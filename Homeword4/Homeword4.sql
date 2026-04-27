create table if not exists sales (
    sale_id serial primary key,
    customer_id int not null,
    product_id int not null,
    sale_date date,
    amount numeric not null
);

drop view if exists customersales;

create view customersales as
select
    customer_id,
    sum(amount) as total_amount
from sales
group by customer_id;

select *
from customersales
where total_amount > 1000;

update customersales
set total_amount = 2000
where customer_id = 1;

select *
from sales
where customer_id = 1;
