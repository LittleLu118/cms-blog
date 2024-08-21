<?php

declare(strict_types=1);

namespace App\Http\Controllers\Admin\Mongo;

use App\Http\Controllers\Controller;
use Domains\Dashboard\MongoDBService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class UserController extends Controller
{
    public function __construct(
        protected readonly string $base_path = 'Admin/Mongo/User'
    ) {}

    public function index(Request $request)
    {
        $paginate = $request->get('paginate') ?? 20;

        return Inertia::render("{$this->base_path}/Index", ['info' => [
            'header' => ['Name', 'Username', 'E-mail', 'Verify', ''],
            'users' => MongoDBService::collection('users')->usersList($paginate),
            'authorize_to' => [
                'verify' => $request->user()->allowedTo('assign-role-to-user'),
                'assign_permission' => $request->user()->allowedTo('assign-permission-to-user'),
                'change_password' => $request->user()->allowedTo('change-user-password'),
            ],
        ]]);
    }

    public function verification(Request $request, $user)
    {
        $input = $request->get('verify');

        $action = MongoDBService::collection('users')
            ->userVerification($user, ['isVarified' => !$input]);

        $message = "Successfully ";
        $message .= ($input) ? "unverified user" : "verified user";

        if (!$action) {
            return redirect()->route('admin.mongo.user.index')->with('error', "Unable to perform this action");
        }

        return redirect()->route('admin.mongo.user.index')->with('success', $message);
    }
}
