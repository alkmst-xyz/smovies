CREATE TABLE IF NOT EXISTS
  smovies_imdb_title_akas (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title_id VARCHAR NOT NULL,
    ordering SMALLINT NOT NULL,
    title VARCHAR,
    region VARCHAR,
    language VARCHAR,
    types VARCHAR,
    attributes VARCHAR,
    is_original_title SMALLINT
  );

CREATE TABLE IF NOT EXISTS
  smovies_imdb_title_basics (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    tconst VARCHAR NOT NULL,
    title_type VARCHAR NOT NULL,
    primary_title VARCHAR NOT NULL,
    original_title VARCHAR NOT NULL,
    is_adult SMALLINT NOT NULL,
    start_year SMALLINT,
    end_year SMALLINT,
    runtime_minutes INTEGER,
    genres VARCHAR
  );

CREATE TABLE IF NOT EXISTS
  smovies_imdb_title_crew (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    tconst VARCHAR NOT NULL,
    directors VARCHAR,
    writers VARCHAR
  );

CREATE TABLE IF NOT EXISTS
  smovies_imdb_title_episode (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    tconst VARCHAR NOT NULL,
    parent_tconst VARCHAR NOT NULL,
    season_number INTEGER,
    episode_number INTEGER
  );

CREATE TABLE IF NOT EXISTS
  smovies_imdb_title_principals (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    tconst VARCHAR NOT NULL,
    ordering SMALLINT NOT NULL,
    nconst VARCHAR NOT NULL,
    category VARCHAR NOT NULL,
    job VARCHAR,
    characters VARCHAR
  );

CREATE TABLE IF NOT EXISTS
  smovies_imdb_title_ratings (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    tconst VARCHAR NOT NULL,
    average_rating DOUBLE PRECISION NOT NULL,
    num_votes INTEGER NOT NULL
  );

CREATE TABLE IF NOT EXISTS
  smovies_imdb_name_basics (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nconst VARCHAR NOT NULL,
    primary_name VARCHAR,
    birth_year SMALLINT,
    death_year SMALLINT,
    primary_profession VARCHAR,
    known_for_titles VARCHAR
  );
