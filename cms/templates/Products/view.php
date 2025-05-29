<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Product $product
 */
?>
<head>
<?= $this->Html->charset() ?>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Product Details - Skydash Admin</title>
<?= $this->Html->css(['normalize.min', 'milligram.min', 'fonts', 'cake','style', 'bootstrap.min']) ?>
<?= $this->Html->meta('icon') ?>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    .customer-table th, .customer-table td {
        padding: 10px 15px;
        text-align: left;
    }

    .customer-table th {
        background-color: #f1f1f1;
    }

    .action-buttons {
        margin-top: 20px;
    }

    .product-image {
        max-width: 200px;
        height: auto;
        margin-bottom: 15px;
    }
</style>
</head>

<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title"><?= h($product->name) ?></h4>
                        <p class="card-description">Product Details</p>

                        <?php if (!empty($product->image)) : ?>
                            <img src="<?= $this->Url->image($product->image) ?>" alt="Product Image" class="product-image" style="height: 200px; width: 200px; object-fit: cover; border-radius: 10px;" />
                        <?php endif; ?>


                        <table class="table table-bordered customer-table">
                            <tr>
                                <th>ID</th>
                                <td><?= $this->Number->format($product->id) ?></td>
                            </tr>
                            <tr>
                                <th>Name</th>
                                <td><?= h($product->name) ?></td>
                            </tr>
                            <tr>
                                <th>Description</th>
                                <td><?= h($product->description) ?></td>
                            </tr>
                            <tr>
                                <th>Price</th>
                                <td><?= $this->Number->currency($product->price) ?></td>
                            </tr>
                            <tr>
                                <th>Category</th>
                                <td><?= h($product->category->name ?? 'N/A') ?></td>
                            </tr>
                        </table>

                        <div class="action-buttons">
                            <?= $this->Html->link('<i class="fa fa-pencil"></i> Edit', ['action' => 'edit', $product->id], [
                                'escape' => false,
                                'class' => 'btn btn-warning btn-rounded btn-fw text-white'
                            ]) ?>

                            <?= $this->Form->postLink('<i class="fa fa-trash"></i> Delete', ['action' => 'delete', $product->id], [
                                'escape' => false,
                                'class' => 'btn btn-danger btn-rounded btn-fw',
                                'confirm' => __('Are you sure you want to delete # {0}?', $product->id)
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
