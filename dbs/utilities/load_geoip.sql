create temporary table geoipimport
(
    range_start text,
    range_end text,
    ip_start text,
    ip_end text,
    countryid text,
    countryname text
);

copy geoipimport from stdin csv;

insert into tbcountries (countryid)
select distinct countryid from geoipimport
where not exists
(
    select *
    from tbcountries
    where tbcountries.countryid = geoipimport.countryid
);

delete from tbgeoipranges;
insert into tbgeoipranges (range_start, range_end, countryid) select range_start::inet, range_end::inet, countryid::char(2) from geoipimport;
