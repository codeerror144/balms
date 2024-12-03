<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Auth;
use App\Providers\CustomUserProvider;

class CustomAuthServiceProvider extends ServiceProvider
{


public function boot()
{
    $this->registerPolicies();

    Auth::provider('custom', function ($app, array $config) {
        return new CustomUserProvider($app['db']->connection(), $config['model']);
    });
}
}
