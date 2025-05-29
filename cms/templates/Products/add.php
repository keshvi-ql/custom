<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Product $product
 * @var \Cake\Collection\CollectionInterface|string[] $categories
 */
?>
<head>
    <?= $this->Html->charset() ?>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Skydash Admin - Add Product</title>
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
            max-width: 150px;
            margin-top: 10px;
            display: block;
            border-radius: 4px;
        }
        .file-upload-info {
            font-size: 0.875rem;
            color: #6c757d;
            margin-top: 5px;
        }
    </style>
</head>
<div class="main-panel">
    <div class="content-wrapper">
        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Add Product</h4>
                    <p class="card-description">Enter product details</p>

                    <?= $this->Form->create($product, ['class' => 'forms-sample', 'type' => 'file']) ?>

                    <div class="form-group">
                        <?= $this->Form->label('category_id', 'Category') ?>
                        <?= $this->Form->control('category_id', [
                            'label' => false, 
                            'options' => $categories, 
                            'class' => 'form-control',
                            'empty' => '-- Select Category --'
                        ]) ?>
                    </div>

                    <div class="form-group">
                        <?= $this->Form->label('name', 'Product Name') ?>
                        <?= $this->Form->control('name', [
                            'label' => false, 
                            'class' => 'form-control', 
                            'placeholder' => 'Enter product name',
                            'required' => true
                        ]) ?>
                    </div>

                    <div class="form-group">
                        <?= $this->Form->label('description', 'Description') ?>
                        <?= $this->Form->control('description', [
                            'label' => false, 
                            'class' => 'form-control', 
                            'placeholder' => 'Product description',
                            'type' => 'textarea',
                            'rows' => 3
                        ]) ?>
                    </div>

                    <div class="form-group">
                        <?= $this->Form->label('price', 'Price') ?>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">₹</span>
                            </div>
                            <?= $this->Form->control('price', [
                                'label' => false, 
                                'class' => 'form-control', 
                                'placeholder' => '0.00',
                                'min' => 0,
                                'step' => '0.01',
                                'required' => true
                            ]) ?>
                        </div>
                    </div>

                    <div class="form-group">
                        <?= $this->Form->label('image_file', 'Product Image') ?>
                        <?= $this->Form->file('image_file', [
                            'class' => 'form-control-file',
                            'id' => 'imageUpload',
                            'accept' => 'image/*'
                        ]) ?>
                        <small class="file-upload-info">Upload product image (JPG, PNG, GIF - Max 2MB)</small>
                        <div id="imagePreviewContainer" class="mt-2" style="display: none;">
                            <img id="imagePreview" src="#" alt="Preview" class="image-preview">
                        </div>
                    </div>

                    <div class="mt-4">
                    <button type="submit" class="btn btn-dark btn-rounded btn-fw" style="padding: 12px 18px;">Submit</button>
            <a href="<?= $this->Url->build(['action' => 'index']) ?>" class="ms-4">Cancel</a>
                    </div>

                    <?= $this->Form->end() ?>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Image preview functionality
    document.getElementById('imageUpload').addEventListener('change', function(e) {
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