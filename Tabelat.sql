CREATE TABLE Useri(
    PersonId Number(10) NOT NULL,
    Emri nvarchar2(30),
    Mbiemri nvarchar2(30),
    Email nvarchar2(30) UNIQUE NOT NULL,
    Datelindja DATE,
    Fjalekalimi Fjalekalimi NOT NULL,
    Adresa Lista_e_Adresave,
    Statusi char(1) NOT NULL CHECK (Statusi = '1' OR Statusi = '0'),
    CONSTRAINT PersonIdPK PRIMARY KEY (PersonId)
)   NESTED TABLE Adresa STORE AS Adresa_Nested;

CREATE TABLE Objekti (
ObjektId Number NOT NULL,
Adresa Adresa NOT NULL,
PronarId Number (10) NOT NULL,
CONSTRAINT ObjektIdPK PRIMARY KEY (ObjektId),
CONSTRAINT PronariFK Foreign Key (PronarId)
REFERENCES Useri(PersonId) ON DELETE CASCADE
);

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

CREATE TABLE tblShtepia (
    ShtepiaID number(10) NOT NULL,
    ObjektiID number(10) NOT NULL,
    SiperfaqjaTotaleShtepise number(8,2) NOT NULL,
    SiperfaqjaTotaleOborrit number(8,2) NOT NULL,
    NumriKateve number(1) CHECK (NumriKateve > 0),
    NumriBallkoneve number(1),
    Lifti char(1) NOT NULL CHECK (Lifti = '1' OR Lifti = '0'),
    
    CONSTRAINT ShtepiaIdPK PRIMARY KEY (ShtepiaID),
    CONSTRAINT shtepiaObjektiIdFK FOREIGN KEY (ObjektiID) REFERENCES Objekti(ObjektId) ON DELETE CASCADE
);

CREATE TABLE tblApartamenti(
    ApartamentiID number(10) NOT NULL,
    ObjektiID number(10) NOT NULL,
    SiperfaqjaTotaleApartamentit number(8,2) NOT NULL,
    KatiNumer number(3) NOT NULL,
    NumriBallkoneve number(1),
    Lifti char(1) NOT NULL CHECK (Lifti = '1' OR Lifti = '0'),
    
    CONSTRAINT ApartamentiIdPK PRIMARY KEY (ApartamentiID),
    CONSTRAINT apartamentiObjektiIdFK FOREIGN KEY (ObjektiID) REFERENCES Objekti(ObjektId) ON DELETE CASCADE
);

CREATE TABLE tblDhomeGjumi(
    DhomeGjumiID number(10) NOT NULL,
    ShtepiaID number(10),
    ApartamentiID number(10),
    LlojiPerdoruesveTeDhomes nvarchar2(30) CHECK (LlojiPerdoruesveTeDhomes = 'femije' OR LlojiPerdoruesveTeDhomes = 'te rritur' OR LlojiPerdoruesveTeDhomes = 'qift'),
    
    CONSTRAINT DhomeGjumiIdPK PRIMARY KEY (DhomeGjumiID),
    CONSTRAINT dhomeGjumiShtepiIdFK FOREIGN KEY (ShtepiaID) REFERENCES tblShtepia(ShtepiaID) ON DELETE CASCADE,
    CONSTRAINT dhomeGjumiApartamentiIdFK FOREIGN KEY (ApartamentiID) REFERENCES tblApartamenti(ApartamentiID) ON DELETE CASCADE

);

CREATE TABLE tblDhomeNdejes(
    DhomeNdejesID number(10) NOT NULL,
    ShtepiaID number(10),
    ApartamentiID number(10),
    NumriDivanave number(2),
    
    CONSTRAINT DhomeNdejesIdPK PRIMARY KEY (DhomeNdejesID),
    CONSTRAINT dhomeNdejesShtepiIdFK FOREIGN KEY (ShtepiaID) REFERENCES tblShtepia(ShtepiaID) ON DELETE CASCADE,
    CONSTRAINT dhomeNdejesApartamentiIdFK FOREIGN KEY (ApartamentiID) REFERENCES tblApartamenti(ApartamentiID) ON DELETE CASCADE
);

CREATE TABLE tblKuzhina(
    KuzhinaID number(10) NOT NULL,
    ShtepiaID number(10),
    ApartamentiID number(10),
    TavolinaUshqimit char(1) NOT NULL CHECK (TavolinaUshqimit = '1' OR TavolinaUshqimit = '0'),
    Enet char(1) NOT NULL CHECK (Enet = '1' OR Enet = '0'),
    EneLaresi char(1) NOT NULL CHECK (EneLaresi = '1' OR EneLaresi = '0'),
    
    TipiFtohesit char(10) NOT NULL CHECK (TipiFtohesit = 'friz' OR TipiFtohesit = 'frigorifer' OR TipiFtohesit = 'te dyjat'),
    TipiNgrohesit char(10) NOT NULL CHECK (TipiNgrohesit = 'plloqe' OR TipiNgrohesit = 'furre' OR TipiNgrohesit = 'te dyjat'),
    
    
    CONSTRAINT KuzhinaIdPK PRIMARY KEY (KuzhinaID),
    CONSTRAINT kuzhinaShtepiIdFK FOREIGN KEY (ShtepiaID) REFERENCES tblShtepia(ShtepiaID) ON DELETE CASCADE,
    CONSTRAINT kuzhinaApartamentiIdFK FOREIGN KEY (ApartamentiID) REFERENCES tblApartamenti(ApartamentiID) ON DELETE CASCADE
);

CREATE TABLE tblBanjo(
    BanjoID number(10) NOT NULL,
    ShtepiaID number(10),
    ApartamentiID number(10),
    PerPastrim char(1) NOT NULL CHECK (PerPastrim = '1' OR PerPastrim = '0'),
    
    CONSTRAINT BanjoIdPK PRIMARY KEY (BanjoID),
    CONSTRAINT BanjoShtepiIdFK FOREIGN KEY (ShtepiaID) REFERENCES tblShtepia(ShtepiaID) ON DELETE CASCADE,
    CONSTRAINT BanjoApartamentiIdFK FOREIGN KEY (ApartamentiID) REFERENCES tblApartamenti(ApartamentiID) ON DELETE CASCADE
);

CREATE TABLE tblGarazhda(
    GarazhdaID number(10) NOT NULL,
    ShtepiaID number(10),
    ApartamentiID number(10),
    ObjektiID number(10),
    HapjaEDyerve char(10) NOT NULL CHECK ( HapjaEDyerve = 'fizike' OR HapjaEDyerve = 'me dirigjim' OR HapjaEDyerve = 'automatike'),
    
    CONSTRAINT GarazhdaIdPK PRIMARY KEY (GarazhdaID),
    CONSTRAINT GarazhdaShtepiIdFK FOREIGN KEY (ShtepiaID) REFERENCES tblShtepia(ShtepiaID) ON DELETE CASCADE,
    CONSTRAINT GarazhdaApartamentiIdFK FOREIGN KEY (ApartamentiID) REFERENCES tblApartamenti(ApartamentiID) ON DELETE CASCADE,
    CONSTRAINT GarazhdaObjektiIdFK FOREIGN KEY (ObjektiID) REFERENCES Objekti(ObjektId) ON DELETE CASCADE
);
