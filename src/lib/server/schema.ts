import {
	bigint,
	customType,
	doublePrecision,
	integer,
	pgEnum,
	pgTable,
	serial,
	smallint,
	uniqueIndex,
	varchar
} from 'drizzle-orm/pg-core';

const identity = (name: string) =>
	customType<{
		data: number;
		notNull: true;
		default: true;
	}>({
		dataType() {
			return 'BIGINT GENERATED ALWAYS AS IDENTITY';
		}
	})(name);

export const titleAkasTable = pgTable('smovies_imdb_title_akas', {
	id: identity('id').primaryKey(),
	titleId: varchar('title_id').notNull(),
	ordering: smallint('ordering').notNull(),
	title: varchar('title'),
	region: varchar('region'),
	language: varchar('language'),
	types: varchar('types'),
	attributes: varchar('attributes'),
	isOriginalTitle: smallint('is_original_title')
});

export const titleBasicsTable = pgTable('smovies_imdb_title_basics', {
	id: identity('id').primaryKey(),
	tconst: varchar('tconst').notNull(),
	titleType: varchar('title_type').notNull(),
	primaryTitle: varchar('primary_title').notNull(),
	originalTitle: varchar('original_title').notNull(),
	isAdult: smallint('is_adult').notNull(),
	startYear: smallint('start_year'),
	endYear: smallint('end_year'),
	runtimeMinutes: integer('runtime_minutes'),
	genres: varchar('genres')
});

export const titleCrewTable = pgTable('smovies_imdb_title_crew', {
	id: identity('id').primaryKey(),
	tconst: varchar('tconst').notNull(),
	directors: varchar('directors'),
	writers: varchar('writers')
});

export const titleEpisodeTable = pgTable('smovies_imdb_title_episode', {
	id: identity('id').primaryKey(),
	tconst: varchar('tconst').notNull(),
	parentTconst: varchar('parent_tconst').notNull(),
	seasonNumber: integer('season_number'),
	episodeNumber: integer('episode_number')
});

export const titlePrincipalsTable = pgTable('smovies_imdb_title_principals', {
	id: identity('id').primaryKey(),
	tconst: varchar('tconst').notNull(),
	ordering: smallint('ordering').notNull(),
	nconst: varchar('nconst').notNull(),
	category: varchar('category').notNull(),
	job: varchar('job'),
	characters: varchar('characters')
});

export const titleRatingsTable = pgTable('smovies_imdb_title_ratings', {
	id: identity('id').primaryKey(),
	tconst: varchar('tconst').notNull(),
	averageRating: doublePrecision('average_rating').notNull(),
	numVotes: integer('num_votes').notNull()
});

export const nameBasicsTable = pgTable('smovies_imdb_name_basics', {
	id: identity('id').primaryKey(),
	primary_name: varchar('primary_name').notNull(),
	birth_year: smallint('birth_year'),
	death_year: smallint('death_year'),
	primary_profession: varchar('primary_profession'),
	known_for_titles: varchar('known_for_titles')
});
