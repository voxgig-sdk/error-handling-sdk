<?php
declare(strict_types=1);

// ErrorHandling SDK utility: result_headers

class ErrorHandlingResultHeaders
{
    public static function call(ErrorHandlingContext $ctx): ?ErrorHandlingResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
