select min(created) from ad_session_usage_audit;

select (case when process_time<10                      then '01. <10' 
             when process_time between 11    and 50    then '02. 10-50'
             when process_time between 51    and 100   then '03. 50-100'
             when process_time between 101   and 200   then '04. 100-200'
             when process_time between 201   and 300   then '05. 200-300'
             when process_time between 301   and 400   then '06. 300-400'
             when process_time between 401   and 500   then '07. 400-500'
             when process_time between 501   and 1000  then '08. 500-1000'
             when process_time between 1001  and 5000  then '09. 1000-5000'
             when process_time between 5001  and 10000 then '10. 5000-1000'
             when process_time between 10001 and 50000 then '11. 10000-50000'
             else                                           '12. >50000' end) as time, count(*)
from ad_session_usage_audit 
group by 1
order by 1;