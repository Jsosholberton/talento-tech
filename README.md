# Talento Tech

This repository is a personal challenge to create all the infrastructure listed on talent tech labs using terraform.

## Pre requirements

AWS CLI must be configured with the credentials of the account that will be used to create the resources.

## Requirements

- Terraform
- AWS CLI
- Make

## How to run

1. Clone the repository

    ```bash
    git clone https://github.com/Jsosholberton/talento-tech
    ```

2. Go to the subfolders that starts with `devilerable`

3. Create the dist for lambda functions

    ```bash
    make node_pkg
    ```

4. Initialize Terraform

   Select environment workspace, default is the initial, choose either development or production

    ```bash
    make change_development
    ```

    ```bash
    make change_production
    ```

   Deploy terraform infrastructure

    ```bash
    make init
    ```

    ```bash
    make plan
    ```

    ```bash
    make apply
    ```

5. Destroy Terraform infrastructure

    ```bash
    make destroy
    ```