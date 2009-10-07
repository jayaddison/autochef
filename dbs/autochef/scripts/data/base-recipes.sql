-- Missing Ingredients
insert into tbingredients (duration) values ('0'::interval);
insert into tbproducts (ingredientid, supplierid) values (currval('tbingredients_ingredientid_seq'), '');
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Tomatoes', '');

insert into tbingredients (duration) values ('5 minutes'::interval);
insert into tbproducts (ingredientid, supplierid) values (currval('tbingredients_ingredientid_seq'), '');
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Tomato Sauce', '');

insert into tbingredients (duration) values ('0'::interval);
insert into tbproducts (ingredientid, supplierid) values (currval('tbingredients_ingredientid_seq'), '');
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Beef', '');

insert into tbingredients (duration) values ('5 minutes'::interval);
insert into tbproducts (ingredientid, supplierid) values (currval('tbingredients_ingredientid_seq'), '');
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Minced Beef', '');

insert into tbingredients (duration) values ('0'::interval);
insert into tbproducts (ingredientid, supplierid) values (currval('tbingredients_ingredientid_seq'), '');
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Spaghetti', '');

-- Intermediate Ingredients
insert into tbingredients (duration) values ('5 minutes'::interval);
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Browned Beef Mince', '');

insert into tbingredients (duration) values ('10 minutes'::interval);
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Bolognese Sauce', '');

insert into tbingredients (duration) values ('10 minutes'::interval);
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Cooked Spaghetti', '');

-- Recipes
insert into tbingredients (duration) values ('0'::interval);
insert into tbmeals (ingredientid) values (currval('tbingredients_ingredientid_seq'));
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Spaghetti Bolognese', '');

insert into tbingredients (duration) values ('0'::interval);
insert into tbmeals (ingredientid) values (currval('tbingredients_ingredientid_seq'));
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Beef Burritos', '');

-- Ingredient Dependencies
insert into tbingredientdependencies (parentid, childid)
select p.ingredientid, c.ingredientid
from tbingredienttranslations as p
cross join tbingredienttranslations as c
where p.languageid = 'en'
and c.languageid = 'en'
and p.name = 'Beef Burritos'
and c.name in ('Browned Beef Mince');

insert into tbingredientdependencies (parentid, childid)
select p.ingredientid, c.ingredientid
from tbingredienttranslations as p
cross join tbingredienttranslations as c
where p.languageid = 'en'
and c.languageid = 'en'
and p.name = 'Spaghetti Bolognese'
and c.name in ('Cooked Spaghetti', 'Bolognese Sauce');

insert into tbingredientdependencies (parentid, childid)
select p.ingredientid, c.ingredientid
from tbingredienttranslations as p
cross join tbingredienttranslations as c
where p.languageid = 'en'
and c.languageid = 'en'
and p.name = 'Cooked Spaghetti'
and c.name in ('Spaghetti');

insert into tbingredientdependencies (parentid, childid)
select p.ingredientid, c.ingredientid
from tbingredienttranslations as p
cross join tbingredienttranslations as c
where p.languageid = 'en'
and c.languageid = 'en'
and p.name = 'Bolognese Sauce'
and c.name in ('Browned Beef Mince', 'Tomato Sauce');

insert into tbingredientdependencies (parentid, childid)
select p.ingredientid, c.ingredientid
from tbingredienttranslations as p
cross join tbingredienttranslations as c
where p.languageid = 'en'
and c.languageid = 'en'
and p.name = 'Browned Beef Mince'
and c.name in ('Minced Beef');

insert into tbingredientdependencies (parentid, childid)
select p.ingredientid, c.ingredientid
from tbingredienttranslations as p
cross join tbingredienttranslations as c
where p.languageid = 'en'
and c.languageid = 'en'
and p.name = 'Minced Beef'
and c.name in ('Beef');

insert into tbingredientdependencies (parentid, childid)
select p.ingredientid, c.ingredientid
from tbingredienttranslations as p
cross join tbingredienttranslations as c
where p.languageid = 'en'
and c.languageid = 'en'
and p.name = 'Tomato Sauce'
and c.name in ('Tomatoes');
