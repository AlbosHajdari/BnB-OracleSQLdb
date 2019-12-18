CREATE OR REPLACE TYPE Fjalekalimi AS Object
(
    Pass char(64),
    Salt varchar(64)
);
/

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

CREATE OR REPLACE TYPE Qeraja AS OBJECT
(
    Qeraja_ditore DECIMAL(10,2),
    Data_e_fillimit DATE,
    Data_e_mbarimit DATE
);
/
