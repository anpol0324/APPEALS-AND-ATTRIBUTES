SELECT
    COUNT(gs.[GiftId]) AS NumberOfGifts,
    a.[DESCRIPTION] AS AppealDescription,
    a.[CAMPAIGN_ID] AS AppealCampaign, 
    c.[DESCRIPTION] AS CampaignDescription, 
    a.[DEFAULT_FUND],
    f.[Fund_ID],
    f.[DESCRIPTION] AS FundDescription
FROM
    [dbo].[GiftSplit] AS gs
LEFT JOIN
    [dbo].[APPEAL] AS a ON a.[ID] = gs.[AppealID]
LEFT JOIN
    [dbo]. [CAMPAIGN] AS c ON c.[ID] = a.[CAMPAIGN_ID]
LEFT JOIN 
    [dbo].[FUND] AS f ON f.[ID] = a.[DEFAULT_FUND]
GROUP BY 
    a.[DESCRIPTION],
    a.[DEFAULT_FUND],
    a.[CAMPAIGN_ID],
    c.[DESCRIPTION],
    f.[Fund_ID],
    f.[DESCRIPTION]
ORDER BY
    a.[DESCRIPTION];