terraform{
    required_version = ">= 1.3.0"
    required_providers{
        azurerm = {
            source = "hashicorp/azurerm"
            version = ">=4.0.0"

        }
    }

    backend "azurerm"   {}
}

provider "azurerm" {
    features{}
    subscription_id = "453f09cc-5afa-481e-8340-61839b6b323c"
  
}