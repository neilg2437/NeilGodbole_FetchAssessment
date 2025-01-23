-- Select users created between October 2020 and March 2021
WITH RecentUsers AS (
    SELECT 
        id_oid AS user_id
    FROM users
    WHERE FORMAT(DATEADD(SECOND, createdDate_date / 1000, '1970-01-01'), 'yyyy-MM') 
          BETWEEN '2020-10' AND '2021-03'
),

-- Get receipts for the selected users
UserReceipts AS (
    SELECT 
        r.id_oid AS receipt_id,
        r.userId AS user_id,
        r.totalSpent
    FROM receipts r
    JOIN RecentUsers u ON r.userId = u.user_id
),

/*
   Calculate total spend for each brand by joining receipt items with
   user receipts and linking brand information. If a brand is not found, 
   it's labeled as 'Unknown Brand'.
*/
BrandSpend AS (
    SELECT 
        ri.brandCode,
        COALESCE(b.name, 'Unknown Brand') AS brand_name,
        SUM(ur.totalSpent) AS total_spend
    FROM receipt_items ri
    JOIN UserReceipts ur ON ri.ReceiptID = ur.receipt_id
    LEFT JOIN brands b ON ri.brandCode = b.brandCode
    GROUP BY ri.brandCode, b.name
)

-- Select the top 5 brands by total spend
SELECT TOP 5 
    brand_name,
    brandCode,
    total_spend
FROM BrandSpend
ORDER BY total_spend DESC;
