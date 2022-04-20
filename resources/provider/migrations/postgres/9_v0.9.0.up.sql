-- Resource: network.express_route_circuits
CREATE TABLE IF NOT EXISTS "azure_network_express_route_circuits" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"subscription_id" text,
	"id" text,
	"allow_classic_operations" boolean,
	"bandwidth_in_gbps" float,
	"circuit_provisioning_state" text,
	"etag" text,
	"express_route_port_id" text,
	"gateway_manager_etag" text,
	"global_reach_enabled" boolean,
	"location" text,
	"name" text,
	"provisioning_state" text,
	"service_key" text,
	"service_provider_notes" text,
	"service_provider_properties_bandwidth_in_mbps" integer,
	"service_provider_properties_peering_location" text,
	"service_provider_properties_service_provider_name" text,
	"service_provider_provisioning_state" text,
	"sku_family" text,
	"sku_name" text,
	"sku_tier" text,
	"stag" integer,
	"tags" jsonb,
	"type" text,
	CONSTRAINT azure_network_express_route_circuits_pk PRIMARY KEY(subscription_id,id),
	UNIQUE(cq_id)
);
CREATE TABLE IF NOT EXISTS "azure_network_express_route_circuit_authorizations" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"express_route_circuit_cq_id" uuid,
	"id" text,
	"authorization_key" text,
	"authorization_use_status" text,
	"etag" text,
	"name" text,
	"provisioning_state" text,
	"type" text,
	CONSTRAINT azure_network_express_route_circuit_authorizations_pk PRIMARY KEY(express_route_circuit_cq_id,id),
	UNIQUE(cq_id),
	FOREIGN KEY (express_route_circuit_cq_id) REFERENCES azure_network_express_route_circuits(cq_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "azure_network_express_route_circuit_peerings" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"express_route_circuit_cq_id" uuid,
	"id" text,
	"azure_asn" integer,
	"etag" text,
	"express_route_connection_id" text,
	"gateway_manager_etag" text,
	"ipv6_peering_config_microsoft_peering_config" jsonb,
	"ipv6_peering_config_primary_peer_address_prefix" text,
	"ipv6_peering_config_route_filter_id" text,
	"ipv6_peering_config_secondary_peer_address_prefix" text,
	"ipv6_peering_config_state" text,
	"last_modified_by" text,
	"microsoft_peering_config_advertised_communities" text[],
	"microsoft_peering_config_advertised_public_prefixes" text[],
	"microsoft_peering_config_advertised_public_prefixes_state" text,
	"microsoft_peering_config_customer_asn" integer,
	"microsoft_peering_config_legacy_mode" integer,
	"microsoft_peering_config_routing_registry_name" text,
	"name" text,
	"peer_asn" bigint,
	"peering_type" text,
	"primary_azure_port" text,
	"primary_peer_address_prefix" text,
	"provisioning_state" text,
	"route_filter_id" text,
	"secondary_azure_port" text,
	"secondary_peer_address_prefix" text,
	"shared_key" text,
	"state" text,
	"stats_primary_bytes_in" bigint,
	"stats_primary_bytes_out" bigint,
	"stats_secondary_bytes_in" bigint,
	"stats_secondary_bytes_out" bigint,
	"type" text,
	"vlan_id" integer,
	CONSTRAINT azure_network_express_route_circuit_peerings_pk PRIMARY KEY(express_route_circuit_cq_id,id),
	UNIQUE(cq_id),
	FOREIGN KEY (express_route_circuit_cq_id) REFERENCES azure_network_express_route_circuits(cq_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "azure_network_express_route_circuit_connections" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"express_route_circuit_peering_cq_id" uuid,
	"id" text,
	"address_prefix" text,
	"circuit_connection_status" text,
	"etag" text,
	"express_route_circuit_peering_id" text,
	"ipv6_circuit_connection_config_address_prefix" text,
	"ipv6_circuit_connection_config_circuit_connection_status" text,
	"name" text,
	"peer_express_route_circuit_peering_id" text,
	"provisioning_state" text,
	"type" text,
	CONSTRAINT azure_network_express_route_circuit_connections_pk PRIMARY KEY(express_route_circuit_peering_cq_id,id),
	UNIQUE(cq_id),
	FOREIGN KEY (express_route_circuit_peering_cq_id) REFERENCES azure_network_express_route_circuit_peerings(cq_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "azure_network_peer_express_route_circuit_connections" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"express_route_circuit_peering_cq_id" uuid,
	"id" text,
	"address_prefix" text,
	"auth_resource_guid" text,
	"circuit_connection_status" text,
	"connection_name" text,
	"etag" text,
	"express_route_circuit_peering_id" text,
	"name" text,
	"peer_express_route_circuit_peering_id" text,
	"provisioning_state" text,
	"type" text,
	CONSTRAINT azure_network_peer_express_route_circuit_connections_pk PRIMARY KEY(express_route_circuit_peering_cq_id,id),
	UNIQUE(cq_id),
	FOREIGN KEY (express_route_circuit_peering_cq_id) REFERENCES azure_network_express_route_circuit_peerings(cq_id) ON DELETE CASCADE
);

-- Resource: network.express_route_gateways
CREATE TABLE IF NOT EXISTS "azure_network_express_route_gateways" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"subscription_id" text,
	"id" text,
	"auto_scale_configuration_bound_max" integer,
	"auto_scale_configuration_bound_min" integer,
	"etag" text,
	"location" text,
	"name" text,
	"provisioning_state" text,
	"tags" jsonb,
	"type" text,
	"virtual_hub_id" text,
	CONSTRAINT azure_network_express_route_gateways_pk PRIMARY KEY(subscription_id,id),
	UNIQUE(cq_id)
);
CREATE TABLE IF NOT EXISTS "azure_network_express_route_connections" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"express_route_gateway_cq_id" uuid,
	"id" text,
	"authorization_key" text,
	"enable_internet_security" boolean,
	"express_route_circuit_peering_id" text,
	"name" text,
	"provisioning_state" text,
	"routing_weight" integer,
	CONSTRAINT azure_network_express_route_connections_pk PRIMARY KEY(express_route_gateway_cq_id,id),
	UNIQUE(cq_id),
	FOREIGN KEY (express_route_gateway_cq_id) REFERENCES azure_network_express_route_gateways(cq_id) ON DELETE CASCADE
);

