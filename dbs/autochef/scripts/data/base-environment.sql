-- Suppliers
insert into tbsuppliers (supplierid) values ('');

-- Users
insert into tbusers (username, password)
select 'test', md5('test');
