													-- Creating Dimension table for Order Entity

select 
	distinct(Order_ID), date(Order_Date) as Order_Date, Order_Month, Order_Year, Order_Priority,
	Ship_Mode, date(Ship_Date) as Ship_Date, Ship_Month, Ship_Year
from storedata;

-- select Order_ID, Order_Date, Order_Priority, Ship_Mode,Ship_Date from storedata where Order_ID = 'CA-2014-135909';