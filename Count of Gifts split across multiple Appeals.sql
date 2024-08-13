WITH GiftSplitCounts AS (
    SELECT 
        gs.GiftId, 
        COUNT(DISTINCT gs.AppealID) AS RecordCount
    FROM 
        [dbo].[GiftSplit] AS gs
    WHERE 
        gs.AppealId IS NOT NULL AND gs.AppealId != ''
    GROUP BY 
        gs.GiftId
    HAVING 
        COUNT(DISTINCT gs.AppealID) > 1
)
SELECT 
    gs.GiftId, 
    gs.Amount AS Gift_Amount,
    g.DATEADDED AS Gift_Date_Added,
    gsc.RecordCount AS GiftSplit_Record_Count,
    gs.GiftSplitId,
    gs.AppealID AS GiftSplit_AppealID, 
    a.DESCRIPTION AS AppealDescription, 
    gs.CampaignId AS GiftSplit_CampaignID,
    c.[DESCRIPTION] AS CampaignDescription, 
    gs.FundId AS GiftSplit_FunID, 
    f. [DESCRIPTION] AS FundDescription

FROM 
    [dbo].[GiftSplit] AS gs
LEFT JOIN 
       [dbo].[GIFT] AS g ON g.ID = gs.GiftId
LEFT JOIN 
    [dbo].[APPEAL] AS a ON a.ID = gs.AppealID
LEFT JOIN
       [dbo].[CAMPAIGN] AS c ON c.ID = gs.CampaignId
LEFT JOIN 
       [dbo].[FUND] AS f ON f.ID = gs.FundId
INNER JOIN 
    GiftSplitCounts AS gsc ON gsc.GiftId = gs.GiftId
ORDER BY 
    gsc.RecordCount DESC, 
    gs.GiftId, 
    gs.GiftSplitId;