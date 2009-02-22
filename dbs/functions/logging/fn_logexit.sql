create or replace function fn_logexit
(
    log_pageviewid int,
    log_sourceid char(5),
    log_supplierid char(4),
    log_ingredientid int
)
returns void as $$
begin
    insert into tbexits (pageviewid, sourceid, supplierid, ingredientid)
    values (log_pageviewid, log_sourceid, log_supplierid, log_ingredientid);
end
$$ language plpgsql;
