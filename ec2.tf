resource "aws_instance" "testing-terraform" {
 # ami differs for region
 ami     = "ami-0af25d0df86db00c1"
 count=1
 key_name = "mumbai-key"
 instance_type = "t2.micro"
 security_groups= ["security-test-port-2"]
 tags= {
    Name = "testinstance"
      }
   }

resource "aws_security_group" "security-test-port-2" {
 name        = "security-test-port-2"
 description = "sg for ec2"

#inbound for ec2
  ingress {
    from_port  = 8080
    to_port    = 8080
    protocol   = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
                }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
                }
 #outbound from ec2
   egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
                }
  tags= {
        Name = "security-test-port-2"
        }
  }
