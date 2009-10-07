-- Recipe
insert into tbingredients (duration) values ('0'::interval);
insert into tbmeals (ingredientid) values (currval('tbingredients_ingredientid_seq'));
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Beef Stew', '');

-- Required Ingredients
insert into tbingredients (duration) values ('0'::interval);
insert into tbproducts (ingredientid, supplierid) values (currval('tbingredients_ingredientid_seq'), '');
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Beef', '');

-- Intermediate Steps

-- Dependencies
