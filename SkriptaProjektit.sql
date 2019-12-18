CREATE TABLE tblShtepia (
    ShtepiaID number(10) NOT NULL,
    ObjektiID number(10) NOT NULL,
    SiperfaqjaTotaleShtepise number(8,2) NOT NULL,
    SiperfaqjaTotaleOborrit number(8,2) NOT NULL,
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
    Lifti char(1) NOT NULL CHECK (Lifti = '1' OR Lifti = '0'),
    NumriBallkoneve number(1),
    
    CONSTRAINT ApartamentiIdPK PRIMARY KEY (ApartamentiID),
    CONSTRAINT apartamentiObjektiIdFK FOREIGN KEY (ObjektiID) REFERENCES Objekti(ObjektId) ON DELETE CASCADE
);

 
CREATE TABLE tblDhomeGjumi(
    DhomeGjumiID number(10) NOT NULL,
    ShtepiaID number(10),
    ApartamentiID number(10),
    LlojiPerdoruesveTeDhomes nvarchar2(30) CHECK (LlojiPerdoruesveTeDhomes = 'femije' OR LlojiPerdoruesveTeDhomes = 'te rritur' OR LlojiPerdoruesveTeDhomes = 'qift'),
    NumriKrevateve number(2),
    
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
