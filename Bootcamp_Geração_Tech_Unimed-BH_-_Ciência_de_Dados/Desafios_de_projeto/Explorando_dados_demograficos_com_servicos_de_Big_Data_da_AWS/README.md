# Explorando Dados Demográficos com Serviços de Big Data na AWS

## Serviços AW utilizados
* Amazon Athena
* Amazon Glue
* Amazon QuickSight
* Amazon S3

## Desenvolvimento do projeto
### Criação de um _Bucket_ no serviço _Amazon S3_ e suas subpastas 📂
* **Criação do _Bucket_:** ``` Amazon S3 Console ```➡️``` Buckets ```➡️``` Criar bucket ```➡️``` Nome do bucket ``` ```:``` ``` ✒️[myawsbucket] ``` , ```Criar bucket ```
* **Criação das subpastas:** ``` Amazon S3 Console ```➡️``` Buckets ```➡️``` [Bucket criado] ```➡️``` Criar pasta ```➡️``` Nome de pasta ``` ```:``` ``` ✒️[Inserir nome da pasta] ``` , ``` Criar pasta ```
* **Foram criadas as pastas:** ```/population``` e ```/output```

### Criação de um _Crawler_ no serviço _Amazon Glue_ 📂
* **Criação do _crawler_:** ``` Amazon Glue Console ```➡️``` Crawlers ```➡️``` Adicionar crawler ``` 
* **Informações do crawler:** ``` Nome do crawler ``` ```:``` ``` ✒️[insira nome...] ```
* **Crawler source type:** 🔵``` Data stores ```  
  * **Repeat crawls of S3 data stores:** 🔵``` Crawl all folders ```
* **Datastore:**
  * **Escolha um datastore:** ``` S3 ```  
  * **Rastrear dados no:** 🔵``` Caminho especificado ```
  * **Incluir caminho:** ``` s3://diounimedbh/population/ ```
* **Função do IAM:** 
  * **A função do IAM permite que o crawler para executar e acessar os datastores do Amazon S3.** 🔵``` Crie uma função do IAM ```
  * **AWSGlueServiceRole-** ``` ✒️[crawler] ```
* **Programação**
  *  **Frequência:** ``` Executar sob demanda ```
* **Saída:**
  *  **Banco de dados:** ``` Adicionar banco de dados ``` ➡️ **Adicionar banco de dados:** ``` ✒️[Digite name] ```
  * **Agrupar comportamento de dados do S3 (opcional)**: ☑️``` Agrupar comportamento de dados do S3 (opcional) ```
* ``` Revisar ``` ➡️ ``` Concluir ```
* **Gerando tabelas:** ``` Selecionar o crawler criado ``` ☑️``` [nome_crawler] ``` ➡️ ``` Run ```
* ``` AWS Glue Catalog ```➡️ ``` Tables ```

### Criação de uma aplicação no serviço _Amazon Athena_ 📂
* **Selecionando a pasta de saída da aplicação:** ``` Amazon Athena Console ```➡️``` Query editor ```➡️``` Settings ```➡️``` Manage ``` 
  * **Query result location and encryption:** ```Browse S3``` ou ``` s3://[bucket_name]/[pasta_de_saída] ``` , ``` Save ```
* **Selecionando a tabela criada com o _crawler_:** ``` Amazon Athena Console ```➡️``` Query editor ```➡️``` database ``` = ``` [nome_db_criado] ```. Se tudo ocorreu de acordo, será possivel ver o nome da tabela criada ao rodar o _Crawler_ na aba ``` Tables ```
* **Salvando _queries_:** Na aba ``` Editor ```, após produzir a _query_ desejada, clique nos 3 pontos verticais ao lado de ``` Query 1 ``` ➡️``` Save as ```. Na janela ``` Save query ```➡️``` Query name ```✒️[nome]```
* **Histórico de _queries executadas_:** Na aba ``` Recent queries ``` estão listadas todas as _queries_ executadas e informações sore a sua execução. Se clicar-mos sobre seu ``` Execution ID ```, a mesma será re-executada. Podemos, também, baixar o histórico de todas as _queries_ executadas clicando em ``` Download CSV ```, bem como fazer o download do resultado de cada _query_ seleciando a mesma 🔵``` [Execution ID] ``` e clicando em ``` Download results ```
* **_Queries_ salvas:** Na aba ``` Saved queries ``` estão listadas todas as _queries_ salvas. Clique no seu ``` ID ```para re-executá-la. Selecionando a _query_ salva desejada 🔵``` [ID] ```, podemos renomeá-la clicando em ``` Rename ``` e excluí-la clicando em ``` Delete ```


### Criação de visualizações de dados no serviço _Amazon QuickSight_ 📂
* **Criação de conta:** ``` Signup ```, quando for escolher, optar por ``` Standart ```
* **Criação do Dataset:** Clicar em ``` Datasets ```➡️``` New dataset ```➡️ ``` Name ``` ```✒️[nome]```➡️ ``` Create ```
* **Criação do Dashboard:** Clicar em ``` Datasets ```➡️``` [nome_dataset] ```➡️ ``` Use in analysis ```. Nessa etapa podemos criar todas as vizualizações necessárias, filtros e parametros. ➡️ Com tudo pronto, clicamos no icone que representa a ação desejada: ``` Save as ```, ``` Export ``` ou ``` Share ``` ao lado de ``` Autosave on ```

## Disclaimer
As _queries_ savas durante minha execução do projeto se encontram na pasta ``` /Queries  ```
