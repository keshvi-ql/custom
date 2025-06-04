<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Table;

class BlogTranslationsTable extends Table
{
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('blog_translations'); // your custom translation table name
        $this->setPrimaryKey('id');
    }
}
