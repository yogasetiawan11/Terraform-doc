output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_ec2_instance.First_module.public_ip
}

# Explanation:
# aws_ec2_instance    => enter your resource type here that you get from main.tf
# First_module    => enter your resource name here that you get from main.tf
# public_ip    => Enter the specific output that you want to display