<?php

declare(strict_types=1);

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Domains\Dashboard\MongoDBService;
use Illuminate\Http\Request;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function __invoke(Request $request)
    {
        Inertia::setRootView('admin');
        
        return Inertia::render('Admin/Dashboard', ['info' => [
            'users' => MongoDBService::collection('users')->getUsers(),
            'post' => MongoDBService::collection('posts')->getPosts()
        ]]);
    }
}
