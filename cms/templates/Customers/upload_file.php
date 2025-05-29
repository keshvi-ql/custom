<h1>Upload File</h1>

<?= $this->Form->create(null, ['type' => 'file']) ?>
    <?= $this->Form->control('profile_picture', ['type' => 'file']) ?>
    <?= $this->Form->button(__('Upload')) ?>
<?= $this->Form->end() ?>
