CREATE TABLE IF NOT EXISTS genre (
id SERIAL PRIMARY key,
name VARCHAR (60) NOT null
);

CREATE TABLE IF NOT EXISTS singer(
id SERIAL PRIMARY KEY,
id_genre INTEGER REFERENCES genre(id),
name VARCHAR (60) NOT null
);

CREATE TABLE IF NOT EXISTS singer_genre(
id_genre INTEGER REFERENCES genre(id),
id_singer INTEGER REFERENCES singer(id),
constraint pkq primary key (id_genre, id_singer)
);

CREATE TABLE IF NOT EXISTS album(
id SERIAL PRIMARY KEY,
id_singer INTEGER REFERENCES singer(id),
date_create_album date NOT null,
name VARCHAR (60) NOT null,
date_create date not null
);

CREATE TABLE IF NOT EXISTS singers_album(
id_album INTEGER REFERENCES album(id),
id_singer INTEGER REFERENCES singer(id),
constraint pkt primary key (id_album, id_singer)
);

CREATE TABLE IF NOT EXISTS song(
id SERIAL PRIMARY KEY,
id_song INTEGER REFERENCES album(id),
singer_id INTEGER REFERENCES singer(id),
name VARCHAR (60) NOT null,
date_create_song date not null
);

CREATE TABLE IF NOT EXISTS collection(
id SERIAL PRIMARY KEY,
id_song INTEGER  REFERENCES song(id),
id_singer INTEGER  REFERENCES singer(id),
name VARCHAR (60) NOT null,
date_create_collection date where date_create_collection >= album(date_create),
);

CREATE TABLE IF NOT EXISTS song_collection(
id_song INTEGER REFERENCES song(id),
id_collection INTEGER REFERENCES collection(id),
constraint pky primary key (id_song, id_collection)
);