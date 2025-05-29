<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Blog $blog
 */
?>
<head>
    <?= $this->Html->charset() ?>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Blog - Skydash Admin</title>
    <?= $this->Html->meta('icon') ?>
    <?= $this->Html->css(['normalize.min', 'milligram.min', 'fonts', 'cake', 'style']) ?>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<div class="main-panel">
    <div class="content-wrapper">
        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Add Blog</h4>
                    <p class="card-description">Blog details form</p>

                    <?= $this->Form->create($blog, ['class' => 'forms-sample']) ?>

                    <div class="form-group">
                        <?= $this->Form->label('title', 'Title') ?>
                        <?= $this->Form->control('title', ['label' => false, 'class' => 'form-control', 'placeholder' => 'Enter Blog Title']) ?>
                    </div>

                    <div class="form-group">
                        <?= $this->Form->label('content', 'Content') ?>
                        <?= $this->Form->control('content', ['label' => false, 'class' => 'form-control', 'placeholder' => 'Enter Blog Content', 'type' => 'textarea', 'rows' => 5]) ?>
                    </div>

                    <div class="form-group">
                        <?= $this->Form->label('author', 'Author') ?>
                        <?= $this->Form->control('author', ['label' => false, 'class' => 'form-control', 'placeholder' => 'Enter Author Name']) ?>
                    </div>

                    <button type="submit" class="btn btn-dark btn-rounded btn-fw" style="padding: 12px 18px;">Submit</button>
                    <a href="<?= $this->Url->build(['action' => 'index']) ?>" class="ms-4">Cancel</a>

                    <?= $this->Form->end() ?>
                </div>
            </div>
        </div>
    </div>
</div>
