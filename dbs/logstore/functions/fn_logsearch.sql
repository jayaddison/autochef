create or replace function fn_logsearch
(
    log_searchtext text
)
returns void as
'
begin
    insert into tbsearches (searchtext)
    select log_searchtext;
end
'
language plpgsql;
