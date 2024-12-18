-- Insert data into pobocky
INSERT INTO pobocky (nazev, adresa, telefon) VALUES
('Pobocka Praha', 'Vaclavske namesti 1, Praha', '224123456'),
('Pobocka Brno', 'Namesti Svobody 10, Brno', '543210987'),
('Pobocka Ostrava', 'Masarykovo namesti 5, Ostrava', '596123789');

-- Insert data into zamestnanci
INSERT INTO zamestnanci (jmeno, prijmeni, email, telefon, pobocka_id) VALUES
('Jan', 'Novak', 'jan.novak@pobocka-praha.cz', '224123457', 1),
('Petr', 'Svoboda', 'petr.svoboda@pobocka-brno.cz', '543210988', 2),
('Eva', 'Kralova', 'eva.kralova@pobocka-ostrava.cz', '596123790', 3),
('Anna', 'Vesela', 'anna.vesela@pobocka-praha.cz', '224123458', 1),
('Marek', 'Novotny', 'marek.novotny@pobocka-brno.cz', '543210989', 2),
('Lucie', 'Horakova', 'lucie.horakova@pobocka-ostrava.cz', '596123791', 3);

-- Insert data into kategorie
INSERT INTO kategorie (nazev) VALUES
('Román'),
('Sci-fi'),
('Historie'),
('Detektivka'),
('Fantasy'),
('Biografie');

-- Insert data into vydavatele
INSERT INTO vydavatele (nazev, adresa) VALUES
('Albatros Media', 'Na Pankráci 30, Praha'),
('Euromedia Group', 'Nádražní 32, Praha'),
('Host', 'Radlas 5, Brno'),
('Grada', 'U Průhonu 22, Praha'),
('Mladá fronta', 'Mezi Vodami 1952/9, Praha');

-- Insert data into autori
INSERT INTO autori (jmeno, prijmeni) VALUES
('Karel', 'Capek'),
('Jules', 'Verne'),
('George', 'Orwell'),
('Agatha', 'Christie'),
('J.K.', 'Rowling'),
('Isaac', 'Asimov'),
('Arthur', 'Clarke'),
('Philip', 'Dick'),
('Terry', 'Pratchett'),
('Stephen', 'King'),
('Haruki', 'Murakami'),
('Neil', 'Gaiman'),
('Margaret', 'Atwood'),
('Dan', 'Brown'),
('J.R.R.', 'Tolkien'),
('Ernest', 'Hemingway'),
('Mark', 'Twain'),
('Jane', 'Austen'),
('Leo', 'Tolstoy'),
('Fyodor', 'Dostoevsky');

-- Insert data into knihy
INSERT INTO knihy (nazev, kategorie_id, vydavatel_id, rok_vydani, pocet_stran, pobocka_id) VALUES
('Válka s Mloky', 1, 1, 1936, 320, 1),
('Cesta do středu Země', 2, 1, 1864, 250, 2),
('1984', 1, 2, 1949, 328, 3),
('Vražda v Orient expresu', 4, 3, 1934, 256, 1),
('Harry Potter a Kámen mudrců', 5, 4, 1997, 309, 2),
('Nadace', 2, 5, 1951, 255, 3),
('RUR', 1, 1, 1920, 200, 1),
('Duna', 2, 1, 1965, 412, 2),
('Jurský park', 2, 2, 1990, 399, 3),
('Pán prstenů', 5, 3, 1954, 1216, 1),
('Záhada na zámku Styles', 4, 3, 1920, 296, 1),
('Harry Potter a Tajemná komnata', 5, 4, 1998, 341, 2),
('Já, robot', 2, 5, 1950, 224, 3),
('2001: Vesmírná odysea', 2, 5, 1968, 297, 3),
('Blade Runner', 2, 2, 1968, 210, 2),
('Strážci', 5, 3, 1986, 416, 1),
('To', 4, 2, 1986, 1138, 3),
('Zelená míle', 1, 2, 1996, 400, 2),
('Hobit', 5, 3, 1937, 310, 1),
('Konec civilizace', 2, 2, 1932, 268, 3),
('Fahrenheit 451', 2, 2, 1953, 194, 1),
('Neuromancer', 2, 1, 1984, 271, 2),
('Lovecraft Country', 2, 3, 2016, 384, 3),
('Metro 2033', 2, 4, 2005, 460, 1),
('Hyperion', 2, 5, 1989, 482, 2),
('Američtí bohové', 5, 3, 2001, 465, 3),
('Píseň ledu a ohně', 5, 4, 1996, 694, 1),
('Kroniky Narnie', 5, 1, 1950, 767, 2),
('Hvězdná pěchota', 2, 1, 1959, 263, 3),
('Zaklínač', 5, 2, 1993, 384, 1),
('Atlasova vzpoura', 1, 2, 1957, 1168, 3),
('Pýcha a předsudek', 1, 3, 1813, 279, 1),
('Malý princ', 1, 4, 1943, 96, 2),
('Sto roků samoty', 1, 5, 1967, 417, 3),
('Brave New World', 2, 2, 1932, 311, 1),
('The Catcher in the Rye', 1, 3, 1951, 277, 2),
('The Great Gatsby', 1, 4, 1925, 180, 3),
('Moby Dick', 1, 5, 1851, 635, 1),
('The Hobbit', 5, 3, 1937, 310, 2),
('The Lord of the Rings', 5, 3, 1954, 1216, 3),
('Kafka on the Shore', 1, 1, 2002, 505, 1),
('Norwegian Wood', 1, 2, 1987, 296, 2),
('The Wind-Up Bird Chronicle', 1, 3, 1994, 607, 3),
('Good Omens', 5, 4, 1990, 432, 1),
('The Handmaids Tale', 1, 5, 1985, 311, 2),
('Angels & Demons', 4, 1, 2000, 616, 3),
('The Old Man and the Sea', 1, 2, 1952, 127, 1),
('The Adventures of Tom Sawyer', 1, 3, 1876, 274, 2),
('War and Peace', 1, 4, 1869, 1225, 3),
('Crime and Punishment', 1, 5, 1866, 671, 1),
('The Shining', 4, 2, 1977, 447, 3),
('Carrie', 4, 2, 1974, 199, 1),
('The Stand', 4, 2, 1978, 823, 2),
('Misery', 4, 2, 1987, 320, 3),
('The Dark Tower', 5, 2, 1982, 845, 1),
('The Gunslinger', 5, 2, 1982, 224, 2),
('The Drawing of the Three', 5, 2, 1987, 400, 3),
('The Waste Lands', 5, 2, 1991, 512, 1),
('Wizard and Glass', 5, 2, 1997, 887, 2),
('Wolves of the Calla', 5, 2, 2003, 931, 3),
('Song of Susannah', 5, 2, 2004, 432, 1),
('The Dark Tower', 5, 2, 2004, 845, 2),
('The Institute', 4, 2, 2019, 576, 3),
('Doctor Sleep', 4, 2, 2013, 531, 1),
('11/22/63', 4, 2, 2011, 849, 2),
('Under the Dome', 4, 2, 2009, 1074, 3);

