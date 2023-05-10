CREATE TABLE IF NOT EXISTS department(
id SERIAL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS leade(
id SERIAL PRIMARY KEY,
name VARCHAR(60) not null,
dep_id INTEGER references department(id)
);

CREATE TABLE IF NOT EXISTS workers(
id SERIAL PRIMARY key,
name VARCHAR(60) not null,
dep_id INTEGER references department(id),
lead_id INTEGER references leade(id) not NULL
);

CREATE TABLE IF NOT EXISTS  leade_worker(
id_leade INTEGER REFERENCES leade(id),
id_worker INTEGER REFERENCES workers(id),
constraint pkq primary key (id_leade, id_worker)
);