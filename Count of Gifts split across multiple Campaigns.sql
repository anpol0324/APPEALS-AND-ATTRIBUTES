SELECT GiftId, 
       COUNT(*) as RecordCount,
       MIN(AppealID) as ExampleAppealID, 
       MIN(CampaignID) as ExampleCampaignID,
       MIN(FundID) as ExampleFundID
FROM GiftSplit
WHERE CampaignId IS NOT NULL AND CampaignId != ''
GROUP BY GiftId
HAVING COUNT(*) > 1 AND COUNT(DISTINCT CampaignId) > 1
ORDER BY GiftId;