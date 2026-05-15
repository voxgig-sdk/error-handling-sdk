<?php
declare(strict_types=1);

// ErrorHandling SDK utility: prepare_body

class ErrorHandlingPrepareBody
{
    public static function call(ErrorHandlingContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
