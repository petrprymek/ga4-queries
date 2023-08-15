SELECT
  geo.country,
  SUM(ecommerce.purchase_revenue_in_usd) as purchase_revenue,
  ROUND((SUM(ecommerce.purchase_revenue_in_usd) / SUM(SUM(ecommerce.purchase_revenue_in_usd)) OVER ()) * 100, 4) AS revenue_percentage
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE
  event_name = 'purchase' AND
  _TABLE_SUFFIX BETWEEN '20201101'AND '20211101'
GROUP BY 1
ORDER BY 2 DESC
  
------------------------------------
  
SELECT
device.category,
COUNT(DISTINCT ecommerce.transaction_id),
COUNT(DISTINCT user_pseudo_id) as pseudo,
ROUND(COUNT(DISTINCT ecommerce.transaction_id)/COUNT(DISTINCT user_pseudo_id)*100,4) as CRV
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE
  _table_suffix BETWEEN '20210101' AND '20210630'
GROUP BY 1
