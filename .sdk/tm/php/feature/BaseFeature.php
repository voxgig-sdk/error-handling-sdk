<?php
declare(strict_types=1);

// ErrorHandling SDK base feature

class ErrorHandlingBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(ErrorHandlingContext $ctx, array $options): void {}
    public function PostConstruct(ErrorHandlingContext $ctx): void {}
    public function PostConstructEntity(ErrorHandlingContext $ctx): void {}
    public function SetData(ErrorHandlingContext $ctx): void {}
    public function GetData(ErrorHandlingContext $ctx): void {}
    public function GetMatch(ErrorHandlingContext $ctx): void {}
    public function SetMatch(ErrorHandlingContext $ctx): void {}
    public function PrePoint(ErrorHandlingContext $ctx): void {}
    public function PreSpec(ErrorHandlingContext $ctx): void {}
    public function PreRequest(ErrorHandlingContext $ctx): void {}
    public function PreResponse(ErrorHandlingContext $ctx): void {}
    public function PreResult(ErrorHandlingContext $ctx): void {}
    public function PreDone(ErrorHandlingContext $ctx): void {}
    public function PreUnexpected(ErrorHandlingContext $ctx): void {}
}
