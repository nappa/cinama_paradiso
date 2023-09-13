SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: guests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.guests (
    id bigint NOT NULL,
    phone1 character varying NOT NULL,
    phone2 character varying NOT NULL,
    phone3 character varying NOT NULL,
    email character varying NOT NULL
);


--
-- Name: guests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.guests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: guests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.guests_id_seq OWNED BY public.guests.id;


--
-- Name: movies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movies (
    id bigint NOT NULL,
    title character varying NOT NULL,
    description text DEFAULT ''::text
);


--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.movies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- Name: play_schedules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.play_schedules (
    id bigint NOT NULL,
    start_time timestamp(6) without time zone NOT NULL,
    finish_time timestamp(6) without time zone NOT NULL,
    screen_id bigint NOT NULL,
    price_table_id bigint NOT NULL,
    movie_id bigint NOT NULL
);


--
-- Name: play_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.play_schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: play_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.play_schedules_id_seq OWNED BY public.play_schedules.id;


--
-- Name: price_tables; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.price_tables (
    id bigint NOT NULL,
    name character varying NOT NULL,
    screen_type_id bigint NOT NULL
);


--
-- Name: price_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.price_tables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: price_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.price_tables_id_seq OWNED BY public.price_tables.id;


--
-- Name: prices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prices (
    id bigint NOT NULL,
    name character varying NOT NULL,
    price integer NOT NULL,
    price_table_id bigint NOT NULL
);


--
-- Name: prices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prices_id_seq OWNED BY public.prices.id;


--
-- Name: purchases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchases (
    id bigint NOT NULL,
    price_id bigint NOT NULL,
    ticket_id bigint NOT NULL,
    guest_id bigint
);


