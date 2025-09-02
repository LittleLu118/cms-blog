import AdminLayout from '@/Layouts/AdminLayout';
import { Head, usePage } from '@inertiajs/react';
import DataTable from '@/Pages/Admin/Components/DataTable';
import DataTableItem from '@/Pages/Admin/Components/DataTableItem';
import Pagination from '@/Components/Pagination';

export default function Index({ auth }) {
     const { info } = usePage().props;
     const newsletter = info.newsletter;

     return (
          <AdminLayout
               user={auth.user}
               header={<h2 className="font-semibold leading-tight text-md text-slate-700">Admin / <span className="text-slate-500">Newsletter Subscribers</span></h2>}
          >
               <Head title="Admin Newsletter Subscribers" />

               <section className="w-full">
                    <div className="p-4 bg-white">
                         <div className="w-full col-span-12">
                              <DataTable header={info.header} showNoData={newsletter.length}>
                                   {newsletter.map((nl, i) => {
                                        return <tr key={`category${i}`} className="hover:bg-slate-50">
                                             <DataTableItem>{nl.email}</DataTableItem>
                                             <DataTableItem>{nl.created}</DataTableItem>
                                        </tr>
                                   })}
                              </DataTable>
                              <Pagination links={info.newsletter.links} />
                         </div>
                    </div>
               </section>
          </AdminLayout>
     );
}
