<?php
declare(strict_types=1);

namespace App\Controller;

class PostsController extends AppController
{
    public function index()
    {
        $query = $this->Posts->find()->contain(['Blogs']);
        $posts = $this->paginate($query);
        $this->set(compact('posts'));
    }

    public function view($id = null)
    {
        $post = $this->Posts->get($id, [
            'contain' => ['Blogs'],
        ]);
        $this->set(compact('post'));
    }

    public function add()
    {
        $post = $this->Posts->newEmptyEntity();
    
        if ($this->request->is('post')) {
            $data = $this->request->getData();
            $file = $this->request->getData('image'); // Will now be an UploadedFileInterface object
    
            // Check if a file was uploaded
            if ($file && $file instanceof \Laminas\Diactoros\UploadedFile && $file->getError() === UPLOAD_ERR_OK) {
                $extension = pathinfo($file->getClientFilename(), PATHINFO_EXTENSION);
                $filename = time() . '.' . $extension;
    
                $uploadPath = WWW_ROOT . 'img' . DS . 'posts' . DS;
                if (!file_exists($uploadPath)) {
                    mkdir($uploadPath, 0777, true);
                }
    
                $file->moveTo($uploadPath . $filename);
                $data['image'] = 'posts/' . $filename;
            }
    
            $post = $this->Posts->patchEntity($post, $data);
    
            if ($this->Posts->save($post)) {
                $this->Flash->success(__('The post has been saved.'));
                return $this->redirect(['action' => 'index']);
            }
    
            $this->Flash->error(__('The post could not be saved. Please, try again.'));
        }
    
        $blogs = $this->Posts->Blogs->find('list', ['limit' => 200])->all();
        $this->set(compact('post', 'blogs'));
    }
    

    public function edit($id = null)
    {
        $post = $this->Posts->get($id);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $data = $this->request->getData();

            // Correct image upload key to 'image'
            $file = $this->request->getData('image');
            if ($file && $file->getError() === UPLOAD_ERR_OK) {
                $extension = pathinfo($file->getClientFilename(), PATHINFO_EXTENSION);
                $filename = time() . '.' . $extension;

                $uploadPath = WWW_ROOT . 'img' . DS . 'posts' . DS;
                if (!file_exists($uploadPath)) {
                    mkdir($uploadPath, 0777, true);
                }

                $file->moveTo($uploadPath . $filename);
                $data['image'] = 'posts/' . $filename;
            }

            $post = $this->Posts->patchEntity($post, $data);
            if ($this->Posts->save($post)) {
                $this->Flash->success(__('The post has been saved.'));
                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The post could not be saved. Please, try again.'));
        }
        $blogs = $this->Posts->Blogs->find('list', ['limit' => 200])->all();
        $this->set(compact('post', 'blogs'));
    }

    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $post = $this->Posts->get($id);
        if ($this->Posts->delete($post)) {
            $this->Flash->success(__('The post has been deleted.'));
        } else {
            $this->Flash->error(__('The post could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