--
-- Name: purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchases_id_seq OWNED BY public.purchases.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: screen_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.screen_types (
    id bigint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: screen_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.screen_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: screen_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.screen_types_id_seq OWNED BY public.screen_types.id;


--
-- Name: screens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.screens (
    id bigint NOT NULL,
    number integer NOT NULL,
    theater_id bigint NOT NULL,
    screen_type_id bigint NOT NULL
);


--
-- Name: screens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.screens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: screens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.screens_id_seq OWNED BY public.screens.id;


--
-- Name: seats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.seats (
    id bigint NOT NULL,
    prefix integer NOT NULL,
    number integer NOT NULL,
    screen_id bigint NOT NULL
);


--
-- Name: seats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.seats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: seats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.seats_id_seq OWNED BY public.seats.id;


--
-- Name: theaters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.theaters (
    id bigint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: theaters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.theaters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: theaters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.theaters_id_seq OWNED BY public.theaters.id;


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tickets (
    id bigint NOT NULL,
    play_schedule_id bigint NOT NULL,
    seat_id bigint NOT NULL
);


--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;


--
-- Name: guests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guests ALTER COLUMN id SET DEFAULT nextval('public.guests_id_seq'::regclass);


--
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- Name: play_schedules id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.play_schedules ALTER COLUMN id SET DEFAULT nextval('public.play_schedules_id_seq'::regclass);


--
-- Name: price_tables id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price_tables ALTER COLUMN id SET DEFAULT nextval('public.price_tables_id_seq'::regclass);


--
-- Name: prices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prices ALTER COLUMN id SET DEFAULT nextval('public.prices_id_seq'::regclass);


--
-- Name: purchases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases ALTER COLUMN id SET DEFAULT nextval('public.purchases_id_seq'::regclass);


--
-- Name: screen_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.screen_types ALTER COLUMN id SET DEFAULT nextval('public.screen_types_id_seq'::regclass);


--
-- Name: screens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.screens ALTER COLUMN id SET DEFAULT nextval('public.screens_id_seq'::regclass);


--
-- Name: seats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seats ALTER COLUMN id SET DEFAULT nextval('public.seats_id_seq'::regclass);


--
-- Name: theaters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.theaters ALTER COLUMN id SET DEFAULT nextval('public.theaters_id_seq'::regclass);


--
-- Name: tickets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: guests guests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guests
    ADD CONSTRAINT guests_pkey PRIMARY KEY (id);


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- Name: play_schedules play_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.play_schedules
    ADD CONSTRAINT play_schedules_pkey PRIMARY KEY (id);


--
-- Name: price_tables price_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price_tables
    ADD CONSTRAINT price_tables_pkey PRIMARY KEY (id);


--
-- Name: prices prices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_pkey PRIMARY KEY (id);


--
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: screen_types screen_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.screen_types
    ADD CONSTRAINT screen_types_pkey PRIMARY KEY (id);


--
-- Name: screens screens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.screens
    ADD CONSTRAINT screens_pkey PRIMARY KEY (id);


--
-- Name: seats seats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (id);


--
-- Name: theaters theaters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.theaters
    ADD CONSTRAINT theaters_pkey PRIMARY KEY (id);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: index_play_schedules_on_movie_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_play_schedules_on_movie_id ON public.play_schedules USING btree (movie_id);


--
-- Name: index_play_schedules_on_price_table_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_play_schedules_on_price_table_id ON public.play_schedules USING btree (price_table_id);


--
-- Name: index_play_schedules_on_screen_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_play_schedules_on_screen_id ON public.play_schedules USING btree (screen_id);


--
-- Name: index_price_tables_on_screen_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_price_tables_on_screen_type_id ON public.price_tables USING btree (screen_type_id);


--
-- Name: index_prices_on_price_table_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_prices_on_price_table_id ON public.prices USING btree (price_table_id);


--
-- Name: index_purchases_on_guest_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_guest_id ON public.purchases USING btree (guest_id);


--
-- Name: index_purchases_on_price_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_price_id ON public.purchases USING btree (price_id);


--
-- Name: index_purchases_on_ticket_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_ticket_id ON public.purchases USING btree (ticket_id);


--
-- Name: index_screens_on_screen_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_screens_on_screen_type_id ON public.screens USING btree (screen_type_id);


--
-- Name: index_screens_on_theater_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_screens_on_theater_id ON public.screens USING btree (theater_id);


--
-- Name: index_seats_on_screen_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_seats_on_screen_id ON public.seats USING btree (screen_id);


--
-- Name: index_tickets_on_play_schedule_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tickets_on_play_schedule_id ON public.tickets USING btree (play_schedule_id);


--
-- Name: index_tickets_on_seat_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tickets_on_seat_id ON public.tickets USING btree (seat_id);


--
-- Name: price_tables fk_rails_01a4a6e126; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price_tables
    ADD CONSTRAINT fk_rails_01a4a6e126 FOREIGN KEY (screen_type_id) REFERENCES public.screen_types(id);


--
-- Name: screens fk_rails_0dbb8d722b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.screens
    ADD CONSTRAINT fk_rails_0dbb8d722b FOREIGN KEY (screen_type_id) REFERENCES public.screen_types(id);


--
-- Name: seats fk_rails_199a07ec24; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT fk_rails_199a07ec24 FOREIGN KEY (screen_id) REFERENCES public.screens(id);


--
-- Name: tickets fk_rails_36e613ae33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT fk_rails_36e613ae33 FOREIGN KEY (play_schedule_id) REFERENCES public.play_schedules(id);


--
-- Name: prices fk_rails_445c269c5a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT fk_rails_445c269c5a FOREIGN KEY (price_table_id) REFERENCES public.price_tables(id);


--
-- Name: purchases fk_rails_6fb46799ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT fk_rails_6fb46799ea FOREIGN KEY (ticket_id) REFERENCES public.tickets(id);


--
-- Name: play_schedules fk_rails_a66c20d556; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.play_schedules
    ADD CONSTRAINT fk_rails_a66c20d556 FOREIGN KEY (price_table_id) REFERENCES public.price_tables(id);


--
-- Name: tickets fk_rails_b0904b94e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT fk_rails_b0904b94e1 FOREIGN KEY (seat_id) REFERENCES public.seats(id);


--
-- Name: purchases fk_rails_bce641d4f0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT fk_rails_bce641d4f0 FOREIGN KEY (price_id) REFERENCES public.prices(id);


--
-- Name: purchases fk_rails_c5352f0f6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT fk_rails_c5352f0f6f FOREIGN KEY (guest_id) REFERENCES public.guests(id);


--
-- Name: play_schedules fk_rails_ce79fc65ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.play_schedules
    ADD CONSTRAINT fk_rails_ce79fc65ea FOREIGN KEY (screen_id) REFERENCES public.screens(id);


--
-- Name: screens fk_rails_cf253c9386; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.screens
    ADD CONSTRAINT fk_rails_cf253c9386 FOREIGN KEY (theater_id) REFERENCES public.theaters(id);


--
-- Name: play_schedules fk_rails_eb19226525; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.play_schedules
    ADD CONSTRAINT fk_rails_eb19226525 FOREIGN KEY (movie_id) REFERENCES public.movies(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20230913000000');


