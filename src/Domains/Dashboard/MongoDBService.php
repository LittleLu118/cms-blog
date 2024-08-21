<?php 

namespace Domains\Dashboard;

use Illuminate\Contracts\Pagination\Paginator;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;

class MongoDBService {
     protected $connection;
     protected $collection;

     private function __construct(string $collection)
     {
          $this->connection = DB::connection('mongodb');
          $this->collection = $collection;
     }

     public static function collection(string $collection): MongoDBService
     {
          return new MongoDBService($collection);
     }

     public function getUsers(int $paginate = 10): array
     {
          return [
               'statistics' => $this->formatUserCollection($this->connection->collection($this->collection)->get()),
               'users' => $this->formatUser($this->connection->collection($this->collection)->paginate($paginate))
          ];
     }

     public function getPosts(): array
     {
          return $this->formatPostCollection($this->connection->collection($this->collection)->get());
     }

     public function usersList(int $paginate = 50)
     {
          return $this->formatUser($this->connection->collection($this->collection)->simplePaginate($paginate));
     }

     public function userVerification(string $user, array $data)
     {
          return $this->connection->collection($this->collection)
               ->where('_id', $user)
               ->update($data);
     }

     protected function formatUserCollection(Collection $users)
     {
          $stats = [
               'count_users' => $users->count(),
               'male' => ['count' => 0, 'percent' => 0],
               'female' => ['count' => 0, 'percent' => 0],
               'verified_users' => ['count' => 0, 'percent' => 0]
          ];
          foreach ($users as $user) {
               if ($user['gender'] === "Man") {
                    $stats['male']['count']++;
               }

               if ($user['gender'] === "Woman") {
                    $stats['female']['count']++;
               }

               if ($user['isVarified']) {
                    $stats['verified_users']['count']++;
               }
          }

          $stats['male']['percent'] = round(($stats['male']['count'] / $stats['count_users']) * 100, 2);
          $stats['female']['percent'] = round(($stats['female']['count'] / $stats['count_users']) * 100, 2);
          $stats['verified_users']['percent'] = round(($stats['verified_users']['count'] / $stats['count_users']) * 100, 2);
          
          return $stats;
     }

     protected function formatUser(Paginator $users): array
     {
          $list = collect($users->items())->map(function($user) {
               return [
                    'id' => $user['_id']->jsonSerialize()['$oid'],
                    'name' => $user['name'],
                    'username' => $user['username'],
                    'email' => $user['email'],
                    'verified' => $user['isVarified'] ? true : false,
                    'verified_text' => $user['isVarified'] ? 'Yes' : 'No',
               ];
          })->toArray();

          return [
               'data' => $list,
               'links' => [
                    'perPage' => $users->perPage(),
                    'currentPage' => $users->currentPage(),
                    'prev_page' => $users->previousPageUrl(),
                    'next_page' => $users->nextPageUrl()
               ]
          ];
     }

     protected function formatPostCollection(Collection $posts): array
     {
          $stats = [
               'count_post' => $posts->count(),
               'local_news' => ['count' => 0, 'percent' => 0],
               'news_shared' => ['count' => 0, 'percent' => 0],
               'user_post' => ['count' => 0, 'percent' => 0],
               'other_post' => ['count' => 0, 'percent' => 0]
          ];

          foreach ($posts as $post) {
               if (isset($post['type']) && $post['type'] === 'Local' && $post['postType'] === "News") {
                    $stats['local_news']['count']++;
               } else if (isset($post['postType']) && $post['postType'] === 'Shared') {
                    $stats['news_shared']['count']++;
               } else if (isset($post['postType']) && $post['postType'] === 'Image') {
                    $stats['user_post']['count']++;
               } else {
                    $stats['other_post']['count']++;
               }
          }

          $stats['local_news']['percent'] = round(($stats['local_news']['count'] / $stats['count_post']) * 100, 2);
          $stats['news_shared']['percent'] = round(($stats['news_shared']['count'] / $stats['count_post']) * 100, 2);
          $stats['user_post']['percent'] = round(($stats['user_post']['count'] / $stats['count_post']) * 100, 2);
          $stats['other_post']['percent'] = round(($stats['other_post']['count'] / $stats['count_post']) * 100, 2);

          return $stats;
     }
}