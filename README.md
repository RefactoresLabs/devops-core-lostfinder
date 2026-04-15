# Lost Finder - Infrastructure & Core

Este repositório centraliza a infraestrutura como código (IaC), configurações de containerização e o esqueleto da aplicação **Lost Finder**. A arquitetura é baseada em micro-serviços utilizando **Flask** (Backend) e **Vue.js** (Frontend), com suporte a uma stack completa de observabilidade.

## Estrutura do Repositório

A organização das pastas segue o fluxo de separação entre ambientes (Dev/Prod):

* **`infrastructure/`**: Orquestração da infraestrutura.
    * `dev/`: Configurações locais (Docker Compose + Terraform Local).
    * `prod/`: Configurações de nuvem (VPS + Supabase).
    * `docker/`: Contém os `Dockerfiles` otimizados para cada serviço e ambiente.
* **`tests/`**: Suíte de testes automatizados utilizando **Cypress**.
* **`.github/`**: Workflows de CI/CD para automação de deploy.

---

## Tecnologias Utilizadas

* **Frontend**: Vue.js + Tailwind CSS
* **Backend**: Python Flask + SQLAlchemy
* **Banco de Dados**: PostgreSQL (Dev) / Supabase (Prod)
* **Infraestrutura**: Docker & Terraform
* **Observabilidade**: Grafana, Loki e Prometheus 

---

## Como Rodar o Ambiente de Desenvolvimento

Siga os passos abaixo para subir a aplicação localmente:

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/RefactoresLabs/devops-lost-finder.git
    cd devops-lost-finder
    ```

2.  **Suba os containers de desenvolvimento:**
    ```bash
    cd infrastructure/dev
    docker-compose up -d
    ```

3.  **Acesse os serviços:**
    * **Frontend**: `http://localhost:5173`
    * **Backend (API)**: `http://localhost:5000`
    * **Grafana**: `http://localhost:3000`

---

## Ambiente de Produção

Em produção, a aplicação é servida em uma VPS através de um Proxy Reverso (Nginx) e utiliza o **Supabase** como banco de dados gerenciado. O deploy é automatizado via GitHub Actions.

* **Configuração de Infra**: Os arquivos Terraform em `infrastructure/prod` gerenciam os recursos na Cloud.
* **Banco de Dados**: Conexão externa via `DATABASE_URL` configurada nos segredos do ambiente.

---

## Testes

Os testes End-to-End (E2E) garantem a integridade das rotas principais:
```bash
# Dentro da pasta tests
npx cypress open
```
