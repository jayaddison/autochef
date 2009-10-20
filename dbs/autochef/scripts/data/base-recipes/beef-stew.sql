-- Recipe
insert into tbingredients (duration) values ('0'::interval);
insert into tbmeals (ingredientid) values (currval('tbingredients_ingredientid_seq'));
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Beef Stew', '');

-- Required Ingredients

-- Intermediate Steps

-- Dependencies
