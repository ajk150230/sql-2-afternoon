create table users
(
    users_id serial primary key,
    name varchar(10),
    email varchar(120)
);
create table products
(
    products_id serial primary key,
    name varchar(120),
    price numeric
);
create table orders
(
    orders_id serial primary key,
    products_id NUMERIC,
    users_id NUMERIC
);

insert into users (name, email) values
(
    'jack',
    'jack@gmail.com'
),
(
    'jake',
    'jake@gmail.com'
),
(
    'james',
    'james@gmail.com'
);

insert into products (name, price) values
(
    'bread',
    5
),
(
    'banana',
    3
),
(
    'burgers',
    8
);

insert into orders (user_id, products_id) values
(1,3),
(2,3),
(3,3),
(1,1),
(2,1),
(3,2),
(2,2),
(1,2),
(3,1);

select * from orders where orders_id = 1;

select* from orders ;

select price from orders a 
join products b 
on b.products_id = a.products_id
where orders_id = 1

select * from orders 
where user_id = 1

select count(*) from orders
where user_id = 1


