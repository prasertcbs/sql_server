-- ranking functions (WINDOW FUNCTIONS)
-- ฟังก์ชันสำหรับสร้างคอลัมน์สำหรับแสดงลำดับของข้อมูล
-- row_number()
-- rank()
-- dense_rank()
-- ntile()

SELECT     MenuID, DescrTH, CategoryID, Price,
        row_number() over (order by categoryid, price) as [row #]
	FROM   Menu

SELECT     MenuID, DescrTH, CategoryID, Price,
        row_number() over (order by categoryid, price) as [row 1],
        row_number() over (
                            partition by categoryid
                            order by categoryid, price
                          ) as [row 2]
	FROM   Menu

SELECT     MenuID, DescrTH, CategoryID, Price,
        rank() over (order by price desc) as [rank #],
        dense_rank() over (order by price desc) as [dense rank]
	FROM   Menu

SELECT     MenuID, DescrTH, CategoryID, Price,
        rank() over (order by categoryid, price desc) as [rank no partition],
        rank() over (partition by categoryid order by price desc) as [rank with partition]
	FROM   Menu

-- ntile()
SELECT     MenuID, DescrTH, CategoryID, Price,
        ntile(4) over (order by price desc) as quartile,
        rank() over (order by price desc) as [rank no partition]
	FROM   Menu
