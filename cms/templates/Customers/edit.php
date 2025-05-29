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
<?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/js/select.dataTables.min.css', 'type' => 'text/css']) ?>
<?= $this->Html->tag('link', '', ['rel' => 'shortcut icon', 'href' => '/images/favicon.png']) ?>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

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
            <div class="col-lg-8 offset-lg-2 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title"><?= __('Edit Customer') ?></h4>
                        <p class="card-description">Update the customer information below</p>

                        <?= $this->Form->create($customer) ?>
                        <div class="form-group">
                            <?= $this->Form->control('name', ['label' => 'Name', 'class' => 'form-control']) ?>
                        </div>
                        <div class="form-group">
                            <?= $this->Form->control('email', ['label' => 'Email', 'class' => 'form-control']) ?>
                        </div>
                        <div class="form-group">
                            <?= $this->Form->control('phone', ['label' => 'Phone', 'class' => 'form-control']) ?>
                        </div>
                        <div class="form-group">
                            <?= $this->Form->control('address', ['label' => 'Address', 'class' => 'form-control', 'rows' => 3]) ?>
                        </div>
                        <div class="mt-4">
                        <?= $this->Form->button('Update', [
    'class' => 'btn btn-warning btn-rounded btn-fw text-white',
    'style' => 'padding: 8px 16px;'
]) ?>

<button type="button"
    onclick="window.location.href='<?= $this->Url->build(['action' => 'index']) ?>'"
    class="btn btn-secondary btn-rounded btn-fw ms-2"
    style="padding: 8x 16px;">
    Back to List
</button>


<?= $this->Form->postButton('Delete', ['action' => 'delete', $customer->id], [
    'confirm' => __('Are you sure you want to delete # {0}?', $customer->id),
    'class' => 'btn btn-danger btn-rounded btn-fw ms-2',
    'style' => 'padding: 8px 16px;'
]) ?>

                        </div>


                        <?= $this->Form->end() ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
