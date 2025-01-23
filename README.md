# NeilGodbole_FetchAssessment

Question 1)
  To begin this project, I first used VSCODE to look at the three unzipped JSON files, to get a preliminary feel for the data. I then used a python script to convert the three files into CSV format. I decided to split the receipt items column into a separate file/table from the receipt file using python as well. To analyze the data, and to understand the schema I uploaded the files as tables into Azure Data Studio, and used T-SQL for all of my queries. 

  I created the schema diagram attached as Q1Diagram using dbdiagram after I identified the primary keys for each table and any foreign keys present. The diagram of the data model shows each table with their primary keys, as well as the connections between tables via their foregin keys. The diagram was helpful to visualize the structure of the data, and for the queries in the next part.


Question 2)
  I chose to answer the questions given in bullets 3 and 4 first. I believe I was able to answer both questions in a single query. The output ofthis query is a table that shows the average spend and total number of items purchased for receipts that have statuses of Rejected, and Finished (there was no status of Accepted as asked for in the question, so I made the assumption that the Finished status was the same thing). 

  I decide to also try and answer the questions in bullets 5 and 6. For these questions, the queries output tables which show the top 5 brands and their brand codes along with their total spend and transaction count metrics. The question asked for the single hghest brand in spend and transactions 
