create or replace function fn_useringredients
(
    username text,
    languageid char(2)
)
returns setof tpingredientlink as
$$
declare
    ret tpingredientlink;
begin
    for ret in
        select t.ingredientid, t.name
        from tbuseringredients as u
        join tbingredienttranslations as t on t.ingredientid = u.ingredientid
        where u.username = username
        and t.languageid = languageid
    loop
        return next ret;
    end loop;
end;
$$
language plpgsql;
