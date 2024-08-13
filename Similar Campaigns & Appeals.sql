SELECT 
    t1.[ID] AS Campaign_ID,
    t1.[DESCRIPTION] AS Campaign_Description,
    t2.[ID] AS Appeal_ID,
    t2.[DESCRIPTION] AS Appeal_Description
   -- t3.[ID] AS Fund_ID, 
   -- t3.[DESCRIPTION] AS Fund_Description
FROM 
    [dbo].[CAMPAIGN] AS t1
JOIN 
    [dbo].[APPEAL] AS t2
ON 
    t2.[DESCRIPTION] LIKE '%' + t1.[DESCRIPTION] + '%'
    OR t1.[DESCRIPTION] LIKE '%' + t2.[DESCRIPTION] + '%'

--JOIN 
    --[dbo].[FUND] AS t3
--ON 
    --t3.[DESCRIPTION] LIKE '%' + t2.[DESCRIPTION] + '%'
ORDER BY 
    t2.[DESCRIPTION];