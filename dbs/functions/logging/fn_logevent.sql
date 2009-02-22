create or replace function fn_logevent
(
    log_severity text,
    log_component text,
    log_event text,
    log_message text
)
returns void as $$
begin
    insert into tbevents (severity, component, event, message)
    values (log_severity, log_component, log_event, log_message);
end
$$ language plpgsql;
