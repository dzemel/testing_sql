CREATE TABLE bikes (
    id SERIAL PRIMARY KEY,
    model_code TEXT NOT NULL,
    cost INT NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    note TEXT NOT NULL DEFAULT '',
    ordered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bike_orders (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders,
    bike_id INT NOT NULL REFERENCES bikes,
    cost_at_time INT NOT NULL,
    num_bikes_ordered INT NOT NULL
);

INSERT INTO bikes (model_code, cost)
VALUES ('FLY', 500), ('HAUL', 600), ('SKIN', 700), ('BUD', 800);