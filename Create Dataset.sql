USE BikeStores

SELECT ord.order_id
	,CONCAT (cust.first_name,' ',cust.last_name) AS 'customer_name'
	,cust.city
	,cust.state
	,ord.order_date
	,SUM(ordi.quantity) AS 'total_units'
	,SUM(ordi.quantity * ordi.list_price) AS 'revenue'
	,pro.product_name
	,cat.category_name
	,brands.brand_name
	,stores.store_name
	,CONCAT (staffs.first_name,' ',staffs.last_name) AS 'sales_rep'
FROM sales.orders ord
JOIN sales.customers cust
	ON ord.customer_id = cust.customer_id
JOIN sales.order_items ordi
	ON ordi.order_id = ord.order_id
JOIN production.products pro
	ON pro.product_id = ordi.product_id
JOIN production.categories cat
	ON cat.category_id = pro.category_id
JOIN sales.stores stores
	ON stores.store_id = ord.store_id
JOIN sales.staffs staffs
	ON staffs.staff_id = ord.staff_id
JOIN production.brands brands
	on brands.brand_id = pro.brand_id
GROUP BY ord.order_id
	,CONCAT (cust.first_name,' ',cust.last_name)
	,cust.city
	,cust.STATE
	,ord.order_date
	,pro.product_name
	,brands.brand_name
	,cat.category_name
	,store_name
	,CONCAT (staffs.first_name,' ',staffs.last_name)
