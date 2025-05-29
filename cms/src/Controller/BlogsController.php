<?php
declare(strict_types=1);

namespace App\Controller;
use Cake\Datasource\ConnectionManager;
use Cake\ORM\Locator\LocatorAwareTrait;
/**
 * Blogs Controller
 *
 * @property \App\Model\Table\BlogsTable $Blogs
 */
class BlogsController extends AppController
{
    use LocatorAwareTrait;
    /**
     * Index method
     *
     * @return \Cake\Http\Response|null|void Renders view
     */
    // public function index()
    // {
    //     $query = $this->Blogs->find();
    //     $blogs = $this->paginate($query);

    //     $this->set(compact('blogs'));
    // }

    // ---------------------------
    // public function index()
    // {
    //     $blogsTable = $this->fetchTable('Blogs');
    //     $query = $blogsTable->find()
    //         ->order(['Blogs.created' => 'DESC']); 
    //     $blogs = $this->paginate($query);
    //     $this->set(compact('blogs'));
    // }

    // ----------------Running Select Statements ------------------
    public function index()
    {
        // Get the predefined connection
        $connection = ConnectionManager::get('dynamic');

        // Raw query using the dynamic connection
        $results = $connection
            ->execute('SELECT * FROM blogs WHERE id = :id', ['id' => 1])
            ->fetchAll('assoc');
        // dd($results); // Optional: only for debugging

        // Still use the default ORM for paginated data
        $blogsTable = $this->fetchTable('Blogs');
        $blogs = $this->paginate($blogsTable->find());
        $this->set(compact('blogs'));
    }

    // ------------------Running Insert Statements----------------
    public function addRaw()
    {
        $connection = ConnectionManager::get('dynamic');
        $data = [
            'title' => 'A Raw Inserted Blog',
            'content' => 'Lorem',
            'author' => 'Lorem',
            'created' => new \DateTime('now'),
            'modified' => new \DateTime('now'),
        ];
        // Insert using raw connection
        $success = $connection->insert('blogs', $data, [
            'created' => 'datetime',
            'modified' => 'datetime'
        ]);
        dd($success);
    }

    // ------------------Running Update Statements-------------------------
    public function updateRaw()
    {
        $connection = ConnectionManager::get('dynamic');

        // Update title of the blog with id = 1
        $success = $connection->update('blogs', ['title' => 'Updated Title'], ['id' => 5]);

        // Dump and die to check result
        dd($success);
    }

    // ----------------------Running Delete Statements--------------------
    public function deleteRaw()
    {
        $connection = ConnectionManager::get('dynamic');

        // Delete the blog where id = 1
        $success = $connection->delete('blogs', ['id' => 4]);

        // Dump and die to view the result
        dd($success);
    }

    /**
     * View method
     *
     * @param string|null $id Blog id.
     * @return \Cake\Http\Response|null|void Renders view
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $blog = $this->Blogs->get($id, contain: ['Posts']);
        $this->set(compact('blog'));
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null|void Redirects on successful add, renders view otherwise.
     */
    // public function add()
    // {
    //     $blog = $this->Blogs->newEmptyEntity();
    //     if ($this->request->is('post')) {
    //         $blog = $this->Blogs->patchEntity($blog, $this->request->getData());
    //         if ($this->Blogs->save($blog)) {
    //             $this->Flash->success(__('The blog has been saved.'));

    //             return $this->redirect(['action' => 'index']);
    //         }
    //         $this->Flash->error(__('The blog could not be saved. Please, try again.'));
    //     }
    //     $this->set(compact('blog'));
    // }
    public function add()
{
    $blog = $this->Blogs->newEmptyEntity();
    if ($this->request->is('post')) {
        $blog = $this->Blogs->patchEntity($blog, $this->request->getData());

        // Add mutation data here (example)
        $blog->mutation = ['x' => 100, 'y' => 200];

        if ($this->Blogs->save($blog)) {
            $this->Flash->success(__('The blog has been saved.'));

            return $this->redirect(['action' => 'index']);
        }
        $this->Flash->error(__('The blog could not be saved. Please, try again.'));
    }
    $this->set(compact('blog'));
}


    /**
     * Edit method
     *
     * @param string|null $id Blog id.
     * @return \Cake\Http\Response|null|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $blog = $this->Blogs->get($id, contain: []);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $blog = $this->Blogs->patchEntity($blog, $this->request->getData());
            if ($this->Blogs->save($blog)) {
                $this->Flash->success(__('The blog has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The blog could not be saved. Please, try again.'));
        }
        $this->set(compact('blog'));
    }

    /**
     * Delete method
     *
     * @param string|null $id Blog id.
     * @return \Cake\Http\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $blog = $this->Blogs->get($id);
        if ($this->Blogs->delete($blog)) {
            $this->Flash->success(__('The blog has been deleted.'));
        } else {
            $this->Flash->error(__('The blog could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
