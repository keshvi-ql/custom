<?php
declare(strict_types=1);

namespace App\View\Cell;

use Cake\View\Cell;
use Cake\Datasource\Paging\NumericPaginator;
/**
 * Inbox cell
 */
class InboxCell extends Cell
{
    /**
     * List of valid options that can be passed into this
     * cell's constructor.
     *
     * @var array<string, mixed>
     */
   //  protected array $_validCellOptions = [];
   protected array $_validCellOptions = ['limit']; // Allow "limit" as option
   protected $limit = 5; // Default limit

    /**
     * Initialization logic run at the end of object construction.
     *
     * @return void
     */
    public function initialize(): void
    {
    }

    /**
     * Default display method.
     *
     * @return void
     */
   //  public function display()
   //  {
   //      // Fetch total number of customers
   //      $customers = $this->fetchTable('Customers');
   //      $this->set('unread_count', $customers->find()->count()); // renamed variable kept same for display
   //  }

   public function display(): void
{
    $paginator = new NumericPaginator();

    $results = $paginator->paginate(
        $this->fetchTable('Customers'),
        $this->request->getQueryParams(),
        [
            'limit' => $this->limit,
            'order' => ['Customers.name' => 'ASC'],
            'scope' => 'customers',
        ]
    );
    $customers = $this->fetchTable('Customers');
    $this->set('unread_count', $customers->find()->count());

    // Remove the following two lines that cause the error
    // $paging = $paginator->getPagingParams() + (array)$this->request->getAttribute('paging');
    // $this->request = $this->request->withAttribute('paging', $paging);

    $this->set('customers', $results);
}
}
