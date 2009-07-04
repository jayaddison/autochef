create or replace function fn_importrecipes
(
    input xml
)
returns setof record as
$$
begin
    create temporary table translations
    (
        ingredientid varchar(12),
        languageid char(2),
        name text,
        instructions text
    );

    insert into translations (ingredientid, languageid, name, instructions)
    select
        (xpath('/translation/@ingredientid', t.xml))[1],
        (xpath('/translation/@languageid', t.xml))[1],
        (xpath('/translation/name/text()', t.xml))[1],
        (xpath('/translation/instructions/text()', t.xml))[1]
    from unnest(xpath('/xml/translations/translation', input)) as t;

    create temporary table dependencies
    (
        parentid varchar(12),
        childid varchar(12)
    );

    insert into dependencies (parentid, childid)
    select
        (xpath('/dependency/@parentid', t.xml))[1],
        (xpath('/dependency/@ingredientid', t.xml))[1]
    from unnest(xpath('/xml/dependencies/dependency', input)) as t;

    return query
        select *
        from translations as t
        join dependencies as d on d.childid = t.ingredientid;
end;
$$
language plpgsql;
