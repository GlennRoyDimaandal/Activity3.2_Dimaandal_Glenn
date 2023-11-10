CREATE DATABASE hero;

CREATE TABLE IF NOT EXISTS public.class
(
    class_id integer NOT NULL,
    class_name character varying(255) NOT NULL,
    class_description text,
    PRIMARY KEY (class_id)
);