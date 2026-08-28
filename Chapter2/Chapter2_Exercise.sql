SELECT SKU , SKU_Description
FROM cape_codd.INVENTORY;

SELECT SKU_Description , SKU
FROM cape_codd.INVENTORY;

SELECT WarehouseID
FROM cape_codd.INVENTORY;

SELECT DISTINCT WarehouseID
FROM cape_codd.INVENTORY;

SELECT SKU , SKU_Description , QuantityOnHand , QuantityOnOrder
FROM cape_codd.INVENTORY;

SELECT * 
FROM cape_codd.INVENTORY;

SELECT *
FROM cape_codd.INVENTORY
WHERE QuantityOnHand > 0;

SELECT SKU , SKU_Description 
FROM cape_codd.INVENTORY
WHERE QuantityOnHand = 0;

SELECT SKU , SKU_Description , WarehouseID
FROM cape_codd.INVENTORY
WHERE QuantityOnHand = 0
ORDER BY WarehouseID ASC;

SELECT SKU , SKU_Description , WarehouseID
FROM cape_codd.INVENTORY
WHERE QuantityOnHand > 0
ORDER BY WarehouseID DESC , SKU ASC;

SELECT SKU , SKU_Description , WarehouseID
FROM cape_codd.INVENTORY
WHERE QuantityOnHand = 0
AND QuantityOnOrder > 0
ORDER BY WarehouseID DESC , SKU ASC;

SELECT SKU , SKU_Description , WarehouseID
FROM cape_codd.INVENTORY
WHERE QuantityOnHand = 0
AND QuantityOnOrder = 0
ORDER BY WarehouseID DESC , SKU ASC;

SELECT SKU , SKU_Description , WarehouseID
FROM cape_codd.INVENTORY
WHERE QuantityOnHand = 0
AND QuantityOnOrder = 0
ORDER BY WarehouseID DESC , SKU ASC;

SELECT SKU , SKU_Description , WarehouseID , QuantityOnHand
FROM cape_codd.INVENTORY
WHERE QuantityOnHand > 1
AND QuantityOnHand < 10
ORDER BY WarehouseID DESC, SKU ASC;

SELECT SKU , SKU_Description , WarehouseID , QuantityOnHand
FROM cape_codd.INVENTORY
WHERE QuantityOnHand BETWEEN 1 AND 10
ORDER BY WarehouseID DESC, SKU ASC;

SELECT DISTINCT SKU , SKU_Description
FROM cape_codd.INVENTORY
WHERE SKU_Description LIKE "Half-Dome%";

SELECT DISTINCT SKU , SKU_Description
FROM cape_codd.INVENTORY
WHERE SKU_Description LIKE "%Climb%";