-- Create "smovies_imdb_name_basics" table
CREATE TABLE "public"."smovies_imdb_name_basics" (
 "id" bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
 "nconst" character varying NOT NULL,
 "primary_name" character varying NULL,
 "birth_year" smallint NULL,
 "death_year" smallint NULL,
 "primary_profession" character varying NULL,
 "known_for_titles" character varying NULL,
 PRIMARY KEY ("id")
);
-- Create "smovies_imdb_title_akas" table
CREATE TABLE "public"."smovies_imdb_title_akas" (
 "id" bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
 "title_id" character varying NOT NULL,
 "ordering" smallint NOT NULL,
 "title" character varying NULL,
 "region" character varying NULL,
 "language" character varying NULL,
 "types" character varying NULL,
 "attributes" character varying NULL,
 "is_original_title" smallint NULL,
 PRIMARY KEY ("id")
);
-- Create "smovies_imdb_title_basics" table
CREATE TABLE "public"."smovies_imdb_title_basics" (
 "id" bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
 "tconst" character varying NOT NULL,
 "title_type" character varying NOT NULL,
 "primary_title" character varying NOT NULL,
 "original_title" character varying NOT NULL,
 "is_adult" smallint NOT NULL,
 "start_year" smallint NULL,
 "end_year" smallint NULL,
 "runtime_minutes" integer NULL,
 "genres" character varying NULL,
 PRIMARY KEY ("id")
);
-- Create "smovies_imdb_title_crew" table
CREATE TABLE "public"."smovies_imdb_title_crew" (
 "id" bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
 "tconst" character varying NOT NULL,
 "directors" character varying NULL,
 "writers" character varying NULL,
 PRIMARY KEY ("id")
);
-- Create "smovies_imdb_title_episode" table
CREATE TABLE "public"."smovies_imdb_title_episode" (
 "id" bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
 "tconst" character varying NOT NULL,
 "parent_tconst" character varying NOT NULL,
 "season_number" integer NULL,
 "episode_number" integer NULL,
 PRIMARY KEY ("id")
);
-- Create "smovies_imdb_title_principals" table
CREATE TABLE "public"."smovies_imdb_title_principals" (
 "id" bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
 "tconst" character varying NOT NULL,
 "ordering" smallint NOT NULL,
 "nconst" character varying NOT NULL,
 "category" character varying NOT NULL,
 "job" character varying NULL,
 "characters" character varying NULL,
 PRIMARY KEY ("id")
);
-- Create "smovies_imdb_title_ratings" table
CREATE TABLE "public"."smovies_imdb_title_ratings" (
 "id" bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
 "tconst" character varying NOT NULL,
 "average_rating" double precision NOT NULL,
 "num_votes" integer NOT NULL,
 PRIMARY KEY ("id")
);
