# Sahil Mangal - Cloud Portfolio & Resume Website

Welcome to the repository for my personal cloud portfolio website, live at **[www.sahilmangal.com](https://www.sahilmangal.com)**.

This project showcases a serverless, cloud-native architecture deployed on **Microsoft Azure**, fully provisioned using **Terraform (Infrastructure as Code)** and deployed automatically via **GitHub Actions (CI/CD)**.

---

## 🏗️ Architecture Overview

* **Infrastructure as Code (IaC):** Azure infrastructure provisioned declaratively with **Terraform**.
* **Frontend:** Responsive web interface using HTML5, CSS3, and JavaScript hosted on **Azure Static Web Apps**.
* **Backend API:** Serverless Node.js Azure Function endpoint serving dynamic backend data (e.g., certifications).
* **CI/CD Pipeline:** Automated deployment workflow executed through **GitHub Actions** (`Static-web-app.yml`).

---

## 🛠️ Tech Stack & Tools

* **Cloud Provider:** Microsoft Azure
* **IaC:** Terraform (`main.tf`, `.terraform.lock.hcl`)
* **Frontend:** HTML5, CSS3 (`style.css`), JavaScript
* **API / Serverless:** Azure Functions (`API/certifications`)
* **CI/CD:** GitHub Actions (`.github/workflows/Static-web-app.yml`)
* **Workspace:** VS Code (`Terraform_Labs.code-workspace`)

---

## 📂 Project Structure

```text
Azure Website/
└── Azure_Personal/
    ├── .github/
    │   └── workflows/
    │       └── Static-web-app.yml     # GitHub Actions workflow for automated deployment
    ├── my-agent/                      # AI Agent/bot integrations
    │   └── skills/
    │       └── joke/
    ├── My-website/                    # Core web application code
    │   ├── API/                       # Azure Functions API implementation
    │   │   ├── certifications/        # Serverless API endpoint
    │   │   │   ├── function.json
    │   │   │   └── index.js
    │   │   ├── host.json
    │   │   └── package.json
    │   ├── index.html                 # Main website markup
    │   ├── style.css                  # Custom styles
    │   └── Pro_photo.jpg              # Profile image asset
    ├── .gitignore
    ├── main.tf                        # Terraform configuration file for Azure
    ├── .terraform.lock.hcl            # Terraform dependency lock file
    └── README.md                      # Documentation
```

---

## 🚀 Deployment & Local Development

### Prerequisites
1. [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and authenticated.
2. [Terraform CLI](https://developer.hashicorp.com/terraform/downloads) installed.
3. [Node.js](https://nodejs.org/) installed (for local Azure Functions development).

### Provisioning Infrastructure
To deploy or modify the Azure resources via Terraform:

```bash
# Initialize working directory
terraform init

# Review execution plan
terraform plan -out=tfplan

# Apply infrastructure changes
terraform apply "tfplan"
```

### CI/CD Workflow
Every push to the main/working branch triggers the GitHub Actions workflow defined in `.github/workflows/Static-web-app.yml`, automatically building and deploying the frontend assets and serverless API endpoints to Azure.

---

## 🌐 Links

* **Live Site:** [www.sahilmangal.com](https://www.sahilmangal.com)
* **GitHub Repository:** [Sahil-000/Personal_website](https://github.com/Sahil-000/Personal_website/tree/Azure_Resume)
