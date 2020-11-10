SELECT DISTINCT store_name, phone, email, street, city, state, zip_code
FROM [sales].[stores]



SELECT DISTINCT product_name, br.brand_name as brand_name, list_price
FROM [production].[products] AS pr
INNER JOIN [production].[brands] AS br ON pr.brand_id = br.brand_id



SELECT DISTINCT order_id, CONVERT (DATE, order_date) AS order_date,
				CONVERT(INT, DATEPART(YEAR, order_date)) AS anio,
				CONVERT(INT,DATEPART(MONTH, order_date)) AS mes,
				CONVERT(INT, DATEPART(DAY, order_date)) AS dia
FROM [sales].[orders]



SELECT tiendaDIM.tienda_id, tiempoDIM.tiempo_id , productosDIM.productos_id, ord_i.quantity, ord_i.list_price, ord_i.discount
FROM [BikeStores].[sales].stores AS sto
INNER JOIN [BikeStores].[sales].orders AS ord ON sto.store_id = ord.store_id
INNER JOIN [BikeStores].[production].[stocks] AS stoc ON stoc.store_id = sto.store_id
INNER JOIN [BikeStores].[production].[products] AS prod ON prod.product_id = stoc.product_id
INNER JOIN [BikeStores].[sales].[order_items] AS ord_i ON ord_i.product_id = prod.product_id
INNER JOIN DWBikeStores.dbo.DIM_TIENDAS tiendaDIM ON tiendaDIM.tienda_nombre = sto.store_name
INNER JOIN DWBikeStores.dbo.DIM_PRODUCTOS productosDIM ON productosDIM.productos_nombre = prod.product_name
INNER JOIN DWBikeStores.dbo.DIM_TIEMPO tiempoDIM ON tiempoDIM.tiempo_fecha = CONVERT(DATE,ord.order_date)



