resource "azurerm_kubernetes_cluster" "example" {

  name                = "${var.prefix}-k8s"
  location            = "${var.location}"  
  resource_group_name = "${var.resource_group_name}"
  dns_prefix          = "${var.prefix}-k8s"


  default_node_pool {
    name            = "agentpool"
    node_count      = "${var.node_count}"
    vm_size         = "${var.vm_size}"
    os_disk_size_gb = "${var.os_disk_size_gb}"
  }   

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }
  
  tags = {
    Environment = "Development"
    Creator = "Terraform"
  }

}
