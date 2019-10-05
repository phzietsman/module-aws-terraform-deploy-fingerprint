# module-aws-terraform-deploy-fingerprint

We manage a lot of AWS environments across many git repos and sometimes it can be tricky for figure out what version of your code has been applied to an enviroment. A simple way to keeping track of this is to store the git commit id somewhere when a `terraform apply` gets done. 

This module grabs the git commit id from the calling terraform code and makes it avaible as an output of the modle. This output can be stored as a SSM parameter or in your state file.


## Example Usage

some_terraform.tf
```
module "fingerprint" {
   source = "git::https://github.com/phzietsman/module-aws-terraform-deploy-fingerprint.git?ref=master"
}

resource "aws_ssm_parameter" "fingerprint" {
  name  = "infrastructure_fingerprint"
  type  = "String"
  value = "${module.fingerprint.output}"
}

```

.gitignore
```
commit_id.log
```