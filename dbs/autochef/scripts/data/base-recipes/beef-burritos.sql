-- Recipe
insert into tbingredients (duration) values ('0'::interval);
insert into tbmeals (ingredientid) values (currval('tbingredients_ingredientid_seq'));
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Beef Burritos', '');

-- Required Ingredients
insert into tbingredients (duration) values ('0'::interval);
insert into tbproducts (ingredientid, supplierid) values (currval('tbingredients_ingredientid_seq'), '');
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Beef', '');

insert into tbingredients (duration) values ('5 minutes'::interval);
insert into tbproducts (ingredientid, supplierid) values (currval('tbingredients_ingredientid_seq'), '');
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Minced Beef', '');

-- Intermediate Steps
insert into tbingredients (duration) values ('5 minutes'::interval);
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Browned Beef Mince', '');

-- Dependencies
insert into tbingredientdependencies (parentid, childid)
select p.ingredientid, c.ingredientid
from tbingredienttranslations as p
cross join tbingredienttranslations as c
where p.languageid = 'en'
and c.languageid = 'en'
and p.name = 'Beef Burritos'
and c.name in ('Browned Beef Mince');
