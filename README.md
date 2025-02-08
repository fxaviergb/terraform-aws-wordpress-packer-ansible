# Wordpress Infrastructure Deployment

## Prerequisites
To set up and deploy the infrastructure, ensure you have the following tools installed on your system:

### Windows
- [Packer](https://developer.hashicorp.com/packer/downloads)
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [PowerShell](https://learn.microsoft.com/en-us/powershell/)

### macOS
- [Packer](https://developer.hashicorp.com/packer/downloads) (`brew install packer` recommended)
- [Terraform](https://developer.hashicorp.com/terraform/downloads) (`brew install terraform` recommended)
- Terminal (default macOS terminal or iTerm2)

### Linux
- [Packer](https://developer.hashicorp.com/packer/downloads)
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- Shell (e.g., Bash, Zsh)

Verify installation by running the following commands:
```bash
packer --version
terraform --version
```

---

## Manual Installation

### Step 1: Build AMIs using Packer
#### Wordpress AMI
```bash
packer validate packer.json
packer build packer.json
```
**Result example:** `us-east-1: ami-001f5550f42d325bf`

Copy the generated AMI ID into `terraform.tfvars`:
```hcl
wordpress_ami = "ami-0d14ce8c8e6da613d"
```

### Step 2: Deploy Infrastructure using Terraform
Navigate to the `terraform` directory:
```bash
cd ../terraform
```

#### Initialize Terraform
```bash
terraform init
```

#### Plan and Apply Changes
```bash
terraform plan
terraform apply -auto-approve
```

#### Verify Outputs
Check the outputs in terminal. For example:
```bash
Apply complete! Resources: 21 added, 0 changed, 0 destroyed.

Outputs:

lb_dns = "wordpress-lb-1210810691.us-east-1.elb.amazonaws.com"
nat_gateway_public_ip = "44.216.159.168"
private_ips = [
  "10.0.0.19",
]
public_ips = [
  "54.226.23.227",
]
```

#### Destroy Infrastructure
When finished, clean up resources:
```bash
terraform destroy -auto-approve
```

---