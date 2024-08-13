SELECT
p. id AS PackageRecordId, 
p. [DESCRIPTION] AS PackageName,  
p.PackageCategoryID,
te.LONGDESCRIPTION AS PackageCategoryDesc, 
p. APPEAL_ID, 
a. [DESCRIPTION] AS AppealDesc,
p. DATE_LAST_CHANGED, 
p. GOAL, 
p. NOTES, 
p. NO_SOLICITED, 
te2.[LONGDESCRIPTION] AS NoSolicitedDesc,
p. START_DATE, 
p. END_DATE,
p. INACTIVE, 
p. DATEADDED, 
p. IMPORT_ID

FROM 
    [dbo].Package AS p
LEFT JOIN 
    [dbo].[TABLEENTRIES] AS te 
ON 
    te.[TABLEENTRIESID] = p.[PackageCategoryID]
LEFT JOIN
    [dbo].APPEAL AS a 
ON
    a.ID = p.APPEAL_ID
LEFT JOIN 
    [dbo].[TABLEENTRIES] AS te2
ON 
    te2.[TABLEENTRIESID] = p.[NO_SOLICITED]

--WHERE
  --p.Package_ID NOT LIKE '%table%'
  --AND p.Package_ID NOT LIKE '%sponsor%'
  --AND p.Package_ID NOT LIKE '%ticket%'
  --AND p.Package_ID NOT LIKE '%donation%'
  --AND p.Package_ID NOT LIKE '%grant%' 

ORDER BY
    p.Package_ID

--WHERE
    --p.PackageCategoryID IS NOT NULL


