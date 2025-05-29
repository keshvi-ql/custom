<?php
/**
 * @var \App\View\AppView $this
 * @var iterable<\App\Model\Entity\Product> $products
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
            <h4 class="card-title mb-0"><?= __('Products') ?></h4>
            <?= $this->Html->link(__('New Product'), ['action' => 'add'], ['class' => 'btn btn-primary btn-rounded']) ?>
        </div>

        <p class="card-description"> List of all available products </p>
        <div class="table-responsive">
            <table class="table table-striped">
            <thead>
                <tr>
                    <th><?= $this->Paginator->sort('id') ?></th>
                    <th><?= $this->Paginator->sort('category_id', 'Category') ?></th>
                    <th><?= $this->Paginator->sort('name') ?></th>
                    <th><?= $this->Paginator->sort('price') ?></th>
                    <th><?= $this->Paginator->sort('image') ?></th>
                    <th><?= $this->Paginator->sort('created') ?></th>
                    <th><?= $this->Paginator->sort('modified') ?></th>
                    <th class="actions"><?= __('Actions') ?></th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($products as $product): ?>
                    <tr>
    <td><?= $this->Number->format($product->id) ?></td>
    <td><?= $product->hasValue('category') ? $this->Html->link($product->category->name, ['controller' => 'Categories', 'action' => 'view', $product->category->id]) : '' ?></td>
    <td><?= h($product->name) ?></td>
    <td><label class="badge badge-success">₹<?= $this->Number->format($product->price) ?></label></td>
    <!-- <td>
        <img src="<?= $this->Url->image('products/' . $product->image) ?>" alt="<?= h($product->name) ?>" width="100">
    </td> -->
    <td>
    <?php 
    // Remove any directory prefix from the filename
    $cleanImage = basename($product->image);
    $imagePath = WWW_ROOT . 'img' . DS . 'products' . DS . $cleanImage;
    $webPath = '/img/products/' . $cleanImage;
    ?>
    
    <?php if (!empty($product->image) && file_exists($imagePath)): ?>
        <img src="<?= $webPath ?>" alt="<?= h($product->name) ?>" width="100">
    <?php else: ?>
        <span class="text-muted">Image not found (<?= h($cleanImage) ?>)</span>
    <?php endif; ?>
</td>

    <td><label class="badge badge-info"><?= h($product->created->format('d M Y')) ?></label></td>
    <td><label class="badge badge-secondary"><?= h($product->modified->format('d M Y')) ?></label></td>
    <td class="actions">
        <?= $this->Html->link(
            '<i class="fa fa-eye"></i>', 
            ['action' => 'view', $product->id], 
            ['escape' => false, 'class' => 'btn btn-sm btn-info text-white', 'title' => 'View','style' => 'padding: 2px 3px;']
        ) ?>
        <?= $this->Html->link(
            '<i class="fa fa-pencil"></i>', 
            ['action' => 'edit', $product->id], 
            ['escape' => false, 'class' => 'btn btn-sm btn-warning text-white', 'title' => 'Edit','style' => 'padding: 2px 3px;']
        ) ?>
        <?= $this->Form->postLink(
            '<i class="fa fa-trash"></i>', 
            ['action' => 'delete', $product->id], 
            [
                'escape' => false,
                'class' => 'btn btn-sm btn-danger text-white',
                'title' => 'Delete',
                'style' => 'padding: 2px 3px;',
                'confirm' => __('Are you sure you want to delete # {0}?', $product->id)
            ]
        ) ?>
    </td>
</tr>

                <?php endforeach; ?>
            </tbody>
            </table>
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
