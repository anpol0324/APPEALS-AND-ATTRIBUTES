
SELECT 
    gs.[GiftSplitId],
    gs.[GiftId],
    gs.[CampaignId],
    c. START_DATE,
    c.[CAMPAIGN_ID],
    c.[DESCRIPTION] AS CampaignDescription,
    gs.[AppealID],
    a. START_DATE,
    a. APPEAL_ID,
    a.[DESCRIPTION] AS AppealDescription,
    gs.[FundId],
    f.[FUND_ID],
    f.[DESCRIPTION] AS FundDescription
FROM 
    [dbo].[GiftSplit] AS gs
LEFT JOIN 
    [dbo].[APPEAL] AS a ON a.[ID] = gs.[AppealID]
LEFT JOIN 
    [dbo].[CAMPAIGN] AS c ON c.[ID] = gs.[CampaignId]
LEFT JOIN 
    [dbo].[FUND] AS f ON f.[ID] = gs.[FundId]
WHERE 
    gs.[AppealID] IS NOT NULL
    AND gs.[CampaignId] IS NOT NULL
    AND gs.[FundId] IS NOT NULL
ORDER BY 
    gs.[GiftId];