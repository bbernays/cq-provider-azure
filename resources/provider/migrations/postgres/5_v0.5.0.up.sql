-- Resource: redis.services
CREATE TABLE IF NOT EXISTS "azure_redis_services" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"subscription_id" text,
	"tags" jsonb,
	"location" text,
	"id" text,
	"name" text,
	"type" text,
	"provisioning_state" text,
	"hostname" text,
	"port" integer,
	"ssl_port" integer,
	"linked_server_ids" text[],
	"instances" jsonb,
	"private_endpoint_connections" jsonb,
	"sku_name" text,
	"sku_family" text,
	"sku_capacity" integer,
	"subnet_id" text,
	"static_ip" inet,
	"configuration" jsonb,
	"version" text,
	"enable_non_ssl_port" boolean,
	"replicas_per_master" integer,
	"replicas_per_primary" integer,
	"tenant_settings" jsonb,
	"shard_count" integer,
	"minimum_tls_version" text,
	"public_network_access" boolean,
	CONSTRAINT azure_redis_services_pk PRIMARY KEY(subscription_id,id),
	UNIQUE(cq_id)
);

-- Resource: sql.servers
CREATE TABLE IF NOT EXISTS "azure_sql_server_virtual_network_rules" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"server_cq_id" uuid,
	"id" text,
	"name" text,
	"type" text,
	"subnet_id" text,
	"ignore_missing_vnet_service_endpoint" boolean,
	"state" text,
	CONSTRAINT azure_sql_server_virtual_network_rules_pk PRIMARY KEY(server_cq_id,id),
	UNIQUE(cq_id),
	FOREIGN KEY (server_cq_id) REFERENCES azure_sql_servers(cq_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "azure_sql_server_security_alert_policy" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"server_cq_id" uuid,
	"id" text,
	"name" text,
	"type" text,
	"state" text,
	"disabled_alerts" text[],
	"email_addresses" text[],
	"email_account_admins" boolean,
	"storage_endpoint" text,
	"storage_account_access_key" text,
	"retention_days" integer,
	"creation_time" timestamp without time zone,
	CONSTRAINT azure_sql_server_security_alert_policy_pk PRIMARY KEY(server_cq_id,id),
	UNIQUE(cq_id),
	FOREIGN KEY (server_cq_id) REFERENCES azure_sql_servers(cq_id) ON DELETE CASCADE
);
