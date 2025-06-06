<?php

declare(strict_types=1);

namespace Brick\VarExporter\Internal\ObjectExporter;

use Brick\VarExporter\Internal\ObjectExporter;
use Override;

/**
 * Handles instances of classes with __serialize() and __unserialize() methods.
 *
 * @internal This class is for internal use, and not part of the public API. It may change at any time without warning.
 */
final class SerializeExporter extends ObjectExporter
{
    #[Override]
    public function supports(\ReflectionObject $reflectionObject) : bool
    {
        return $reflectionObject->hasMethod('__serialize')
            && $reflectionObject->hasMethod('__unserialize');
    }

    #[Override]
    public function export(object $object, \ReflectionObject $reflectionObject, array $path, array $parentIds) : array
    {
        $lines = $this->getCreateObjectCode($reflectionObject);

        $lines[] = '';

        /**
         * @psalm-suppress MixedAssignment
         * @psalm-suppress MixedMethodCall
         */
        $values = $object->__serialize();

        $exportedValues = $this->exporter->export($values, $path, $parentIds);
        $exportedValues = $this->exporter->wrap($exportedValues, '$object->__unserialize(', ');');

        $lines = array_merge($lines, $exportedValues);

        $lines[] = '';
        $lines[] = 'return $object;';

        return $this->wrapInClosure($lines);
    }
}
