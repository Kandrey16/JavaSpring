CREATE TABLE IF NOT EXISTS public.client
(
    id integer NOT NULL,
    client_address character varying(255) COLLATE pg_catalog."default",
    first_name_client character varying(255) COLLATE pg_catalog."default",
    middle_name_client character varying(255) COLLATE pg_catalog."default",
    second_name_client character varying(255) COLLATE pg_catalog."default",
    licence_id bigint,
    CONSTRAINT client_pkey PRIMARY KEY (id),
    CONSTRAINT uk_hc3mfdccjt6wkj7y6qgqgyh8u UNIQUE (licence_id),
    CONSTRAINT fk9hw0gbm14tchblagwse9ns7t1 FOREIGN KEY (licence_id)
        REFERENCES public.licence (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
CREATE TABLE IF NOT EXISTS public.client_product
(
    product_id bigint NOT NULL,
    client_id integer NOT NULL,
    CONSTRAINT fkgqd72o2a9wa923a2s0757b5c0 FOREIGN KEY (client_id)
        REFERENCES public.client (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
CREATE TABLE IF NOT EXISTS public.employee
(
    id bigint NOT NULL,
    email_employee character varying(255) COLLATE pg_catalog."default",
    first_name_employee character varying(255) COLLATE pg_catalog."default",
    middle_name_employee character varying(255) COLLATE pg_catalog."default",
    password_employee character varying(255) COLLATE pg_catalog."default",
    second_name_employee character varying(255) COLLATE pg_catalog."default",
    employee_position_id bigint,
    CONSTRAINT employee_pkey PRIMARY KEY (id),
    CONSTRAINT fkkft5wjvwfuqgkuuh6tces2pdr FOREIGN KEY (employee_position_id)
        REFERENCES public.employee_position (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
CREATE TABLE IF NOT EXISTS public.employee_position
(
    id bigint NOT NULL,
    name_employee_position character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT employee_position_pkey PRIMARY KEY (id)
)
CREATE TABLE IF NOT EXISTS public.licence
(
    id bigint NOT NULL,
    number_licence character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT licence_pkey PRIMARY KEY (id)
)
CREATE TABLE IF NOT EXISTS public.model_user
(
    id_user bigint NOT NULL DEFAULT nextval('model_user_id_user_seq'::regclass),
    active boolean NOT NULL,
    password character varying(255) COLLATE pg_catalog."default",
    username character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT model_user_pkey PRIMARY KEY (id_user)
)
CREATE TABLE IF NOT EXISTS public.product
(
    id bigint NOT NULL,
    name_product character varying(255) COLLATE pg_catalog."default",
    count_product integer NOT NULL,
    price_product integer NOT NULL,
    employee_position_id bigint,
    type_product_id bigint,
    store_id bigint,
    CONSTRAINT fkfkrbelgnteuty2c98jmaowfq4 FOREIGN KEY (type_product_id)
        REFERENCES public.type_product (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkj9lvidkybl9wutien8eqksf3m FOREIGN KEY (employee_position_id)
        REFERENCES public.employee_position (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkjlfidudl1gwqem0flrlomvlcl FOREIGN KEY (store_id)
        REFERENCES public.store (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
CREATE TABLE IF NOT EXISTS public.product_client
(
    client_id integer NOT NULL,
    product_id bigint NOT NULL,
    CONSTRAINT fk1fheea2rwcidmnbde8tnj5k3f FOREIGN KEY (client_id)
        REFERENCES public.client (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
CREATE TABLE IF NOT EXISTS public.store
(
    id bigint NOT NULL,
    address character varying(255) COLLATE pg_catalog."default",
    name_store character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT store_pkey PRIMARY KEY (id)
)
CREATE TABLE IF NOT EXISTS public.type_product
(
    id bigint NOT NULL,
    name_type_product character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT type_product_pkey PRIMARY KEY (id)
)
CREATE TABLE IF NOT EXISTS public.user_role
(
    user_id bigint NOT NULL,
    roles character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT fkhnk3nw6rsvkly3ww7umdq7ys1 FOREIGN KEY (user_id)
        REFERENCES public.model_user (id_user) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
CREATE TABLE IF NOT EXISTS public.zakaz
(
    id bigint NOT NULL,
    count integer NOT NULL,
    price integer NOT NULL,
    product_id bigint,
    client_id integer,
    CONSTRAINT zakaz_pkey PRIMARY KEY (id),
    CONSTRAINT fknxcd9fgedgxqwhwfhe3mpltyi FOREIGN KEY (client_id)
        REFERENCES public.client (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
