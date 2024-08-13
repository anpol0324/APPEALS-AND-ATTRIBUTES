SELECT GiftId, 
       COUNT(*) as RecordCount,
       MIN(AppealID) as ExampleAppealID, 
       MIN(CampaignID) as ExampleCampaignID,
       MIN(FundID) as ExampleFundID
FROM GiftSplit
WHERE FundID IS NOT NULL AND FundID != ''
GROUP BY GiftId
HAVING COUNT(*) > 1 AND COUNT(DISTINCT FundID) > 1
ORDER BY GiftId;