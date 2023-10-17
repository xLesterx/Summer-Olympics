SELECT [ID],
      [Name] AS 'Athlete Name',
      CASE 
		WHEN [Sex] = 'M' THEN 'Male'
		 WHEN [Sex] = 'F' THEN 'Female'
	  END AS Gender, -- Better Filters
	  [Age],
      CASE 
		WHEN [Age] < 18 THEN 'Under 18'
		WHEN [Age] BETWEEN 18 AND 25 THEN '18-25'
		WHEN [Age] BETWEEN 25 AND 30 THEN '25-30'
		WHEN [Age] > 30 THEN 'Over 30'
	  END AS [Age Bracket],
      [Height],
      [Weight],
      [NOC] AS 'Nation Code', -- Abbrevation Explained
      [Games],
	  --CHARINDEX(' ', Games)-1 AS 'Year Position', -- Identifying the index no. of year
	  --CHARINDEX(' ', REVERSE([Games]))-1 AS 'Season Position', --Identifying the index no. of season
	  LEFT([Games], CHARINDEX(' ', Games))-1 AS 'Year', 
	  RIGHT([Games], CHARINDEX(' ', REVERSE(Games))-1) AS 'Season',
      --[City], -- Only country is needed
      [Sport],
      [Event],
      CASE 
		WHEN [Medal] = 'NA' THEN 'Not Registered' ELSE [Medal]
	  END AS Medal -- Replacing N/A with Not Registered 
  FROM 
	[olympic_games].[dbo].[athletes_event_results]
  WHERE
	 RIGHT([Games], CHARINDEX(' ', REVERSE(Games))-1) = 'Summer' --Filtering Season to Summer only
