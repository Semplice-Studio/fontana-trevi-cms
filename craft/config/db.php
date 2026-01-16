<?php

use craft\helpers\App;

return [
    'driver' => App::env('DB_DRIVER') ?: 'mysql',
    'server' => App::env('DB_SERVER') ?: 'db',
    'port' => App::env('DB_PORT') ?: 3306,
    'database' => App::env('DB_DATABASE') ?: 'craft',
    'user' => App::env('DB_USER') ?: 'craft',
    'password' => App::env('DB_PASSWORD') ?: '',
    'schema' => App::env('DB_SCHEMA') ?: 'public',
    'tablePrefix' => App::env('DB_TABLE_PREFIX') ?: '',
    'charset' => 'utf8mb4',
    'collation' => 'utf8mb4_unicode_ci',
];
