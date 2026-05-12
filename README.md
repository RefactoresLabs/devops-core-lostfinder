# Lost Finder - Infrastructure & Core

Este repositório centraliza a infraestrutura como código (IaC), configurações de containerização e o esqueleto da aplicação **Lost Finder**. A arquitetura é baseada em micro-serviços utilizando **Flask** (Backend) e **Vue.js** (Frontend), com suporte a uma stack completa de observabilidade.

## Estrutura do Repositório

A organização das pastas segue o fluxo de separação entre ambientes (Dev/Prod):

* **`infrastructure/`**: Orquestração da infraestrutura.
    * `docker/`: Contém os `Dockerfiles` otimizados para cada serviço e ambiente.
* **`tests/`**: Suíte de testes automatizados utilizando **Cypress**.
* **`.github/`**: Workflows de CI/CD para automação de deploy.

---

## Tecnologias Utilizadas

* **Frontend**: Vue.js + Tailwind CSS
* **Backend**: Python Flask + SQLAlchemy
* **Banco de Dados**: Supabase 
* **Infraestrutura**: Docker & Terraform
* **Observabilidade**: Grafana, Loki e Prometheus 
