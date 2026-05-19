# LostFinder Architecture

## Overview

LostFinder is a cloud-native lost and found management platform designed using modern DevOps, observability, and infrastructure-as-code practices.

The architecture follows a distributed containerized model using Docker Compose, with monitoring, centralized logging, metrics collection, and automated infrastructure provisioning using Terraform.

---

# High-Level Architecture

```text
                    ┌────────────────────┐
                    │      Users         │
                    └─────────┬──────────┘
                              │
                              ▼
                    ┌────────────────────┐
                    │       Nginx        │
                    │ Reverse Proxy/API  │
                    └─────────┬──────────┘
                              │
               ┌──────────────┴──────────────┐
               ▼                             ▼
    ┌──────────────────┐         ┌──────────────────┐
    │   Vue Frontend   │         │   Flask Backend  │
    │     (Vite)       │         │      REST API    │
    └──────────────────┘         └────────┬─────────┘
                                          │
                                          ▼
                                ┌──────────────────┐
                                │     Supabase     │
                                │ PostgreSQL Cloud │
                                └──────────────────┘
```

---

# Observability Stack

```text
                 ┌────────────────────┐
                 │     Promtail       │
                 │ Log Collection     │
                 └─────────┬──────────┘
                           │
                           ▼
                 ┌────────────────────┐
                 │       Loki         │
                 │ Centralized Logs   │
                 └─────────┬──────────┘
                           │
                           ▼
                 ┌────────────────────┐
                 │      Grafana       │
                 │ Dashboards/Logs    │
                 └────────────────────┘


                 ┌────────────────────┐
                 │   Flask Metrics    │
                 │ prometheus_export  │
                 └─────────┬──────────┘
                           │
                           ▼
                 ┌────────────────────┐
                 │    Prometheus      │
                 │ Metrics Scraping   │
                 └─────────┬──────────┘
                           │
                           ▼
                 ┌────────────────────┐
                 │      Grafana       │
                 │ Metrics Analysis   │
                 └────────────────────┘
```

---

# Infrastructure Components

| Component | Responsibility |
|---|---|
| Vue.js + Vite | Frontend SPA |
| Flask | Backend REST API |
| Supabase | Managed PostgreSQL Database |
| Docker Compose | Container orchestration |
| Nginx | Static serving and reverse proxy |
| Prometheus | Metrics collection |
| Grafana | Visualization dashboards |
| Loki | Log aggregation |
| Promtail | Log shipping |
| Terraform | Infrastructure provisioning |
| AWS EC2 | Cloud compute infrastructure |

---

# Container Architecture

```text
docker-compose
│
├── frontend
│   └── Nginx + Vue Build
│
├── backend
│   └── Flask API
│
├── prometheus
│   └── Metrics Collection
│
├── grafana
│   └── Dashboards
│
├── loki
│   └── Log Storage
│
└── promtail
    └── Log Forwarding
```

---

# Infrastructure as Code (Terraform)

Terraform provisions:

- EC2 instance
- Security groups
- Networking rules
- Server bootstrap
- Docker installation
- Automatic application deployment

Terraform Files:

```text
terraform/
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── ec2.tf
├── security-groups.tf
├── terraform.tfvars
└── user-data.sh
```

---

# Deployment Flow

```text
Developer Push
        │
        ▼
 GitHub Repository
        │
        ▼
 Terraform Provisioning
        │
        ▼
 AWS EC2 Instance
        │
        ▼
 user-data.sh
        │
        ▼
 Docker Compose
        │
        ▼
 Running Containers
```

---

# Monitoring Flow

```text
Flask Metrics
      │
      ▼
Prometheus
      │
      ▼
Grafana Dashboards
```

---

# Logging Flow

```text
Docker Container Logs
           │
           ▼
       Promtail
           │
           ▼
         Loki
           │
           ▼
       Grafana
```

---

# Security

Current security measures include:

- Docker container isolation
- Environment variables for secrets
- AWS Security Groups
- Reverse proxy architecture
- Managed database via Supabase

Future improvements:

- HTTPS/TLS
- Nginx SSL termination
- WAF
- IAM hardening
- Secrets Manager
- Private subnets

---

# Scalability Strategy

Current architecture supports future migration toward:

- Microservices
- Kubernetes
- ECS/EKS
- CI/CD pipelines
- Load balancing
- Auto scaling
- Distributed monitoring

The project currently follows a transitional architecture approach aligned with the Strangler Fig pattern.

---

# DevOps Practices

Implemented practices:

- Infrastructure as Code
- Containerization
- Centralized Logging
- Metrics Monitoring
- Automated Provisioning
- Environment Isolation
- Cloud Deployment

Planned practices:

- CI/CD with GitHub Actions
- Blue-Green Deployments
- Automated Backups
- Canary Releases
- Distributed Tracing

---

# Future Improvements

- SSL/TLS certificates
- Custom domain
- Kubernetes migration
- Redis caching
- API Gateway
- Message queues
- OpenTelemetry tracing
- Alerting system
- Multi-environment deployment

---

# Conclusion

LostFinder was designed as a modern cloud-native platform combining software engineering, DevOps, observability, and infrastructure automation practices.

The architecture emphasizes:

- scalability
- maintainability
- monitoring
- automation
- modularity
- cloud readiness

while remaining lightweight enough for academic and portfolio purposes.