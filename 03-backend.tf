terraform {
  backend "s3" {
    # replace with your bucket name for your state file location 
    bucket = "BUCKET NAME"
    # replace with what you want to name your state file
    key = "STATE FILE NAME"
    # replace with the region of the bucket
    region = "eu-west-1"
  
  }
}
