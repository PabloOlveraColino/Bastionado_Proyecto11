variable "pm_api_url" {
  description = "URL de la API de Proxmox"
  type        = string
}

variable "pm_api_token_id" {
  description = "ID del token de API de Proxmox"
  type        = string
}

variable "pm_api_token_secret" {
  description = "Secreto del token de API de Proxmox"
  type        = string
  sensitive   = true
}

variable "pm_node" {
  description = "Nombre del nodo de Proxmox"
  type        = string
}

variable "storage" {
  description = "Nombre del almacenamiento en Proxmox"
  type        = string
}

variable "pfsense_iso" {
  description = "Ruta al ISO de pfSense en Proxmox"
  type        = string
}

variable "kali_template" {
  description = "Nombre de la plantilla de Kali Linux"
  type        = string
}

variable "ubuntu_template" {
  description = "Nombre de la plantilla de Ubuntu Server 22.04"
  type        = string
}
