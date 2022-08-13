														-- delete from housing_property_data;

SELECT * FROM housing_property.housing_property_data;


														-- Standardize Date Format -- 

alter table housing_property_data
add new_column_name date;       -- creating a new column name SalesDate with only date type.

update housing_property_data
set new_column_name = convert(SaleDate,date);  -- Updating new_column_name  value from SaleDate column

alter table housing_property_data
modify column SaleDate date;

SELECT SaleDate from housing_property_data;

-- Delete a existing column in the table
-- ALTER TABLE housing_property_data
-- Drop COLUMN SalesDate;


										-- Fetch the data for PropertyAddress if the row is null from the same ParcelID
                                        
select hpd_a.ParcelID, hpd_a.PropertyAddress, hpd_b.ParcelID, hpd_b.PropertyAddress, ifnull(hpd_b.PropertyAddress,hpd_a.PropertyAddress) as NewPropertyAddress
from housing_property_data hpd_a
	join housing_property_data hpd_b
	on hpd_a.ParcelID = hpd_b.ParcelID
	and hpd_a.UniqueID <> hpd_b.UniqueID;

update housing_property_data hpd_a
join housing_property_data hpd_b
	on hpd_a.ParcelID = hpd_b.ParcelID
	and hpd_a.UniqueID <> hpd_b.UniqueID 
	set hpd_a.PropertyAddress = ifnull(hpd_b.PropertyAddress,hpd_a.PropertyAddress)
    where hpd_a.PropertyAddress = 'null';

select UniqueID, ParcelID, PropertyAddress, OwnerName from housing_property_data;

-- Parsing the cityname from PropertyAddress string

select UniqueID, ParcelID, SaleDate, substring_index(PropertyAddress, ',' , -1) as CityName from housing_property_data;





