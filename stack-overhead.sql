select '0. ALL' as type, sum(calls) calls, sum(total_time) total_time, '-' as query    FROM pg_stat_statements 
union
select '1. NEW SESSIONS', sum(calls) calls, sum(total_time) total_time, substring(trim(query),0,100) as qry from pg_stat_statements where query like '%insert into AD_Session (%'  group by qry
union 
select '2. HSAS', sum(calls) calls, sum(total_time) total_time, trim(query) from pg_stat_statements where query ilike '%FROM AD_SESSION WHERE AD_SESSION_ID%'  group by trim(query)
union
select '2. HSAS', sum(calls) calls, sum(total_time) total_time, substring(trim(query),0,100) as qry from pg_stat_statements where query like '%FROM AD_Process_Access%'  group by qry
union
select '2. HSAS', sum(calls) calls, sum(total_time) total_time, substring(trim(query),0,100) as qry from pg_stat_statements where query ilike '%SELECT ACCESSLEVEL%'  group by qry
union
select '3. ALERT PING', sum(calls) calls, sum(total_time) total_time, substring(trim(query),0,100) as qry from pg_stat_statements where query ilike '%select count(*) from AD_ALERT%'  group by qry
union
select '3. ALERT PING', sum(calls) calls, sum(total_time) total_time, substring(trim(query),0,100) as qry from pg_stat_statements where query ilike '%from AD_AlertRecipient%'  group by qry
union
select '3. USAGE', sum(calls) calls, sum(total_time) total_time, substring(trim(query),0,100) as qry from pg_stat_statements where query ilike '%INSERT INTO ad_session_usage_audit%'  group by qry
union
select '3. SESSION PING', sum(calls) calls, sum(total_time) total_time, trim(query) from pg_stat_statements where query ilike '%update ad_session%SET last_session_ping%' group by trim(query)
union
select '4. AD_LANGUAGE', sum(calls) calls, sum(total_time) total_time, substring(trim(query),0,100) as qry from pg_stat_statements where query like 'select adlanguage0_.AD_Language_ID as AD1_55_0_%from AD_Language%' group by qry
union
select '5. BP SEL DR DW',sum(calls) calls, sum(total_time) total_time, substring(trim(query),0,100) as qry from pg_stat_statements where query ilike '%Upper(businesspa0_.value) LIKE Upper%' group by qry

order by 1,2;