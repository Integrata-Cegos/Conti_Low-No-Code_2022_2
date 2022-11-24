--DROP TRIGGER AUDIT_UPDATE_TRIGGER_RS
CREATE TRIGGER AUDIT_UPDATE_TRIGGER_RS ON PUBLISHERS FOR UPDATE
AS 
BEGIN
 INSERT INTO AUDIT_MESSAGES SELECT 'UPDATED PUBLISHER WITH, old name was ' + d.NAME + ', new name is ' + i.NAME FROM DELETED as d, INSERTED as i
END



