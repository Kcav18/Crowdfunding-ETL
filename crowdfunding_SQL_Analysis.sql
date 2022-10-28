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
