<?php
declare(strict_types=1);

// ErrorHandling SDK utility: clean

class ErrorHandlingClean
{
    public static function call(ErrorHandlingContext $ctx, mixed $val): mixed
    {
        return $val;
    }
}
