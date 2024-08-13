SELECT 
    gs.[GiftSplitId],
    gs.[GiftId] AS GiftSplit_Gift,
    gs.[CampaignId] AS GiftSplitCampaign,
    c.[START_DATE] AS CampaignStartDate,
    c.[CAMPAIGN_ID],
    c.[DESCRIPTION] AS CampaignDescription,
    gs.[AppealID] AS GiftSplitAppeal,
    a.[START_DATE] AS AppealStartDate,
    a.[APPEAL_ID],
    a.[DESCRIPTION] AS AppealDescription
FROM 
    [dbo].[GiftSplit] AS gs
LEFT JOIN 
    [dbo].[APPEAL] AS a ON a.[ID] = gs.[AppealID]
LEFT JOIN 
    [dbo].[CAMPAIGN] AS c ON c.[ID] = gs.[CampaignId]
WHERE 
    gs.[CampaignId] IS NOT NULL 
    AND gs.[AppealId] IS NULL
ORDER BY 
    gs.[GiftId];