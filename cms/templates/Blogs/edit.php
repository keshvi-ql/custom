<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Blog $blog
 */
?>
<head>
<?= $this->Html->charset() ?>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit Blog</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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
                        <h4 class="card-title"><?= __('Edit Blog') ?></h4>
                        <p class="card-description">Update the blog details below</p>

                        <?= $this->Form->create($blog) ?>
                        <div class="form-group">
                            <?= $this->Form->control('title', ['label' => 'Title', 'class' => 'form-control']) ?>
                        </div>
                        <div class="form-group">
                            <?= $this->Form->control('content', ['label' => 'Content', 'class' => 'form-control', 'rows' => 5]) ?>
                        </div>
                        <div class="form-group">
                            <?= $this->Form->control('author', ['label' => 'Author', 'class' => 'form-control']) ?>
                        </div>

                        <div class="mt-4">
                            <?= $this->Form->button('Update', [
                                'class' => 'btn btn-warning btn-rounded btn-fw text-white',
                                'style' => 'padding: 8px 16px;'
                            ]) ?>

                            <button type="button"
                                onclick="window.location.href='<?= $this->Url->build(['action' => 'index']) ?>'"
                                class="btn btn-secondary btn-rounded btn-fw ms-2"
                                style="padding: 8px 16px;">
                                Back to List
                            </button>

                            <?= $this->Form->postButton('Delete', ['action' => 'delete', $blog->id], [
                                'confirm' => __('Are you sure you want to delete # {0}?', $blog->id),
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
