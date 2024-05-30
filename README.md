# Todo App with AWS Elastic Beanstalk

This project is a simple Todo app where users can register with their email addresses, create, edit, and delete Todo items. The application is deployed using AWS Elastic Beanstalk and utilizes various AWS services such as Amazon S3 for storing application files, MongoDB for the database, and a standard VPC setup with public and private subnets along with a NAT gateway.

## Technologies Used
<p align="center">
  <img src="screenshots/eb.svg" alt="Elastic Beanstalk" width="50" style="margin-right: 10px;"/>
  <img src="screenshots/S3.svg" alt="Amazon S3" width="50" style="margin-right: 10px;"/>
  <img src="screenshots/mongodb.png" alt="MongoDB" width="50" style="margin-right: 10px;"/>
  <img src="screenshots/terraform.svg" alt="Terraform" width="50" style="margin-right: 10px;"/>
  <img src="screenshots/nodejs.svg" alt="NodeJS" width="50"/>
</p>

- **AWS Elastic Beanstalk**: Deploys and manages the application.
- **Amazon S3**: Stores zip files of the application.
- **MongoDB**: Serves as the database for the application.

## Getting Started

Before deploying the app, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) 
- [Node.js](https://nodejs.org/en/download/) 
- [MongoDB](https://www.mongodb.com/try/download/community)
- [AWS CLI](https://aws.amazon.com/cli/) 

## Setup Instructions

1. **Clone the repository**

    ```sh
    git clone https://github.com/Andriizachepilo/Elasticbeanstalk-WebServer
    ```

2. **Create a `.env` file**

    Navigate to the `app/` directory and create a `.env` file based on the `.env.example` file. Update the MongoDB URL as required.

    ```sh
    cd app
    cp .env.example .env
    ```

    **Example `.env` file:**

    ```env
    MONGODB_URL=mongodb://your-mongodb-url:port/dbname
    ```

3. **Check Terraform variables**

    Review the `terraform.tfvars` file settings. Refer to the screenshot located at `screenshots/tfvars.png` for an example configuration.

    ```sh
    # Open the terraform.tfvars file and set the necessary variables
    nano ../terraform/terraform.tfvars
    ```

4. **Create a Key Pair for Elastic Beanstalk**

    You need a key pair to access the instances created by Elastic Beanstalk.

5. **Create IAM User and Service Role**

    An IAM user and service role will be created to allow Elastic Beanstalk to use EC2 instances, S3 bucket, and other resources.

6. **Run the deployment script**

    Run the `test-and-deploy` script to check the MongoDB connection, package the application, and deploy it using Terraform.

    ```sh
    ./test-and-deploy
    ```

## Project Architecture

- **Elastic Beanstalk**: Deploys the application along with Load Balancer, Autoscaling Group, and optionally CloudFormation stack for resource management.
- **Amazon S3**: Stores zip files containing application code.
- **MongoDB**: Database for storing Todo items.
- **VPC**: Configured with public and private subnets along with a NAT gateway.
- **CloudWatch**: Monitors CPU utilization and other metrics.

## Additional Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [Node.js Documentation](https://nodejs.org/en/docs/)
- [MongoDB Documentation](https://docs.mongodb.com/)
- [AWS CLI Documentation](https://aws.amazon.com/documentation/cli/)
