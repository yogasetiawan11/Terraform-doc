provider "aws" {
  region = "us-east-1"
  
}

provider "vault" {  
    address = "http://[HASHICORP_VAULT_IP]:8200"
    skip_child_token = true
    
    auth_login {
      path = "auth/approle/login"
      
      parameters = {
        role_id   = "[ROLE_ID]"
        secret_id   = "[SECRET_ID]"   
       }
    }
}

# AFTER CREATING THIS FILE THEN RUN terraform init 

# you can "create" or "read" resources in vault

# To create resource in vault you can define
# resource "" "name" {
  
# }


# To read resource in vault you can define
# data "" "example {

# }