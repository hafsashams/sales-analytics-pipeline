-- RFM Customer Segmentation
-- Segments: Champion, Loyal, High Value, At Risk, Regular
-- Finding: 1,369 At Risk customers representing recoverable revenue

WITH rfm_base AS (
  SELECT
    customer_id,
    MAX(invoice_date) AS last_purchase,
    COUNT(DISTINCT invoice) AS frequency,
    ROUND(SUM(revenue), 2) AS monetary
  FROM `cogent-summer-423400-u4.sales_analytics.raw_sales`
  WHERE customer_id IS NOT NULL AND customer_id != 0
  GROUP BY customer_id
),
max_date AS (
  SELECT DATE(MAX(invoice_date)) AS ref_date
  FROM `cogent-summer-423400-u4.sales_analytics.raw_sales`
),
rfm_scored AS (
  SELECT
    r.customer_id,
    DATE_DIFF(m.ref_date, DATE(r.last_purchase), DAY) AS recency_days,
    r.frequency,
    r.monetary,
    NTILE(5) OVER (ORDER BY DATE_DIFF(m.ref_date, DATE(r.last_purchase), DAY) DESC) AS r_score,
    NTILE(5) OVER (ORDER BY r.frequency DESC) AS f_score,
    NTILE(5) OVER (ORDER BY r.monetary DESC) AS m_score
  FROM rfm_base r, max_date m
)
SELECT
  customer_id,
  recency_days,
  frequency,
  monetary,
  r_score,
  f_score,
  m_score,
  CASE
    WHEN r_score >= 4 AND f_score >= 4 THEN 'Champion'
    WHEN r_score >= 3 AND f_score >= 3 THEN 'Loyal'
    WHEN r_score >= 4 AND f_score < 3 THEN 'High Value'
    WHEN r_score <= 2 AND f_score >= 3 THEN 'At Risk'
    ELSE 'Regular'
  END AS segment
FROM rfm_scored
ORDER BY monetary DESC;
