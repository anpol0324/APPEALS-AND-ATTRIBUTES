SELECT 
    gs.[GiftSplitId],
    gs.[GiftId] AS GiftSplist_Gift,
    gs.[AppealID] AS GiftSplitAppeal,
    a. START_DATE,
    a. APPEAL_ID,
    a.[DESCRIPTION] AS AppealDescription,
    gs.[CampaignId] AS GiftSplitCampaign,
    c. START_DATE,
    c. CAMPAIGN_ID,
    c.[DESCRIPTION] AS CampaignDescription
   
FROM 
    [dbo].[GiftSplit] AS gs
LEFT JOIN 
    [dbo].[APPEAL] AS a ON a.[ID] = gs.[AppealID]
LEFT JOIN 
    [dbo].[CAMPAIGN] AS c ON c.[ID] = gs.[CampaignId]
WHERE 
    gs.[AppealID] IS NOT NULL 

ORDER BY 
    gs.[GiftId];