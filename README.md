<h1>🐘 PostgreSQL Function Example</h1>

<h2>⚙️ Installation</h2>
<p>Recommend to install a postgres into the docker</p>

<ol>
<strong><li>Pull a postgres image</li></strong>

```zsh
docker pull postgres:alpine
```

<strong><li>Run a container</li></strong>

```zsh
docker run --name postgres-func-eg -e POSTGRES_PASSWORD=123456 -p 4181:5432 -d postgres:alpine
```

<strong><li>Config the postgres</li></strong>

```zsh
docker exec -it postgres-func-eg bash
```
```zsh
psql -U postgres
```
```zsh
create database how_to_func;
```

<strong><li>Check the database that created or not</li></strong>

```zsh
\l
```
```zsh
      Name      |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges
----------------+----------+----------+------------+------------+-----------------------
 how_to_func | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
```

<strong><li>Connect to the database with any database explorer (Reccommend DBeaver)</li></strong>

```zsh
HOST: 0.0.0.0
PORT: 4181
USERNAME: postgres
PASSWORD: 123456
DATABASE: how_to_func
```

<strong><li>Open a sql script and copy code from <a href="./migrate.sql">migrate.sql</a> and paste then run to generate the mock data</li></strong>

</ol>

<h2>✏️ Exmaple</h2>

<p><strong>Returning a table</strong></p>
<p>Find all volumes of a manga by id</p>

```sql
CREATE OR REPLACE FUNCTION get_all_volumes(manga_id INT)
RETURNS TABLE (
	"id" INT,
	"title" VARCHAR,
	"vol" INT
)
AS $$
	BEGIN
		RETURN QUERY SELECT
			"m"."id",
			"m"."title",
			"v"."volume" AS "vol"
		FROM "mangas" "m"
		LEFT JOIN "volumes" "v" ON "v"."manga_id" = "m"."id"
		WHERE "v"."manga_id" = $1;
	END;
$$ LANGUAGE plpgsql;
```

<p><strong>Returning a value</strong></p>
<p>Find a manga that price is more than n</p>

```sql
CREATE OR REPLACE FUNCTION get_manga_from_price(price FLOAT)
RETURNS VARCHAR
AS $$
	DECLARE
		"manga" VARCHAR;
	BEGIN
		SELECT INTO "manga"
		"m"."title"
		FROM "mangas" "m"
		LEFT JOIN "volumes" "v" ON "v"."manga_id" = "m"."id"
		WHERE "v"."price" >= $1;
	RETURN
		"manga";
	END;
$$ LANGUAGE plpgsql;
```

<p><strong>Usecases</strong></p>

```sql
SELECT * FROM get_one_piece_all_volumes(1);
```

```sql
SELECT * FROM get_manga_from_price(160);
```

<p><strong>Drop a function</strong></p>

```sql
DROP FUNCTION function_name;
```

<h2>💰 Donate Me on Stripe</h2>
<p><a href="https://buy.stripe.com/bIY03L6vp0vJa883cc">https://buy.stripe.com/bIY03L6vp0vJa883cc</a></p>

<h2>📑 Refenece</h2>
<p><a href="https://www.postgresql.org/docs/current/sql-createfunction.html">https://www.postgresql.org/docs/current/sql-createfunction.html</a></p>