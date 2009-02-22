create or replace function fn_userrecipeingredients
(
    username text,
    recipeid int,
    languageid char(2)
)
returns setof tprecipeingredient as
$$
declare
    ret tprecipeingredient;
begin
    create temporary table _possibleuseringredients (ingredientid int primary key);
    create temporary table _parentingredients
    (
        treenodeid int,

        ingredientid int,
        starttime interval,
        
        primary key (ingredientid, treenodeid)
    );

    create temporary table _requiredingredients
    (
        treenodeid serial,
        treeparentid int,

        ingredientid int,
        starttime interval,

        primary key (ingredientid, treenodeid)
    );

    create temporary table _choseningredients
    (
        treenodeid int,
        treeparentid int,

        ingredientid int,
        starttime interval,
        available bit,
        
        primary key (ingredientid, treenodeid)
    );

    -- All of the ingredients the user can create
    insert into _possibleuseringredients (ingredientid)
    select i.ingredientid
    from fn_userpossibleingredients(username) as i;

    -- Immediate dependencies of the recipe
    insert into _requiredingredients (treeparentid, ingredientid, starttime)
    select 0, i.ingredientid, '0'::interval
    from tbingredients as i
    where i.ingredientid = recipeid;

    loop
        -- Choose product ingredients which the user cannot create
        insert into _choseningredients (treenodeid, treeparentid, ingredientid, starttime, available)
        select r.treenodeid, r.treeparentid, r.ingredientid, r.starttime, 0::bit
        from _requiredingredients as r
        join tbproducts as p on p.ingredientid = r.ingredientid
        where not exists
        (
            select *
            from _possibleuseringredients as p
            where p.ingredientid = r.ingredientid
        );

        -- Choose any ingredients that the user has readily available
        insert into _choseningredients (treenodeid, treeparentid, ingredientid, starttime, available)
        select r.treenodeid, r.treeparentid, r.ingredientid, r.starttime, 1::bit
        from _requiredingredients as r
        join tbuseringredients as u on u.ingredientid = r.ingredientid
        where u.username = username;

        -- Remove chosen ingredients from requirement list
        delete from _requiredingredients
        where exists
        (
            select *
            from _choseningredients as c
            where c.treenodeid = _requiredingredients.treenodeid
            and c.ingredientid = _requiredingredients.ingredientid
        );

        -- Replace remaining (all unsatisfied) requirements with their dependencies
        truncate table _parentingredients;
        insert into _parentingredients (treenodeid, ingredientid, starttime)
        select r.treenodeid, r.ingredientid, r.starttime
        from _requiredingredients as r;

        insert into _choseningredients (treenodeid, treeparentid, ingredientid, starttime)
        select r.treenodeid, r.treeparentid, r.ingredientid, r.starttime
        from _requiredingredients as r;

        truncate table _requiredingredients;
        insert into _requiredingredients (treeparentid, ingredientid, starttime)
        select p.treenodeid, d.childid, p.starttime + i.duration
        from _parentingredients as p
        join tbingredients as i on i.ingredientid = p.ingredientid
        join tbingredientdependencies as d on d.parentid = p.ingredientid;

        exit when not exists (select * from _requiredingredients);
    end loop;

    update _choseningredients
    set starttime = starttime - (select max(starttime) from _choseningredients);

    return query
        select
            c.treenodeid,
            c.treeparentid,
            c.ingredientid,
            t.name as ingredientname,
            t.instructions,
            i.duration,
            - (c.starttime + i.duration) as starttime,
            c.available
        from _choseningredients as c
        join tbingredients as i on i.ingredientid = c.ingredientid
        join tbingredienttranslations as t on t.ingredientid = c.ingredientid
        where t.languageid = 'en'
        order by c.treenodeid desc;
end;
$$
language plpgsql;
