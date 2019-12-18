Insert into Useri (Emri,Mbiemri, Email, Fjalekalimi,Adresa)
Values ('Albos','asd','email1', Fjalekalimi('asd','123'),Lista_e_adresave(Adresa('Ferizaj','Ferizaj','Kuvendi i Arberit','70000'),Adresa('Kommogllave','Ferizaj','Rr.E Vitise','70000')));

Insert into Useri (Emri,Mbiemri,Fjalekalimi,Adresa)
Values
('Ndriqim','Halili','email2', Fjalekalimi('asd','123'),Lista_e_adresave(Adresa('qyteti1','rajoni1','rruga1','zip1'),Adresa('qyteti2','rajoni2','rruga2','zip2')));

Insert into Useri (Emri,Mbiemri,Fjalekalimi,Adresa)
Values
('Ndriqim','mbiemri1', 'email3',Fjalekalimi('asd','123'),Lista_e_adresave(Adresa('qyteti5','rajoni6','rruga6','zip6')));

Insert into Useri (Emri,Mbiemri,Fjalekalimi,Adresa)
Values
('Emri3','mbiemri1','email4', Fjalekalimi('asd','123'),Lista_e_adresave(Adresa('qyteti5','rajoni6','rruga6','zip6')));

Insert into Useri (Emri,Mbiemri,Fjalekalimi,Adresa)
Values
('Emri3','mbiemri1', 'email5',Fjalekalimi('asd','123'),Lista_e_adresave(Adresa('qyteti5','rajoni6','rruga6','zip6')));

INSERT INTO objekti (Adresa,PronarId)
VALUES(Adresa('qyteti3','rajoni3','rruga3','zip3'),1);

INSERT INTO objekti (Adresa,PronarId)
VALUES(Adresa('qyteti3','rajoni3','rruga3','zip3'),1);

INSERT INTO objekti (Adresa,PronarId)
VALUES(Adresa('qyteti4','rajoni4','rruga4','zip4'),2);


INSERT INTO QerajaInfo (ObjektId,PronarId,QeramarresiId,Qeraja)
VALUES (1,1,2,Qeraja(20,'01-OCT-2019','31-OCT-2019'));

INSERT INTO tblApartamenti (ObjektiID, SiperfaqjaTotaleApartamentit, KatiNumer, Lifti)
VALUES (1, 100, 3, '1');

INSERT INTO tblApartamenti (ObjektiID, SiperfaqjaTotaleApartamentit, KatiNumer, Lifti)
VALUES (2, 200, 2, '0');

INSERT INTO tblApartamenti (ObjektiID, SiperfaqjaTotaleApartamentit, KatiNumer, Lifti)
VALUES (3, 200, 2, '1');

INSERT INTO tblApartamenti (ObjektiID, SiperfaqjaTotaleApartamentit, KatiNumer, Lifti)
VALUES (3, 400, 2, '1');

INSERT INTO tblDhomeGjumi (ApartamentiID, LlojiPerdoruesveTeDhomes)
VALUES (1, 'femije');

INSERT INTO tblDhomeGjumi (ApartamentiID, LlojiPerdoruesveTeDhomes)
VALUES (1, 'qift');

INSERT INTO tblDhomeGjumi (ApartamentiID, LlojiPerdoruesveTeDhomes)
VALUES (2, 'te rritur');




SELECT u.emri
FROM Useri u
GROUP BY u.emri
HAVING COUNT (u.PersonId) > 1;
