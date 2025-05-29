<?php
/**
 * @var \App\View\AppView $this
 * @var iterable<\App\Model\Entity\Customer> $customers
 */
?>
<head>
<?= $this->Html->charset() ?>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Skydash Admin</title>
<?= $this->Html->meta('icon') ?>

<?= $this->Html->css(['normalize.min', 'milligram.min', 'fonts', 'cake','style']) ?>
<?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/vendors/feather/feather.css']) ?>
<?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/vendors/ti-icons/css/themify-icons.css']) ?>
<?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/vendors/css/vendor.bundle.base.css']) ?>
<?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/vendors/font-awesome/css/font-awesome.min.css']) ?>
<?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/vendors/mdi/css/materialdesignicons.min.css']) ?>
<?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/vendors/bootstrap-maxlength/bootstrap-maxlength.css']) ?>
<?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/vendors/datatables.net-bs5/dataTables.bootstrap5.css']) ?>
<?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/vendors/ti-icons/css/themify-icons.css']) ?>
<?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/js/select.dataTables.min.css', 'type' => 'text/css']) ?>
<?= $this->Html->tag('link', '', ['rel' => 'shortcut icon', 'href' => '/images/favicon.png']) ?>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
<?= $this->fetch('meta') ?>
<?= $this->fetch('css') ?>
<?= $this->fetch('script') ?>
<style>
    html, body {
    height: 100%;
    margin: 0;
    padding: 0;
    }
    .main-panel {
    width: 100%;
    min-height: 100vh;
    padding: 0;
    margin: 0;
    }
    .content-wrapper {
    padding: 20px;
    }
</style>
</head>

<div class="main-panel">
<div class="content-wrapper">
<div class="row">
    <div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
    <div class="card-body">

    <div class="d-flex align-items-center justify-content-between mb-3">
        <a class="navbar-brand brand-logo-mini" href="<?= $this->Url->build('/') ?>">
            <i class="fa fa-home" style="font-size: 20px;"></i>
        </a>
        <h4 class="card-title mb-0"><?= __('Customers') ?></h4>
        <?= $this->Html->link(__('New Customer'), ['action' => 'add'], ['class' => 'btn btn-primary btn-rounded']) ?>
    </div>

        <p class="card-description"> List of all registered customers </p>
        <div class="table-responsive">
            <table class="table table-striped">
            <thead>
                <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('name') ?></th>
                <th><?= $this->Paginator->sort('email') ?></th>
                <th><?= $this->Paginator->sort('phone') ?></th>
                <th><?= $this->Paginator->sort('created') ?></th>
                <th><?= $this->Paginator->sort('modified') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($customers as $customer): ?>
                <tr>
                <td><?= $this->Number->format($customer->id) ?></td>
                <td><?= h($customer->name) ?></td>
                <td><?= h($customer->email) ?></td>
                <td><?= h($customer->phone) ?></td>
                <td><label class="badge badge-info"><?= h($customer->created->format('d M Y')) ?></label></td>
                <td><label class="badge badge-secondary"><?= h($customer->modified->format('d M Y')) ?></label></td>
                <td class="actions">
                    <?= $this->Html->link(
                        '<i class="fa fa-eye"></i>', 
                        ['action' => 'view', $customer->id], 
                        ['escape' => false, 'class' => 'btn btn-sm btn-info text-white', 'title' => 'View','style' => 'padding: 2px 3px;']
                    ) ?>
                    <?= $this->Html->link(
                        '<i class="fa fa-pencil"></i>', 
                        ['action' => 'edit', $customer->id], 
                        ['escape' => false, 'class' => 'btn btn-sm btn-warning text-white', 'title' => 'Edit','style' => 'padding: 2px 3px;']
                    ) ?>
                    <?= $this->Form->postLink(
                        '<i class="fa fa-trash"></i>', 
                        ['action' => 'delete', $customer->id], 
                        [
                        'escape' => false,
                        'class' => 'btn btn-sm btn-danger text-white',
                        'title' => 'Delete',
                        'style' => 'padding: 2px 3px;',
                        'confirm' => __('Are you sure you want to delete # {0}?', $customer->id)
                        ]
                    ) ?>
                </td>

                </tr>
                <?php endforeach; ?>
            </tbody>
            </table>
                <!-- cell -->
                <h4>Welcome to the Home Page Using Cell</h4>
                <?php
                 echo $this->cell('Inbox::display')  
                /*
                echo $this->cell('Inbox::display', [], [
                    'cache' => [
                        'config' => 'default', // uses the default cache engine
                        'key' => 'inbox_unread_count', // unique key for this cell
                        'expires' => '+10 minutes' // cache expiry
                    ]
                ])
                    */
                // echo $this->cell('Inbox::display', [], ['limit' => 2])
                ?>
            



        </div>
        <div class="mt-4">
            <nav>
            <ul class="pagination">
                <?= $this->Paginator->first('<< ' . __('first'), ['class' => 'page-item']) ?>
                <?= $this->Paginator->prev('< ' . __('previous'), ['class' => 'page-item']) ?>
                <?= $this->Paginator->numbers(['class' => 'page-item']) ?>
                <?= $this->Paginator->next(__('next') . ' >', ['class' => 'page-item']) ?>
                <?= $this->Paginator->last(__('last') . ' >>', ['class' => 'page-item']) ?>
            </ul>
            </nav>
            <p><?= $this->Paginator->counter(__('Page {{page}} of {{pages}}, showing {{current}} record(s) out of {{count}} total')) ?></p>
        </div>
        </div>
    </div>
    </div>
</div>
</div>
</div>
