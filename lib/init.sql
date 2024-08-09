DROP TABLE IF EXISTS movies;

CREATE TABLE movies (
    id INT,
    title TEXT,
    vote_average NUMERIC,
    vote_count INT,
    status TEXT,
    release_date DATE,
    revenue BIGINT,
    runtime INT,
    adult BOOLEAN,
    backdrop_path TEXT,
    budget BIGINT,
    homepage TEXT,
    imdb_id TEXT,
    original_language TEXT,
    original_title TEXT,
    overview TEXT,
    popularity NUMERIC,
    poster_path TEXT,
    tagline TEXT,
    genres TEXT,
    production_companies TEXT,
    production_countries TEXT,
    spoken_languages TEXT,
    keywords TEXT
);

ALTER TABLE movies
ADD CONSTRAINT movies_pkey PRIMARY KEY (id);