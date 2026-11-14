WITH sum_donations AS (
SELECT assignment_id, donor_type, ROUND(SUM(amount), 2) AS rounded_total_donation_amount
FROM assignments
INNER JOIN  donations
USING (assignment_id)
INNER JOIN donors
USING (donor_id)
GROUP BY assignment_id, donor_type
)	
SELECT assignment_name, region, donor_type, rounded_total_donation_amount
FROM sum_donations
INNER JOIN assignments
USING(assignment_id)
ORDER BY rounded_total_donation_amount DESC
LIMIT 5;

WITH count_donations AS (
SELECT assignment_id, COUNT(donation_id) AS num_total_donations
FROM assignments
INNER JOIN donations
USING(assignment_id)
GROUP BY assignment_id
),

ranking AS(
SELECT assignment_id, assignment_name, region, impact_score, ROW_NUMBER()OVER(PARTITION BY region ORDER BY impact_score DESC) AS impact_score_rank
FROM assignments
)	

SELECT assignment_name, region, impact_score, num_total_donations
FROM count_donations
INNER JOIN ranking
USING(assignment_id)
WHERE impact_score_rank = 1
ORDER BY region;
