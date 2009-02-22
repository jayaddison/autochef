create table tbingredients
(
    ingredientid serial,

    duration interval not null,

    primary key (ingredientid)
);

create table tbingredientdependencies
(
    parentid int references tbingredients (ingredientid),
    childid int references tbingredients (ingredientid),

    primary key (parentid, childid)
);
create index ixingredientparents on tbingredientdependencies (childid, parentid);

create table tblanguages
(
    languageid char(2),

    primary key (languageid)
);

create table tbcountries
(
    countryid char(2),

    primary key (countryid)
);

create table tbingredienttranslations
(
    ingredientid int references tbingredients (ingredientid),
    languageid char(2) references tblanguages (languageid),
    countryid char(2) references tbcountries (countryid),

    name text not null,
    instructions text not null,

    primary key (ingredientid, languageid, countryid)
);

create table tbmeals
(
    ingredientid int references tbingredients (ingredientid),

    primary key (ingredientid)
);

create table tbsuppliers
(
    supplierid char(4),

    primary key (supplierid)
);

create table tbproducts
(
    ingredientid int references tbingredients (ingredientid),
    supplierid char(4) references tbsuppliers (supplierid),

    primary key (ingredientid, supplierid)
);

create table tbusers
(
    username text,

    password text not null,

    primary key (username)
);

create table tbuseringredients
(
    username text references tbusers (username),
    ingredientid int references tbingredients (ingredientid),

    primary key (username, ingredientid)
);

create table tbingredientratings
(
    ingredientid int references tbingredients (ingredientid),
    username text references tbusers (username),

    rating int check (rating between 0 and 5),

    primary key (ingredientid, username)
);

create table tbingredienttags
(
    tag text,
    ingredientid int references tbingredients (ingredientid),
    username text references tbusers (username),

    primary key (tag, ingredientid, username)
);
create index ixingredienttags on tbingredienttags (ingredientid, tag);

create table tbevents
(
    eventid serial,

    datetime timestamp default now()::timestamp,

    severity text,
    component text,
    event text,
    message text,

    primary key (eventid)
);

create table tbpageviews
(
    pageviewid serial,

    datetime timestamp default now()::timestamp,

    serverip inet,
    clientip inet,
    requesturl text,
    referer text,
    useragent text,
    acceptlanguage text,

    primary key (pageviewid)
);

create table tbexits
(
    exitid serial,

    datetime timestamp default now()::timestamp,

    pageviewid int references tbpageviews (pageviewid),
    sourceid char(5),
    supplierid char(4) references tbsuppliers (supplierid),
    ingredientid int references tbingredients (ingredientid),

    primary key (exitid)
);

create table tbsearches
(
    searchid serial,

    datetime timestamp default now()::timestamp,

    domain char(5),
    searchtext text,

    primary key (searchid)
);

create table tbgeoipranges
(
    range_start inet,
    range_end inet,

    countryid char(2) references tbcountries (countryid),

    primary key(range_start, range_end)
);

create type tpingredientid as
(
    ingredientid int
);

create type tpingredientlink as
(
    ingredientid int,
    ingredientname text
);

create type tprecipeingredient as
(
    treenodeid int,
    treeparentid int,

    ingredientid int,
    ingredientname text,
    instructions text,
    duration interval,
    starttime interval,
    available bit
);
