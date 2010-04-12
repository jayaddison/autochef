create or replace function fn_searchrecipes
(
    searchtext text,
    languageid char(2)
)
returns setof tpingredientlink as
'
begin
    return query
        select m.ingredientid, t.name as ingredientname
        from tbingredienttranslations as t
        join tbingredients as m on m.ingredientid = t.ingredientid
        where m.meal
        and t.languageid = languageid
        and t.name ilike textcat(''%'', textcat(searchtext, ''%''))
        limit 9;
end
'
language plpgsql;
