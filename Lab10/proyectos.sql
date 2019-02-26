BULK INSERT a1703151.a1703151.[Proyectos]
   FROM 'e:\wwwroot\a1703151\proyectos.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

	  SELECT  * FROM Proyectos