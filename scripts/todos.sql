--insert into PUBLISHERS VALUES (666, 'Anton')
--insert into BOOKS (ISBN, TITLE, PAGES, PRICE, AVAILABLE) VALUES('ISBN-Anton-1', 'Das Omen', 200, 19.99, 1)
--insert into AUTHORS VALUES (666, 'Aus Tirol', 'Anton')


--update BOOKS  set BOOKS.PUBLISHER_ID = PUBLISHERS.ID from PUBLISHERS  where PUBLISHERS.NAME = 'Anton'
-- select ID from PUBLISHERS where NAME = 'Anton'
-- select TITLE from BOOKS where PUBLISHER_ID = 666

-- insert into BOOKS_AUTHORS (BOOK_ID, AUTHOR_ID) select b.ISBN, a.ID from BOOKS as b, AUTHORS as a where b.TITLE = 'Das Omen' AND a.FIRSTNAME = 'Anton'

-- Alle Bücher (also auch School und Specialist) mit Preis-Kriterium

select *
from (            SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM BOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SPECIALBOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SCHOOLBOOKS 
) as allbooks
where allbooks.PRICE > 22

-- Alle "schwierigen"= Bücher: Kriterium: Normal > 150 Seiten, Schule > 200, Fach > 50


select *
from (            SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, 'book' as Type
        FROM BOOKS
        WHERE PAGES > 400
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, 'specialist'
        FROM SPECIALBOOKS
        WHERE PAGES > 50
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, 'school'
        FROM SCHOOLBOOKS
        WHERE PAGES > 200
) as allbooks
ORDER BY PAGES ASC

-- Die 10 teuersten Bücher

select top (10)
    *
from (            SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM BOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SPECIALBOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SCHOOLBOOKS 
) as allbooks
order by price DESC

-- titel > 30 zeichen

select *
from (            SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM BOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SPECIALBOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SCHOOLBOOKS 
) as allbooks
where len(allbooks.title) > 30

-- Zeichenkette vorhanden, diesmal ohne LIKE

select title
from (            SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM BOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SPECIALBOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SCHOOLBOOKS 
) as allbooks
where PATINDEX('%rett%', title) > 0

-- Der höchste Buch-Preis

select max(price)
from (            SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM BOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SPECIALBOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SCHOOLBOOKS 
) as allBooks

-- Der niedrigste Buch-Preis

select min(price)
from (            SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM BOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SPECIALBOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SCHOOLBOOKS 
) as allBooks


-- die Bücher mit dem niedrigsten Preis

select *
from (            SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM BOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SPECIALBOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SCHOOLBOOKS 
) as allBooks
where price = (select min(price)
from (            SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM BOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SPECIALBOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SCHOOLBOOKS 
) as allBooks)

-- die Bücher mit dem höchsten Preis


select *
from (                        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM BOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SPECIALBOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SCHOOLBOOKS 
) as allBooks
where price = (select max(price)
from (                                    SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM BOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SPECIALBOOKS
    UNION
        SELECT ISBN, TITLE, PAGES, PRICE, AVAILABLE, PUBLISHER_ID
        FROM SCHOOLBOOKS 
 ) as allBooks) 