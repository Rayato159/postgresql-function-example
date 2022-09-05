BEGIN;

CREATE TABLE "mangas"(
    "id" SERIAL PRIMARY KEY NOT NULL,
    "title" VARCHAR NOT NULL
);

CREATE TABLE "volumes"(
    "id" SERIAL PRIMARY KEY NOT NULL,
    "volume" VARCHAR NOT NULL,
    "manga_id" INTEGER NOT NULL
);

ALTER TABLE "volumes" ADD FOREIGN KEY ("manga_id") REFERENCES "mangas" ("id");

INSERT INTO "mangas"(
    "id",
    "title"
)
VALUES
(1, 'one piece'),
(2, 'death note'),
(3, 'chainsawman'),
(4, 'slave'),
(5, 'eighty six');

INSERT INTO "volumes"(
    "volume",
    "manga_id"
)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5);

COMMIT;