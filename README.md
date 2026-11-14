<h1>GoodThought NGO: SQL Analysis</h1>

## Overview

GoodThought is a nonprofit working in education, healthcare, and sustainable development. This project analyzes its PostgreSQL database of assignments, donations, and donors (2010-2023) to see how funding is distributed and where the highest-impact work is happening, so resources can be directed more effectively.

## Data

Three linked tables (assignments, donations, donors),  5,000 rows each:
<ul>
<li>assignments: assignment_id, assignment_name, start_date, end_date, budget, region, impact_score</li>

<li>donations: donation_id, donor_id, amount, donation_date, assignment_id</li>

<li>donors: donor_id, donor_name, donor_type </li>
</ul>



## Relationships

donors (donor_id) ──< donations >── (assignment_id) assignments
## Business Questions
<ol>
<li>Which assignments received the most donation money, and which donor types funded them?</li>
<li>What is the highest-impact assignment in each region, and how many donations did it receive?</li>
</ol>

## SQL Skills Demonstrated
<ul>
<li>Multi-table INNER JOIN with USING</li>
<li>Common table expressions (CTEs)</li>
<li>Aggregation with SUM, COUNT, and ROUND</li>
<li>Window functions: ROW_NUMBER() OVER (PARTITION BY ...)</li>
<li>Sorting and limiting results</li>
</ul>

## Data Notes
<ul>
<li>Some assignments have negative budget values, which should be cleaned or flagged before budget analysis.</li>
<li>Not every assignment has donations, so inner joins to donations exclude those assignments.</li>
</ul>

## Tools

PostgreSQL

## Repository Structure
<p>├── data/</p>
<p>│   ├── assignments.csv</p>
<p>│   ├── donations.csv</p>
<p>│   └── donors.csv</p>
<p>├── queries/</p>
<p>│   └── analysis.sql</p>
<p>└── README.md</p>
