<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Blog $blog
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
                        <h4 class="card-title"><?= h($blog->title) ?></h4>
                        <p class="card-description">Blog Details</p>

                        <table class="table table-bordered">
                            <tr>
                                <th>Title</th>
                                <td><?= h($blog->title) ?></td>
                            </tr>
                            <tr>
                                <th>Author</th>
                                <td><?= h($blog->author) ?></td>
                            </tr>
                            <tr>
                                <th>ID</th>
                                <td><?= $this->Number->format($blog->id) ?></td>
                            </tr>
                            <tr>
                                <th>Created</th>
                                <td><span class="badge badge-info"><?= h($blog->created->format('d M Y')) ?></span></td>
                            </tr>
                            <tr>
                                <th>Modified</th>
                                <td><span class="badge badge-secondary"><?= h($blog->modified->format('d M Y')) ?></span></td>
                            </tr>
                        </table>

                        <div class="mt-4">
                            <h5 class="font-weight-bold">Content</h5>
                            <div class="border p-3 bg-light">
                                <?= $this->Text->autoParagraph(h($blog->content)); ?>
                            </div>
                        </div>

                        <div class="mt-4">
                            <?= $this->Html->link('<i class="fa fa-pencil"></i> Edit', ['action' => 'edit', $blog->id], [
                                'escape' => false,
                                'class' => 'btn btn-warning btn-rounded btn-fw text-white'
                            ]) ?>
                            <?= $this->Form->postLink('<i class="fa fa-trash"></i> Delete', ['action' => 'delete', $blog->id], [
                                'escape' => false,
                                'class' => 'btn btn-danger btn-rounded btn-fw',
                                'confirm' => __('Are you sure you want to delete # {0}?', $blog->id)
                            ]) ?>
                            <?= $this->Html->link('<i class="fa fa-list"></i> Back to List', ['action' => 'index'], [
                                'escape' => false,
                                'class' => 'btn btn-secondary btn-rounded btn-fw'
                            ]) ?>
                        </div>

                        <?php if (!empty($blog->posts)) : ?>
                        <div class="mt-5">
                            <h5 class="card-title">Related Posts</h5>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>ID</th>
                                            <th>Blog ID</th>
                                            <th>Title</th>
                                            <th>Content</th>
                                            <th>Image</th>
                                            <th>Created</th>
                                            <th>Modified</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($blog->posts as $post) : ?>
                                        <tr>
                                            <td><?= h($post->id) ?></td>
                                            <td><?= h($post->blog_id) ?></td>
                                            <td><?= h($post->title) ?></td>
                                            <td><?= h($post->content) ?></td>
                                            <!-- <td><?= h($post->image) ?></td> -->
                                            <td>
    <?php if (!empty($post->image)) : ?>
        <?= $this->Html->image($post->image, ['alt' => 'Post Image', 'style' => 'max-width: 100px; height: auto;']) ?>
    <?php else : ?>
        <span>No Image</span>
    <?php endif; ?>
</td>

                                            <td><?= h($post->created->format('d M Y')) ?></td>
                                            <td><?= h($post->modified->format('d M Y')) ?></td>
                                            <td>
                                                <?= $this->Html->link('<i class="fa fa-eye"></i>', ['controller' => 'Posts', 'action' => 'view', $post->id], ['escape' => false, 'class' => 'btn btn-info btn-sm']) ?>
                                                <?= $this->Html->link('<i class="fa fa-pencil"></i>', ['controller' => 'Posts', 'action' => 'edit', $post->id], ['escape' => false, 'class' => 'btn btn-warning btn-sm']) ?>
                                                <?= $this->Form->postLink('<i class="fa fa-trash"></i>', ['controller' => 'Posts', 'action' => 'delete', $post->id], [
                                                    'escape' => false,
                                                    'class' => 'btn btn-danger btn-sm',
                                                    'confirm' => __('Are you sure you want to delete # {0}?', $post->id)
                                                ]) ?>
                                            </td>
                                        </tr>
                                        <?php endforeach; ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
