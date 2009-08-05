create or replace function fn_importrecipes
(
    input xml
)
returns setof record as
'
begin
    create temporary table ingredients
    (
        ingredientid varchar(12),
        duration interval
    );

    insert into ingredients (ingredientid, duration)
    select
        (xpath(''/ingredient/@ingredientid'', t.xml))[1],
        coalesce(nullif((xpath(''/ingredient/@duration'', t.xml))[1]::text, ''''), ''0'')::interval
    from unnest(xpath(''/xml/ingredients/ingredient'', input)) as t;

    create temporary table translations
    (
        ingredientid varchar(12),
        languageid char(2),
        name text,
        instructions text
    );

    insert into translations (ingredientid, languageid, name, instructions)
    select
        (xpath(''/translation/@ingredientid'', t.xml))[1],
        (xpath(''/translation/@languageid'', t.xml))[1],
        (xpath(''/translation/name/text()'', t.xml))[1],
        (xpath(''/translation/instructions/text()'', t.xml))[1]
    from unnest(xpath(''/xml/translations/translation'', input)) as t;

    create temporary table dependencies
    (
        parentid varchar(12),
        childid varchar(12)
    );

    insert into dependencies (parentid, childid)
    select
        (xpath(''/dependency/@parentid'', t.xml))[1],
        (xpath(''/dependency/@ingredientid'', t.xml))[1]
    from unnest(xpath(''/xml/dependencies/dependency'', input)) as t;

    return query
        select *
        from ingredients as i
        join dependencies as d on d.childid = i.ingredientid
        join translations as t on t.ingredientid = i.ingredientid;
end;
'
language plpgsql;
