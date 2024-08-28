# main.tf

# Define the module
module "example_module" {
  source = "./example_module"

  # Module variables
  variable_1 = "value_1"
  variable_2 = "value_2"
}

# Resource definition outside the module
resource "aws_instance" "example_instance" {
  instance_type = "t2.micro"
  ami           = "ami-0c94855ba95c71c99"
  tags = {
    git_commit           = "19210fca42d086e7942ad75f45a18537a976232d"
    git_file             = "maiinnn.tf"
    git_last_modified_at = "2024-08-28 00:47:49"
    git_last_modified_by = "imtariq@shockers.wichita.edu"
    git_modifiers        = "imtariq"
    git_org              = "IT-Test-Org"
    git_repo             = "Vuln-Files-Repo"
    yor_name             = "example_instance"
    yor_trace            = "17437b33-a4ed-4b61-9585-94bca30e282b"
  }
}

# Output values
output "instance_id" {
  value = aws_instance.example_instance.id
}
