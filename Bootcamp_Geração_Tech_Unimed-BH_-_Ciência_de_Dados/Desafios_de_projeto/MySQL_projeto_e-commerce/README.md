# Projeto de Banco de Dados :heavy_minus_sign: E-COMMERCE
* Levantamento dos requisitos do E-COMMERCE
* Projeto Conceitual: Modelo Entidade-Relacionamento
* Projeto Lógico: Modelo Relacional


## Refinando o Projeto Conceitual do Banco de Dados E-COMMERCE :shopping_cart:
Durante as aulas modelamos, junto a tutora, um conceito de BD reduzido para e-commerce. Como tarefa, devemos refinar o modelo feito com a ferramenta de nossa preferência, corrigindo os pontos citados por ela.

### Entidades e Escopo:
#### Produtos
* Os produtos são vendidos em um unica plataforma online que contem, támbem, vendedores *third party*
* Cada produto possui um fornecedor
* Um ou mais produtos podem compor o pedido

#### Clientes
* O cliente pode se cadastrar no site com seu CPF ou CNPJ
* O endereço do cliente irá determinar o valor do frete
* Um cliente pode comprar mais de um pedido
* O Cliente tem um período de carência para devolução do produto

#### Pedidos
* Os pedidos são criados por clientes e possuem informações de compra, endereço e status da entrega
* Um ou mais produtos compoem o pedido
* O pedido pode ser cancelado

#### Refinamento Exigido
* Uma conta pode ser *PJ* **ou** *PF*
* O cliente pode cadastrar mais de uma forma de pagamento
* A Entrega deve possui status e código de rastreio


O arquivo contendo o modelo conceitual refinado pode ser encontrado [aqui](https://github.com/TMKaT/DIO/blob/main/Bootcamp%20Gera%C3%A7%C3%A3o%20Tech%20Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/Desafios%20de%20projeto/Refinando%20um%20Projeto%20Conceitual%20de%20Banco%20de%20Dados%20-%20E-COMMERCE/Modelo%20conceitual%20ECOMERCE.png)

## Criando o Projeto Lógico
#### Criação das Tabelas, de Suas Colunas e a Definição de Seus Atributos
* O arquivo com o código utilizado para realizar a criação das tabelas pode ser encontrado [aqui](https://github.com/TMKaT/DIO/blob/main/Bootcamp%20Gera%C3%A7%C3%A3o%20Tech%20Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/Desafios%20de%20projeto/Refinando%20um%20Projeto%20Conceitual%20de%20Banco%20de%20Dados%20-%20E-COMMERCE/Projeto%20l%C3%B3gico%20ECOMMERCE.sql)
#### Persistencia dos dados nas tabelas
* O arquivo com o código utilizado para realizar a persistencia dos dados pode ser encontrado [aqui](https://github.com/TMKaT/DIO/blob/main/Bootcamp%20Gera%C3%A7%C3%A3o%20Tech%20Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/Desafios%20de%20projeto/Refinando%20um%20Projeto%20Conceitual%20de%20Banco%20de%20Dados%20-%20E-COMMERCE/Persistencia%20de%20dados%20ECOMMERCE.sql)
#### Consultas
* O arquivo com o código utilizado para realizar as consultas dos dados no BD pode ser encontrado [aqui](https://github.com/TMKaT/DIO/blob/main/Bootcamp%20Gera%C3%A7%C3%A3o%20Tech%20Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/Desafios%20de%20projeto/Refinando%20um%20Projeto%20Conceitual%20de%20Banco%20de%20Dados%20-%20E-COMMERCE/Consultas%20ECOMMERCE.sql)

#### _Statement_ que podemos utilizar
* Extração simples com _SELECT statement_
* Filtros com _WHERE statement_
* Criação de atributos derivaos
* Definição de ordenações com _ORDER BY statement_
* Definição de filtros condicionais com _HAVING statement_
* Criação de junções de tabelas com _JOIN statement_

#### Perguntas Para se Responder com _Queries_
* Quantos pedidos foram feitos por cada cliente?
* Relação entre produto e estoque
* Qual o valor total gasto por cliente?
* Quantos clientes cadastrados?
* Quais são e quantos produtos cadastrados com preço superior a R$1000.00 existem?
* Qual o valor de cada estoque?
* Que empresa foi responsável por entral qual pedido?

---

## Software utilizado para modelagem conceitual
* [MySQL Workbench](https://www.mysql.com/products/workbench/)
