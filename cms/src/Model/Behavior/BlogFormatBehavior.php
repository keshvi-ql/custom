<?php
namespace App\Model\Behavior;

use Cake\ORM\Behavior;
use Cake\Event\EventInterface;
use ArrayObject;
use Cake\Datasource\EntityInterface;

class BlogFormatBehavior extends Behavior
{
   protected array $_defaultConfig = [
      'titleField' => 'title',
      'slugField' => 'slug',
   ];

   public function beforeSave(EventInterface $event, EntityInterface $entity, ArrayObject $options): void
   {
      $titleField = $this->getConfig('titleField');
      $slugField = $this->getConfig('slugField');

      if ($entity->isDirty($titleField)) {
         $title = $entity->get($titleField);
         $slug = $this->generateSlug($title);

         $entity->set($titleField, ucwords(strtolower($title)));
         $entity->set($slugField, $slug);

         dd([
               'formatted_title' => $entity->get($titleField),
               'generated_slug' => $slug
         ]);
      }
   }

   public function generateSlug(string $string): string
   {
      return strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $string), '-'));
   }

   public function formatBlog(EntityInterface $entity): array
   {
      $titleField = $this->getConfig('titleField');

      $original = $entity->get($titleField);
      if (empty($original)) {
         return [
               'original' => null,
               'slug' => ''
         ];
      }

      $slug = $this->generateSlug($original);

      return [
         'original' => $original,
         'slug' => $slug
      ];
   }
}