-- Insert data into knihy_autori
INSERT INTO knihy_autori (kniha_id, autor_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 1),
(8, 7),
(9, 8),
(10, 9),
(11, 4),
(12, 5),
(13, 6),
(14, 7),
(15, 8),
(16, 9),
(17, 10),
(18, 10),
(19, 9),
(20, 3),
(21, 3),
(22, 2),
(23, 4),
(24, 5),
(25, 6),
(26, 9),
(27, 5),
(28, 1),
(29, 2),
(30, 3),
(31, 2), -- Atlasova vzpoura by Ayn Rand
(32, 4), -- Pýcha a předsudek by Jane Austen
(33, 6), -- Malý princ by Antoine de Saint-Exupéry
(34, 10), -- Sto roků samoty by Gabriel Garcia Marquez
(35, 3), -- Brave New World by Aldous Huxley
(36, 8), -- The Catcher in the Rye by J.D. Salinger
(37, 7), -- The Great Gatsby by F. Scott Fitzgerald
(38, 5), -- Moby Dick by Herman Melville
(39, 9), -- The Hobbit by J.R.R. Tolkien
(40, 9), -- The Lord of the Rings by J.R.R. Tolkien
(41, 11), -- Kafka on the Shore by Haruki Murakami
(42, 11), -- Norwegian Wood by Haruki Murakami
(43, 11), -- The Wind-Up Bird Chronicle by Haruki Murakami
(44, 12), -- Good Omens by Neil Gaiman
(45, 13), -- The Handmaid's Tale by Margaret Atwood
(46, 14), -- Angels & Demons by Dan Brown
(47, 15), -- The Old Man and the Sea by Ernest Hemingway
(48, 16), -- The Adventures of Tom Sawyer by Mark Twain
(49, 17), -- War and Peace by Leo Tolstoy
(50, 18), -- Crime and Punishment by Fyodor Dostoevsky
(51, 10), -- The Shining by Stephen King
(52, 10), -- Carrie by Stephen King
(53, 10), -- The Stand by Stephen King
(54, 10), -- Misery by Stephen King
(55, 10), -- The Dark Tower by Stephen King
(56, 10), -- The Gunslinger by Stephen King
(57, 10), -- The Drawing of the Three by Stephen King
(58, 10), -- The Waste Lands by Stephen King
(59, 10), -- Wizard and Glass by Stephen King
(60, 10), -- Wolves of the Calla by Stephen King
(61, 10), -- Song of Susannah by Stephen King
(62, 10), -- The Dark Tower by Stephen King
(63, 10), -- The Institute by Stephen King
(64, 10), -- Doctor Sleep by Stephen King
(65, 10), -- 11/22/63 by Stephen King
(66, 10); -- Under the Dome by Stephen King

