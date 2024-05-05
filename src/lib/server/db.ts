import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';
import { PGHOST, PGDATABASE, PGUSER, PGPASSWORD, PGPORT } from '$env/static/private';
import { dev } from '$app/environment';

const client = postgres({
	host: PGHOST,
	database: PGDATABASE,
	username: PGUSER,
	password: PGPASSWORD,
	port: parseInt(PGPORT),
	ssl: dev ? false : 'require'
});

export const db = drizzle(client);
