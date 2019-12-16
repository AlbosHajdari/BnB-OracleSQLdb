CREATE SEQUENCE UserIdSeq START WITH 1 CACHE 2;

--Drop SEQUENCE userIdSeq;

CREATE TABLE Useri(
    PersonId Number(10) NOT NULL,
    Emri nvarchar2(30),
    Mbiemri nvarchar2(30),
    Email nvarchar2(30),
    Datelindja DATE,
    CONSTRAINT PersonIdPK PRIMARY KEY (PersonId)
);

CREATE OR REPLACE TRIGGER UserIdCreate
BEFORE INSERT ON Useri 
FOR EACH ROW
BEGIN
  SELECT UserIdSeq.NEXTVAL
  INTO   :new.PersonId
  FROM   dual;
END;
/



Insert into Useri (Emri,Mbiemri)
Values ('Albos','asd');

SELECT * FROM Useri;

--TRUNCATE TABLE Useri;


CREATE TABLE tblDhomeGjumi(
    DhomaGjumitID Number(10) NOT NULL,
    LlojiPerdoruesveTeDhomes nvarchar2(30),
    NumriKrevateve number(2),
    SiperfaqjaDhomesGjumit number(5,2),
    --FotoDhomesGjumit PHOTO,
    CONSTRAINT FemijeApoTeRriturApoQift ,
    
    CONSTRAINT DhomaGjumitIdPK PRIMARY KEY (DhomaGjumitID)
);

CREATE TABLE tblDhomeNdejes(
    DhomaNdejesID Number(10) NOT NULL,
    NumriDivaneve number(2),
    SiperfaqjaDhomesNdejes number(5,2),
    --FotoDhomesNdejes PHOTO,
    CONSTRAINT DhomaGjumitIdPK PRIMARY KEY (DhomaNdejesID)
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
