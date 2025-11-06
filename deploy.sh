#!/bin/bash

# AWS Account Factory for Terraform (AFT) Deployment Script
# This script deploys the AFT solution using the aws-ia/terraform-aws-control_tower_account_factory module

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting AWS AFT Deployment...${NC}"

# Check prerequisites
echo -e "${YELLOW}Checking prerequisites...${NC}"

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo -e "${RED}AWS CLI is not installed. Please install it first.${NC}"
    exit 1
fi

# Check if Terraform is installed
if ! command -v terraform &> /dev/null; then
    echo -e "${RED}Terraform is not installed. Please install it first.${NC}"
    exit 1
fi

# Check AWS credentials
if ! aws sts get-caller-identity &> /dev/null; then
    echo -e "${RED}AWS credentials not configured. Please run 'aws configure' first.${NC}"
    exit 1
fi

echo -e "${GREEN}Prerequisites check passed!${NC}"

# Initialize Terraform
echo -e "${YELLOW}Initializing Terraform...${NC}"
terraform init

# Validate Terraform configuration
echo -e "${YELLOW}Validating Terraform configuration...${NC}"
terraform validate

# Plan deployment
echo -e "${YELLOW}Creating Terraform plan...${NC}"
terraform plan -out=tfplan

# Ask for confirmation
echo -e "${YELLOW}Do you want to apply the Terraform plan? (y/N):${NC}"
read -r response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    echo -e "${YELLOW}Applying Terraform configuration...${NC}"
    terraform apply tfplan
    echo -e "${GREEN}AFT deployment completed successfully!${NC}"
else
    echo -e "${YELLOW}Deployment cancelled.${NC}"
    rm -f tfplan
fi

echo -e "${GREEN}Script execution completed.${NC}"