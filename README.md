# PetCare API

API REST desenvolvida para o gerenciamento de tutores e seus respectivos pets, contando com autenticação de usuários via token e persistência em banco de dados relacional MySQL.

---

## Integrantes do Grupo

* **Isaque de Oliveira Machado** — RA: `22404060`

---

## Como Rodar o Projeto

### 1. Pré-requisitos
* **XAMPP** instalado (com **Apache** e **MySQL / MariaDB** ativos, PHP 8.0+).
* Extensão **REST Client** no VS Code (para executar o arquivo `requisicoes.http`) ou **Thunder Client**.

### 2. Configuração dos Arquivos no XAMPP
1. Copie a pasta deste projeto para dentro do diretório `htdocs` do XAMPP (ex: `C:\xampp\htdocs\petcare-php-api`).
2. Abra o **XAMPP Control Panel** e inicie os serviços **Apache** e **MySQL**.

### 3. Configuração do Banco de Dados (via MySQL Workbench)
1. Abra o **MySQL Workbench** e conecte-se à instância local do MySQL (`localhost`, porta `3306`, usuário `root`).
2. Vá em **File > Open SQL Script...** (ou pressione `Ctrl + Shift + O`) e selecione o arquivo `script.sql` na raiz do projeto.
3. Clique no ícone do raio (**Execute**, ou pressione `Ctrl + Shift + Enter`) para criar o banco `petcare`, as tabelas e popular os dados iniciais de exemplo.
4. Atualize o painel **Schemas** à esquerda para confirmar que o banco `petcare` foi criado corretamente.

### 4. Configuração da Conexão com o Banco
Verifique o arquivo de conexão com o banco no projeto (ex: `conexao.php`) e confirme se as credenciais correspondem ao padrão do XAMPP:

* **Host:** `localhost`
* **Banco:** `petcare`
* **Usuário:** `root`
* **Senha:** *(em branco)*

### 5. Testando a API
Com o Apache rodando, a API estará acessível em `http://localhost/petcare-php-api` *(ajuste o caminho caso tenha usado outro nome de pasta no `htdocs`)*.

Para testar os endpoints:
* **Via REST Client (VS Code):** Abra o arquivo `requisicoes.http`, verifique se a variável `@baseUrl` corresponde ao caminho no seu `htdocs` e clique em *Send Request* nas rotas na ordem indicada.
* **Via Thunder Client:** Caso prefira utilizar o Thunder Client, basta importar o arquivo JSON da coleção *(se você exportar e incluir no repositório)* ou reproduzir as rotas documentadas no `requisicoes.http`.