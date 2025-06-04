<?php
namespace App\Model\Behavior;

use ArrayObject;
use Cake\Datasource\EntityInterface;
use Cake\Event\EventInterface;
use Cake\ORM\Behavior;
use Cake\ORM\Query\SelectQuery;
use Cake\Utility\Text;

class SluggableBehavior extends Behavior
{
    protected array $_defaultConfig = [
    'field' => 'title',
    'slug' => 'slug',
    'replacement' => '-',
    'implementedMethods' => [
        'superSlug' => 'generateSlug', // ✅ Calls correct method
    ],
];

    public function generateSlug(string $title): string
{
    return Text::slug($title, $this->_config['replacement']);
}

    public function slug(EntityInterface $entity): void
    {
        $config = $this->getConfig();
        $value = $entity->get($config['field']);

        if ($value !== null) {
            $slug = Text::slug($value, $config['replacement']);
            $entity->set($config['slug'], $slug);
        }
    }

    // Automatically slug before saving
    public function beforeSave(EventInterface $event, EntityInterface $entity, ArrayObject $options): void
    {
        $this->slug($entity);
    }

    // Finder to search by slug
    public function findSlug(SelectQuery $query, string $slug): SelectQuery
    {
        $slugField = $this->getConfig('slug');
        return $query->where([$query->getRepository()->getAlias() . '.' . $slugField => $slug]);
    }
}