-- Resource: network.express_route_ports
CREATE TABLE IF NOT EXISTS "azure_network_express_route_ports" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"subscription_id" text,
	"id" text,
	"allocation_date" text,
	"bandwidth_in_gbps" integer,
	"circuits" text[],
	"encapsulation" text,
	"etag" text,
	"ether_type" text,
	"identity_principal_id" text,
	"identity_tenant_id" text,
	"identity_type" text,
	"identity_user_assigned_identities" jsonb,
	"location" text,
	"mtu" text,
	"name" text,
	"peering_location" text,
	"provisioned_bandwidth_in_gbps" float,
	"provisioning_state" text,
	"resource_guid" text,
	"tags" jsonb,
	"type" text,
	CONSTRAINT azure_network_express_route_ports_pk PRIMARY KEY(subscription_id,id),
	UNIQUE(cq_id)
);
CREATE TABLE IF NOT EXISTS "azure_network_express_route_links" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"express_route_port_cq_id" uuid,
	"id" text,
	"admin_state" text,
	"connector_type" text,
	"etag" text,
	"interface_name" text,
	"mac_sec_config_cak_secret_identifier" text,
	"mac_sec_config_cipher" text,
	"mac_sec_config_ckn_secret_identifier" text,
	"mac_sec_config_sci_state" text,
	"name" text,
	"patch_panel_id" text,
	"provisioning_state" text,
	"rack_id" text,
	"router_name" text,
	CONSTRAINT azure_network_express_route_links_pk PRIMARY KEY(express_route_port_cq_id,id),
	UNIQUE(cq_id),
	FOREIGN KEY (express_route_port_cq_id) REFERENCES azure_network_express_route_ports(cq_id) ON DELETE CASCADE
);

-- Resource: network.route_filters
CREATE TABLE IF NOT EXISTS "azure_network_route_filters" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"subscription_id" text,
	"id" text,
	"etag" text,
	"ipv6_peerings" jsonb,
	"location" text,
	"name" text,
	"peerings" jsonb,
	"provisioning_state" text,
	"tags" jsonb,
	"type" text,
	CONSTRAINT azure_network_route_filters_pk PRIMARY KEY(subscription_id,id),
	UNIQUE(cq_id)
);
CREATE TABLE IF NOT EXISTS "azure_network_route_filter_rules" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"route_filter_cq_id" uuid,
	"id" text,
	"access" text,
	"communities" text[],
	"etag" text,
	"location" text,
	"name" text,
	"provisioning_state" text,
	"route_filter_rule_type" text,
	CONSTRAINT azure_network_route_filter_rules_pk PRIMARY KEY(route_filter_cq_id,id),
	UNIQUE(cq_id),
	FOREIGN KEY (route_filter_cq_id) REFERENCES azure_network_route_filters(cq_id) ON DELETE CASCADE
);