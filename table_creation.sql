CREATE TABLE pobocky (
    id SERIAL PRIMARY KEY,
    nazev VARCHAR(100) NOT NULL,
    adresa VARCHAR(255) NOT NULL,
    telefon VARCHAR(20)
);

CREATE TABLE zamestnanci (
    id SERIAL PRIMARY KEY,
    jmeno VARCHAR(100) NOT NULL,
    prijmeni VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefon VARCHAR(20),
    pobocka_id INTEGER REFERENCES pobocky,
    supervisor_id INTEGER REFERENCES zamestnanci
);

CREATE TABLE kategorie (
    id SERIAL PRIMARY KEY,
    nazev VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE vydavatele (
    id SERIAL PRIMARY KEY,
    nazev VARCHAR(100) NOT NULL,
    adresa VARCHAR(255)
);

CREATE TABLE autori (
    id SERIAL PRIMARY KEY,
    jmeno VARCHAR(100) NOT NULL,
    prijmeni VARCHAR(100) NOT NULL
);

CREATE TABLE knihy (
    id SERIAL PRIMARY KEY,
    nazev VARCHAR(200) NOT NULL,
    kategorie_id INTEGER REFERENCES kategorie,
    vydavatel_id INTEGER REFERENCES vydavatele,
    rok_vydani INTEGER,
    pocet_stran INTEGER,
    pobocka_id INTEGER REFERENCES pobocky
);

CREATE TABLE knihy_autori (
    kniha_id INTEGER NOT NULL REFERENCES knihy,
    autor_id INTEGER NOT NULL REFERENCES autori,
    PRIMARY KEY (kniha_id, autor_id)
);

CREATE TABLE uzivatele (
    id SERIAL PRIMARY KEY,
    jmeno VARCHAR(100) NOT NULL,
    prijmeni VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefon VARCHAR(20),
    adresa VARCHAR(255)
);

CREATE TABLE vypujcky (
    id SERIAL PRIMARY KEY,
    kniha_id INTEGER NOT NULL REFERENCES knihy,
    uzivatel_id INTEGER NOT NULL REFERENCES uzivatele,
    datum_vypujcky DATE NOT NULL,
    datum_vraceni DATE
);

CREATE TABLE rezervace (
    id SERIAL PRIMARY KEY,
    kniha_id INTEGER NOT NULL REFERENCES knihy,
    uzivatel_id INTEGER NOT NULL REFERENCES uzivatele,
    datum_rezervace DATE NOT NULL,
    stav VARCHAR(20) DEFAULT 'cekajici'
);

CREATE TABLE zmeny_vypujcky (
    id SERIAL PRIMARY KEY,
    vypujcka_id INTEGER NOT NULL,
    akce VARCHAR(10) NOT NULL,
    datum_zmeny TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    kniha_id INTEGER NOT NULL,
    uzivatel_id INTEGER NOT NULL
);

CREATE TABLE knihy_slevy (
    id SERIAL PRIMARY KEY,
    kniha_id INTEGER NOT NULL,
    puvodni_cena NUMERIC(10, 2) NOT NULL,
    sleva_procenta NUMERIC(5, 2) NOT NULL,
    nova_cena NUMERIC(10, 2) NOT NULL,
    datum TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

