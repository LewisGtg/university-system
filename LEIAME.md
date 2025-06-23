# Projeto de Programação Web - T5

## Uso
A aplicação fornece uma interface intuitiva onde os usuários podem:
- Navegar por diferentes seções usando o menu principal
- Criar, ler, atualizar e excluir registros
- Pesquisar e filtrar dados
- Visualizar informações detalhadas e estatísticas

## Funcionalidades
- Interface de usuário limpa e responsiva
- Gerenciamento e visualização de dados
- Autenticação e autorização de usuários
- Componentes web interativos
- Design compatível com dispositivos móveis
- Uso do framework rails e javascript

## Primeiros Passos

### Pré-requisitos
- Ruby (versão 3.2)
- Framework Rails

### Como rodar``

1. Instale as dependências:
   ```
   bundle install
   ```

2. Configure o banco de dados (os dados já estão presentes na aplicação):
   ```
   rails db:create
   rails db:migrate
   rails db:seed
   ```

3. Inicie o servidor de desenvolvimento:
   ```
   rails server
   ```

4. Acesse `http://localhost:3000` no seu navegador

## Credenciais de Acesso

### Administrador
Email: admin@universidade.com  
Senha: senha123

Funcionalidades disponíveis:
- Gerenciar usuários (visualizar, criar, editar, excluir)
- Gerenciar disciplinas (criar, editar, excluir disciplinas)
- Gerenciar monitorias (atribuir e remover monitores)
- Visualizar todos os dados do sistema
- Acesso completo a todas as funcionalidades administrativas

### Estudantes (existes outros estudantes disponívels no arquivo /db/seeds.rb)

#### João Silva
Email: joao.silva@estudante.universidade.com  
Senha: senha123  
Registro Acadêmico: EST001

Funcionalidades disponíveis:
- Visualizar seu próprio perfil
- Visualizar disciplinas nas quais está matriculado (Programação Web e Banco de Dados)
- Ver informações sobre monitores das disciplinas
- Atualizar dados pessoais

Nota: Estudantes podem apenas visualizar informações e gerenciar seus próprios dados. Não têm acesso às funcionalidades administrativas como criar disciplinas ou gerenciar outros usuários.

## Estrutura do Projeto
- `app/` - Código principal da aplicação (controllers, models, views)
- `config/` - Arquivos de configuração
- `db/` - Migrações e schema do banco de dados
- `public/` - Assets estáticos
- `test/` - Arquivos de teste

## Testes
Execute a suíte de testes com:
```
rake test
```
