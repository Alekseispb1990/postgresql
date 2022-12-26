CREATE TABLE IF NOT EXISTS public."Genre"
(
    "Genre_ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "Name" character varying(80) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "PK_Genre_ID" PRIMARY KEY ("Genre_ID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Genre"
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public."Artist_Genre"
(
    "Artist_Genre_ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "Genre_ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "Artist_ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    CONSTRAINT "PK_Artist_Genre_ID" PRIMARY KEY ("Artist_Genre_ID"),
    CONSTRAINT "FK_Artist_ID" FOREIGN KEY ("Artist_ID")
        REFERENCES public."Artist" ("Artist_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_Genre_ID" FOREIGN KEY ("Genre_ID")
        REFERENCES public."Genre" ("Genre_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Artist_Genre"
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public."Artist"
(
    "Artist_ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "Album" character varying(80) COLLATE pg_catalog."default" NOT NULL,
    "Nickname" character varying(80) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "PK_Artist_ID" PRIMARY KEY ("Artist_ID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Artist"
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public."Artist_Album"
(
    "Artist_Album_ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "Album_ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "Artist_ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    CONSTRAINT "PK_Artist_Album_ID" PRIMARY KEY ("Artist_Album_ID"),
    CONSTRAINT "FK_Album_ID" FOREIGN KEY ("Album_ID")
        REFERENCES public."Album" ("Album_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_Artist_ID" FOREIGN KEY ("Artist_ID")
        REFERENCES public."Artist" ("Artist_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Artist_Album"
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public."Album"
(
    "Album_ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "Name" character varying(80) COLLATE pg_catalog."default" NOT NULL,
    "Year of release" character varying(80) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "PK_Album_ID" PRIMARY KEY ("Album_ID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Album"
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public."Track"
(
    "Track_ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "Name" character varying(80) COLLATE pg_catalog."default" NOT NULL,
    "Duration" character varying(80) COLLATE pg_catalog."default" NOT NULL,
    "Album_ID" bigint NOT NULL,
    CONSTRAINT "PK_Track_ID" PRIMARY KEY ("Track_ID"),
    CONSTRAINT "FK_Album_ID" FOREIGN KEY ("Album_ID")
        REFERENCES public."Album" ("Album_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Track"
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public."Track_Collection"
(
    "Track_Collection_ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "Track_ID" bigint NOT NULL,
    "Collection_ID" bigint NOT NULL,
    CONSTRAINT "PK_Track_Collection_ID" PRIMARY KEY ("Track_Collection_ID"),
    CONSTRAINT "FK_Collection_ID" FOREIGN KEY ("Collection_ID")
        REFERENCES public."Collection" ("Collection_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_Track_ID" FOREIGN KEY ("Track_ID")
        REFERENCES public."Track" ("Track_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Track_Collection"
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public."Collection"
(
    "Collection_ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "Name" character varying(80) COLLATE pg_catalog."default" NOT NULL,
    "Year of release" character varying(80) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "PK_Collection_ID" PRIMARY KEY ("Collection_ID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Collection"
    OWNER to postgres;