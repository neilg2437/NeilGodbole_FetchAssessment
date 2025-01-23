# NeilGodbole_FetchAssessment

Question 1)
  To begin this project, I first used VSCODE to look at the three unzipped JSON files, to get a preliminary feel for the data. I then used a python script to convert the three files into CSV format. I decided to split the receipt items column into a separate file/table from the receipt file using python as well. To analyze the data, and to understand the schema I uploaded the files as tables into Azure Data Studio, and used T-SQL for all of my queries. 

  I created the schema diagram attached as Q1Diagram using dbdiagram after I identified the primary keys for each table and any foreign keys present. The diagram of the data model shows each table with their primary keys, as well as the connections between tables via their foregin keys. The diagram was helpful to visualize the structure of the data, and for the queries in the next part.


Question 2)
  I chose to answer the questions given in bullets 3 and 4 first. I believe I was able to answer both questions in a single query. The output ofthis query is a table that shows the average spend and total number of items purchased for receipts that have statuses of Rejected, and Finished (there was no status of Accepted as asked for in the question, so I made the assumption that the Finished status was the same thing). 

  I decide to also try and answer the questions in bullets 5 and 6. As these questions asked for information among users created in the last six months, I determined the latest user creation date to be 2021-02-12. I then used the range of 2020-08-12 to 2021-02-12 for these questions. The queries output tables which show the top 5 brands and their brand codes along with their total spend and transaction count metrics. Because the brand table had missing information (which I will expand upon in the next part), the top brand for both questions is unknown, with the brand name and brand code being unknown. I decided to show the top five brand to provide some useful information.

  Question 3)
    To evaluate the data quality of the given files, I chose to use python. I created a script that checks for missing values, duplicate rows, as well as any potential invalid values in the barcodes. All four of the tables have missing values, which I believe has had a large impact on this analysis. The brands table has multiple missing values in category, catgegory code, and the brandcode column, making any analysis arounds trends in brands much harder to identify. Brandcode also has 271 duplicates, which will lead to inaccurate analysis. All other tables have missing values as well, some in critical columns like finalPrice and itemPrice, which will impact any kind of analysis on transactional questions. I believe the biggest gaps in this dataset are due to these missing and duplicate values.

Question 4)
Subject: Key Insights and Next Steps on Data Quality

Hello,

I hope this email finds you well! As part of my work on analyzing our datasets, I’ve identified a few key challenges related to data quality that could impact our ability to derive accurate insights. I’ve summarized the findings  below, along with some questions I am hoping you can help shed some light on.

What I Found
Missing Data:

Certain important details, like product categories and spend amounts, are missing in parts of the dataset. In addition, the brand dataset has multiple missing values in key columns such as brand name and brand code. This limits our ability to fully understand trends in spending and customer behavior, as we cannot identify specific brands. 

Duplicate Entries:

Some records, such as user or product identifiers, are repeated. This could skew results when we’re looking at totals like overall spending or the number of transactions.

Questions:
Is there a plan for handling missing or placeholder values, like “Unknown Brand” or “ITEM NOT FOUND”?
Are there specific fields or metrics (like spending trends or user behavior) that are most important to focus on?
Can missing fields like itemPrice or finalPrice be backfilled?
How exactly is the data being collected? I am wondering if there might be some filtering applied or mismatches in the data structure we are expecting that is causing us to lose values. 

Next steps:
It would be very helpful if we were able to meet soon to discuss my findings and the questions above. Specifically, more context on how the data is collected and structured will help us understand the root cause of some of these issues. Also, feedback on what areas of the data are most critical for our needs will allow us to prioritize our cleanup efforts. 

As far as our data model's performance, because we are frequently joining across all of our tables, this may slow things down as we continue to collect more data and scale increases. I think making sure some of our more frequently used columns are properly indexed will allow us to optimize our queries. Cleaning up our data quality issues should improve our overall performance as well!

Please let me know when you are available. Thanks so much!

Best regards,
Neil Godbole







