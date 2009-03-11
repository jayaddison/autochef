-- Remove all existing data
delete from tbuseringredients;
delete from tbusers;
delete from tbmeals;
delete from tbproducts;
delete from tbsuppliers;
delete from tbingredientdependencies;
delete from tbingredienttranslations;
delete from tbingredients;
delete from tblanguages;

-- Restart the ingredientid sequence
alter sequence tbingredients_ingredientid_seq restart with 1;

-- Languages
insert into tblanguages (languageid) values ('en');

-- Suppliers
insert into tbsuppliers (supplierid) values ('');

-- Products
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

-- Ingredients
insert into tbingredients (duration) values ('5 minutes'::interval);
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Browned Beef Mince', '');

insert into tbingredients (duration) values ('10 minutes'::interval);
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Bolognese Sauce', '');

insert into tbingredients (duration) values ('10 minutes'::interval);
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Cooked Spaghetti', '');

-- Meals
insert into tbingredients (duration) values ('0'::interval);
insert into tbmeals (ingredientid) values (currval('tbingredients_ingredientid_seq'));
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Spaghetti Bolognese', '');

insert into tbingredients (duration) values ('0'::interval);
insert into tbmeals (ingredientid) values (currval('tbingredients_ingredientid_seq'));
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Beef Burritos', '');

-- Ingredient dependencies
insert into tbingredientdependencies (parentid, childid) values (10, 6);
insert into tbingredientdependencies (parentid, childid) values (9, 8);
insert into tbingredientdependencies (parentid, childid) values (9, 7);
insert into tbingredientdependencies (parentid, childid) values (8, 5);
insert into tbingredientdependencies (parentid, childid) values (7, 6);
insert into tbingredientdependencies (parentid, childid) values (7, 2);
insert into tbingredientdependencies (parentid, childid) values (6, 4);
insert into tbingredientdependencies (parentid, childid) values (4, 3);
insert into tbingredientdependencies (parentid, childid) values (2, 1);

-- Users
insert into tbusers (username, password)
select 'test', md5('test');

-- User ingredients
insert into tbuseringredients (username, ingredientid) values ('test', 3);
insert into tbuseringredients (username, ingredientid) values ('test', 5);
