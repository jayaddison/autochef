create or replace function fn_userpossibleingredients
(
    username text
)
returns setof tpingredientid as
$$
declare
    ret tpingredientid;
    rowcount int;
begin
    create temporary table _possibleingredients
    (
        ingredientid int,

        primary key (ingredientid)
    );

    insert into _possibleingredients (ingredientid)
    select i.ingredientid
    from tbuseringredients as i
    where i.username = username;

    loop
        insert into _possibleingredients (ingredientid)
        select d.parentid as ingredientid
        from _possibleingredients as i
        join tbingredientdependencies as d on d.childid = i.ingredientid
        left join _possibleingredients as p on p.ingredientid = d.childid
        where not exists
        (
            select *
            from _possibleingredients as i
            where i.ingredientid = d.parentid
        )
        group by d.parentid
        having count(*) = sum(case when p.ingredientid is null then 0 else 1 end);

        get diagnostics rowcount = row_count;
        exit when rowcount = 0;
    end loop;

    return query
        select i.ingredientid
        from _possibleingredients as i;
end;
$$
language plpgsql;
