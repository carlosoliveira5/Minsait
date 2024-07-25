# Minsait
Este projeto cria uma VM na Azure, instala Docker e configura um container com WordPress utilizando Terraform.


Pré-requisitos
✅ Conta na Azure
      https://azure.microsoft.com/pt-br/free/
✅ Git
      https://git-scm.com/book/pt-br/v2/Come%C3%A7ando-Instalando-o-Git
✅ Azure CLI     
      https://learn.microsoft.com/en-us/cli/azure/install-azure-cli
✅ Terraform
      https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

0️⃣ Passo: Adicione as variáveis de ambiente ao seu arquivo de perfil
        (~/.bashrc, ~/.bash_profile, ~/.zshrc, etc.):
        export admin_username="username"
        export admin_password="password"

1️⃣ Passo: Clone o Repositório
      git clone https://github.com/carlosoliveira5/Minsait.git
Esse comando será utilizado para clonar o repositório deste projeto, ou seja a versão da branch local será idêntica a branch remota. 

2️⃣ Passo: Faça Login na Azure
      az login
Esse comando será utilizado para logar na sua conta do Azure, você pode escolher a assinatura ao logar também, certifique-se de estar no diretório raiz.
      
3️⃣ Passo: Inicialize o Terraform 
      terraform init
Esse comando é executado para inicializar a pasta de trabalho.

4️⃣ Passo: Inicialize o Terraform   
      terraform plan
Esse comando é executado para criar um plano de execução.

5️⃣ Passo: Inicialize o Terraform 
      terraform apply
Esse comando é executado para aplicar o plano de execução.

6️⃣ Passo: Encontre seu Ip público
      az vm show --resource-group rg-challenge --name vm-challenge --query "publicIps" --output tsv

7️⃣ Passo: Conecte na VM
      ssh username@publicip
      Password: password

8️⃣ Passo: Verifique se o Docker e os containers estão funcionando corretamente na VM
      docker ps
      
9️⃣ Passo: Destrua o que foi provisionado
      terraform destroy
