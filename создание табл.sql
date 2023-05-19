CREATE TABLE IF NOT EXISTS genre(
id SERIAL PRIMARY key,
name VARCHAR (60) NOT null
);

CREATE TABLE IF NOT EXISTS singer(
id SERIAL PRIMARY KEY,
name VARCHAR (60) NOT null
);

CREATE TABLE IF NOT EXISTS singer_genre(
id_genre  INTEGER REFERENCES genre(id),
id_singer INTEGER REFERENCES singer(id),
constraint singer_genres primary key (id_genre, id_singer)
);

CREATE TABLE IF NOT EXISTS album(
id SERIAL PRIMARY KEY,
date_create_album date NOT null,
name VARCHAR (60) NOT null
);

CREATE TABLE IF NOT EXISTS album_singers(
id_album INTEGER REFERENCES album(id),
id_singer INTEGER REFERENCES singer(id),
constraint collab_album primary key (id_album, id_singer)
);

CREATE TABLE IF NOT EXISTS collection(
id SERIAL PRIMARY KEY,
name VARCHAR (60) NOT null,
date_create_collection date NOT null
);

CREATE TABLE IF NOT EXISTS song(
id SERIAL PRIMARY KEY,
id_album INTEGER REFERENCES album(id),
name VARCHAR (60) NOT null,
date_create_song date not null,
duration time
);

CREATE TABLE IF NOT EXISTS collection_song (
id_collection INTEGER REFERENCES collection(id),
id_song INTEGER REFERENCES song(id),
constraint songs_collection primary key (id_song, id_collection)
);