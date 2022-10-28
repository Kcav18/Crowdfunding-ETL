# Crowdfunding-ETL
Independent Funding has just received a new dataset that contains information about the backers who’ve pledged to the live projects. And, the company wanted me and Britta to perform both an ETL process on this dataset and a data analysis by using SQL queries.

This new analysis consists of four technical analysis deliverables outlined below.

**Deliverable 1: Extract Data**

**Deliverable 2: Transform and Clean Data**

*Deliverable 1 and 2 code can be found here: [Extract-Transform_final_code](Extract-Transform_final_code.ipynb)*


**Deliverable 3: Create an ERD and Table Schema, and Load Data***

*See ERD for Deliverable 3 below:*

![Crowdfunding ERD](https://github.com/Kcav18/Crowdfunding-ETL/blob/main/crowdfunding_db_relationships.png)

**Deliverable 4: SQL Analysis**

*See code from SQL Analysis below:*

```
-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

SELECT cf_id,
backers_count
FROM campaign
Where outcome = 'live'
ORDER BY backers_count DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT 
	DISTINCT(backers.cf_id), 
	campaign.backers_count
FROM backers
INNER JOIN campaign ON campaign.cf_id = backers.cf_id
WHERE campaign.outcome = 'live'
ORDER by backers_count DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
select  
	contacts.first_name,
	contacts.last_name,
	contacts.email,
	(campaign.goal - campaign.pledged) AS Remaining_goal_amount
INTO email_contacts_remaining_goal_amount
from campaign
INNER JOIN contacts
ON contacts.contact_id = campaign.contact_id
WHERE campaign.outcome = 'live'
ORDER by Remaining_goal_amount DESC;

-- Check the table
select * from email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

-- ******THE CODE BELOW MATCHES THE MODULE CHALLENGE IMAGE ***********

SELECT 
	backers.email,
	backers.first_name,
	backers.last_name,
	campaign.cf_id,
	campaign.company_name,
	campaign.description,
	campaign.end_date,
	(campaign.goal - campaign.pledged) AS "Left Of Goal"
INTO email_backers_remaining_goal_amount
FROM backers 
JOIN campaign
ON campaign.cf_id = backers.cf_id 
INNER Join contacts
ON contacts.contact_id = campaign.contact_id
ORDER BY backers.last_name , backers.first_name;
-- Check the table

SELECT * FROM email_backers_remaining_goal_amount

-- ******THE CODE BELOW SORTS THE EMAIL IN DESCENDING ORDER LIKE THE CHALLENGE INSTRUCTIONS SAID BUT DOESNT MATCH THE IMAGE PROVIDED...SO I DID BOTH. ***********

SELECT 
	backers.email,
	backers.first_name,
	backers.last_name,
	campaign.cf_id,
	campaign.company_name,
	campaign.description,
	campaign.end_date,
	(campaign.goal - campaign.pledged) AS "Left Of Goal"
INTO email_backers_remaining_goal_amountV2
FROM backers 
JOIN campaign
ON campaign.cf_id = backers.cf_id 
INNER Join contacts
ON contacts.contact_id = campaign.contact_id
ORDER by backers.email DESC;
-- Check the table

SELECT * FROM email_backers_remaining_goal_amountV2

```
Quick Access to all required files for this analysis:

- [The Extract-Transform_final_code.ipynb file](Extract-Transform_final_code.ipynb)

- [All five CSV files, including the backers.csv file in the Resources Folder](https://github.com/Kcav18/Crowdfunding-ETL/tree/main/Resources)

- [The ERD logical diagram, which includes the backers table saved as crowdfunding_db_relationships](https://github.com/Kcav18/Crowdfunding-ETL/blob/main/crowdfunding_db_relationships.png)

- [The database schema, which includes the backers table saved as crowdfunding_db_schema.sql](https://github.com/Kcav18/Crowdfunding-ETL/blob/main/crowdfunding_db_schema.sql)

- [The bonus SQL queries, saved as crowdfunding_SQL_Analysis.sql](https://github.com/Kcav18/Crowdfunding-ETL/blob/main/crowdfunding_SQL_Analysis.sql)

- [The email_contacts_remaining_goal_amount table, saved as email_contacts_remaining_goal_amount.csv](https://github.com/Kcav18/Crowdfunding-ETL/blob/main/Resources/email_contacts_remaining_goal_amount.csv)

- [The email_backers_remaining_goal_amount table, saved as email_backers_remaining_goal_amount.csv](https://github.com/Kcav18/Crowdfunding-ETL/blob/main/Resources/email_backers_remaining_goal_amount.csv)

