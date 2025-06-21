# Projeto de Programação Web - T5

## Visão Geral
Este é um projeto de aplicação web desenvolvido como parte da disciplina de Programação Web (ProgWeb) da UFPR. A aplicação demonstra práticas modernas de desenvolvimento web e fornece uma interface amigável para gerenciar e interagir com dados.

## Funcionalidades
- Interface de usuário limpa e responsiva
- Gerenciamento e visualização de dados
- Autenticação e autorização de usuários
- Componentes web interativos
- Design compatível com dispositivos móveis

## Primeiros Passos

### Pré-requisitos
- Ruby (versão 2.7 ou superior)
- Framework Rails
- Sistema de banco de dados (PostgreSQL/MySQL/SQLite)
- Node.js e npm (para compilação de assets)

### Instalação
1. Clone o repositório:
   ```
   git clone [url-do-repositorio]
   cd t5
   ```

2. Instale as dependências:
   ```
   bundle install
   npm install
   ```

3. Configure o banco de dados:
   ```
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. Inicie o servidor de desenvolvimento:
   ```
   rails server
   ```

5. Acesse `http://localhost:3000` no seu navegador

## Uso
A aplicação fornece uma interface intuitiva onde os usuários podem:
- Navegar por diferentes seções usando o menu principal
- Criar, ler, atualizar e excluir registros
- Pesquisar e filtrar dados
- Visualizar informações detalhadas e estatísticas

## Estrutura do Projeto
- `app/` - Código principal da aplicação (controllers, models, views)
- `config/` - Arquivos de configuração
- `db/` - Migrações e schema do banco de dados
- `public/` - Assets estáticos
- `test/` - Arquivos de teste

## Testes
Execute a suíte de testes com:
```
rails test
```
