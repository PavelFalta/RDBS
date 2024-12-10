-- #a

SELECT AVG(table_row_count) AS avg_rows_per_table
FROM (
    SELECT COUNT(*) AS table_row_count
    FROM pobocky
    UNION ALL
    SELECT COUNT(*) FROM zamestnanci
    UNION ALL
    SELECT COUNT(*) FROM kategorie
    UNION ALL
    SELECT COUNT(*) FROM vydavatele
    UNION ALL
    SELECT COUNT(*) FROM autori
    UNION ALL
    SELECT COUNT(*) FROM knihy
    UNION ALL
    SELECT COUNT(*) FROM knihy_autori
    UNION ALL
    SELECT COUNT(*) FROM uzivatele
    UNION ALL
    SELECT COUNT(*) FROM vypujcky
    UNION ALL
    SELECT COUNT(*) FROM rezervace
) AS row_counts;

-- vsichni zamestnanci kde jejich polozka > 20 knih
SELECT jmeno, prijmeni
FROM zamestnanci
WHERE pobocka_id IN (
    SELECT id
    FROM pobocky
    WHERE id IN (
        SELECT DISTINCT pobocka_id
        FROM knihy
        GROUP BY pobocka_id
        HAVING COUNT(*) > 21
    )
);

-- pocet kni h pro kazdou kategorii
SELECT kategorie_id, COUNT(*) AS num_books
FROM knihy
GROUP BY kategorie_id;


SELECT e.jmeno AS employee_name, e.prijmeni AS employee_lastname,
       STRING_AGG(c.jmeno || ' ' || c.prijmeni, ', ') AS colleagues
FROM zamestnanci e
JOIN zamestnanci c ON e.pobocka_id = c.pobocka_id
WHERE e.id != c.id
GROUP BY e.id;

-- nadrizeni

SELECT e.jmeno AS employee_name, e.prijmeni AS employee_lastname,
       s.jmeno AS supervisor_name, s.prijmeni AS supervisor_lastname
FROM zamestnanci e
LEFT JOIN zamestnanci s ON e.supervisor_id = s.id;

-- #b
CREATE OR REPLACE VIEW knihy_vydavatele_pobocky AS
SELECT
    k.nazev AS kniha_nazev,
    k.rok_vydani,
    v.nazev AS vydavatel_nazev,
    p.nazev AS pobocka_nazev,
    p.adresa AS pobocka_adresa
FROM knihy k
INNER JOIN vydavatele v ON k.vydavatel_id = v.id
LEFT JOIN pobocky p ON k.pobocka_id = p.id;

-- #c
CREATE UNIQUE INDEX idx_unique_email ON uzivatele(email);

-- #d
CREATE OR REPLACE FUNCTION pocet_cekajicich_rezervaci()
RETURNS INTEGER AS $$
DECLARE
    pocet INTEGER := 0;
BEGIN
    SELECT COUNT(*)
    INTO pocet
    FROM rezervace
    WHERE stav = 'cekajici'; -- pouze rezervace s cekajici stavem

    RETURN pocet;
END;
$$ LANGUAGE plpgsql;


SELECT pocet_cekajicich_rezervaci();

-- #e

