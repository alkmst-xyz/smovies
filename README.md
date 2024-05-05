# smovies

Search through [IMDb Non-Commercial Datasets](https://developer.imdb.com/non-commercial-datasets/).

- [ ] Create index for first const columns.
- [ ] Create relations for exisitng connecitons.
- [ ] Convert string to array of string for array columns.

## Setup

### [Atals](https://atlasgo.io/getting-started)

```bash
curl -sSf https://atlasgo.sh | sh
```

### [psql](https://www.timescale.com/blog/how-to-install-psql-on-mac-ubuntu-debian-windows/)

```bash
sudo dnf install postgresql
```

## Database

### Migrations

```bash
# start dev db
docker compose -f compose.dev-db.yml up -d

# create migrations
atlas migrate diff initial \
    --dir "file://db/migrations" \
    --to "file://db/schema.sql" \
    --dev-url "postgres://admin:admin@0.0.0.0:5434/postgres?sslmode=disable" \
    --format '{{ sql . " " }}'

# verify migrations manually

# remove dev db
docker compose -f compose.dev-db.yml down

# apply migrations to productive db
atlas migrate apply \
    --dir "file://db/migrations" \
    --url "postgres://admin:admin@0.0.0.0:5432/postgres?sslmode=disable"
```

- After manually editing the contents of a newly created migration file, the checksums for the directory must be recalculated.

```bash
# manually update atlas hash
atlas migrate hash --dir "file://db/migrations"
```

### Download datasets

```bash
./db/download.sh
```

### Copy data to Database

- The downloaded data is in TSV format. This can be copied into the created tables using the psql `\copy` command. Takes about 15 min on my laptop.

```bash
# pipe copy commands to psql
cat ./db/init.txt | psql "postgres://admin:admin@0.0.0.0:5432/postgres?sslmode=disable"
```

- After copying, the output should look something like this.

```
COPY 48250053
COPY 10745034
COPY 10108028
COPY 8225525
COPY 85570742
COPY 1433978
COPY 13443221
```
