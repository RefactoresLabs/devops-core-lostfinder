# Refactor Labs
---

# Sistema de Achados e Perdidos

Sistema web robusto para registro e recuperação de itens, focado em alta performance, segurança de dados e acessibilidade.

---

## Tecnologias e Padrões de Projeto

### Design Patterns Utilizados
* **DTO (Data Transfer Object):** Otimização do tráfego de dados entre as camadas para garantir carregamento em < 30s.
* **Adapter:** Isolamento do algoritmo **SHA-3** para hashing de senhas e integração com APIs de Storage.
* **Factory:** Criação dinâmica de diferentes tipos de itens (Eletrônicos, Documentos, Pets).
* **Repository:** Abstração da camada de dados para facilitar a manutenção e testes.
* **Observer:** Gerenciamento de temas (Claro/Escuro) e disparos de notificações de itens encontrados.

### Stack Técnica
* **Frontend:** React / Vue.js (Interoperabilidade: Chrome, Edge, Firefox).
* **Backend:** Python.
* **Banco de Dados:** PostgreSQL.
* **Segurança:** Autenticação Básica de API e Hash SHA-3.

---

## DevOps & Observabilidade

Este projeto aplica conceitos modernos de **Infrastructure as Code (IaC)** e **Observability**:

* **Docker & Docker Compose:** Utilizados para paridade de ambiente em Desenvolvimento Local.
* **Terraform:** IaC para provisionamento de infraestrutura em nuvem e configuração do Grafana.
* **CI/CD:** Pipelines via GitHub Actions para automação de testes (Jest/Cypress) e deploy.
* **Monitoramento:** Prometheus + Grafana para garantir que os requisitos de performance sejam cumpridos.

---

## Requisitos Não Funcionais Atendidos

| Requisito | Categoria | Implementação |
| :--- | :--- | :--- |
| **Interoperabilidade** | Acesso | Compatível com Chrome, Firefox e Edge. |
| **Segurança** | Criptografia | Senhas armazenadas com Hash SHA-3. |
| **Desempenho** | Registro | Efetivação de registro em no máximo 15 segundos. |
| **Desempenho** | Listagem | Carregamento de listas em no máximo 30 segundos. |
| **Armazenamento** | Upload | Suporte para imagens de itens de até 10 MB. |
| **Acessibilidade** | UI | Personalização de temas (Claro/Escuro). |

---

## Estrutura de Pastas

```text
├── /infrastructure        # IaC  
|    ├── dev               # monta e configura ambiente de desenvolvimento
|    └── prod              # monta e configura ambiente de produção
├── /tests                 # Camada de Dados (Abstração de Banco e Storage)
|    ├── system            # testes focados no sistema
|    └── integration       # testes focados em integração
├── docker-compose.yml     # Orquestração para Desenvolvimento Local
└── .github/workflows      # Pipelines de CI/CD
```
