--Cleaned DIM_Customer Table--
SELECT 
  c.[CustomerKey] AS CustomerKey --,[GeographyKey]
  --,[CustomerAlternateKey]
  --,[Title]
  , 
  c.[FirstName] AS [First Name] --,[MiddleName]
  , 
  c.[LastName] AS [Last Name], 
  c.FirstName + ' ' + LastName as [Full Name] --,[NameStyle]
  --,[BirthDate]
  --,[MaritalStatus]
  --,[Suffix]
  , 
  case c.[Gender] WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender, 
  --,[EmailAddress]
  --,[YearlyIncome]
  --,[TotalChildren]
  --,[NumberChildrenAtHome]
  --,[EnglishEducation]
  --,[SpanishEducation]
  --,[FrenchEducation]
  --,[EnglishOccupation]
  --,[SpanishOccupation]
  --,[FrenchOccupation]
  --,[HouseOwnerFlag]
  --,[NumberCarsOwned]
  --,[AddressLine1]
  --,[AddressLine2]
  --,[Phone]
  c.[DateFirstPurchase], 
  --,[CommuteDistance]
  g.city AS [Customer City] 
INTO Dim_Customer1
FROM 
  [AdventureWorksDW].[dbo].[DimCustomer] c 
  LEFT JOIN dbo.DimGeography g ON g.GeographyKey = c.GeographyKey 
ORDER BY 
  CustomerKey ASC --Ordered List by CustomerKey
