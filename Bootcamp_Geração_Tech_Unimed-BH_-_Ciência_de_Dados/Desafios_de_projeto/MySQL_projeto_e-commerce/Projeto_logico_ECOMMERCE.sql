-- Criação do DB e de suas tabelas
-- drop database ecommerce;
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;
CREATE TABLE IF NOT EXISTS conta (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	tipo ENUM('Pessoa Física', 'Pessoa Jurídica') NOT NULL,
    cpf_cnpj VARCHAR(14) NOT NULL UNIQUE,
    nome_razaosocial VARCHAR(45) NOT NULL,
    nome_responsavel VARCHAR(45),
    email VARCHAR(200) NOT NULL,
    cel VARCHAR(11),
    tel VARCHAR(11)
);
CREATE TABLE IF NOT EXISTS formas_pagamento (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    pix VARCHAR(4000),
    boleto_bancario VARCHAR(48),
    ted VARCHAR(15),
    idconta INT,
    FOREIGN KEY (idconta)
        REFERENCES conta (id)
);
CREATE TABLE IF NOT EXISTS cartao_credito (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome_cartao VARCHAR(45) NOT NULL,
    numero_cartao VARCHAR(16) NOT NULL,
    bandeira ENUM('VISA', 'MASTERCARD', 'ELO', 'MAESTRO', 'AMERICAN EXPRESS', 'HIPERCARD') NOT NULL,
    validade CHAR(7) NOT NULL,
    cpf_titular CHAR(11) NOT NULL,
    idf_pagamentos INT,
    FOREIGN KEY (idf_pagamentos)
        REFERENCES formas_pagamento (id)
);
CREATE TABLE IF NOT EXISTS pedido (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    estatos ENUM('Aguardando confirmação', 'Pagamento recusado', 'Pagamento confirmado', 'Em processamento', 'Enviado', 'Entregue') DEFAULT 'Aguardando confirmação' NOT NULL,
    valor_pedido FLOAT NOT NULL,
    valor_frete FLOAT NOT NULL,
    data_compra DATE,
    idf_pagamentos INT,
    FOREIGN KEY (idf_pagamentos)
        REFERENCES formas_pagamento (id)
);
CREATE TABLE IF NOT EXISTS estoque (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome_responsavel VARCHAR(45) NOT NULL,
    email VARCHAR(200) NOT NULL,
    cel VARCHAR(11),
    tel VARCHAR(11)
);
CREATE TABLE IF NOT EXISTS terceiros (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    cnpj CHAR(14) NOT NULL UNIQUE,
    razao_social VARCHAR(45) NOT NULL,
    nome_fantasia VARCHAR(45) NOT NULL,
    nome_responsavel VARCHAR(45) NOT NULL,
    email VARCHAR(200) NOT NULL,
    cel VARCHAR(11),
    tel VARCHAR(11)
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
    idconta INT,
    FOREIGN KEY (idconta)
        REFERENCES conta (id)
);
CREATE TABLE IF NOT EXISTS endereco_estoque (
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
    idestoque INT,
    FOREIGN KEY (idestoque)
        REFERENCES estoque (id)
);
CREATE TABLE IF NOT EXISTS endereco_terceiros (
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
    idterceiros INT,
    FOREIGN KEY (idterceiros)
        REFERENCES terceiros (id)
);
CREATE TABLE IF NOT EXISTS produto (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	categoria ENUM('Audio e Video', 'Automotivo', 'Bebês', 'Beleza e Perfumaria', 'Brinquedos', 'Cama, Mesa e Banho', 'Casa e Construção', 'Celular e Smartphone', 'Decoração', 'Eletrodomésticos', 'Esporte e Lazer', 'Ferramentas', 'Games', 'Informática', 'Livros', 'Moda', 'Móveis', 'Papelaria', 'Pet Shop', 'Relógios', 'TVs' ) NOT NULL,
	descricao VARCHAR(255),
	valor_uni FLOAT NOT NULL,
	avaliacao FLOAT(2,1) DEFAULT "0",
	dimensoes VARCHAR(45),
	idestoque INT,
	idterceiros INT,
	FOREIGN KEY (idestoque) 
		REFERENCES estoque(id),
	FOREIGN KEY (idterceiros) 
		REFERENCES terceiros(id)
   );
CREATE TABLE IF NOT EXISTS item_pedido (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    idpedido INT,
    idproduto INT,
    qntd_produto INT,
    garantia_extendida ENUM('Sim', 'Não') DEFAULT 'Não',
    FOREIGN KEY (idproduto)
        REFERENCES produto (id),
    FOREIGN KEY (idpedido)
        REFERENCES pedido (id)
);
CREATE TABLE IF NOT EXISTS empresa_entrega (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    cnpj CHAR(14) NOT NULL UNIQUE,
    razao_social VARCHAR(45) NOT NULL,
    nome_fantasia VARCHAR(45) NOT NULL,
    nome_responsavel VARCHAR(45) NOT NULL,
    email VARCHAR(200) NOT NULL,
    cel VARCHAR(11),
    tel VARCHAR(11)
);
CREATE TABLE IF NOT EXISTS entrega (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    cod_rastreamento VARCHAR(45) NOT NULL,
    prazo_entrega_dias INT NOT NULL,
    situacao ENUM('Em separação', 'Coletado pela empresa', 'No centro de distribuição', 'A caminho cidade de destino', 'Em rota de entrega', 'Entregue'),
    idpedido INT,
    idendereco_cliente INT,
    idempresa_entrega INT,
    FOREIGN KEY (idpedido)
        REFERENCES pedido (id),
    FOREIGN KEY (idendereco_cliente)
        REFERENCES endereco_cliente (id),
    FOREIGN KEY (idempresa_entrega)
        REFERENCES empresa_entrega (id)
);

