CREATE SEQUENCE UserIdSeq START WITH 1 CACHE 2;

CREATE OR REPLACE TRIGGER UserIdCreate
BEFORE INSERT ON Useri 
FOR EACH ROW
BEGIN
  SELECT UserIdSeq.NEXTVAL
  INTO   :new.PersonId
  FROM   dual;
END;
/

CREATE SEQUENCE ObjektiIdSeq START WITH 1 CACHE 2;
/

CREATE OR REPLACE TRIGGER ObjektiAutoNumber 
BEFORE INSERT ON Objekti
FOR EACH ROW
BEGIN
    SELECT ObjektiIdSeq.NEXTVAL
    INTO :NEW.ObjektId
    FROM dual;
END;
/

CREATE SEQUENCE QerajaSeq START WITH 1 CACHE 2;
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

CREATE SEQUENCE PagesaIdSeq START WITH 1 CACHE 2;

CREATE OR REPLACE TRIGGER PagesaIdAuto
BEFORE INSERT ON Pagesa
FOR EACH ROW 
BEGIN
    SELECT PagesaIdSeq.NEXTVAL
    INTO :NEW.PagesaId
    FROM DUAL;
END;
/

CREATE SEQUENCE ShtepiaIdSeq START WITH 1 CACHE 2;
/

CREATE OR REPLACE TRIGGER ShtepiaAutoNumber 
BEFORE INSERT ON tblShtepia
FOR EACH ROW
BEGIN
    SELECT ShtepiaIdSeq.NEXTVAL
    INTO :NEW.ShtepiaID
    FROM dual;
END;
/

CREATE SEQUENCE ApartamentiSeq START WITH 1 CACHE 2;
/
CREATE OR REPLACE TRIGGER ApartamentiAutoNumber 
BEFORE INSERT ON tblApartamenti
FOR EACH ROW
BEGIN
    SELECT ApartamentiSeq.NEXTVAL
    INTO :NEW.ApartamentiID
    FROM dual;
END;
/

CREATE SEQUENCE DhomeGjumiIdSeq START WITH 1 CACHE 2;
/
CREATE OR REPLACE TRIGGER DhomeGjumiAutoNumber 
BEFORE INSERT ON tblDhomeGjumi
FOR EACH ROW
BEGIN
    SELECT DhomeGjumiIdSeq.NEXTVAL
    INTO :NEW.DhomeGjumiID
    FROM dual;
END;
/

CREATE SEQUENCE DhomeNdejesIdSeq START WITH 1 CACHE 2;
/
CREATE OR REPLACE TRIGGER DhomeNdejesAutoNumber 
BEFORE INSERT ON tblDhomeNdejes
FOR EACH ROW
BEGIN
    SELECT DhomeNdejesIdSeq.NEXTVAL
    INTO :NEW.DhomeNdejesID
    FROM dual;
END;
/

CREATE SEQUENCE KuzhinaIdSeq START WITH 1 CACHE 2;
/
CREATE OR REPLACE TRIGGER KuzhinaAutoNumber 
BEFORE INSERT ON tblKuzhina
FOR EACH ROW
BEGIN
    SELECT KuzhinaIdSeq.NEXTVAL
    INTO :NEW.KuzhinaID
    FROM dual;
END;
/

CREATE SEQUENCE BanjoIdSeq START WITH 1 CACHE 2;
/
CREATE OR REPLACE TRIGGER BanjoAutoNumber 
BEFORE INSERT ON tblBanjo
FOR EACH ROW
BEGIN
    SELECT BanjoIdSeq.NEXTVAL
    INTO :NEW.BanjoID
    FROM dual;
END;
/

CREATE SEQUENCE GarazhdaIdSeq START WITH 1 CACHE 2;
/
CREATE OR REPLACE TRIGGER GarazhdaAutoNumber 
BEFORE INSERT ON tblGarazhda
FOR EACH ROW
BEGIN
    SELECT GarazhdaIdSeq.NEXTVAL
    INTO :NEW.GarazhdaID
    FROM dual;
END;
/



------------------------
CREATE OR REPLACE TRIGGER Llogarit_Qerane_Totale
BEFORE INSERT ON QerajaInfo 
FOR EACH ROW 
BEGIN
    :NEW.Qeraja_Totale := (:NEW.Qeraja.Qeraja_ditore*(:New.Qeraja.Data_e_mbarimit - :NEW.Qeraja.Data_e_fillimit + 1));
END;
/










