<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Category $category
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
<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Add Category</h4>
            <p class="card-description">Basic form elements</p>

            <?= $this->Form->create($category, ['class' => 'forms-sample']) ?>

            <div class="form-group">
                <?= $this->Form->label('name', 'Name') ?>
                <?= $this->Form->control('name', ['label' => false, 'class' => 'form-control', 'placeholder' => 'Category Name']) ?>
            </div>

            <div class="form-group">
                <?= $this->Form->label('description', 'Description') ?>
                <?= $this->Form->control('description', ['label' => false, 'class' => 'form-control', 'placeholder' => 'Category Description']) ?>
            </div>

            <button type="submit" class="btn btn-dark btn-rounded btn-fw" style="padding: 12px 18px;">Submit</button>
            <a href="<?= $this->Url->build(['action' => 'index']) ?>" class="ms-4">Cancel</a>

            <?= $this->Form->end() ?>
        </div>
    </div>
</div>
</div>
</div>
