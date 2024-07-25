# variavel responsavel para alocar em eastus sempre que chamada
variable "locat" {
  type        = string # tipo de dado que a variavel responsavel pela localizacao vai assumir
  default     = "eastus" # valor padrao que a localizacao recebera
  description = "localizacao de criacao dos recursos" # descricao do que eh a variavel
}

# variavel responsavel pelo nome do resource group 
variable "rg" {
  type        = string # tipo de dado que a variavel responsavel pelo rg vai assumir
  default     = "rg-challenge" # valor padrao que o rg recebera
  description = "nome do resouce group da aplicacao" # descricao do que eh a variavel
}

# variavel responsavel pela vnet 
variable "vnet" {
  type        = string  # tipo de dado que a variavel responsavel pela vnet vai assumir
  default     = "vnet-challenge" # valor padrao que a vnet recebera
  description = "vnet da aplicacao para a vm" # descricao do que eh a variavel
}

# variavel responsavel pela virtual machine
variable "vm" {
  type        = string # tipo de dado que a variavel responsavel pela vm vai assumir
  default     = "vm-challenge" # valor padrao que a vm recebera dentro do seu rg
  description = "construcao da vm para o desafio"  # descricao do que eh a variavel
}
# variavel para o usuario administrador
# Apos instrução do professor Lucas Pauluk, realizei a definição das variáveis
# de ambiente, desse modo nao passarei nenhum valor default, o Terraform as reconhecerá automaticamente
variable "admin_username" {
  description = "O nome de usuario do administrador para a VM" # descricao do que eh a variavel
  type        = string # tipo de dado que a variavel responsavel pela vm

}
# variavel para a senha do administrador
# Apos instrução do professor Lucas Pauluk, realizei a definição das variáveis
# de ambiente, desse modo nao passarei nenhum valor default, o Terraform as reconhecerá automaticamente
variable "admin_password" {
  description = "A senha do administrador para a VM" # descricao do que eh a variavel
  type        = string # tipo de dado que a variavel responsavel pela vm
}
# variavel para a senha do bd
variable "db_root_password" {
  type        = string # tipo de dado que a variavel responsavel pela senha do bd
  default     = "GAud4mZby8F3SD6P" # valor padrao que o bd recebera
  description = "Senha do root do banco de dados" # descricao do que eh a variavel
}