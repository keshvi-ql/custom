<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Product $product
 * @var string[]|\Cake\Collection\CollectionInterface $categories
 */
?>
<head>
    <?= $this->Html->charset() ?>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Skydash Admin - Edit Product</title>
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
        .form-group {
            margin-bottom: 1.5rem;
        }
        .image-preview {
            max-width: 200px;
            max-height: 200px;
            margin-top: 10px;
            display: block;
            border-radius: 4px;
            border: 1px solid #ddd;
        }
        .file-upload-info {
            font-size: 0.875rem;
            color: #6c757d;
            margin-top: 5px;
        }
        .btn-icon {
            margin-right: 5px;
        }
    </style>
</head>
<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title"><?= __('Edit Product') ?></h4>
                        <p class="card-description">Update product details below</p>

                        <?= $this->Form->create($product, ['type' => 'file']) ?>

                        <div class="form-group">
                            <?= $this->Form->control('category_id', [
                                'label' => 'Category',
                                'options' => $categories,
                                'class' => 'form-control',
                                'empty' => '-- Select Category --'
                            ]) ?>
                        </div>

                        <div class="form-group">
                            <?= $this->Form->control('name', [
                                'label' => 'Product Name',
                                'class' => 'form-control',
                                'required' => true
                            ]) ?>
                        </div>

                        <div class="form-group">
                            <?= $this->Form->control('description', [
                                'label' => 'Description',
                                'class' => 'form-control',
                                'rows' => 3,
                                'type' => 'textarea'
                            ]) ?>
                        </div>

                        <div class="form-group">
                            <?= $this->Form->control('price', [
                                'label' => 'Price',
                                'class' => 'form-control',
                                'min' => 0,
                                'step' => '0.01',
                                'required' => true
                            ]) ?>
                        </div>

                        <div class="form-group">
                            <label for="current-image">Current Image</label>
                            <?php if ($product->image): ?>
                                <div>
                                    <img src="/img/<?= h($product->image) ?>" class="image-preview" id="currentImage">
                                    <small class="file-upload-info">Current product image</small>
                                </div>
                            <?php else: ?>
                                <p class="text-muted">No image uploaded</p>
                            <?php endif; ?>
                        </div>

                        <div class="form-group">
                            <?= $this->Form->label('image_file', 'Upload New Image') ?>
                            <?= $this->Form->file('image_file', [
                                'class' => 'form-control-file',
                                'id' => 'imageUpload',
                                'accept' => 'image/*'
                            ]) ?>
                            <small class="file-upload-info">JPG, PNG or GIF (Max 2MB)</small>
                            <div id="imagePreviewContainer" class="mt-2" style="display: none;">
                                <img id="imagePreview" src="#" alt="Preview" class="image-preview">
                                <small class="file-upload-info">New image preview</small>
                            </div>
                        </div>

                        <div class="mt-4 d-flex">
                            <?= $this->Form->button('Update', [
                                'class' => 'btn btn-warning btn-rounded btn-fw text-white',
                                'escape' => false,
                                'style' => 'padding : 12px 16px;'
                            ]) ?>

                            <?= $this->Html->link(
                                ' Back to List', 
                                ['action' => 'index'], 
                                [
                                    'escape' => false,
                                    'class' => 'btn btn-secondary btn-rounded btn-fw ms-2',
                                    'style' => 'padding : 12px 16px;'
                                ]
                            ) ?>

                            <?= $this->Form->postLink(
                                'Delete', 
                                ['action' => 'delete', $product->id], 
                                [
                                    'escape' => false,
                                    'confirm' => __('Are you sure you want to delete # {0}?', $product->id),
                                    'class' => 'btn btn-danger btn-rounded btn-fw ms-2',
                                    'style' => 'padding : 12px 16px;'
                                ]
                            ) ?>
                        </div>

                        <?= $this->Form->end() ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Image preview functionality
    document.getElementById('imageUpload')?.addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(event) {
                const preview = document.getElementById('imagePreview');
                const container = document.getElementById('imagePreviewContainer');
                preview.src = event.target.result;
                container.style.display = 'block';
            };
            reader.readAsDataURL(file);
        }
    });
</script>