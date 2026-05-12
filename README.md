# Lost Finder - Infrastructure & Core

Este repositório centraliza a infraestrutura como código (IaC), configurações de containerização e o esqueleto da aplicação **Lost Finder**. A arquitetura é baseada em microserviços utilizando **Flask** (Backend) e **Vue.js** (Frontend), com suporte a uma stack completa de observabilidade.

## Estrutura do Repositório

A organização das pastas segue o fluxo de separação entre ambientes:

* **`infrastructure/`**: Orquestração da infraestrutura.
* `docker/`: Contém os `Dockerfiles` otimizados para cada serviço e ambiente.
* `docker/backend`: Contém o `Dockerfile` para montar o backend, configurar o Python e comandos.
* `docker/frontend`: Contém o `Dockerfile` para montar o frontend, configurar o Node e comandos.
---

## Tecnologias Utilizadas

* **Frontend**: Vue.js + Tailwind CSS
* **Backend**: Python Flask + SQLAlchemy
* **Banco de Dados**: PostgreSQL
* **Infraestrutura**: Docker
* **Observabilidade**: Grafana, Loki e Prometheus

---

## Como Rodar o Ambiente de Desenvolvimento

Siga os passos abaixo para subir a aplicação localmente:

1. **Clone o repositório:**
```bash
git clone https://github.com/RefactoresLabs/devops-lost-finder.git
cd devops-lost-finder

```


2. **Rode o arquivo `run_linux_or_mac.sh` ou `run_windows.ps1` caso não tenha os repositórios do frontend ou backend:**
No Linux ou Mac:
```bash
chmod +x run_linux_or_mac.sh
./run_linux_or_mac.sh

```


No Windows:
```powershell
.\run_windows.ps1

```



2.1 **Rode o arquivo `docker-compose.yml` caso já tenha os repositórios do frontend e backend:**
`bash docker-compose up -d `

3. **Acesse os serviços:**
* **Frontend**: `http://localhost:5173`
* **Backend (API)**: `http://localhost:5000`
* **Grafana**: `http://localhost:3000`



---

## Ambiente de Desenvolvimento

Em desenvolvimento, a aplicação é executada via Docker e utiliza os seguintes arquivos para configurações:

* **`docker-compose.yml`**: Gera a infraestrutura no Docker usando os `Dockerfiles` em `docker/frontend` e `docker/backend`, além de subir o banco de dados.
* **`loki-config.yml`**: Configurações para o container do Loki.
* **`prometheus.yml`**: Configurações para o container do Prometheus.

No `docker-compose.yml`, você pode modificar as variáveis de conexão do banco de dados. Mofique apenas os valores.
