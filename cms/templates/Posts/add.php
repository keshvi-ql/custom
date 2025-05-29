<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Post $post
 * @var \Cake\Collection\CollectionInterface|string[] $blogs
 */
?>
<head>
<?= $this->Html->charset() ?>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Skydash Admin - Add Posts</title>
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
    </style>
</head>

<div class="main-panel">
    <div class="content-wrapper">
        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Add Post</h4>
                    <p class="card-description">Enter post details</p>

                    <?= $this->Form->create($post, ['type' => 'file', 'class' => 'forms-sample']) ?>

                    <div class="form-group">
                        <?= $this->Form->label('blog_id', 'Blog') ?>
                        <?= $this->Form->control('blog_id', [
                            'label' => false,
                            'options' => $blogs,
                            'class' => 'form-control',
                            'empty' => '-- Select Blog --'
                        ]) ?>
                    </div>

                    <div class="form-group">
                        <?= $this->Form->label('title', 'Title') ?>
                        <?= $this->Form->control('title', [
                            'label' => false,
                            'class' => 'form-control',
                            'placeholder' => 'Enter post title',
                            'required' => true
                        ]) ?>
                    </div>

                    <div class="form-group">
                        <?= $this->Form->label('content', 'Content') ?>
                        <?= $this->Form->control('content', [
                            'label' => false,
                            'class' => 'form-control',
                            'type' => 'textarea',
                            'rows' => 5,
                            'placeholder' => 'Write post content here...'
                        ]) ?>
                    </div>

                    <div class="form-group">
                        <?= $this->Form->label('image', 'Image') ?>
                        <?= $this->Form->file('image', [
                            'class' => 'form-control-file',
                            'accept' => 'image/*'
                        ]) ?>
                        <small class="file-upload-info">Upload an image (JPG, PNG, GIF - Max 2MB)</small>
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
