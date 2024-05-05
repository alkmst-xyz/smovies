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

### Download datasets

```bash
./db/download.sh
```

### Migrations

```bash
# start dev db
docker compse -f compse.dev-db.yml up -d

# create migrations
atlas migrate diff initial \
    --dir "file://db/migrations" \
    --to "file://db/schema.sql" \
    --dev-url "postgres://admin:admin@0.0.0.0:5434/postgres?sslmode=disable" \
    --format '{{ sql . " " }}'

# verify migrations manually

# apply migrations to productive db
atlas migrate diff apply \
    --dir "file://db/migrations" \
    --url "postgres://admin:admin@0.0.0.0:5432/postgres?sslmode=disable"

docker compse -f compse.dev-db.yml down --remove-orphans

# manually update atlas hash
atlas migrate hash --dir "file://db/migrations"
```

### Copy data to Database

```bash
# connect to db
# psql "postgres://admin:admin@0.0.0.0:5432/postgres?sslmode=disable"

# pipe command to psql
cat ./db/init.sql | psql "postgres://admin:admin@0.0.0.0:5432/postgres?sslmode=disable"
```

- Takes about 15 min on my laptop. Output should look like this.

```
COPY 48250053
COPY 10745034
COPY 10108028
COPY 8225525
COPY 85570742
COPY 1433978
COPY 13443221
```
