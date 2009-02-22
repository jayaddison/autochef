create or replace function fn_randomrecipes
(
    languageid char(2)
)
returns setof tpingredientlink as
$$
    select m.ingredientid, t.name as ingredientname
    from tbmeals as m
    join tbingredienttranslations as t on t.ingredientid = m.ingredientid
    where t.languageid = languageid
    order by random()
    limit 9;
$$
language sql;
