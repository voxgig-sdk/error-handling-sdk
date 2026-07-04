<?php
declare(strict_types=1);

// ErrorHandling SDK configuration

class ErrorHandlingConfig
{
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "ErrorHandling",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://abhi-api.vercel.app",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "logo_generation" => [],
                ],
            ],
            "entity" => [
        'logo_generation' => [
          'fields' => [],
          'name' => 'logo_generation',
          'op' => [
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'active' => true,
                  'args' => [
                    'query' => [
                      [
                        'active' => true,
                        'example' => 'Hello',
                        'kind' => 'query',
                        'name' => 'text',
                        'orig' => 'text',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'method' => 'GET',
                  'orig' => '/api/logo/neon',
                  'parts' => [
                    'api',
                    'logo',
                    'neon',
                  ],
                  'select' => [
                    'exist' => [
                      'text',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'index$' => 0,
                ],
              ],
              'key$' => 'load',
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return ErrorHandlingFeatures::make_feature($name);
    }
}
