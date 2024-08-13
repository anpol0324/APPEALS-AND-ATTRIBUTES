SELECT
    f.[FUND_ID],
    f.[FUND_CATEGORY],
    f.[INACTIVE],
    f.[RESTRICTED_FLAG],
    te.[LONGDESCRIPTION] AS FundCategoryDescription,
    f.[FUNDTYPE],
    te2.[LONGDESCRIPTION] AS FundTypeDescription
FROM 
    [dbo].[FUND] AS f  
LEFT JOIN 
    [dbo].[TABLEENTRIES] AS te 
ON 
    te.[TABLEENTRIESID] = f.[FUND_CATEGORY]
LEFT JOIN 
    [dbo].[TABLEENTRIES] AS te2 
ON 
    te2.[TABLEENTRIESID] = f.[FUNDTYPE]
ORDER BY   
    te.[LONGDESCRIPTION] DESC;