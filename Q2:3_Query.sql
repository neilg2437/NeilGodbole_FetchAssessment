-- Select rewardsReceiptStatus, average totalSpent, and total purchasedItemCount
SELECT 
    rewardsReceiptStatus, 
    AVG(totalSpent) AS avg_spent, 
    SUM(purchasedItemCount) AS total_items 
FROM receipts
-- Filter for receipts with a status of 'FINISHED' or 'REJECTED'
WHERE rewardsReceiptStatus IN ('FINISHED', 'REJECTED')
-- Group the results by receipt status 
GROUP BY rewardsReceiptStatus;



