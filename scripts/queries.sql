--SELECT * FROM BOOKS;
-- Kreuprodukt: Alle Zeilen aus AUTHORS kombiniert mit allen Zeilen von ADDRESSES
-- SELECT * FROM AUTHORS, ADDRESSES;
-- Kreuzprodukt mit Kriterium
--SELECT * FROM AUTHORS, ADDRESSES WHERE LASTNAME='Pausenkurt';
--SELECT * FROM AUTHORS, ADDRESSES WHERE ID=1; --GEHT NICHT, ID ambiguos
--SELECT * FROM AUTHORS, ADDRESSES WHERE AUTHORS.ID = 1;
--SELECT AUTHORS.ID AS AUTHOR_ID, ADDRESSES.ID AS ADDRESS_ID FROM AUTHORS, ADDRESSES WHERE AUTHORS.ID = 1;
--SELECT AU.ID AS AUTHOR_ID, AD.ID AS ADDRESS_ID FROM AUTHORS AS AU, ADDRESSES AS AD WHERE AU.ID = 1;