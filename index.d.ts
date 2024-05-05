declare module 'bun' {
	interface Env {
		PGHOST: string;
		PGDATABASE: string;
		PGUSER: string;
		PGPASSWORD: string;
		PGPORT: number;
	}
}
