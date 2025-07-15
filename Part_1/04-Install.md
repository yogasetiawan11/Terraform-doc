# Install Terraform in MacOS
Run this command in Package manager:
```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```
# Install Terraform in Linux (Ubuntu/Debian)
Run this command in Package manager:
```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

Install Terraform in different OS (mac, window, linux) Official Documentation : [Click to the Page](https://developer.hashicorp.com/terraform/install)