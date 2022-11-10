-- Criando DB e suas tabelas
drop database oficina;
CREATE DATABASE IF NOT EXISTS  oficina;
USE oficina;
CREATE TABLE IF NOT EXISTS cadastro (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    tipo ENUM('Pessoa Física', 'Pessoa Jurídica')
);
CREATE TABLE IF NOT EXISTS cliente_pf (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    cpf CHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(45) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    celular CHAR(11) NOT NULL,
    telefone CHAR(10),
    idcadastro INT,
    FOREIGN KEY (idcadastro)
        REFERENCES cadastro (id)
);
CREATE TABLE IF NOT EXISTS cliente_pj (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    cnpj CHAR(14) NOT NULL UNIQUE,
    razao_social VARCHAR(100) NOT NULL,
    nome_responsavel VARCHAR(45) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    celular CHAR(11) NOT NULL,
    telefone CHAR(10),
    idcadastro INT,
    FOREIGN KEY (idcadastro)
        REFERENCES cadastro (id)
);
CREATE TABLE IF NOT EXISTS endereco_cliente (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    logradouro_tipo VARCHAR(15),
    endereco VARCHAR(45) NOT NULL,
    numero INT,
    complemento VARCHAR(45),
    bairro VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    estado VARCHAR(45) NOT NULL,
    cep CHAR(8) NOT NULL,
    obsevacoes VARCHAR(255),
    idcadastro INT,
    FOREIGN KEY (idcadastro)
        REFERENCES cadastro (id)
);
CREATE TABLE IF NOT EXISTS veiculo (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    tipo ENUM('Caminhão', 'Carro', 'Moto') NOT NULL,
    combustivel ENUM('Diesel', 'Alcool', 'Gasolina', 'Flex') NOT NULL,
    placa CHAR(7) NOT NULL UNIQUE,
    marca VARCHAR(45),
    modelo VARCHAR(45),
    versao VARCHAR(45),
    ano CHAR(4),
    idcadastro INT,
    FOREIGN KEY (idcadastro)
        REFERENCES cadastro (id)
);
CREATE TABLE IF NOT EXISTS equipe (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    especialidade ENUM('Elétrica', 'Bombista', 'Mecânica', 'Funilaria e Pintura', 'Serviços Gerais'),
    responsavel VARCHAR(45) NOT NULL
    );
CREATE TABLE IF NOT EXISTS funcionarios (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    funcao VARCHAR(100),
    idequipe INT,
    FOREIGN KEY (idequipe)
        REFERENCES equipe (id)
);
CREATE TABLE IF NOT EXISTS endereco_func (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    logradouro_tipo VARCHAR(15),
    endereco VARCHAR(45) NOT NULL,
    numero INT,
    complemento VARCHAR(45),
    bairro VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    estado VARCHAR(45) NOT NULL,
    cep CHAR(8) NOT NULL,
    obsevacoes VARCHAR(255),
    idfunc INT,
    FOREIGN KEY (idfunc)
        REFERENCES funcionarios (id)
);    
CREATE TABLE IF NOT EXISTS peca (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    qntd INT,
	valor_uni FLOAT NOT NULL,
    localizacao VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS tabela_preco (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    mao_de_obra ENUM('Elétrica', 'Bombista', 'Mecânica', 'Funilaria', 'Pintura', 'Revisão'),
    preco_mao_de_obra FLOAT
);
CREATE TABLE IF NOT EXISTS orcamento (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    servico ENUM('Revisão', 'Conserto') NOT NULL,
    data_entrada DATE NOT NULL,
    data_orcamento DATE NOT NULL,
    idpeca INT,
    qntd_peca INT,
    preco_peca FLOAT,
    idt_preco INT,
    preco_mao_de_obra FLOAT,
    valor_orcamento FLOAT,
    idcadastro INT,
    idveiculo INT,
    aprovado ENUM('Sim', 'Não'),
    FOREIGN KEY (idcadastro)
        REFERENCES cadastro (id),
    FOREIGN KEY (idveiculo)
        REFERENCES veiculo (id),
    FOREIGN KEY (idpeca)
        REFERENCES peca (id),
    FOREIGN KEY (idt_preco)
        REFERENCES tabela_preco (id)
);  
CREATE TABLE IF NOT EXISTS ordem_servico (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    idorcamento INT,
    data_emissao DATE NOT NULL,
    idveiculo INT,
    tipo_servico ENUM('Revisão', 'Conserto'),
    idequipe INT,
    idpeca INT,
    qntd_peca INT,
    data_conclusao DATE,
    FOREIGN KEY (idorcamento)
        REFERENCES orcamento (id),
    FOREIGN KEY (idveiculo)
        REFERENCES veiculo (id),
    FOREIGN KEY (idequipe)
        REFERENCES equipe (id),
    FOREIGN KEY (idpeca)
        REFERENCES peca (id)
);
CREATE TABLE IF NOT EXISTS precificacao (
    idorcamento INT,
    idt_preco INT,
    idpeca INT,
    qntd_peca INT,
    FOREIGN KEY (idorcamento)
        REFERENCES orcamento (id),
    FOREIGN KEY (idt_preco)
        REFERENCES tabela_preco (id),
    FOREIGN KEY (idpeca)
        REFERENCES peca (id)
);
CREATE TABLE IF NOT EXISTS pecas_necessarias (
    ido_servico INT,
    idpeca INT,
    FOREIGN KEY (ido_servico)
        REFERENCES ordem_servico (id),
    FOREIGN KEY (idpeca)
        REFERENCES peca (id)
);

