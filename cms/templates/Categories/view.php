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
        <div class="row">
            <div class="col-lg-10 offset-lg-1 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title"><?= h($category->name) ?></h4>
                        <p class="card-description">Category Details</p>

                        <table class="table table-bordered">
                            <tr>
                                <th>Name</th>
                                <td><?= h($category->name) ?></td>
                            </tr>
                            <tr>
                                <th>ID</th>
                                <td><?= $this->Number->format($category->id) ?></td>
                            </tr>
                            <tr>
                                <th>Created</th>
                                <td><span class="badge badge-info"><?= h($category->created->format('d M Y')) ?></span></td>
                            </tr>
                            <tr>
                                <th>Modified</th>
                                <td><span class="badge badge-secondary"><?= h($category->modified->format('d M Y')) ?></span></td>
                            </tr>
                            <tr>
                                <th>Description</th>
                                <td><?= $this->Text->autoParagraph(h($category->description)) ?></td>
                            </tr>
                        </table>

                        <div class="mt-4">
                            <?= $this->Html->link('<i class="fa fa-pencil"></i> Edit', ['action' => 'edit', $category->id], [
                                'escape' => false,
                                'class' => 'btn btn-warning btn-rounded btn-fw text-white'
                            ]) ?>

                            <?= $this->Form->postLink('<i class="fa fa-trash"></i> Delete', ['action' => 'delete', $category->id], [
                                'escape' => false,
                                'class' => 'btn btn-danger btn-rounded btn-fw',
                                'confirm' => __('Are you sure you want to delete # {0}?', $category->id)
                            ]) ?>

                            <?= $this->Html->link('<i class="fa fa-list"></i> Back to List', ['action' => 'index'], [
                                'escape' => false,
                                'class' => 'btn btn-secondary btn-rounded btn-fw'
                            ]) ?>

                            <!-- <?= $this->Html->link('<i class="fa fa-plus"></i> New Category', ['action' => 'add'], [
                                'escape' => false,
                                'class' => 'btn btn-primary btn-rounded btn-fw'
                            ]) ?> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <?php if (!empty($category->products)) : ?>
        <div class="row mt-5">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Related Products</h4>
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Category ID</th>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th>Price</th>
                                        <th>Image</th>
                                        <th>Created</th>
                                        <th>Modified</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($category->products as $product) : ?>
                                    <tr>
                                        <td><?= h($product->id) ?></td>
                                        <td><?= h($product->category_id) ?></td>
                                        <td><?= h($product->name) ?></td>
                                        <td><?= h($product->description) ?></td>
                                        <td>$<?= h($product->price) ?></td>
                                        <td>
                                            <?php if (!empty($product->image)) : ?>
                                            <?= $this->Html->image(h($product->image), ['alt' => 'Product Image', 'style' => 'max-width: 100px; height: auto;']) ?>
                                            <?php else : ?>
                                                <span>No Image</span>
                                            <?php endif; ?>
                                        </td>
                                        <td><?= h($product->created->format('d M Y')) ?></td>
                                        <td><?= h($product->modified->format('d M Y')) ?></td>
                                        <td>
                                            <?= $this->Html->link('<i class="fa fa-eye"></i>', ['controller' => 'Products', 'action' => 'view', $product->id], [
                                                'escape' => false,
                                                'class' => 'btn btn-info btn-sm'
                                            ]) ?>
                                            <?= $this->Html->link('<i class="fa fa-pencil"></i>', ['controller' => 'Products', 'action' => 'edit', $product->id], [
                                                'escape' => false,
                                                'class' => 'btn btn-warning btn-sm text-white'
                                            ]) ?>
                                            <?= $this->Form->postLink('<i class="fa fa-trash"></i>', ['controller' => 'Products', 'action' => 'delete', $product->id], [
                                                'escape' => false,
                                                'class' => 'btn btn-danger btn-sm',
                                                'confirm' => __('Are you sure you want to delete # {0}?', $product->id)
                                            ]) ?>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php endif; ?>
    </div>
</div>
