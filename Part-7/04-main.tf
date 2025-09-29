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

resource "vault_kv_secret_v2" "example" {
  mount               = "secret"        # This is the path where the KV engine is mounted
  name                = "test-secret"   # Name of the secret
}

resource "aws" "example" {
  ami = "ami-0c55b159cbfafe1f0"  # Example AMI ID
  instance_type = "t2.micro"

  tags {
    name = "test"
    Secret = data.vault_kv_secret_v2.example.data["samsul"]  # samsul is the key name inside "test-secret"
  }
}

# AFTER CREATING THIS FILE THEN RUN terraform apply    to create resources in vault and aws