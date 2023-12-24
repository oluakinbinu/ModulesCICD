
 
module "ec2_app" {
   source = "./modules/ec2"
 
   workspace = var.workspace
   workspace_role = "app"
   instance_size = "t2.small"
   instance_ami = var.instance_ami
    instance_root_device_size = 12 # Optional
}
module "ec2_worker" {
   source = "./modules/ec2"
 
   workspace = var.workspace
   workspace_role = "worker"
   instance_size = "t3.large"
   instance_ami = var.instance_ami
   instance_root_device_size = 50
}