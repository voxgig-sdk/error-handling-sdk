<?php
declare(strict_types=1);

// ErrorHandling SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class ErrorHandlingMakeContext
{
    public static function call(array $ctxmap, ?ErrorHandlingContext $basectx): ErrorHandlingContext
    {
        return new ErrorHandlingContext($ctxmap, $basectx);
    }
}
