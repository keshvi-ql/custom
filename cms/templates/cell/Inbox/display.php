<!-- templates/cell/Inbox/display.php -->
<div class="notification-icon">
    There are <?= $unread_count ?> registered customers.
</div>

<!-- for pagination -->
<!-- <h3>Customer List</h3>
<ul>
    <?php foreach ($customers as $customer): ?>
        <li><?= h($customer->name) ?>(<?= h($customer->email) ?>)</li>
    <?php endforeach; ?>
</ul>

<?= $this->Paginator->numbers(['scope' => 'customers']) ?>
<?= $this->Paginator->prev('« Previous', ['scope' => 'customers']) ?>
<?= $this->Paginator->next('Next »', ['scope' => 'customers']) ?> -->
