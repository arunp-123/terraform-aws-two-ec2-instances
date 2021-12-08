provider "aws" {
  region     = "us-east-2"
  access_key = "enter your access key"
  secret_key = "enter your secret key"
}

provider "aws" {
  region     = "us-east-1"
  access_key = "enter your access key"
  secret_key = "enter your secret key"
  alias      = "useast1"
}


resource "aws_instance" "us-east-2" {
  ami           = "ami-020db2c14939a8efb"
  instance_type = "t2.micro"
  tags = {
    Name = "Ec2 instance created by terraform"
  }
}

resource "aws_instance" "us-east-1" {
  ami           = "ami-061ac2e015473fbe2"
  instance_type = "t2.micro"
  provider      = aws.useast1
  tags = {
    Name = "Ec2 us-east-1 instance created by terraform"
  }
}
:wq
