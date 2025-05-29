<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Post $post
 */
?>
<head>
    <?= $this->Html->charset() ?>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?= h($post->title) ?> - Skydash Admin</title>
    <?= $this->Html->css(['normalize.min', 'milligram.min', 'fonts', 'cake','style', 'bootstrap.min']) ?>
    <?= $this->Html->meta('icon') ?>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .detail-table th, .detail-table td {
            padding: 10px 15px;
            text-align: left;
        }
        .detail-table th {
            background-color: #f1f1f1;
            width: 150px;
        }
        .action-buttons {
            margin-top: 20px;
        }
        .post-image {
            max-width: 200px;
            height: auto;
            margin-bottom: 15px;
            border-radius: 10px;
            object-fit: cover;
        }
        blockquote {
            border-left: 5px solid #ddd;
            padding-left: 15px;
            color: #555;
            font-style: italic;
            background: #f9f9f9;
            margin-top: 15px;
            border-radius: 4px;
        }
    </style>
</head>

<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title"><?= h($post->title) ?></h4>
                        <p class="card-description">Post Details</p>

                        <?php if (!empty($post->image)) : ?>
                            <img src="<?= $this->Url->image($post->image) ?>" alt="Post Image" class="post-image" />
                        <?php else: ?>
                            <p class="text-muted">No image available</p>
                        <?php endif; ?>

                        <table class="table table-bordered detail-table">
                            <tr>
                                <th>ID</th>
                                <td><?= $this->Number->format($post->id) ?></td>
                            </tr>
                            <tr>
                                <th>Blog</th>
                                <td>
                                    <?php
                                    if ($post->has('blog')) {
                                        echo $this->Html->link(
                                            h($post->blog->title),
                                            ['controller' => 'Blogs', 'action' => 'view', $post->blog->id]
                                        );
                                    } else {
                                        echo 'N/A';
                                    }
                                    ?>
                                </td>
                            </tr>
                            <tr>
                                <th>Created</th>
                                <td><?= h($post->created) ?></td>
                            </tr>
                            <tr>
                                <th>Modified</th>
                                <td><?= h($post->modified) ?></td>
                            </tr>
                        </table>

                        <div class="text">
                            <strong>Content</strong>
                            <blockquote>
                                <?= $this->Text->autoParagraph(h($post->content)) ?>
                            </blockquote>
                        </div>

                        <div class="action-buttons">
                            <?= $this->Html->link('<i class="fa fa-pencil"></i> Edit', ['action' => 'edit', $post->id], [
                                'escape' => false,
                                'class' => 'btn btn-warning btn-rounded btn-fw text-white'
                            ]) ?>

                            <?= $this->Form->postLink('<i class="fa fa-trash"></i> Delete', ['action' => 'delete', $post->id], [
                                'escape' => false,
                                'class' => 'btn btn-danger btn-rounded btn-fw',
                                'confirm' => __('Are you sure you want to delete # {0}?', $post->id)
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
