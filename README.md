# DelphiToHero - Análise do Projeto

Este é um projeto Delphi completo com arquitetura cliente-servidor utilizando o framework Horse para API REST.

## Estrutura do Projeto

### **Servidor (API REST)**
- **Framework**: Horse (framework Delphi para APIs REST)
- **Porta**: 9000
- **Banco de dados**: Firebird (baseado nos arquivos de configuração)
- **Autenticação**: JWT (comentado no código)

### **Cliente (Desktop)**
- **Framework**: VCL (Visual Component Library)
- **Arquitetura**: Router4D para navegação entre páginas
- **Interface**: Desktop application com painéis e navegação

## Módulos do Servidor

### **Entidades (Model/Entity)**
- USERS, CUSTOMERS, COUNTRIES, STATES, CITIES
- COMPANIES, OCCUPATION, AREASEXPERTISE
- BANKACCOUNTS, TYPESBANKACCOUNTS

### **Controllers**
- Controller genérico e específico para cada entidade
- Padrão DAO (Data Access Object)

### **Routers**
- Endpoints REST para cada entidade (CRUD completo)
- Registro automático de rotas

### **Utils**
- Funções utilitárias para:
  - Busca com LIKE em múltiplos campos
  - Ordenação dinâmica
  - Ajuste de GUIDs

## Módulos do Cliente

### **View Components**
- Formulário principal com menu lateral
- Sistema de cores e estilos centralizado
- Navegação entre páginas usando Router4D

### **Páginas**
- Página principal
- Página de usuários
- Template base para formulários

## Características Técnicas

- **Gerenciamento de dependências**: Boss (Delphi package manager)
- **Patterns**: MVC, DAO, Repository
- **Banco de dados**: Firebird com entidades mapeadas
- **REST API**: Endpoints completos para todas as entidades
- **Frontend**: Desktop com navegação modular

O projeto implementa um sistema completo de gestão com backend REST API e frontend desktop, seguindo boas práticas de arquitetura Delphi moderna.