-- Insert data into uzivatele
INSERT INTO uzivatele (jmeno, prijmeni, email, telefon, adresa) VALUES
('Alice', 'Mala', 'alice.mala@example.com', '777123456', 'Ulice 1, Praha'),
('Bob', 'Velky', 'bob.velky@example.com', '777654321', 'Ulice 2, Brno'),
('Charlie', 'Stredni', 'charlie.stredni@example.com', '777456789', 'Ulice 3, Ostrava'),
('David', 'Novy', 'david.novy@example.com', '777987654', 'Ulice 4, Praha'),
('Eva', 'Stara', 'eva.stara@example.com', '777321456', 'Ulice 5, Brno'),
('Filip', 'Maly', 'filip.maly@example.com', '777654987', 'Ulice 6, Ostrava'),
('Gustav', 'Velky', 'gustav.velky@example.com', '777123789', 'Ulice 7, Praha'),
('Hana', 'Nova', 'hana.nova@example.com', '777987321', 'Ulice 8, Brno'),
('Iva', 'Stara', 'iva.stara@example.com', '777321789', 'Ulice 9, Ostrava'),
('Jakub', 'Maly', 'jakub.maly@example.com', '777654123', 'Ulice 10, Praha');

-- Insert data into vypujcky
INSERT INTO vypujcky (kniha_id, uzivatel_id, datum_vypujcky, datum_vraceni) VALUES
(1, 1, '2023-01-01', '2023-01-15'),
(2, 2, '2023-02-01', '2023-02-15'),
(3, 3, '2023-03-01', '2023-03-15'),
(4, 4, '2023-04-01', '2023-04-15'),
(5, 5, '2023-05-01', '2023-05-15'),
(6, 6, '2023-06-01', '2023-06-15'),
(7, 7, '2023-07-01', '2023-07-15'),
(8, 8, '2023-08-01', '2023-08-15'),
(9, 9, '2023-09-01', '2023-09-15'),
(10, 10, '2023-10-01', '2023-10-15'),
(11, 1, '2023-11-01', '2023-11-15'),
(12, 2, '2023-12-01', '2023-12-15'),
(13, 3, '2024-01-01', '2024-01-15'),
(14, 4, '2024-02-01', '2024-02-15'),
(15, 5, '2024-03-01', '2024-03-15'),
(16, 6, '2024-04-01', '2024-04-15'),
(17, 7, '2024-05-01', '2024-05-15'),
(18, 8, '2024-06-01', '2024-06-15'),
(19, 9, '2024-07-01', '2024-07-15'),
(20, 10, '2024-08-01', '2024-08-15'),
(21, 1, '2024-09-01', '2024-09-15'),
(22, 2, '2024-10-01', '2024-10-15'),
(23, 3, '2024-11-01', '2024-11-15'),
(24, 4, '2024-12-01', '2024-12-15'),
(25, 5, '2025-01-01', '2025-01-15'),
(26, 6, '2025-02-01', '2025-02-15'),
(27, 7, '2025-03-01', '2025-03-15'),
(28, 8, '2025-04-01', '2025-04-15'),
(29, 9, '2025-05-01', '2025-05-15'),
(30, 10, '2025-06-01', '2025-06-15');

-- Insert data into rezervace
INSERT INTO rezervace (kniha_id, uzivatel_id, datum_rezervace, stav) VALUES
(1, 1, '2023-06-01', 'cekajici'),
(2, 2, '2023-07-01', 'cekajici'),
(3, 3, '2023-08-01', 'cekajici'),
(4, 4, '2023-09-01', 'cekajici'),
(5, 5, '2023-10-01', 'cekajici'),
(6, 6, '2023-11-01', 'cekajici'),
(7, 7, '2023-12-01', 'cekajici'),
(8, 8, '2024-01-01', 'cekajici'),
(9, 9, '2024-02-01', 'cekajici'),
(10, 10, '2024-03-01', 'cekajici'),
(11, 1, '2024-04-01', 'cekajici'),
(12, 2, '2024-05-01', 'cekajici'),
(13, 3, '2024-06-01', 'cekajici'),
(14, 4, '2024-07-01', 'cekajici'),
(15, 5, '2024-08-01', 'cekajici'),
(16, 6, '2024-09-01', 'cekajici'),
(17, 7, '2024-10-01', 'cekajici'),
(18, 8, '2024-11-01', 'cekajici'),
(19, 9, '2024-12-01', 'cekajici'),
(20, 10, '2025-01-01', 'cekajici'),
(21, 1, '2025-02-01', 'cekajici'),
(22, 2, '2025-03-01', 'cekajici'),
(23, 3, '2025-04-01', 'cekajici'),
(24, 4, '2025-05-01', 'cekajici'),
(25, 5, '2025-06-01', 'cekajici'),
(26, 6, '2025-07-01', 'cekajici'),
(27, 7, '2025-08-01', 'cekajici'),
(28, 8, '2025-09-01', 'cekajici'),
(29, 9, '2025-10-01', 'cekajici'),
(30, 10, '2025-11-01', 'cekajici');

