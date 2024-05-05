import type { Config } from 'drizzle-kit';

export default {
	schema: './src/lib/server/schema.ts',
	out: './src/lib/server/migrations',
	driver: 'pg',
	dbCredentials: {
		host: Bun.env.PGHOST,
		user: Bun.env.PGUSER,
		password: Bun.env.PGPASSWORD,
		database: Bun.env.PGDATABASE,
		port: Bun.env.PGPORT
	}
} satisfies Config;
