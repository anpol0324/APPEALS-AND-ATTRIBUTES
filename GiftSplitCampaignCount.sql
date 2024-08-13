SELECT
    COUNT(gs.[GiftId]) AS NumberOfGifts,
    c.[DESCRIPTION] AS CampaignDescription,
    c.[DEFAULT_APPEAL] AS CampaignDefaultAppeal, 
    a.[DESCRIPTION] AS DefaultAppealDescription, 
    c.[DEFAULT_FUND],
    f.[Fund_ID],
    f.[DESCRIPTION] AS FundDescription,
    gs.[AppealID] AS GiftSplitAppeal
FROM
    [dbo].[GiftSplit] AS gs
LEFT JOIN
    [dbo].[CAMPAIGN] AS c ON c.[ID] = gs.[CampaignId]
LEFT JOIN
    [dbo].[APPEAL] AS a ON a.[ID] = c.[DEFAULT_APPEAL]
LEFT JOIN 
    [dbo].[FUND] AS f ON f.[ID] = c.[DEFAULT_FUND]
GROUP BY 
    c.[DESCRIPTION],
    c.[DEFAULT_FUND],
    c.[DEFAULT_APPEAL],
    a.[DESCRIPTION],
    f.[Fund_ID],
    f.[DESCRIPTION],
    gs.[AppealID]
ORDER BY
    c.[DESCRIPTION];