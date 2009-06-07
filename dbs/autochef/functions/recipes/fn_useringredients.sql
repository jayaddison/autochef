create or replace function fn_useringredients
(
    username text,
    languageid char(2)
)
returns setof tpingredientlink as
$$
begin
    return query
        select t.ingredientid, t.name
        from tbuseringredients as u
        join tbingredienttranslations as t on t.ingredientid = u.ingredientid
        where u.username = username
        and t.languageid = languageid;
end;
$$
language plpgsql;
