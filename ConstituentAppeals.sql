SELECT 
    ca.APPEAL_ID, 
    a.[DESCRIPTION] AS AppealName, 
    ca.CONSTIT_ID, 
    ca.DTE, 
    ca.PackageID, 
    p.[DESCRIPTION] AS PackageName, 
    ca. COMMENTS,
    ca. [SEQUENCE]
FROM 
    [dbo].[CONSTITUENT_APPEALS] AS ca 
LEFT JOIN 
    [dbo].[APPEAL] AS a ON a.ID = ca.APPEAL_ID
LEFT JOIN
    [dbo].[Package] AS p ON p.ID = ca.PackageID

--WHERE
   -- ca.COMMENTS IS NOT NULL

ORDER BY
    p.[DESCRIPTION] DESC;