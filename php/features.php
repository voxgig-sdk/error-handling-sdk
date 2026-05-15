<?php
declare(strict_types=1);

// ErrorHandling SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class ErrorHandlingFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new ErrorHandlingBaseFeature();
            case "test":
                return new ErrorHandlingTestFeature();
            default:
                return new ErrorHandlingBaseFeature();
        }
    }
}
