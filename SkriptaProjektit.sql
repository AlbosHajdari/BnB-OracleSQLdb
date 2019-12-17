CREATE SEQUENCE UserIdSeq START WITH 1 CACHE 2;

--Drop SEQUENCE userIdSeq;


CREATE OR REPLACE TYPE Fjalekalimi AS Object
(
    Pass nvarchar2(30),
    Salt nvarchar2(30)
);
/


CREATE OR REPLACE TYPE Adresa AS Object
(
    Qyteti nvarchar2(30),
    Rajoni nvarchar2(30),
    Rruga nvarchar2(30),
    Zip nvarchar2(10)
);
/
CREATE OR REPLACE TYPE Lista_e_Adresave 
AS TABLE OF Adresa;
/

--Drop Table Useri;
CREATE TABLE Useri(
    PersonId Number(10) NOT NULL,
    Emri nvarchar2(30),
    Mbiemri nvarchar2(30),
    Email nvarchar2(30),
    Datelindja DATE,
    Fjalekalimi Fjalekalimi NOT NULL,
    Adresa Lista_e_Adresave,
    CONSTRAINT PersonIdPK PRIMARY KEY (PersonId)
)   NESTED TABLE Adresa STORE AS Adresa_Nested;


CREATE OR REPLACE TRIGGER UserIdCreate
BEFORE INSERT ON Useri 
FOR EACH ROW
BEGIN
  SELECT UserIdSeq.NEXTVAL
  INTO   :new.PersonId
  FROM   dual;
END;
/

CREATE OR REPLACE TRIGGER UserIdCreate
BEFORE INSERT ON Useri 
FOR EACH ROW
BEGIN
  SELECT UserIdSeq.NEXTVAL
  INTO   :new.PersonId
  FROM   dual;
END;
/


Alter TABLE Useri 
ADD Fjalekalimi Fjalekalimi NOT NULL;

ALTER TABLE Useri
ADD Adresa Lista_e_adresave NESTED TABLE Adresa STORE AS Adresa_Nested;


Insert into Useri (Emri,Mbiemri,Fjalekalimi,Adresa)
Values ('Albos','asd', Fjalekalimi('asd','123'),Lista_e_adresave(Adresa('Ferizaj','Ferizaj','Kuvendi i Arberit','70000'),Adresa('Kommogllave','Ferizaj','Rr.E Vitise','70000')));

SELECT Emri,Mbiemri,Email,Datelindja,U.Fjalekalimi FROM Useri U;
SELECT SYSDATE FROM DUAL;
SELECT * FROM Useri;

Update Useri
SET Adresa = Lista_e_Adresave( Adresa('Ferizaj','Ferizaj','Kuvendi i Arberit','70000'),Adresa('Kommogllave','Ferizaj','Rr.E Vitise','70000'));


TRUNCATE TABLE Useri;

SELECT * FROM DICT;

CREATE TABLE tblDhomeGjumi(
    DhomaGjumitID Number(10) NOT NULL,
    LlojiPerdoruesveTeDhomes nvarchar2(30),
    NumriKrevateve number(2),
    SiperfaqjaDhomesGjumit number(5,2),
    --FotoDhomesGjumit PHOTO,
    --CONSTRAINT FemijeApoTeRriturApoQift ,
    
    PRIMARY KEY (DhomaGjumitID)
);


CREATE TABLE tblDhomeNdejes(
    DhomaNdejesID Number(10) NOT NULL,
    NumriDivaneve number(2),
    SiperfaqjaDhomesNdejes number(5,2),
    --FotoDhomesNdejes PHOTO,
    CONSTRAINT DhomaNdejesIdPK PRIMARY KEY (DhomaNdejesID)
);

CREATE TABLE tblKuzhina(
    KuzhinaID Number(10) NOT NULL,
    TipiNgrohesit nvarchar2(30),
    TipiFtohesit nvarchar2(30),
    TavolinaUshqimi boolean,
    Enet boolean,
    Enelaresi boolean,
    SiperfaqjaKuzhines number(5,2),
    --FotoKuzhines PHOTO,
    CONSTRAINT KuzhinaIdPK PRIMARY KEY (KuzhinaID)
);

commit;

CREATE TABLE tblBallkoni(
    BallkoniID Number(10) NOT NULL,
    SiperfaqjaBallkonit number(5,2),
    --FotoBallkonit PHOTO,
    CONSTRAINT BallkoniIdPK PRIMARY KEY (BallkoniID)
);

CREATE TABLE tblBanjo(
    BanjoID Number(10) NOT NULL,
    SiperfaqjaBanjos number(5,2),
    PerPastrim boolean,
    --FotoBanjos PHOTO,
    CONSTRAINT BanjoIdPK PRIMARY KEY (BanjoID)
);
commit;

CREATE TABLE tblGarazhda(
    GarazhdaID Number(10) NOT NULL,
    SiperfaqjaGarazhdes number(6,2),
    TipiDyerve nvarchar2(20),
    --FotoGarazhdes PHOTO,
    CONSTRAINT GarazhdaIdPK PRIMARY KEY (GarazhdaID)
);
