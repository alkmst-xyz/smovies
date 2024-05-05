#!/bin/bash

echo "name.basics.tsv.gz
title.akas.tsv.gz
title.basics.tsv.gz
title.crew.tsv.gz
title.episode.tsv.gz
title.principals.tsv.gz
title.ratings.tsv.gz" | xargs -I % bash -c \
    "curl -L https://datasets.imdbws.com/% -o db/data/% && gzip -dv db/data/%"

