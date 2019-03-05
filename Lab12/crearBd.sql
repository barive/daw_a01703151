--Ejercicio 1
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Materiales')

DROP TABLE Materiales 

CREATE TABLE Materiales 
( 
  Clave numeric(5) not null, 
  Descripcion varchar(50), 
  Costo numeric (8,2) 
) 

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proveedores')

DROP TABLE Proveedores

CREATE TABLE Proveedores 
( 
  RFC char(13) not null, 
  RazonSocial varchar(50) 
) 

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proyectos')

DROP TABLE Proyectos

CREATE TABLE Proyectos 
( 
  Numero numeric(5) not null, 
  Denominacion varchar(50) 
)
 
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Entregan')

DROP TABLE Entregan

CREATE TABLE Entregan 
( 
  Clave numeric(5) not null, 
  RFC char(13) not null, 
  Numero numeric(5) not null, 
  Fecha DateTime not null, 
  Cantidad numeric (8,2) 
) 

BULK INSERT a1703151.a1703151.[Materiales] 
  FROM 'e:\wwwroot\a1703151\materiales.csv' 
  WITH 
  ( 
    CODEPAGE = 'ACP', 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n' 
  ) 

BULK INSERT a1703151.a1703151.[Proyectos] 
  FROM 'e:\wwwroot\a1703151\proyectos.csv' 
  WITH 
  ( 
    CODEPAGE = 'ACP', 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n' 
  )

BULK INSERT a1703151.a1703151.[Proveedores] 
  FROM 'e:\wwwroot\a1703151\proveedores.csv' 
  WITH 
  ( 
    CODEPAGE = 'ACP', 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n' 
  )

SET DATEFORMAT dmy -- especificar formato de la fecha 

BULK INSERT a1703151.a1703151.[Entregan] 
  FROM 'e:\wwwroot\a1703151\entregan.csv' 
  WITH 
  ( 
    CODEPAGE = 'ACP', 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n' 
  ) 

--Ejercicio 2
INSERT INTO Materiales values(1000, 'xxx', 1000)

select * from Materiales

Delete from Materiales where Clave = 1000 and Costo = 1000

ALTER TABLE Materiales add constraint llaveMateriales PRIMARY KEY (Clave)

INSERT INTO Materiales values(1000, 'xxx', 1000) 

sp_helpconstraint materiales

ALTER TABLE Proveedores add constraint llaveProveedores PRIMARY KEY (RFC)

ALTER TABLE Proyectos add constraint llaveProyectos PRIMARY KEY (Numero)

sp_helpconstraint proveedores

sp_helpconstraint proyectos

ALTER TABLE Entregan add constraint llaveEntregan PRIMARY KEY (Clave, RFC, Numero, Fecha)

sp_helpconstraint entregan

--Ejercicio 3
SELECT * from Entregan ; 

INSERT INTO entregan values (0, 'xxx', 0, '1-jan-02', 0) ; 

Delete from Entregan where Clave = 0 

ALTER TABLE entregan add constraint cfentreganclave 
  foreign key (clave) references materiales(clave); 

ALTER TABLE entregan add constraint cfentreganrrfc 
  foreign key (rfc) references proveedores(rfc);

ALTER TABLE entregan add constraint cfentregannumero 
  foreign key (numero) references proyectos(numero);

sp_helpconstraint entregan

--Ejercicio 4
INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0); 

SELECT * from Entregan 

Delete from Entregan where Cantidad = 0

ALTER TABLE entregan add constraint cantidad check (cantidad > 0) ; 