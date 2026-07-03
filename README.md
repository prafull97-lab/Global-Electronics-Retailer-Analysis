Global Electronics Retailer | Sales & Performance Analysis | SQL + Power BI

Project Overview:

This project analyzes sales data for a global electronics retailer operating across 8 countries to identify revenue drivers, customer behavior, product profitability and operational efficiency.
The core business question driving this project is:

"What factors drive revenue growth, which products and markets are most profitable, and where should the business focus to maximize performance?"


Tools Used:

MySQL - Data cleaning, profiling and analysis
Power BI - Interactive dashboard and data visualization
Microsoft Excel - Data cleaning and preparation


Dataset:

Source: Maven Analytics - Global Electronics Retailer
Tables: Sales, Products, Customers, Stores, Exchange Rates
Key Features: Multi-currency transactions, global store network, customer demographics


Data Cleaning:

Before analysis, all five source files were cleaned in Excel and verified in MySQL:

1. Removed currency symbols from price and cost columns
2. Standardized inconsistent date formats across sales records
3. Verified referential integrity across all five tables
4. Confirmed no NULL values or duplicate records in key columns
5. Validated UnitPriceUSD against UnitCostUSD to identify and correct pricing errors


Project Workflow:

Section 1 - Sales Performance (Q1 to Q5)
Analyzed overall revenue trends, category and brand performance across the full dataset period.

Key Findings:

1. Revenue grew 167% from $6.85M in 2016 to $18.31M in 2019 before COVID-19 impact
2. Computers dominate revenue at $19.1M - nearly double second place Home Appliances
3. Adventure Works leads all brands at $11.7M with the strongest profit per unit ratio
4. Fabrikam and Proseware are hidden efficiency brands - strong margins despite moderate volume


Section 2 - Product Performance (Q6 to Q9)
Identified top performing products by revenue, quantity and profit across all categories.

Key Findings:

1. WWI Desktop PC2.33 X2330 Black leads in revenue, quantity and profit simultaneously - the ideal product profile
2. All top 5 revenue and profit products are Desktop PCs - confirming category concentration
3. TV and Video category top product Adventure Works 52" LCD HDTV generates $381,072 - strongest non-computer product
4. Games and Toys top product generates only $45,199 - 11x below the top Computer product


Section 3 - Customer Analysis (Q10 to Q15)
Analyzed customer value, geographic distribution and revenue per customer across all markets.

Key Findings:

1. Matthew Flemming is the highest value customer at $61,872 - significantly ahead of second place
2. 4,149 customers generate above average revenue - the priority retention segment
3. United States dominates with 6,828 customers generating $29.9M - nearly 5x second place Canada
4. Gender split is virtually equal - Male 51% vs Female 49% - not a meaningful segmentation variable
5. France and Netherlands have the lowest revenue per customer at $3,052 and $3,241 respectively - underperforming markets


Section 4 - Store Performance (Q16 to Q19)
Evaluated store revenue across countries, size bands and opening eras.

Key Findings:

1. Online store is the single highest revenue channel at $11.4M - more than 6x the best physical store
2. Canadian physical stores outperform US stores despite the US having 4x more customers
3. Store size has minimal impact on revenue - only $27 difference between largest and smallest bands
4. Expansion Era stores opened 2013-2016 generate the highest average revenue at $924 per transaction


Section 5 - Operational Analysis (Q20 to Q23)
Measured delivery performance across countries and over time.

Key Findings:

1. Average delivery time is 4.53 days across the portfolio
2. Delivery performance improved 47% from 7.31 days in 2016 to 3.90 days in 2021
3. Italy and Canada are the slowest markets at 4.77 and 4.70 days respectively
4. 49,719 orders have no recorded delivery date - a significant operational visibility gap


Section 6 - Advanced Business Analysis (Q24 to Q30)
Conducted strategic analysis on profitability, expansion opportunities and product portfolio optimization.

Key Findings:

1. Every category maintains 54-61% profit margin - remarkably consistent portfolio efficiency
2. Proseware leads all brands in profit margin at 60.30% despite ranking 6th in revenue
3. Canada and Australia are the highest priority expansion markets at $5,273 and $4,846 revenue per customer
4. SV USB Cable products generate less than $0.95 profit per unit - clear discontinuation candidates
5. Computers drove 377% revenue growth from 2016 to 2019 - the primary growth engine of the business


Power BI Dashboard:

The interactive dashboard is organized across three pages:

1. Sales Performance: Revenue trends, category and brand analysis, geographic distribution
2. Customer Analysis: Customer value, gender split, revenue per customer by country 
3. Product Store Performance: Top products, store size analysis, delivery trends

Key Business Recommendations:

1. Protect and prioritize the Desktop PC product line - it drives revenue, volume and profit simultaneously
2. Invest in Proseware and Fabrikam inventory - highest margin brands with room to grow
3. Prioritize Canada and Australia for expansion - highest revenue per customer with room to grow customer base
4. Conduct strategic review of France and Netherlands - lowest revenue per customer across all markets
5. Discontinue SV USB Cable product line - less than $1 profit per unit with negligible volume
6. Address the 49,719 pending delivery records - critical operational visibility gap
7. Replicate Expansion Era store selection strategy for any future physical store openings


About This Project:
This project was built as part of my data analytics portfolio to demonstrate end-to-end analytical capabilities including data cleaning, multi-table SQL analysis across five related tables and Power BI dashboard development. The analysis covers sales performance, customer behavior, product profitability and operational efficiency across a global retail operation spanning 8 countries.


