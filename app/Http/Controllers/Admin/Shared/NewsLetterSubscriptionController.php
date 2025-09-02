<?php

declare(strict_types=1);

namespace App\Http\Controllers\Admin\Shared;

use App\Http\Controllers\Controller;
use Domains\Shared\Models\NewsletterSubscription;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class NewsLetterSubscriptionController extends Controller
{
    public function index(Request $request)
    {
        return Inertia::render('Admin/Shared/NewsletterSubscription', ['info' => [
            'header' => ['E-mail', 'Date Subscribed'],
            'newsletter' => NewsletterSubscription::paginate(5)->map(function($subs){
                return ['email' => $subs->email, 'created' => $subs->created_at->format('d M Y')];
            }),
            'authorize_to' => [
                'create' => $request->user()->allowedTo('create-blog-category'),
                'edit' => $request->user()->allowedTo('update-blog-category'),
                'subs' => $request->user()->allowedTo('read-blog-sub-category')
            ]
        ]]);
    }
}
