create or replace function fn_login
(
    username text,
    password text
)
returns text as
'
    select u.username
    from tbusers as u
    where u.username = $1
    and u.password = md5($2);
'
language sql strict stable;
