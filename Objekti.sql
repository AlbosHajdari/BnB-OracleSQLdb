CREATE SEQUENCE ObjektiIdSeq START WITH 1 CACHE 2;
/

--Drop Table Objekti;
CREATE TABLE Objekti (
ObjektId Number NOT NULL,
Adresa Adresa NOT NULL,
PronarId Number (10) NOT NULL,
CONSTRAINT ObjektIdPK PRIMARY KEY (ObjektId),
CONSTRAINT PronariFK Foreign Key (PronarId)
REFERENCES Useri(PersonId) ON DELETE CASCADE
);

CREATE OR REPLACE TRIGGER ObjektiAutoNumber 
BEFORE INSERT ON Objekti
FOR EACH ROW
BEGIN
    SELECT ObjektiIdSeq.NEXTVAL
    INTO :NEW.ObjektId
    FROM dual;
END;
/

INSERT INTO objekti (Adresa,PronarId)
VALUES(Adresa('Prishtine','Prishtine','Bregu i Diellit','10000'),1);

SELECT objektid, O.Adresa.Qyteti AS Qyteti,O.Adresa.Rruga As Rruga, PronarId FROM Objekti O;
TRUNCATE Table Objekti;
select * from objekti;


