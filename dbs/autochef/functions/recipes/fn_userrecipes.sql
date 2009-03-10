create or replace function fn_userrecipes
(
    username text,
    languageid char(2)
)
returns setof tpingredientlink as
$$
declare
    ret tpingredientlink;
begin
    return query
        select t.ingredientid, t.name
        from fn_userpossibleingredients(username) as i
        join tbmeals as m on m.ingredientid = i.ingredientid
        join tbingredienttranslations as t on t.ingredientid = i.ingredientid
        where t.languageid = 'en';
end;
$$
language plpgsql;
