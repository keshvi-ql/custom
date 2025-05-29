<?php
declare(strict_types=1);

namespace App\Database\Type;

use Cake\Database\Driver;
use Cake\Database\Type\BaseType;

class PointMutationType extends BaseType
{
    public function toDatabase(mixed $value, Driver $driver): mixed
    {
        if ($value === null) {
            return null; // Store NULL in DB if PHP value is null
        }
        return json_encode($value);
    }

    public function toPHP(mixed $value, Driver $driver): mixed
    {
        if ($value === null) {
            return null; // Return null if DB value is null
        }
        return json_decode($value, true);
    }

    public function marshal(mixed $value): mixed
    {
        // This method converts request data into PHP values, so handle null or JSON strings here too.
        if (is_string($value)) {
            $decoded = json_decode($value, true);
            return $decoded === null ? $value : $decoded;
        }
        return $value;
    }
}
