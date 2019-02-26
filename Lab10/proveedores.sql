BULK INSERT a1703151.a1703151.[Proveedores]
   FROM 'e:\wwwroot\a1703151\proveedores.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

	  SELECT  * FROM Proveedores