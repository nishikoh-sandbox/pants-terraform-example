# [pants] terraform example

## terraform apply from changed files

pants can find which files have changed since a certain commit.

```bash
$pants --changed-since=54795b7d3688c98f --changed-dependents=transitive experimental-deploy 

22:59:38.45 [INFO] Deploying targets...
module.name.random_id.id: Refreshing state... [id=5JAAEz9cu_Q]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # module.name.random_id.id must be replaced
-/+ resource "random_id" "id" {
      ~ b64_std     = "5JAAEz9cu/Q=" -> (known after apply)
      ~ b64_url     = "5JAAEz9cu_Q" -> (known after apply)
      ~ byte_length = 8 -> 7 # forces replacement
      ~ dec         = "16469663919961324532" -> (known after apply)
      ~ hex         = "e49000133f5cbbf4" -> (known after apply)
      ~ id          = "5JAAEz9cu_Q" -> (known after apply)
        # (1 unchanged attribute hidden)
    }

Plan: 1 to add, 0 to change, 1 to destroy.
╷
│ Warning: Version constraints inside provider configuration blocks are deprecated
│ 
│   on ../../module/random.tf line 2, in provider "random":
│    2:   version = "3.6.2"
│ 
│ Terraform 0.13 and earlier allowed provider version constraints inside the provider configuration block, but that is now deprecated and will be removed in a future version of
│ Terraform. To silence this warning, move the provider version constraint into the required_providers block.
╵

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.name.random_id.id: Destroying... [id=5JAAEz9cu_Q]
module.name.random_id.id: Destruction complete after 0s
module.name.random_id.id: Creating...
module.name.random_id.id: Creation complete after 0s [id=tEgpIWKqMw]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
module.name.random_id.id: Refreshing state... [id=q76RkCfiV3A]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # module.name.random_id.id must be replaced
-/+ resource "random_id" "id" {
      ~ b64_std     = "q76RkCfiV3A=" -> (known after apply)
      ~ b64_url     = "q76RkCfiV3A" -> (known after apply)
      ~ byte_length = 8 -> 7 # forces replacement
      ~ dec         = "12375488874391164784" -> (known after apply)
      ~ hex         = "abbe919027e25770" -> (known after apply)
      ~ id          = "q76RkCfiV3A" -> (known after apply)
        # (1 unchanged attribute hidden)
    }

Plan: 1 to add, 0 to change, 1 to destroy.
╷
│ Warning: Version constraints inside provider configuration blocks are deprecated
│ 
│   on ../../module/random.tf line 2, in provider "random":
│    2:   version = "3.6.2"
│ 
│ Terraform 0.13 and earlier allowed provider version constraints inside the provider configuration block, but that is now deprecated and will be removed in a future version of
│ Terraform. To silence this warning, move the provider version constraint into the required_providers block.
╵

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.name.random_id.id: Destroying... [id=q76RkCfiV3A]
module.name.random_id.id: Destruction complete after 0s
module.name.random_id.id: Creating...
module.name.random_id.id: Creation complete after 0s [id=DFRLKl4sLg]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.

✓ infra/terraform/app/bar:deploy deployed
✓ infra/terraform/app/foo:deploy deployed
```

```bash
pants --changed-since=d4c480294ef348a4f8ef48df103d8fac34aeac45 --changed-dependents=transitive experimental-deploy 

23:08:51.67 [INFO] Deploying targets...
module.name.random_id.id: Refreshing state... [id=DFRLKl4sLg]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # module.name.random_id.id must be replaced
-/+ resource "random_id" "id" {
      ~ b64_std     = "DFRLKl4sLg==" -> (known after apply)
      ~ b64_url     = "DFRLKl4sLg" -> (known after apply)
      ~ dec         = "3470381530623022" -> (known after apply)
      ~ hex         = "0c544b2a5e2c2e" -> (known after apply)
      ~ id          = "DFRLKl4sLg" -> (known after apply)
      ~ keepers     = { # forces replacement
          ~ "inpput_text" = "hello" -> "helloooo"
        }
        # (1 unchanged attribute hidden)
    }

Plan: 1 to add, 0 to change, 1 to destroy.
╷
│ Warning: Version constraints inside provider configuration blocks are deprecated
│ 
│   on ../../module/random.tf line 2, in provider "random":
│    2:   version = "3.6.2"
│ 
│ Terraform 0.13 and earlier allowed provider version constraints inside the provider configuration block, but that is now deprecated and will be removed in a future version of
│ Terraform. To silence this warning, move the provider version constraint into the required_providers block.
╵

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.name.random_id.id: Destroying... [id=DFRLKl4sLg]
module.name.random_id.id: Destruction complete after 0s
module.name.random_id.id: Creating...
module.name.random_id.id: Creation complete after 0s [id=gVNOVOh7rg]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.

✓ infra/terraform/app/foo:deploy deployed
```