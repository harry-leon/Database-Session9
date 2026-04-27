create table if not exists orders (
    order_id serial primary key,
    customer_id int not null,
    order_date date,
    total_amount numeric
);

drop index if exists idx_orders_customer_id;

explain analyze
select *
from orders
where customer_id = 1;

create index idx_orders_customer_id on orders using btree (customer_id);

explain analyze
select *
from orders
where customer_id = 1;
