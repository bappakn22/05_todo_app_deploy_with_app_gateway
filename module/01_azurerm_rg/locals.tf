locals {
  managed_by = "Terraform"

  common_tags = {
    ManagedBy   = local.managed_by
    Environment = "Production"
    Project     = "Azure-Infralab"
    Owner       = "Bappa Kundu"
    CostCenter  = "IT-001"
    Application = "VirtualMachine"
    CreatedBy   = "Terraform"
    Department  = "Infrastructure"
    Team        = "Cloud"
  }

 }
