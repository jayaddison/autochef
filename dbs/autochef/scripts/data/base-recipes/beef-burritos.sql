-- Recipe
insert into tbingredients (duration) values ('0'::interval);
insert into tbmeals (ingredientid) values (currval('tbingredients_ingredientid_seq'));
insert into tbingredienttranslations (ingredientid, languageid, name, instructions) values (currval('tbingredients_ingredientid_seq'), 'en', 'Beef Burritos', '');

-- Required Ingredients

-- Intermediate Steps

-- Dependencies
insert into tbingredientdependencies (parentid, childid)
select p.ingredientid, c.ingredientid
from tbingredienttranslations as p
cross join tbingredienttranslations as c
where p.languageid = 'en'
and c.languageid = 'en'
and p.name = 'Beef Burritos'
and c.name in ('Browned Beef Mince');
