create or replace function fn_searchrecipes
(
    searchtext text,
    languageid char(2)
)
returns setof tpingredientlink as
$$
declare
    ret tpingredientlink;
begin
    for ret in
        select m.ingredientid, t.name as ingredientname
        from tbingredienttranslations as t
        join tbmeals as m on m.ingredientid = t.ingredientid
        where t.languageid = languageid
        and t.name ilike textcat('%', textcat(searchtext, '%'))
        limit 9
    loop
        return next ret;
    end loop;
end
$$
language plpgsql;
