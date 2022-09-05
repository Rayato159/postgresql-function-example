<h1>PostgreSQL Function Example</h1>

<h2>Installation</h2>
<p>Reccommend to install a postgres into the docker</p>

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
```

<strong><li>Open a sql script and copy code from <a href="./migrate.sql">migrate.sql</a> and paste then run to generate the mock data</li></strong>

</ol>

<h2>Exmaple</h2>

```sql

```

<h2>Refenece</h2>
<p><a href="https://www.postgresql.org/docs/current/sql-createfunction.html">https://www.postgresql.org/docs/current/sql-createfunction.html</a></p>