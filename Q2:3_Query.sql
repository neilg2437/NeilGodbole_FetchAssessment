
SELECT 
    rewardsReceiptStatus,
    AVG(totalSpent) AS avg_spent,
    SUM(purchasedItemCount) AS total_items
FROM receipts
WHERE rewardsReceiptStatus IN ('FINISHED', 'REJECTED')
GROUP BY rewardsReceiptStatus;



