create table if not exists users (
    user_id serial primary key,
    email text not null,
    username text
);

drop index if exists idx_users_email_hash;

create index idx_users_email_hash on users using hash (email);

explain
select *
from users
where email = 'example@example.com';
