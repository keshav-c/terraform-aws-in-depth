# Starter Project

## What to do?

```sh
tofu init

aws sso ...

tofu plan -out plan.tfplan

tofu apply
```

## Rollback (destroy)

```sh
tofu plan -destroy -out plan.tfplan

tofu apply "plan.tfplan"
```

## Why can't connect using instance connect (ssh)

1. Default Security Group: In your main.tf, the aws_instance resource doesn't specify any security groups. When this happens, AWS assigns the default security group of your default VPC to the instance.
2. Default Rules: A default security group typically has restrictive inbound rules. It usually does not have a rule to allow inbound SSH (port 22) traffic from the specific IP addresses that the EC2 Instance Connect service uses.
3. The Fix: To resolve this, you need to:

- Create a new aws_security_group resource in your Terraform code.
- Add an ingress (inbound) rule to this security group that allows traffic on TCP port 22.
- Crucially, the source of this traffic should be the IP address range for the EC2 Instance Connect service in your region (ap-south-1).
- Attach this new security group to your EC2 instance.

## Finding the AMI

Book uses an AMI owned by the ubuntu company. For that is set the `aws_ami.owners` in the lookup to the AWS ID of the Canonical (Ubuntu) company. Google search for "Official aws account id for ubuntu amis" returns that same id. In the aws web console also we can search for images.

## Upgrading modules

After updating module code locally and publishing (to github), I want to use the updated modules in the main module (_example_). But running `tofu init` followed by `tofu plan` throws an error saying the changes were not recognised.

To solve this run `tofu init -upgrade`. This tells tofu to upgrade its modules. This is followed by the usual steps of `plan` and `apply`.

## env

AWS_PROFILE=

## Other

The nodejs tool-version is there for gemini cli
