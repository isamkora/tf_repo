cidr_blocks = [
  {
    vpc        = "10.0.0.0/16",
    subnet-pub = "10.0.1.0/24",
    subnet-pri = "10.0.2.0/24"
  } #0
]

name_tags = [
  {
    vpc        = "dev-vpc",
    subnet-pub = "dev-public",
    subnet-pri = "dev-private"
    igw        = "dev-igw"
    rt         = "dev-rt"
  }
]

region = [
  {
    main_acc   = "us-east-1",
    subnet1_AZ = "us-east-1a",
    subnet2_AZ = "us-east-1a"
  }
]

