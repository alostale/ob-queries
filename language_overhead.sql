select now() as when, '0. ALL' as type, sum(calls) calls, sum(total_time) total_time, '-' as query    FROM pg_stat_statements 
union
select now() as when, '1. AD_LANGUAGE', sum(calls) calls, sum(total_time) total_time, substring(trim(query),0,100) as qry from pg_stat_statements where query like 'select adlanguage__.AD_Language_ID as AD1_55_0_%from AD_Language%'
group by query
order by 2,5;
