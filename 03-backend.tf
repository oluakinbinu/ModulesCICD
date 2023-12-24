terraform {
  backend "s3" {
    # replace with your bucket name for your state file location 
    bucket = "ado-user-class5-1231230120i312i31"
    # replace with what you want to name your state file
    key = "moduleexamplestatefile.tfstate"
    # replace with the region of the bucket
    region = "eu-west-1"
  
  }
}