create language plpgsql;

create table tbaccesslog
(
    id serial,
    timestamp timestamp not null,

    remotehost char(15) not null,
    username char(15),
    virtualhost varchar(64) not null,
    method varchar(8) not null,
    query varchar(255) not null,
    status smallint not null,
    bytes int not null,
    referer varchar(128),
    useragent varchar(255),

    primary key (id)
);

create table tbeventlog
(
    id serial,
    timestamp timestamp not null default now(),

    priority char(5),
    category varchar(128),
    message text,

    primary key (id)
);

create table tbactions
(
    id serial,

    timestamp timestamp default now(),

    primary key (id)
);

create table tbexits
(
    sourceid char(5),
    supplierid char(4),
    ingredientid int
)
inherits (tbactions);

create table tbsearches
(
    searchtext text
)
inherits (tbactions);

create table tbcountries
(
    countryid char(2),

    primary key (countryid)
);

create table tbgeoipranges
(
    range_start inet,
    range_end inet,

    countryid char(2) references tbcountries (countryid),

    primary key (range_start, range_end)
);;
