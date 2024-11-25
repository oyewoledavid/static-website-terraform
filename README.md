# Static Website with Terraform

This repository contains the code and configuration files to deploy a static website using Terraform. The website is hosted on AWS S3 and served through AWS CloudFront for better performance and security.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Architecture](#architecture)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [Contributing](#contributing)

## Introduction

This project demonstrates how to use Terraform to automate the deployment of a static website. By leveraging AWS services like S3 and CloudFront, we can ensure that the website is highly available, scalable, and secure.

## Prerequisites

Before you begin, ensure you have the following:

- An AWS account
- Terraform installed on your local machine
- AWS CLI configured with your credentials

## Architecture

The architecture of the static website includes:

- **AWS S3**: To store the static website files.
- **AWS CloudFront**: To distribute the content globally with low latency.
- **Route 53** (optional): For domain name management.

## Setup Instructions

Follow these steps to set up the project:

1. **Clone the repository**:
    ```sh
    git clone https://github.com/your-username/static-website-terraform.git
    cd static-website-terraform
    ```

2. **Initialize Terraform**:
    ```sh
    terraform init
    ```

3. **Configure your variables**:
    Update the `variables.tf` file with your desired values.

4. **Plan the deployment**:
    ```sh
    terraform plan
    ```

5. **Apply the configuration**:
    ```sh
    terraform apply
    ```

6. **Upload your website files to S3**:
    ```sh
    aws s3 sync ./website s3://your-s3-bucket-name
    ```

## Usage

After deployment, your static website will be accessible via the CloudFront distribution URL. If you configured Route 53, it will be accessible via your custom domain.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes. Ensure that your code adheres to the project's coding standards.

