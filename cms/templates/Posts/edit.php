<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Post $post
 * @var string[]|\Cake\Collection\CollectionInterface $blogs
 */
?>
<head>
    <?= $this->Html->charset() ?>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Post</title>
    <?= $this->Html->css(['normalize.min', 'milligram.min', 'fonts', 'cake','style']) ?>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .main-panel {
            width: 100%;
            min-height: 100vh;
            padding: 20px;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        .btn-icon {
            margin-right: 5px;
        }
    </style>
</head>
<div class="main-panel">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h4 class="card-title"><?= __('Edit Post') ?></h4>
                    <p class="card-description">Update post details below</p>

                    <?= $this->Form->create($post, ['type' => 'file']) ?>
                    <div class="form-group">
                        <?= $this->Form->control('blog_id', [
                            'label' => 'Blog',
                            'options' => $blogs,
                            'class' => 'form-control',
                            'empty' => '-- Select Blog --'
                        ]) ?>
                    </div>

                    <div class="form-group">
                        <?= $this->Form->control('title', [
                            'label' => 'Title',
                            'class' => 'form-control',
                            'required' => true
                        ]) ?>
                    </div>

                    <div class="form-group">
                        <?= $this->Form->control('content', [
                            'label' => 'Content',
                            'class' => 'form-control',
                            'rows' => 4,
                            'type' => 'textarea'
                        ]) ?>
                    </div>

                    <div class="form-group">
                        <?= $this->Form->label('image', 'Upload Image') ?>
                        <?= $this->Form->file('image', [
                            'class' => 'form-control-file',
                            'accept' => 'image/*'
                        ]) ?>
                        <small class="form-text text-muted">JPG, PNG or GIF (Max 2MB)</small>
                    </div>

                    <div class="d-flex mt-4">
                        <?= $this->Form->button(__('Update'), [
                            'class' => 'btn btn-warning btn-rounded btn-fw text-white',
                            'style' => 'padding: 12px 16px;',
                            'escape' => false
                        ]) ?>

                        <?= $this->Html->link(
                            ' Back to List',
                            ['action' => 'index'],
                            [
                                'class' => 'btn btn-secondary btn-rounded btn-fw ms-2',
                                'style' => 'padding: 12px 16px;',
                                'escape' => false
                            ]
                        ) ?>

                        <?= $this->Form->postLink(
                            'Delete',
                            ['action' => 'delete', $post->id],
                            [
                                'class' => 'btn btn-danger btn-rounded btn-fw ms-2',
                                'style' => 'padding: 12px 16px;',
                                'escape' => false,
                                'confirm' => __('Are you sure you want to delete # {0}?', $post->id)
                            ]
                        ) ?>
                    </div>
                    <?= $this->Form->end() ?>
                </div>
            </div>
        </div>
    </div>
</div>
