CREATE SEQUENCE QerajaSeq START WITH 1 CACHE 2;
/

CREATE OR REPLACE TYPE Qeraja AS OBJECT
(
    Qeraja_ditore DECIMAL(10,2),
    Data_e_fillimit DATE,
    Data_e_mbarimit DATE
);
/

--Drop Table QerajaInfo;
CREATE TABLE QerajaInfo (
QerajaId Number NOT NULL,
ObjektId Number NOT NULL,
PronarId Number (10) NOT NULL,
QeramarresiId Number (10) NOT NULL,
Qeraja Qeraja NOT NULL,
Qeraja_Totale DECIMAL(10,2) NOT NULL,
CONSTRAINT QerajaIdPK PRIMARY KEY (QerajaId),
CONSTRAINT ObjektIdFK Foreign KEY (ObjektId) 
REFERENCES Objekti(ObjektId),
CONSTRAINT QeraDhenesiFK Foreign Key (PronarId)
REFERENCES Useri(PersonId) ON DELETE CASCADE,
CONSTRAINT QeraMarresiFK FOREIGN KEY (QeramarresiId) 
REFERENCES Useri (PersonId) ON DELETE CASCADE
);
/
CREATE OR REPLACE TRIGGER QerajaAutoNumber 
BEFORE INSERT ON QerajaInfo
FOR EACH ROW
BEGIN
    SELECT QerajaSeq.NEXTVAL
    INTO :NEW.QerajaId
    FROM dual;
END;

/

CREATE OR REPLACE TRIGGER Llogarit_Qerane_Totale
BEFORE INSERT ON QerajaInfo 
FOR EACH ROW 
BEGIN
    :NEW.Qeraja_Totale := (:NEW.Qeraja.Qeraja_ditore*(:New.Qeraja.Data_e_mbarimit - :NEW.Qeraja.Data_e_fillimit + 1));
END;
/


INSERT INTO QerajaInfo (ObjektId,PronarId,QeramarresiId,Qeraja)
VALUES (5,2,3,Qeraja(20,'01-OCT-2019','31-OCT-2019'));

SELECT * FROM QerajaInfo;
TRUNCATE TABLE QerajaInfo;

--INSERT INTO objekti (Adresa,PronarId)
--VALUES(Adresa('Prishtine','Prishtine','Bregu i Diellit','10000'),2);
--SELECT * FROM Useri;
--SELECT objektid, O.Adresa.Qyteti AS Qyteti,O.Adresa.Rruga As Rruga, PronarId FROM Objekti O;
--TRUNCATE Table Objekti;
--select * from objekti;

CREATE SEQUENCE PagesaIdSeq START WITH 1 CACHE 2;
/
--DROP SEQUENCE PagesaIdSeq


CREATE TABLE Pagesa(
PagesaId NUMBER(10),
Paguesi NUMBER(10),
Pranuesi NUMBER (10),
Menyra_e_Pageses Varchar(10) CHECK (Menyra_e_pageses IN ('Transaksion bankar','Para ne dore','Karte krediti')) NOT NULL,
Banka Varchar(20),
XhirollogariaDerguese char(16),
XhirollogariaPranuese char(16),
CONSTRAINT PagesaIdPK PRIMARY KEY (PagesaId),
CONSTRAINT PaguesiFK FOREIGN KEY (Paguesi) REFERENCES Useri(PersonId),
CONSTRAINT PranuesiFK FOREIGN KEY (Pranuesi) REFERENCES Useri(PersonId)
);
/

CREATE OR REPLACE TRIGGER PagesaIdAuto
BEFORE INSERT ON Pagesa
FOR EACH ROW 
BEGIN
    SELECT PagesaIdSeq.NEXTVAL
    INTO :NEW.PagesaId
    FROM DUAL;
END;
/

