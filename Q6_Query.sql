--  Filter users created within the specified date range
WITH RecentUsers AS (
    SELECT 
        id_oid AS user_id
    FROM users
    WHERE DATEADD(SECOND, createdDate_date / 1000, '1970-01-01') 
          BETWEEN '2020-08-12' AND '2021-02-12'
),

-- Get receipts for selected users
UserReceipts AS (
    SELECT 
        r.id_oid AS receipt_id, 
        r.userId AS user_id 
    FROM receipts r
    JOIN RecentUsers u ON r.userId = u.user_id 
),

-- Step 3: Calculate the number of transactions for each brand
BrandTransactions AS (
    SELECT 
        ri.brandCode, 
        COALESCE(b.name, 'Unknown Brand') AS brand_name, -- Brand name or 'Unknown Brand' if not matched
        COUNT(ur.receipt_id) AS transaction_count 
    FROM receipt_items ri
    JOIN UserReceipts ur ON ri.ReceiptID = ur.receipt_id 
    LEFT JOIN brands b ON ri.brandCode = b.brandCode 
    GROUP BY ri.brandCode, b.name 
)

--  Select top 5 brands by transaction count
SELECT TOP 5 
    brand_name, -- Name of the brand
    brandCode, -- Brand code
    transaction_count -- Total number of transactions for the brand
FROM BrandTransactions
ORDER BY transaction_count DESC; 
