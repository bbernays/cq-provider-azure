
# Table: azure_sql_databases
Azure sql database
## Columns
| Name        | Type           | Description  |
| ------------- | ------------- | -----  |
|subscription_id|text|Azure subscription id|
|kind|text|Kind of database  This is metadata used for the Azure portal experience|
|collation|text|The collation of the database If createMode is not Default, this value is ignored|
|creation_date_time|timestamp without time zone|The creation date of the database (ISO8601 format)|
|containment_state|bigint|The containment state of the database|
|current_service_objective_id|uuid|The current service level objective ID of the database This is the ID of the service level objective that is currently active|
|database_id|uuid|The ID of the database|
|earliest_restore_date_time|timestamp without time zone|This records the earliest start date and time that restore is available for this database (ISO8601 format)|
|create_mode|text|Specifies the mode of database creation Default: regular database creation Copy: creates a database as a copy of an existing database sourceDatabaseId must be specified as the resource ID of the source database OnlineSecondary/NonReadableSecondary: creates a database as a (readable or nonreadable) secondary replica of an existing database sourceDatabaseId must be specified as the resource ID of the existing primary database PointInTimeRestore: Creates a database by restoring a point in time backup of an existing database sourceDatabaseId must be specified as the resource ID of the existing database, and restorePointInTime must be specified Recovery: Creates a database by restoring a geo-replicated backup sourceDatabaseId must be specified as the recoverable database resource ID to restore Restore: Creates a database by restoring a backup of a deleted database sourceDatabaseId must be specified If sourceDatabaseId is the database's original resource ID, then sourceDatabaseDeletionDate must be specified Otherwise sourceDatabaseId must be the restorable dropped database resource ID and sourceDatabaseDeletionDate is ignored restorePointInTime may also be specified to restore from an earlier point in time RestoreLongTermRetentionBackup: Creates a database by restoring from a long term retention vault recoveryServicesRecoveryPointResourceId must be specified as the recovery point resource ID Copy, NonReadableSecondary, OnlineSecondary and RestoreLongTermRetentionBackup are not supported for DataWarehouse edition Possible values include: 'CreateModeCopy', 'CreateModeDefault', 'CreateModeNonReadableSecondary', 'CreateModeOnlineSecondary', 'CreateModePointInTimeRestore', 'CreateModeRecovery', 'CreateModeRestore', 'CreateModeRestoreLongTermRetentionBackup'|
|source_database_id|text|Conditional If createMode is Copy, NonReadableSecondary, OnlineSecondary, PointInTimeRestore, Recovery, or Restore, then this value is required Specifies the resource ID of the source database If createMode is NonReadableSecondary or OnlineSecondary, the name of the source database must be the same as the new database being created|
|source_database_deletion_date_time|timestamp without time zone|Conditional If createMode is Restore and sourceDatabaseId is the deleted database's original resource id when it existed (as opposed to its current restorable dropped database id), then this value is required Specifies the time that the database was deleted|
|restore_point_in_time|timestamp without time zone|Conditional If createMode is PointInTimeRestore, this value is required If createMode is Restore, this value is optional Specifies the point in time (ISO8601 format) of the source database that will be restored to create the new database Must be greater than or equal to the source database's earliestRestoreDate value|
|recovery_services_recovery_point_resource_id|text|Conditional If createMode is RestoreLongTermRetentionBackup, then this value is required Specifies the resource ID of the recovery point to restore from|
|edition|text|The edition of the database The DatabaseEditions enumeration contains all the valid editions If createMode is NonReadableSecondary or OnlineSecondary, this value is ignored  The list of SKUs may vary by region and support offer To determine the SKUs (including the SKU name, tier/edition, family, and capacity) that are available to your subscription in an Azure region, use the `Capabilities_ListByLocation` REST API or one of the following commands:  ```azurecli az sql db list-editions -l <location> -o table ````  ```powershell Get-AzSqlServerServiceObjective -Location <location> ````  Possible values include: 'Web', 'Business', 'Basic', 'Standard', 'Premium', 'PremiumRS', 'Free', 'Stretch', 'DataWarehouse', 'System', 'System2', 'GeneralPurpose', 'BusinessCritical', 'Hyperscale'|
|max_size_bytes|text|The max size of the database expressed in bytes If createMode is not Default, this value is ignored To see possible values, query the capabilities API (/subscriptions/{subscriptionId}/providers/MicrosoftSql/locations/{locationID}/capabilities) referred to by operationId: "Capabilities_ListByLocation"|
|requested_service_objective_id|uuid|The configured service level objective ID of the database This is the service level objective that is in the process of being applied to the database Once successfully updated, it will match the value of currentServiceObjectiveId property If requestedServiceObjectiveId and requestedServiceObjectiveName are both updated, the value of requestedServiceObjectiveId overrides the value of requestedServiceObjectiveName  The list of SKUs may vary by region and support offer To determine the service objective ids that are available to your subscription in an Azure region, use the `Capabilities_ListByLocation` REST API|
|requested_service_objective_name|text|The name of the configured service level objective of the database This is the service level objective that is in the process of being applied to the database Once successfully updated, it will match the value of serviceLevelObjective property  The list of SKUs may vary by region and support offer To determine the SKUs (including the SKU name, tier/edition, family, and capacity) that are available to your subscription in an Azure region, use the `Capabilities_ListByLocation` REST API or one of the following commands:  ```azurecli az sql db list-editions -l <location> -o table ````  ```powershell Get-AzSqlServerServiceObjective -Location <location> ````  Possible values include: 'ServiceObjectiveNameSystem', 'ServiceObjectiveNameSystem0', 'ServiceObjectiveNameSystem1', 'ServiceObjectiveNameSystem2', 'ServiceObjectiveNameSystem3', 'ServiceObjectiveNameSystem4', 'ServiceObjectiveNameSystem2L', 'ServiceObjectiveNameSystem3L', 'ServiceObjectiveNameSystem4L', 'ServiceObjectiveNameFree', 'ServiceObjectiveNameBasic', 'ServiceObjectiveNameS0', 'ServiceObjectiveNameS1', 'ServiceObjectiveNameS2', 'ServiceObjectiveNameS3', 'ServiceObjectiveNameS4', 'ServiceObjectiveNameS6', 'ServiceObjectiveNameS7', 'ServiceObjectiveNameS9', 'ServiceObjectiveNameS12', 'ServiceObjectiveNameP1', 'ServiceObjectiveNameP2', 'ServiceObjectiveNameP3', 'ServiceObjectiveNameP4', 'ServiceObjectiveNameP6', 'ServiceObjectiveNameP11', 'ServiceObjectiveNameP15', 'ServiceObjectiveNamePRS1', 'ServiceObjectiveNamePRS2', 'ServiceObjectiveNamePRS4', 'ServiceObjectiveNamePRS6', 'ServiceObjectiveNameDW100', 'ServiceObjectiveNameDW200', 'ServiceObjectiveNameDW300', 'ServiceObjectiveNameDW400', 'ServiceObjectiveNameDW500', 'ServiceObjectiveNameDW600', 'ServiceObjectiveNameDW1000', 'ServiceObjectiveNameDW1200', 'ServiceObjectiveNameDW1000c', 'ServiceObjectiveNameDW1500', 'ServiceObjectiveNameDW1500c', 'ServiceObjectiveNameDW2000', 'ServiceObjectiveNameDW2000c', 'ServiceObjectiveNameDW3000', 'ServiceObjectiveNameDW2500c', 'ServiceObjectiveNameDW3000c', 'ServiceObjectiveNameDW6000', 'ServiceObjectiveNameDW5000c', 'ServiceObjectiveNameDW6000c', 'ServiceObjectiveNameDW7500c', 'ServiceObjectiveNameDW10000c', 'ServiceObjectiveNameDW15000c', 'ServiceObjectiveNameDW30000c', 'ServiceObjectiveNameDS100', 'ServiceObjectiveNameDS200', 'ServiceObjectiveNameDS300', 'ServiceObjectiveNameDS400', 'ServiceObjectiveNameDS500', 'ServiceObjectiveNameDS600', 'ServiceObjectiveNameDS1000', 'ServiceObjectiveNameDS1200', 'ServiceObjectiveNameDS1500', 'ServiceObjectiveNameDS2000', 'ServiceObjectiveNameElasticPool'|
|service_level_objective|text|The current service level objective of the database Possible values include: 'ServiceObjectiveNameSystem', 'ServiceObjectiveNameSystem0', 'ServiceObjectiveNameSystem1', 'ServiceObjectiveNameSystem2', 'ServiceObjectiveNameSystem3', 'ServiceObjectiveNameSystem4', 'ServiceObjectiveNameSystem2L', 'ServiceObjectiveNameSystem3L', 'ServiceObjectiveNameSystem4L', 'ServiceObjectiveNameFree', 'ServiceObjectiveNameBasic', 'ServiceObjectiveNameS0', 'ServiceObjectiveNameS1', 'ServiceObjectiveNameS2', 'ServiceObjectiveNameS3', 'ServiceObjectiveNameS4', 'ServiceObjectiveNameS6', 'ServiceObjectiveNameS7', 'ServiceObjectiveNameS9', 'ServiceObjectiveNameS12', 'ServiceObjectiveNameP1', 'ServiceObjectiveNameP2', 'ServiceObjectiveNameP3', 'ServiceObjectiveNameP4', 'ServiceObjectiveNameP6', 'ServiceObjectiveNameP11', 'ServiceObjectiveNameP15', 'ServiceObjectiveNamePRS1', 'ServiceObjectiveNamePRS2', 'ServiceObjectiveNamePRS4', 'ServiceObjectiveNamePRS6', 'ServiceObjectiveNameDW100', 'ServiceObjectiveNameDW200', 'ServiceObjectiveNameDW300', 'ServiceObjectiveNameDW400', 'ServiceObjectiveNameDW500', 'ServiceObjectiveNameDW600', 'ServiceObjectiveNameDW1000', 'ServiceObjectiveNameDW1200', 'ServiceObjectiveNameDW1000c', 'ServiceObjectiveNameDW1500', 'ServiceObjectiveNameDW1500c', 'ServiceObjectiveNameDW2000', 'ServiceObjectiveNameDW2000c', 'ServiceObjectiveNameDW3000', 'ServiceObjectiveNameDW2500c', 'ServiceObjectiveNameDW3000c', 'ServiceObjectiveNameDW6000', 'ServiceObjectiveNameDW5000c', 'ServiceObjectiveNameDW6000c', 'ServiceObjectiveNameDW7500c', 'ServiceObjectiveNameDW10000c', 'ServiceObjectiveNameDW15000c', 'ServiceObjectiveNameDW30000c', 'ServiceObjectiveNameDS100', 'ServiceObjectiveNameDS200', 'ServiceObjectiveNameDS300', 'ServiceObjectiveNameDS400', 'ServiceObjectiveNameDS500', 'ServiceObjectiveNameDS600', 'ServiceObjectiveNameDS1000', 'ServiceObjectiveNameDS1200', 'ServiceObjectiveNameDS1500', 'ServiceObjectiveNameDS2000', 'ServiceObjectiveNameElasticPool'|
|status|text|The status of the database|
|elastic_pool_name|text|The name of the elastic pool the database is in If elasticPoolName and requestedServiceObjectiveName are both updated, the value of requestedServiceObjectiveName is ignored Not supported for DataWarehouse edition|
|default_secondary_location|text|The default secondary region for this database|
|failover_group_id|text|The resource identifier of the failover group containing this database|
|read_scale|text|Conditional If the database is a geo-secondary, readScale indicates whether read-only connections are allowed to this database or not Not supported for DataWarehouse edition Possible values include: 'ReadScaleEnabled', 'ReadScaleDisabled'|
|sample_name|text|Indicates the name of the sample schema to apply when creating this database If createMode is not Default, this value is ignored Not supported for DataWarehouse edition Possible values include: 'AdventureWorksLT'|
|zone_redundant|boolean|Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones|
|location|text|Resource location|
|tags|jsonb|Resource tags|
|id|text|Resource ID|
|name|text|Resource name|
|type|text|Resource type|