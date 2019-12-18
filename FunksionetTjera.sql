SELECT objektid, O.Adresa.Qyteti AS Qyteti,O.Adresa.Rruga As Rruga, PronarId FROM Objekti O;
SELECT * FROM Objekti;
/

CREATE INDEX Emri_Idx
    ON Useri(Emri);

CREATE INDEX Qeraja_totale_Idx
    ON QerajaInfo (Qeraja_Totale);

/
CREATE UNIQUE INDEX Email_Idx
    ON Useri (Email);

/

CREATE BITMAP INDEX Menyra_e_Pageses_Bit
    ON Pagesat (Menyra_e_Pageses);
/

CREATE INDEX Shuma_e_rrumbullaksuar_Idx
    ON Pagesat (ROUND(Shuma));
/



SELECT Emri, CURSOR (SELECT Qyteti FROM TABLE (Adresa) WHERE Qyteti ='Ferizaj') AS Adresa FROM Useri;
/

CREATE TABLE rank_demo (
 col VARCHAR(10) NOT NULL
);

INSERT ALL 
INTO rank_demo(col) VALUES('A')
INTO rank_demo(col) VALUES('A')
INTO rank_demo(col) VALUES('B')
INTO rank_demo(col) VALUES('C')
INTO rank_demo(col) VALUES('C')
INTO rank_demo(col) VALUES('C')
INTO rank_demo(col) VALUES('D')
SELECT 1 FROM dual; 

/


/

SELECT Qeraja_Totale, Rank() OVER (ORDER BY Qeraja_Totale DESC) Rangimi_i_Qerase
FROM QerajaInfo;
/

SELECT Shuma, RANK() OVER (ORDER BY Shuma DESC) Rangimi_i_Pageses
FROM Pagesat;
/

SELECT Shuma,  OVER (ORDER BY Shuma DESC) Rangimi_i_Pageses
FROM Pagesat;

/

CREATE VIEW Pronari AS 
select u.emri,u.Mbiemri,o.objektid from useri u join Objekti o on u.PersonId=o.PronarId;
;





