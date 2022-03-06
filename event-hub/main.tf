provider "azurerm" {
  features {}
}

resource "azurerm_eventhub_namespace" "eh_namespace" {
  name                = var.event_hub_namespace_name
  location            = var.eventhub_ns_location
  resource_group_name = var.eventhub_ns_rg_name
  sku                 = var.eventhub_ns_sku
  capacity            = var.eventhub_ns_capacity
  tags                = var.tags
}

resource "azurerm_eventhub" "event_hub" {
  name                = var.event_hub_name
  namespace_name      = azurerm_eventhub_namespace.eh_namespace.name
  resource_group_name = var.event_hub_rg_name
  partition_count     = var.event_hub_partition_count
  message_retention   = var.event_hub_message_retention
}

resource "azurerm_management_lock" "kv_lock" {
  count      = var.enable_resource_lock ? 1 : 0
  name       = "delete-lock-eh"
  scope      = azurerm_eventhub_namespace.eh_namespace.id
  lock_level = "CanNotDelete"
  notes      = "Delete lock on event hub."
}

resource "azurerm_monitor_diagnostic_setting" "diag_logs" {
  name                       = "logs-to-workspace"
  target_resource_id         = azurerm_eventhub_namespace.eh_namespace.id
  log_analytics_workspace_id = var.la_workspace_id

  log {
    category = "ArchiveLogs"
    enabled  = true
  }
  log {
    category = "OperationalLogs"
    enabled  = true
  }
  log {
    category = "AutoScaleLogs"
    enabled  = true
  }
  log {
    category = "KafkaUserErrorLogs"
    enabled  = true
  }
  log {
    category = "KafkaCoordinatorLogs"
    enabled  = true
  }
  log {
    category = "EventHubVNetConnectionEvent"
    enabled  = true
  }
  log {
    category = "CustomerManagedKeyUserLogs"
    enabled  = true
  }
}