import { db } from '$lib/server/db';
import type { PageServerLoad } from './$types';
import {
	titleAkasTable,
	titleBasicsTable,
	titleCrewTable,
	titleEpisodeTable,
	titlePrincipalsTable,
	titleRatingsTable,
	nameBasicsTable
} from '$lib/server/schema';

export const load: PageServerLoad = async ({ params }) => {
	const results = await db.select().from(titleBasicsTable).limit(10);

	return {
		titleBasic: results
	};
};
