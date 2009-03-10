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

create table tbingredienttranslations
(
    ingredientid int references tbingredients (ingredientid),
    languageid char(2) references tblanguages (languageid),

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
