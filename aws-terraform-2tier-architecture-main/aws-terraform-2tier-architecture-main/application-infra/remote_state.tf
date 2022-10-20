terraform {
  backend "s3" {
    encrypt = true
    bucket  = "myterraformbucketchandu"
    key     = "demo-key"
    region  = "eu-central-1"
    profile = "default"
    access_key = ""
    secret_key = "" 
  
  }

}
