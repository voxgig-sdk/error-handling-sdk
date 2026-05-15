<?php
declare(strict_types=1);

// ErrorHandling SDK exists test

require_once __DIR__ . '/../errorhandling_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = ErrorHandlingSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
