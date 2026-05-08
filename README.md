# Sales Analytics Pipeline

End-to-end analytics project built on a modern cloud stack: BigQuery, dbt, and Looker Studio.

## Business Question
A retail company operates across 37 countries. Where is revenue concentrated, which customers are at risk of churning, and what does the customer base look like by value segment?

## Dataset
- **Source:** UCI Online Retail Dataset via Kaggle
- **Size:** 406,295 transactions across 37 countries
- **Period:** December 2009 – December 2011

## Stack
| Layer | Tool |
|-------|------|
| Cloud Warehouse | Google BigQuery |
| Transformation | dbt Core (Week 2) |
| Visualisation | Looker Studio (Week 3) |
| Version Control | Git / GitHub |
| Language | SQL, Python (Pandas) |

## Key Findings

### 1. Revenue is dangerously concentrated
The United Kingdom accounts for £7.35M — 84% of total revenue. The next largest market (EIRE) generates £334K. This represents significant single-market risk.

### 2. 1,369 customers are At Risk
RFM segmentation across 4,285 customers identified 1,369 At Risk customers — the largest segment — who have not purchased in an average of 198 days. These represent recoverable revenue through targeted retention campaigns.

### 3. High Value customers drive outsized revenue
1,068 High Value customers average £5,334 in spend — 10x the At Risk segment average of £493. Protecting this segment is the highest-priority retention action.

## Customer Segments (RFM)
| Segment | Customers | Avg Spend | Avg Recency (days) |
|---------|-----------|-----------|-------------------|
| At Risk | 1,369 | £493 | 198 |
| High Value | 1,068 | £5,335 | 13 |
| Loyal | 814 | £738 | 40 |
| Regular | 646 | £2,345 | 92 |
| Champion | 388 | £479 | 18 |

## Repo Structure
sales-analytics-pipeline/
└── sql/
├── revenue_by_country.sql   # Revenue concentration analysis
└── rfm_segmentation.sql     # RFM customer segmentation

## Author
Hafsa Sahito · (https://www.linkedin.com/in/hafsa-sahito)
