-- Find out how much Wholesale net revenue each product_line generated per month per warehouse in the dataset.
select product_line,
	case when extract(month from date) = 06 then 'june'
		 when extract(month from date) = 07 then 'July'
		 when extract(month from date) = 08 then 'August'
		 end as month,
		 warehouse,
		 sum(total) - sum(payment_fee) as net_revenue
from sales
where client_type = 'Wholesale'
group by product_line, month, warehouse 
order by product_line, month, net_revenue