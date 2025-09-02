import AdminLayout from '@/Layouts/AdminLayout';
import { Head, Link, usePage } from '@inertiajs/react';
import DataTable from '@/Pages/Admin/Components/DataTable';
import DataTableItem from '@/Pages/Admin/Components/DataTableItem';
import FlashMessage from '@/Components/FlashMessage';
import Pagination from '@/Components/Pagination';

export default function Index({ auth }) {
     const { info } = usePage().props;
     const users = info.users.data;

     return (
          <AdminLayout
               user={auth.user}
               header={<h2 className="font-semibold leading-tight text-md text-slate-700">Admin / <span className="text-slate-500">App Users</span></h2>}
          >
               <Head title="Admin App User" />

               <section className="w-full">
                    <div className="p-4 bg-white">
                         <div className="w-full col-span-12">
                              <FlashMessage />
                              <DataTable header={info.header} showNoData={users.length}>
                                   {users.map(({ id, name, username, email, verified, verified_text }, i) => {
                                        return <tr key={`usr${i}`} className="hover:bg-slate-50">
                                             <DataTableItem>{name}</DataTableItem>
                                             <DataTableItem>{username}</DataTableItem>
                                             <DataTableItem>{email}</DataTableItem>
                                             <DataTableItem>
                                                  <span className={`${verified ? 'text-green-700' : 'text-red-700'}`}>{verified_text}</span>
                                             </DataTableItem>
                                             <DataTableItem>
                                                  {info.authorize_to.verify ? <Link 
                                                       className={`px-2 py-1 text-semibold rounded ${verified ? 'text-red-700 border border-red-300  hover:bg-red-300' : 'text-green-700 border border-green-300  hover:bg-green-300 '}`} 
                                                       as="button" 
                                                       type="button" 
                                                       method="post" 
                                                       data={{ verify: verified }}
                                                       href={route('admin.mongo.user.verification', id)}>
                                                       {verified ? 'Unverify' : 'Verify'}
                                                  </Link> : null}
                                             </DataTableItem>
                                        </tr>
                                   })}
                              </DataTable>
                              <div className="flex justify-between w-full mt-4">
                                   {info.users.links.prev_page ? <Link className="px-2 py-1 text-white rounded bg-sky-400 hover:bg-sky-600" href={info.users.links.prev_page} >Previous</Link> : null}
                                   {info.users.links.next_page ? <Link className="px-2 py-1 text-white rounded bg-sky-400 hover:bg-sky-600" href={info.users.links.next_page} >Next</Link> : null}
                              </div>
                         </div>
                    </div>
               </section>
          </AdminLayout>
     );
}
