
CREATE TRIGGER DBTables   
ON DATABASE   
FOR CREATE_TABLE, DROP_TABLE  
AS   
BEGIN
    SET NOCOUNT ON;
	insert into DBLogs values(EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]','NVARCHAR(100)'),GETDATE(),USER)
END
--.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'NVARCHAR(2000)')


--FOR TESTING
create table testtable(name varchar(10))
drop table testtable



drop trigger DBTables on database
select  * from DBLogs
create table DBLogs
(
LogID int IDENTITY(1,1) PRIMARY KEY,
EventVal varchar(100),
EventDate datetime NOT NULL,
ChangedBy SYSNAME NOT NULL
)