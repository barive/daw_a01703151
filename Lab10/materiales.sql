BULK INSERT a1703151.a1703151.[Materiales]
   FROM 'e:\wwwroot\a1703151\materiales.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

	  SELECT  * FROM Materiales