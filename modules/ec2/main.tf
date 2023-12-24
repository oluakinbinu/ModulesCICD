#EC2 Instance
resource "aws_instance" "web_app_1" {

  ami           = var.instance_ami
  instance_type = var.instance_size

  root_block_device {
    volume_size = var.instance_root_device_size
    volume_type = "gp3"
  }

  tags = {
    Name        = "Web-${var.workspace}-App"
    Role        = var.workspace_role
    Project     = "CloudSec.io"
    Environment = var.workspace
    ManagedBy   = "terraform"
  }
 
} 

resource "aws_eip" "web_app_addr" {

  vpc      = true
 
  lifecycle {
    prevent_destroy = false
  }
 
  tags = {
    Name        = "Web-${var.workspace}-App"
    Role        = var.workspace_role
    Project     = "CloudSec.io"
    Environment = var.workspace
    ManagedBy   = "terraform"
  }
}
 
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web_app_1.id
  allocation_id = aws_eip.web_app_addr.id
}





