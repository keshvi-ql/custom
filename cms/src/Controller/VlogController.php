<?php
namespace App\Controller;

use Cake\Event\EventInterface;

class VlogController extends AppController
{
    public function beforeFilter(EventInterface $event)
    {
        parent::beforeFilter($event);
        // you can add code here
    }

    public function home()
    {
      //   $this->loadModel('Products');
    
      //   $products = $this->Products->find('all', [
      //       'contain' => ['Categories'],
      //       'order' => ['Products.created' => 'DESC'],
      //       'limit' => 10
      //   ])->all();
    
      //   $this->set(compact('products'));
    
        // Optionally still set message too
        $this->set('message', 'Hello World');
    }
    

    public function about()
    {
    }

    public function contact()
    {
    }

    public function view()
    {
    }
}
