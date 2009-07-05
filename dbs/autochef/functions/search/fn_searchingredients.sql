create or replace function fn_searchingredients
(
    searchtext text,
    languageid char(2)
)
returns setof tpingredientlink as
'
begin
    return query
        select p.ingredientid, t.name as ingredientname
        from tbingredienttranslations as t
        join tbproducts as p on p.ingredientid = t.ingredientid
        where t.languageid = languageid
        and t.name ilike textcat(''%'', textcat(searchtext, ''%''))
        limit 9;
end
'
language plpgsql;
