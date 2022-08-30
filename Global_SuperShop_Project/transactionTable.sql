SELECT 
	Row_ID, Order_ID, Customer_ID, Product_ID, Sales, Quantity, Sales_per_Unit, Discount, Profit, Profit_per_Unit, Costs, Cost_Per_Unit, Shipping_Cost, ShippingCost_per_Unit,
    City, State, Country, Region, Postal_Code, Market
FROM storedata;

select Customer_Name, sum(Profit), Product_ID from storedata where Customer_ID = 'AB-10015';