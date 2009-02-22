create or replace function fn_logsearch
(
    log_domainid char(5),
    log_searchtext text
)
returns void as $$
begin
    insert into tbsearches (domainid, searchtext)
    select log_domainid, log_searchtext;
end
$$ language plpgsql;
