from datetime import date
from sqlalchemy import create_engine, Column, Integer, Date, ForeignKey, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, relationship

# nastavení url databáze
DATABASE_URL = "postgresql+psycopg2://dbuser:dbpwd@localhost:5433/knihovna"

# vytvoření engine a session
engine = create_engine(DATABASE_URL)
Session = sessionmaker(bind=engine)
session = Session()
Base = declarative_base()

# definice tabulky knihy
class Kniha(Base):
    __tablename__ = 'knihy'
    id = Column(Integer, primary_key=True)
    nazev = Column(String, nullable=False)
    vypujcky = relationship('Vypujcka', back_populates='kniha')

# definice tabulky uživatelé
class Uzivatel(Base):
    __tablename__ = 'uzivatele'
    id = Column(Integer, primary_key=True)
    jmeno = Column(String, nullable=False)
    vypujcky = relationship('Vypujcka', back_populates='uzivatel')

# definice tabulky výpůjčky
class Vypujcka(Base):
    __tablename__ = 'vypujcky'
    id = Column(Integer, primary_key=True)
    kniha_id = Column(Integer, ForeignKey('knihy.id'), nullable=False)
    uzivatel_id = Column(Integer, ForeignKey('uzivatele.id'), nullable=False)
    datum_vypujcky = Column(Date, nullable=False)
    datum_vraceni = Column(Date, nullable=True)
    kniha = relationship('Kniha', back_populates='vypujcky')
    uzivatel = relationship('Uzivatel', back_populates='vypujcky')

    def __str__(self):
        return f"Vypujcka(id={self.id}, kniha_id={self.kniha_id}, uzivatel_id={self.uzivatel_id}, datum_vypujcky={self.datum_vypujcky}, datum_vraceni={self.datum_vraceni})"

# třída knihovna pro správu výpůjček
class Library:
    def __init__(self, session):
        self.session = session

    # metoda pro vložení záznamu
    def insert_record(self, kniha_id, uzivatel_id, datum_vypujcky, datum_vraceni):
        new_record = Vypujcka(
            kniha_id=kniha_id,
            uzivatel_id=uzivatel_id,
            datum_vypujcky=datum_vypujcky,
            datum_vraceni=datum_vraceni
        )
        self.session.add(new_record)
        self.session.commit()
        print(f"Inserted record with ID: {new_record.id}")

    # metoda pro aktualizaci záznamu
    def update_record(self, record_id, new_datum_vraceni):
        record = self.session.query(Vypujcka).filter_by(id=record_id).first()
        if record:
            record.datum_vraceni = new_datum_vraceni
            self.session.commit()
            print(f"Updated record with ID: {record_id}")

    # metoda pro smazání záznamu
    def delete_record(self, record_id):
        record = self.session.query(Vypujcka).filter_by(id=record_id).first()
        if record:
            self.session.delete(record)
            self.session.commit()
            print(f"Deleted record with ID: {record_id}")

    # metoda pro výběr všech záznamů
    def select_all_records(self):
        records = self.session.query(Vypujcka).all()
        for record in records:
            print(record)

try:
    library = Library(session)
    # library.insert_record(201, 10, date(2024, 1, 1), date(2024, 1, 15))
    # library.insert_record(202, 15, date(2024, 2, 1), date(2024, 2, 20))
    
    # library.select_all_records()
    
    library.update_record(3, date(2045, 3, 1))
    
    # library.select_all_records()
    
    # library.delete_record(1)
    
    library.select_all_records()
finally:
    session.close()