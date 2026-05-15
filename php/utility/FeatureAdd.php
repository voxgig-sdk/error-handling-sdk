<?php
declare(strict_types=1);

// ErrorHandling SDK utility: feature_add

class ErrorHandlingFeatureAdd
{
    public static function call(ErrorHandlingContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
