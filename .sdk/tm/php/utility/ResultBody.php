<?php
declare(strict_types=1);

// ErrorHandling SDK utility: result_body

class ErrorHandlingResultBody
{
    public static function call(ErrorHandlingContext $ctx): ?ErrorHandlingResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
