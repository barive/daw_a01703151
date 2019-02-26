SET DATEFORMAT dmy

BULK INSERT a1703151.a1703151.[Entregan]
   FROM 'e:\wwwroot\a1703151\entregan.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

	  SELECT  * FROM Entregan