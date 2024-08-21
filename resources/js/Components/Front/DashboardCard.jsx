import Icon from "@/Components/Icon";

export default function DashboardCard({ icon, iconBG, iconClass, title, content, other = {} }) {
     return (
          <div className="p-5 bg-white rounded shadow-sm">
               <div className="flex items-center space-x-4">
                    <div>
                         <div className={`flex items-center justify-center w-12 h-12 rounded-full ${iconBG}`}>
                              <Icon name={icon} className={iconClass} />
                         </div>
                    </div>
                    <div>
                         <div className="text-gray-400">{title}</div>
                         <div className="flex w-full space-x-4 text-2xl font-bold text-slate-700">
                              <div>{content}</div>
                              {other.percent ? <span className="text-sm font-light text-slate-500"> {other.percent}% of total</span> : null}
                         </div>
                    </div>
               </div>
          </div>
     );
}