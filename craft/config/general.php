<?php

use craft\config\GeneralConfig;
use craft\helpers\App;

return GeneralConfig::create()
    // Site and system
    ->defaultWeekStartDay(1)
    ->omitScriptNameInUrls()
    ->cpTrigger(App::env('CP_TRIGGER') ?: 'admin')

    // Headless mode
    ->headlessMode(true)

    // GraphQL configuration
    ->enableGql(true)
    ->enableGraphqlCaching(true)
    ->maxGraphqlComplexity(500)
    ->maxGraphqlDepth(10)
    ->maxGraphqlResults(1000)

    // Security
    ->securityKey(App::env('CRAFT_SECURITY_KEY'))
    ->allowAdminChanges(App::env('CRAFT_ALLOW_ADMIN_CHANGES') ?? true)
    ->devMode(App::env('CRAFT_DEV_MODE') ?? false)
    ->allowUpdates(App::env('CRAFT_ALLOW_UPDATES') ?? true)
    ->disallowRobots(App::env('CRAFT_DISALLOW_ROBOTS') ?? false)

    // File handling
    ->maxUploadFileSize('100M')
    ->convertFilenamesToAscii(true)

    // URLs
    ->aliases([
        '@web' => App::env('PRIMARY_SITE_URL'),
        '@webroot' => dirname(__DIR__) . '/web',
    ])

    // Caching (file-based)
    ->cacheDuration(86400)

    // Performance
    ->runQueueAutomatically(true)
    ->maxRevisions(10)

    // CORS for headless API
    ->allowedGraphqlOrigins(App::env('GRAPHQL_ALLOWED_ORIGINS') ? explode(',', App::env('GRAPHQL_ALLOWED_ORIGINS')) : ['*']);
