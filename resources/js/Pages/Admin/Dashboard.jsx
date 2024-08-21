import DashboardCard from '@/Components/Front/DashboardCard';
import AdminLayout from '@/Layouts/AdminLayout';
import { Head, usePage, Link } from '@inertiajs/react';

export default function Dashboard({ auth }) {
     const { info } = usePage().props;
     
     return (
          <AdminLayout
               user={auth.user}
               header={<h2 className="font-semibold leading-tight text-md text-slate-800">Admin / Dashboard</h2>}
          >
               <Head title="Admin Dashboard" />

               <section className="w-full">
                    <div className="p-2 overflow-hidden">
                         <div className="w-full p-4 rounded bg-slate-50 text-slate-700">
                              <h1 className="w-full text-lg font-semibold border-b border-slate-300 md:text-xl text-slate-700">
                                   <Link className="hover:text-yellow-600 hover:underline" href={route('admin.mongo.user.index')}>Users</Link>
                              </h1>
                              <div className="grid grid-cols-4 gap-2 pt-4">
                                   <DashboardCard 
                                        icon={'user'}
                                        iconBG={'bg-amber-50'} 
                                        iconClass={'text-amber-400 stroke-amber-400 w-8 h-8'}
                                        title={'Total'}
                                        content={info.users.statistics.count_users}
                                   />
                                   <DashboardCard
                                        icon={'user'}
                                        iconBG={'bg-blue-50'}
                                        iconClass={'text-blue-400 stroke-blue-400 w-8 h-8'}
                                        title={'Male'}
                                        content={info.users.statistics.male.count}
                                        other={info.users.statistics.male}
                                   />
                                   <DashboardCard
                                        icon={'user'}
                                        iconBG={'bg-pink-50'}
                                        iconClass={'text-pink-400 stroke-pink-400 w-8 h-8'}
                                        title={'Female'}
                                        content={info.users.statistics.female.count}
                                        other={info.users.statistics.female}
                                   />
                                   <DashboardCard
                                        icon={'user'}
                                        iconBG={'bg-green-50'}
                                        iconClass={'text-green-400 stroke-green-400 w-8 h-8'}
                                        title={'Verified'}
                                        content={info.users.statistics.verified_users.count}
                                        other={info.users.statistics.verified_users}
                                   />
                              </div>
                         </div>
                         <div className="w-full p-4 mt-4 rounded bg-slate-50 text-slate-700">
                              <h1 className="w-full text-lg font-semibold border-b border-slate-300 md:text-xl text-slate-700">Posts</h1>
                              <div className="grid grid-cols-4 gap-2 pt-4">
                                   <DashboardCard
                                        icon={'news-paper'}
                                        iconBG={'bg-lime-50'}
                                        iconClass={'text-lime-400 stroke-lime-400 w-8 h-8'}
                                        title={'Total'}
                                        content={info.post.count_post}
                                   />
                                   <DashboardCard
                                        icon={'home'}
                                        iconBG={'bg-amber-50'}
                                        iconClass={'text-amber-400 stroke-amber-400 w-8 h-8'}
                                        title={'Local News'}
                                        content={info.post.local_news.count}
                                        other={info.post.local_news}
                                   />
                                   <DashboardCard
                                        icon={'clipboard-document'}
                                        iconBG={'bg-violet-50'}
                                        iconClass={'text-violet-400 stroke-violet-400 w-8 h-8'}
                                        title={'Other News'}
                                        content={info.post.other_post.count}
                                        other={info.post.other_post}
                                   />
                                   <DashboardCard
                                        icon={'share'}
                                        iconBG={'bg-cyan-50'}
                                        iconClass={'text-cyan-400 stroke-cyan-400 w-8 h-8'}
                                        title={'News Shared'}
                                        content={info.post.news_shared.count}
                                        other={info.post.news_shared}
                                   />
                                   <DashboardCard
                                        icon={'user'}
                                        iconBG={'bg-green-50'}
                                        iconClass={'text-green-400 stroke-green-400 w-8 h-8'}
                                        title={'User Posts'}
                                        content={info.post.user_post.count}
                                        other={info.post.user_post}
                                   />
                              </div>
                         </div>
                    </div>
               </section>
          </AdminLayout>
     );
}
