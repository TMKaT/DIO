# Projeto de Banco de Dados :heavy_minus_sign: Oficina Automotiva
* Levantamento dos requisitos da  Oficina Automotiva
* Projeto Conceitual: Modelo Entidade-Relacionamento
* Projeto Lógico: Modelo Relacional

## Criando o Projeto Conceitual do Banco de Dados da Oficina Automotiva :car::man_mechanic:
### Entidades e Escopo:
#### Clientes
* Os clientes pode ter mais de um veiculo
* Os clientes deve Autorizar a execução dos serviços

#### Equipes
* Devem possuir X funcionários
* Cada equipe executa uma tarefa
* Devem preencher as datas de entrega das OS
* Devem avaliar (revisar) o estado dos veículos e executar as correções

#### Estoque
* Devem conter o nome das peças e sua quantidade

#### Mecânicos
* Devem possuir código identificador, nome, endereço e especialidade

#### Ordem de Serviço - OS
* Deve ser vinculada as suas modalidades de trabalho executadas na oficina (conserto ou revisão)
* Deve conter o nome da peça e seu valor
* Deve conter o valor do serviço
* Deve conter numero identificador, data de emissão, valor, status e data para conclusão dos trabalhos
* Pode conter vários serviços
* Um mesmo serviço pode estar contido em mais de uma OS
* Uma OS pode conter várias de peças
* Uma peça pode estar presente em mais de uma OS

#### Tabela de Serviços
* Deve conter tipo de serviço prestado, o calor do serviço e as peças utilizadas.

#### Veículos
* Os veiculos podem ser consertados ou ter revisão periodica

#### Refinamento Exigido
* O cliente pode ser *PJ* **ou** *PF*
* O cliente pode possuir mais de um carro
* O Veiculo deve possuir tipo (carro, moto, caminhão), proprietário ou responsavel, Placa, Marca, Modelo, versão e ano de fabricação.

O arquivo contendo o modelo conceitual refinado pode ser encontrado [aqui](https://github.com/TMKaT/DIO/blob/main/Bootcamp%20Gera%C3%A7%C3%A3o%20Tech%20Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/Desafios%20de%20projeto/Construindo%20um%20Esquema%20Conceitual%20para%20Banco%20de%20Dados/Modelo%20conceitual%20OS%20Oficina.png)

## Criando o Projeto Lógico
#### Criação das Tabelas, de Suas Colunas e a Definição de Seus Atributos
* O arquivo com o código utilizado para realizar a criação das tabelas pode ser encontrado [aqui](https://github.com/TMKaT/DIO/blob/main/Bootcamp%20Gera%C3%A7%C3%A3o%20Tech%20Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/Desafios%20de%20projeto/Construindo%20um%20Esquema%20Conceitual%20para%20Banco%20de%20Dados/Projeto%20l%C3%B3gico%20Oficina.sql)
#### Persistencia dos dados nas tabelas
* O arquivo com o código utilizado para realizar a persistencia dos dados pode ser encontrado [aqui](https://github.com/TMKaT/DIO/blob/main/Bootcamp%20Gera%C3%A7%C3%A3o%20Tech%20Unimed-BH%20-%20Ci%C3%AAncia%20de%20Dados/Desafios%20de%20projeto/Construindo%20um%20Esquema%20Conceitual%20para%20Banco%20de%20Dados/Persistencia%20de%20dados%20Oficina.sql)
#### Consultas
* O arquivo com o código utilizado para realizar as consultas dos dados no BD pode ser encontrado [aqui](https://github.com/TMKaT/DIO/blob/main/Bootcamp_Gera%C3%A7%C3%A3o_Tech_Unimed-BH_-_Ci%C3%AAncia_de_Dados/Desafios_de_projeto/MySQL_projeto_oficina_automotiva/Consultas%20Oficina.sql)

#### _Statement_ que podemos utilizar
* Extração simples com _SELECT statement_
* Filtros com _WHERE statement_
* Criação de atributos derivaos
* Definição de ordenações com _ORDER BY statement_
* Definição de filtros condicionais com _HAVING statement_
* Criação de junções de tabelas com _JOIN statement_

#### Perguntas Para se Responder com _Queries_ 
* Relação de cliente pf e os veículos possuídos
* Relação de cliente pj e os veículos possuídos
* Quais clientes possuem determinado tipo de veículo
* Quantas OS executadas
* Detalhamento da OS
* Balanço Estoque
* Tabela de equipes
* Equipe responsável por cada OS 

## Software utilizado para modelagem conceitual
* [MySQL Workbench](https://www.mysql.com/products/workbench/)
