<?php
declare(strict_types=1);

namespace App\Controller;

class ProductsController extends AppController
{
    public function index()
    {
        $query = $this->Products->find()->contain(['Categories']);
        $products = $this->paginate($query);
        $this->set(compact('products'));
    }

    // In ProductsController.php
// public function view($id = null)
// {
//     $product = $this->Products->get($id);
//     $this->set(compact('product'));
// }
public function view($id = null)
{
    $product = $this->Products->get($id, [
        'contain' => ['Categories'], // Include category data
    ]);
    $this->set(compact('product'));
}


    public function add()
    {

        $product = $this->Products->newEmptyEntity();
        if ($this->request->is('post')) {
            $data = $this->request->getData();
    
            // Handle image upload
            $file = $data['image_file'] ?? null;
            if ($file && $file->getError() === UPLOAD_ERR_OK) {
                $extension = pathinfo($file->getClientFilename(), PATHINFO_EXTENSION);
                $filename = time() . '.' . $extension;
    
                $uploadPath = WWW_ROOT . 'img/products/';
                // Ensure the directory exists
                if (!file_exists($uploadPath)) {
                    mkdir($uploadPath, 0777, true); // Create directory with write permissions
                }
    
                // Move the file
                $file->moveTo($uploadPath . $filename);
                $data['image'] = 'products/' . $filename;
            }
    
            $product = $this->Products->patchEntity($product, $data);
            if ($this->Products->save($product)) {
                $this->Flash->success(__('The product has been saved.'));
                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The product could not be saved. Please, try again.'));
        }
        $categories = $this->Products->Categories->find('list', limit: 200)->all();
        $this->set(compact('product', 'categories'));
    }
    

    public function edit($id = null)
    {
        $product = $this->Products->get($id, contain: []);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $data = $this->request->getData();

            // Handle image upload (optional, only if user selects a new file)
            $file = $data['image_file'] ?? null;
            if ($file && $file->getError() === UPLOAD_ERR_OK) {
                $extension = pathinfo($file->getClientFilename(), PATHINFO_EXTENSION);
                $filename = time() . '.' . $extension;
                $uploadPath = WWW_ROOT . 'img/products/';
                $file->moveTo($uploadPath . $filename);
                $data['image'] = 'products/' . $filename;
            }

            $product = $this->Products->patchEntity($product, $data);
            if ($this->Products->save($product)) {
                $this->Flash->success(__('The product has been saved.'));
                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The product could not be saved. Please, try again.'));
        }
        $categories = $this->Products->Categories->find('list', limit: 200)->all();
        $this->set(compact('product', 'categories'));
    }

    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $product = $this->Products->get($id);
        if ($this->Products->delete($product)) {
            $this->Flash->success(__('The product has been deleted.'));
        } else {
            $this->Flash->error(__('The product could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
