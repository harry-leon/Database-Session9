create table if not exists products (
    product_id serial primary key,
    category_id int not null,
    price numeric not null,
    stock_quantity int not null
);

drop index if exists idx_products_category_id;
drop index if exists idx_products_price;

create index idx_products_category_id on products (category_id);

cluster products using idx_products_category_id;
analyze products;

create index idx_products_price on products (price);

explain analyze
select *
from products
where category_id = 1
order by price;
