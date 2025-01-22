# Mobile Application Backend Deployment

## Introduction
This repository contains the backend for a mobile application, designed to be deployed in a secure and scalable manner. The backend provides a set of APIs for the mobile application to communicate with. The deployment leverages **Railway.app** as the cloud provider and includes a CI/CD pipeline for automated deployments using GitHub Actions.

## Features
- Secure and scalable deployment using Railway.app.
- CI/CD pipeline for seamless updates and automated deployments.
- Dockerized backend for consistent build and runtime environments.

---

## Setup Instructions

### Prerequisites
To set up and deploy this project, ensure you have the following installed:
- **Docker**
- **Railway CLI** ([Installation Guide](https://docs.railway.app/cli/installation))
- A GitHub repository with secrets configured (details below).

### Local Setup
1. Clone this repository:
   ```bash
   git clone git@github.com:flightman69/shavok.git
   cd shavok
   ```

2. Build the Docker image locally:
   ```bash
   docker build -t your-backend .
   ```

3. Run the backend locally:
   ```bash
   docker run -p 5000:5000 your-backend
   ```
   Access the API at `http://localhost:5000`.

---

## Deployment Details

### Railway Deployment

1. **Initial Setup**:
   - Create a new project on [Railway.app](https://railway.app/).
   - Link your GitHub repository to Railway.
   - Configure the project to use the provided `Dockerfile` for builds.

2. **Environment Configuration**:
   - Add any required environment variables directly via the Railway dashboard (if needed).

3. **Deployment**:
   - Push your code to the `master` branch, and Railway will automatically build and deploy the backend.

4. **Access**:
   - Your application will be accessible at the domain provided by Railway (e.g., `https://yourapp.railway.app`).

---

### CI/CD Pipeline

The project uses GitHub Actions for CI/CD. The pipeline is triggered on every push to the `master` branch.

#### GitHub Actions Workflow
```yaml
name: CI/CD Pipeline

on:
  push:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Setup Docker
        uses: docker/setup-buildx-action@v2

      - name: Build Docker Image
        run: docker build -t your-backend .

      - name: Install Railway CLI
        run: |
          bash <(curl -fsSL cli.new)

      - name: Deploy to Railway.app
        env:
          RAILWAY_TOKEN: ${{ secrets.RAILWAY_TOKEN }}
        run: |
          railway up --ci
```

#### Setting Up Secrets
1. Go to your GitHub repository.
2. Navigate to **Settings > Secrets and variables > Actions**.
3. Add a new secret:
   - Name: `RAILWAY_TOKEN`
   - Value: Your Railway project token.

---

## Infrastructure Design

### Security
- **No Hardcoded Secrets**: All sensitive data (e.g., Railway token) is stored securely in GitHub Secrets.
- **HTTPS by Default**: Railway provides HTTPS for all deployed applications.

### Scalability
- **Horizontal Scaling**: Railway supports deploying multiple replicas (Pro plan required).
- **Vertical Scaling**: Increase vCPU and memory allocation as needed.

---

## API Details

### Endpoints
| Method | Endpoint       | Description              |
|--------|----------------|--------------------------|
| GET    | `/healthcheck` | Check API health status. |
| POST   | `/login`       | User login.              |
| GET    | `/data`        | Fetch application data.  |

### Example Request
#### `/healthcheck`
```bash
curl -X GET https://yourapp.railway.app/healthcheck
```
#### Response
```json
{
  "status": "ok"
}
```

---

## Final Validation
1. Make a small code change (e.g., modify an API response).
2. Push the changes to the `master` branch.
3. Verify the CI/CD pipeline triggers a new deployment.
4. Confirm the updated API is live at the Railway domain.

---

## Conclusion
This project demonstrates a secure, scalable, and automated deployment process for a mobile application backend. By leveraging Railway.app and GitHub Actions, updates can be deployed seamlessly while maintaining a robust infrastructure.

For any issues or queries, feel free to open an issue in this repository.

