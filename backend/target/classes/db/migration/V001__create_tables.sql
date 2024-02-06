CREATE TABLE product(
    id bigint GENERATED BY DEFAULT AS IDENTITY,
    name varchar(255) NOT NULL,
    picture_url varchar(255),
    price double precision
);

CREATE TABLE orders(
    id bigint GENERATED BY DEFAULT AS IDENTITY,
    status varchar(255),
    date_created date DEFAULT current_date
);

CREATE TABLE order_product(
    quantity integer NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL
);