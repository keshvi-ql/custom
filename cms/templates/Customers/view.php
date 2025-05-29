<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Customer $customer
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
<?php
if (!empty($breadcrumbs)):
    foreach ($breadcrumbs as $breadcrumb) {
        if (isset($breadcrumb['url'])) {
            $this->Breadcrumbs->add($breadcrumb['title'], $breadcrumb['url']);
        } else {
            $this->Breadcrumbs->add($breadcrumb['title']);
        }
    }
    echo $this->Breadcrumbs->render();
endif;
?>
    <div class="content-wrapper">
        <div class="row">
        <div class="col-lg-8 offset-lg-2 grid-margin stretch-card">
            <div class="card">
            <div class="card-body">
                <h4 class="card-title"><?= h($customer->name) ?></h4>
                <p class="card-description">Customer Details</p>

                <table class="table table-bordered">
                <tr>
                    <th>Name</th>
                    <td><?= h($customer->name) ?></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><?= h($customer->email) ?></td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td><?= h($customer->phone) ?></td>
                </tr>
                <tr>
                    <th>ID</th>
                    <td><?= $this->Number->format($customer->id) ?></td>
                </tr>
                <tr>
                    <th>Created</th>
                    <td><span class="badge badge-info"><?= h($customer->created->format('d M Y')) ?></span></td>
                </tr>
                <tr>
                    <th>Modified</th>
                    <td><span class="badge badge-secondary"><?= h($customer->modified->format('d M Y')) ?></span></td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td><?= $this->Text->autoParagraph(h($customer->address)); ?></td>
                </tr>
                </table>

                <div class="mt-4">
                    <?= $this->Html->link('<i class="fa fa-pencil"></i> Edit', ['action' => 'edit', $customer->id], [
                        'escape' => false,
                        'class' => 'btn btn-warning btn-rounded btn-fw text-white'
                    ]) ?>

                    <?= $this->Form->postLink('<i class="fa fa-trash"></i> Delete', ['action' => 'delete', $customer->id], [
                        'escape' => false,
                        'class' => 'btn btn-danger btn-rounded btn-fw',
                        'confirm' => __('Are you sure you want to delete # {0}?', $customer->id)
                    ]) ?>

                    <?= $this->Html->link('<i class="fa fa-list"></i> Back to List', ['action' => 'index'], [
                        'escape' => false,
                        'class' => 'btn btn-secondary btn-rounded btn-fw'
                    ]) ?>
                </div>


            </div>

            </div>
        </div>
        </div>

    </div>
    
</div>
