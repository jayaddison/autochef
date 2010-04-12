create or replace function fn_userrecipes
(
    username text,
    languageid char(2)
)
returns setof tpingredientlink as
'
begin
    return query
        select t.ingredientid, t.name
        from fn_userpossibleingredients(username) as i
        join tbingredients as m on m.ingredientid = i.ingredientid
        join tbingredienttranslations as t on t.ingredientid = i.ingredientid
        where m.meal
        and t.languageid = ''en'';
end;
'
language plpgsql;
