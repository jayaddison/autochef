create or replace function unnest(anyarray)
returns setof anyelement as
$$
    select $1[i]
    from generate_series(array_lower($1, 1), array_upper($1, 1)) as i;
$$
language sql immutable;
