--UPDATE BOOKS SET BOOKS.PUBLISHER_ID = (select top(1) PUBLISHERS.ID FROM PUBLISHERS WHERE PUBLISHERS.NAME = 'Springer') where ISBN LIKE '%-fr'
select * from BOOKS where ISBN LIKe '%-RS'
