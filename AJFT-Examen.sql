Use AdventureWorks2017
Go

Backup Database AdventureWorks2017
To Disk = N'D:\Examen Parcial\AwExamenBDII.bak' With NoFormat, NoInit,
Name = N'AwExamenBDII-Full Database Backup', skip, norewind, nounload, STATS=10
Go


Use AdventureWorks2017
Go


CREATE TABLE RestoreHeaderOnlyData( 
BackupName NVARCHAR(128) 
,BackupDescription NVARCHAR(255) 
,BackupType smallint 
,ExpirationDate datetime 
,Compressed tinyint 
,Position smallint 
,DeviceType tinyint 
,UserName NVARCHAR(128) 
,ServerName NVARCHAR(128) 
,DatabaseName NVARCHAR(128) 
,DatabaseVersion INT 
,DatabaseCreationDate datetime 
,BackupSize numeric(20,0) 
,FirstLSN numeric(25,0) 
,LastLSN numeric(25,0) 
,CheckpointLSN numeric(25,0) 
,DatabaseBackupLSN numeric(25,0) 
,BackupStartDate datetime 
,BackupFinishDate datetime 
,SortOrder smallint 
,CodePage smallint 
,UnicodeLocaleId INT 
,UnicodeComparisonStyle INT 
,CompatibilityLevel tinyint 
,SoftwareVendorId INT 
,SoftwareVersionMajor INT 
,SoftwareVersionMinor INT 
,SoftwareVersionBuild INT 
,MachineName NVARCHAR(128) 
,Flags INT 
,BindingID uniqueidentifier 
,RecoveryForkID uniqueidentifier 
,Collation NVARCHAR(128) 
,FamilyGUID uniqueidentifier 
,HasBulkLoggedData INT 
,IsSnapshot INT 
,IsReadOnly INT 
,IsSingleUser INT 
,HasBackupChecksums INT 
,IsDamaged INT 
,BeginsLogChain INT 
,HasIncompleteMetaData INT 
,IsForceOffline INT 
,IsCopyOnly INT 
,FirstRecoveryForkID uniqueidentifier 
,ForkPointLSN numeric(25,0) 
,RecoveryModel NVARCHAR(128) 
,DifferentialBaseLSN numeric(25,0) 
,DifferentialBaseGUID uniqueidentifier 
,BackupTypeDescription NVARCHAR(128) 
,BackupSetGUID uniqueidentifier 
,CompressedBackupSize BIGINT
,Containment INT
,KeyAlgorithm varchar(500)
,EncryptorThumbprint varchar(500)
,EncryptorType varchar(500)
) 

INSERT INTO RestoreHeaderOnlyData 
EXEC('RESTORE HEADERONLY FROM AdventureWorks')

DECLARE @File smallint
SELECT @File = MAX(Position) 
FROM RestoreHeaderOnlyData 
WHERE BackupName = 'AwExamenBDII – Full Backup 20210510_174269' 

RESTORE DATABASE AwExamenBDII20201108_105831 
FROM HotelData 
WITH FILE = @File, 
    MOVE N'AwExamenBDII_01' TO N'D:\Examen Parcial\AwExamenBDII20210510_174269_Data.mdf', 
	MOVE N'AwExamenBDII_2' TO N'\Examen Parcial\AwExamenBDII20210510_174269_2.mdf', 
	MOVE N'AwExamenBDII_3' TO N'\Examen Parcial\AwExamenBDII20210510_174269_3.mdf', 
	MOVE N'AwExamenBDII_4' TO N'\Examen Parcial\AwExamenBDII20210510_174269_4.mdf', 
	MOVE N'HoAwExamenBDII_5' TO N'\Examen Parcial\AwExamenBDII20210510_174269_5.mdf', 
    MOVE N'AwExamenBDII_Log_1' TO N'E:\BD II PROMECYS\DATABASES\LOG\Hotel20201108_105831_Log_1.ldf', 
	MOVE N'AwExamenBDII_Log_2' TO N'E:\BD II PROMECYS\DATABASES\LOG\Hotel20201108_105831_Log_2.ldf', 
NOUNLOAD, REPLACE, STATS = 10
GO



