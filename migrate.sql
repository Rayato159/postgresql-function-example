BEGIN;

CREATE TABLE "mangas"(
    "id" SERIAL PRIMARY KEY NOT NULL,
    "title" VARCHAR NOT NULL
);

CREATE TABLE "volumes"(
    "id" SERIAL PRIMARY KEY NOT NULL,
    "volume" INTEGER NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
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
    "manga_id",
    "price",
    "volume"
)
VALUES
(1, 45, 1),
(1, 45, 2),
(1, 50, 3),
(1, 50, 4),
(1, 45, 5),
(2, 120, 1),
(2, 120, 2),
(2, 120, 3),
(2, 120, 4),
(2, 120, 5),
(3, 60, 1),
(3, 60, 2),
(3, 60, 3),
(3, 60, 4),
(3, 60, 5),
(4, 130, 1),
(4, 135, 2),
(4, 160, 3),
(4, 160, 4),
(4, 160, 5),
(5, 130, 1),
(5, 130, 2),
(5, 130, 3),
(5, 130, 4),
(5, 130, 5);

COMMIT;