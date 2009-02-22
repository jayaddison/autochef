create or replace function fn_logpageview
(
    log_serverip text,
    log_clientip text,
    log_requesturl text,
    log_referer text,
    log_useragent text,
    log_acceptlanguage text
)
returns int as $$
declare
    ret_pageviewid int;
begin
    insert into tbpageviews (serverip, clientip, requesturl, referer, useragent, acceptlanguage)
    values (log_serverip::inet, log_clientip::inet, log_requesturl, log_referer, log_useragent, log_acceptlanguage);

    get diagnostics ret_pageviewid = RESULT_OID;
    return ret_pageviewid;
end
$$ language plpgsql;