-- Create the discount table
CREATE TABLE IF NOT EXISTS knihy_slevy (
    id SERIAL PRIMARY KEY,
    kniha_id INT NOT NULL,
    puvodni_cena NUMERIC(10, 2) NOT NULL,
    sleva_procenta NUMERIC(5, 2) NOT NULL,
    nova_cena NUMERIC(10, 2) NOT NULL,
    datum TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE PROCEDURE pro_generuj_nahodne_slevy()

AS $$
DECLARE
    cur_kniha RECORD;
    random_price NUMERIC(10, 2);
    sleva NUMERIC(5, 2);
    nova_cena NUMERIC(10, 2);
    cur CURSOR FOR SELECT id FROM knihy;
BEGIN
    -- kursor open
    OPEN cur;

    LOOP
        -- kursor fetch
        FETCH cur INTO cur_kniha;
        EXIT WHEN NOT FOUND;

        BEGIN
            -- random cena
            random_price := ROUND((50 + (RANDOM() * 450))::NUMERIC, 2);

            -- sleva random mezi 5 a 30
            sleva := ROUND((5 + (RANDOM() * 25))::NUMERIC, 2);

            -- nova cena
            nova_cena := ROUND(random_price * (1 - (sleva / 100)), 2);

            -- sleva do tabulky
            INSERT INTO knihy_slevy (kniha_id, puvodni_cena, sleva_procenta, nova_cena)
            VALUES (cur_kniha.id, random_price, sleva, nova_cena);
        EXCEPTION WHEN OTHERS THEN

            RAISE NOTICE 'Error s knihou ID: %, Error: %', cur_kniha.id, SQLERRM;
        END;
    END LOOP;

    -- zahodit kursor
    CLOSE cur;
END;
$$ LANGUAGE plpgsql;

CALL pro_generuj_nahodne_slevy();



-- #f
CREATE OR REPLACE FUNCTION zaznamena_zmenu_vypujcky()
RETURNS TRIGGER
SECURITY DEFINER
AS $$
BEGIN
    -- insrt
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO zmeny_vypujcky (vypujcka_id, akce, datum_zmeny, uzivatel_id, kniha_id)
        VALUES (NEW.id, 'INSERT', CURRENT_TIMESTAMP, NEW.uzivatel_id, NEW.kniha_id);
    -- uptd
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO zmeny_vypujcky (vypujcka_id, akce, datum_zmeny, uzivatel_id, kniha_id)
        VALUES (NEW.id, 'UPDATE', CURRENT_TIMESTAMP, NEW.uzivatel_id, NEW.kniha_id);
    -- del
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO zmeny_vypujcky (vypujcka_id, akce, datum_zmeny, uzivatel_id, kniha_id)
        VALUES (OLD.id, 'DELETE', CURRENT_TIMESTAMP, OLD.uzivatel_id, OLD.kniha_id);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trig_zmeny_vypujcky
AFTER INSERT OR UPDATE OR DELETE ON vypujcky
FOR EACH ROW
EXECUTE FUNCTION zaznamena_zmenu_vypujcky();

DELETE FROM zmeny_vypujcky;

INSERT INTO vypujcky (kniha_id, uzivatel_id, datum_vypujcky, datum_vraceni)
VALUES (12, 8, '2024-01-01', '2024-01-15');

UPDATE vypujcky
SET datum_vraceni = '2024-05-20'
WHERE id = 5;

DELETE FROM vypujcky
WHERE id = 8;

-- #g

DELETE FROM knihy_slevy;

CREATE OR REPLACE FUNCTION generuj_nahodne_slevy_transaction()
RETURNS VOID AS $$
DECLARE
    cur_kniha RECORD;
    random_price NUMERIC(10, 2);
    sleva NUMERIC(5, 2);
    nova_cena NUMERIC(10, 2);
    cur CURSOR FOR SELECT id FROM knihy;
BEGIN
    OPEN cur;

    LOOP

        FETCH cur INTO cur_kniha;
        EXIT WHEN NOT FOUND;

        random_price := ROUND((50 + (RANDOM() * 450))::NUMERIC, 2);

        IF cur_kniha.id = 5 THEN
            RAISE EXCEPTION 'error na knize ID: %', cur_kniha.id;
        END IF;

        sleva := ROUND((5 + (RANDOM() * 25))::NUMERIC, 2);

        nova_cena := ROUND(random_price * (1 - (sleva / 100)), 2);

        INSERT INTO knihy_slevy (kniha_id, puvodni_cena, sleva_procenta, nova_cena)
        VALUES (cur_kniha.id, random_price, sleva, nova_cena);
    END LOOP;

    CLOSE cur;
END;
$$ LANGUAGE plpgsql;

SELECT generuj_nahodne_slevy_transaction();

-- #h

CREATE USER new_user WITH PASSWORD 'password123';

GRANT SELECT ON autori TO new_user;

REVOKE SELECT ON ALL TABLES IN SCHEMA public FROM new_user;

CREATE ROLE data_entry;

GRANT SELECT, INSERT ON ALL TABLES IN SCHEMA public TO data_entry;

GRANT data_entry TO new_user;

REVOKE data_entry FROM new_user;

REVOKE SELECT, INSERT ON ALL TABLES IN SCHEMA public FROM data_entry;

DROP USER new_user;

-- #i

BEGIN;

LOCK TABLE vypujcky IN ACCESS EXCLUSIVE MODE;

INSERT INTO vypujcky (kniha_id, uzivatel_id, datum_vypujcky, datum_vraceni)
VALUES (10, 2, '2024-01-01', '2042-01-15');

SELECT relname AS table_name,
       locktype,
       mode,
       granted
FROM pg_locks pl
JOIN pg_class pc ON pl.relation = pc.oid
WHERE pc.relname = 'vypujcky';

COMMIT;

ROLLBACK;


-- radek
BEGIN;

SELECT * FROM vypujcky WHERE id = 6 FOR UPDATE;

UPDATE vypujcky
SET datum_vraceni = '2042-01-25'
WHERE id = 6;

DELETE FROM vypujcky WHERE id = 5;

COMMIT;

ROLLBACK;

