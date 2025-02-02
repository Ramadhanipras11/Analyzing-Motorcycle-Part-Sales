# Analyzing-Motorcycle-Part-Sales
![Image](https://github.com/user-attachments/assets/9a95c3d8-c898-4f00-ab96-07bce05b82fa)

## Introduction
You're working for a company that sells motorcycle parts, and they've asked for some help in analyzing their sales data!

They operate three warehouses in the area, selling both retail and wholesale. They offer a variety of parts and accept credit cards, cash, and bank transfer as payment methods. However, each payment type incurs a different fee.

The board of directors wants to gain a better understanding of wholesale revenue by product line, and how this varies month-to-month and across warehouses. You have been tasked with calculating net revenue for each product line and grouping results by month and warehouse. The results should be filtered so that only "Wholesale" orders are included.

## Data
<img src="https://github.com/user-attachments/assets/b9bcdcca-715f-4599-861c-a323d5054df1" alt="Deskripsi Gambar" width="800">

You can download full dataset in : [here](https://github.com/user-attachments/files/18631899/sales.csv)

## Analyze Mototcycle Part Sales
### 1. Find out how much Wholesale net revenue each product_line generated per month per warehouse in the dataset.

````sql
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
````

**Answer**

a. Best performing products:
- Engine and Frame & body have the highest revenue, especially in Central and North warehouses.
- Electrical system also showed good improvement in August.

b. Best time for sales:
- August is the best performing month, followed by July.
- June has lower revenue, may need more aggressive marketing strategy in this month.

c. Warehouse location optimization:
- Central and North have high revenue, so they can be the main distribution focus.
- West has lower revenue and may need sales improvement strategy.
