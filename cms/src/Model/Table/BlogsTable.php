<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Query\SelectQuery;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;
use Cake\Database\Schema\TableSchemaInterface;
use Cake\ORM\Behavior\Translate\EavStrategy;

/**
 * Blogs Model
 */
class BlogsTable extends Table
{
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('blogs');
        $this->setDisplayField('title');
        $this->setPrimaryKey('id');

        // $this->addBehavior('Timestamp');
        $this->addBehavior('BlogFormat'); // Add custom behavior

        // Attach SluggableBehavior and rename slug() to superSlug()
        // $this->addBehavior('Sluggable', [
        //     'implementedMethods' => [
        //         'superSlug' => 'slug',
        //     ]
        // ]);

        $this->addBehavior('Sluggable', [
            'field' => 'title',
            'slug' => 'slug',
            'replacement' => '-',
            'implementedMethods' => [
                  'superSlug' => 'generateSlug', // ✅ Correct: generateSlug accepts a string
            ]
        ]);

        
        // Using and Configuring the Behavior
        $this->addBehavior('Timestamp', [
            'events' => [
                // Default created and modified columns
                'Model.beforeSave' => [
                    'created' => 'new',   // Set on new records
                    'modified' => 'always',  // Set on every save
                ],
                // Custom event example (if you want to update mutation timestamp)
                'Blogs.mutation' => [
                    'mutation' => 'always', // update mutation timestamp or JSON field as you wish
                ],
            ],
        ]);

        // Translate
        
        // Translate behavior with EAV strategy
        $this->addBehavior('Translate', [
            'fields' => ['title', 'content'],
            'strategyClass' => EavStrategy::class,
            'defaultLocale' => 'en_US', // change to your app default locale if needed
        ]);

        $this->hasMany('Posts', [
            'foreignKey' => 'blog_id',
        ]);
         // Add this association
        $this->belongsTo('Categories', [
            'foreignKey' => 'category_id', // assuming your blogs table has category_id column
            'joinType' => 'INNER',
        ]);
    }

    public function validationDefault(Validator $validator): Validator
    {
        $validator
            ->scalar('title')
            ->maxLength('title', 200)
            ->requirePresence('title', 'create')
            ->notEmptyString('title');

        $validator
            ->scalar('content')
            ->requirePresence('content', 'create')
            ->notEmptyString('content');

        $validator
            ->scalar('author')
            ->maxLength('author', 100)
            ->allowEmptyString('author');

        return $validator;
    }

    /**
     * Override getSchema to define custom column types.
     */
    public function getSchema(): TableSchemaInterface
    {
        $schema = parent::getSchema();

        // Safely assign custom type only if column exists
        if ($schema->hasColumn('mutation')) {
            $schema->setColumnType('mutation', 'point_mutation');
        }

        return $schema;
    }
}
