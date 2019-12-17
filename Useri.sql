CREATE SEQUENCE UserIdSeq START WITH 1 CACHE 2;

--Drop SEQUENCE userIdSeq;


CREATE OR REPLACE TYPE Fjalekalimi AS Object
(
    Pass nvarchar2(30),
    Salt nvarchar2(30)
);
/
--Drop Table Useri;

CREATE OR REPLACE TYPE Adresa AS Object
(
    Qyteti nvarchar2(30),
    Rajoni nvarchar2(30),
    Rruga nvarchar2(100),
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

    SELECT *FROM Useri;
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





Insert into Useri (Emri,Mbiemri,Fjalekalimi,Adresa)
Values ('Albos','asd', Fjalekalimi('asd','123'),Lista_e_adresave(Adresa('Ferizaj','Ferizaj','Kuvendi i Arberit','70000'),Adresa('Kommogllave','Ferizaj','Rr.E Vitise','70000')));

--
--SELECT Emri,Mbiemri,Email,Datelindja,U.Fjalekalimi FROM Useri U;
--SELECT SYSDATE FROM DUAL;
--SELECT * FROM Useri;

--Update Useri
--SET Adresa = Lista_e_Adresave( Adresa('Ferizaj','Ferizaj','Kuvendi i Arberit','70000'),Adresa('Kommogllave','Ferizaj','Rr.E Vitise','70000'));

--
--TRUNCATE TABLE Useri;
--DELETE FROM Useri WHERE personid=1;
--SELECT * FROM Useri;