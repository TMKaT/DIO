# Banco de dados com DynamoDB e AWS CLI

<a name="ancora"></a>
### Conteúdo abordado :pencil:
* [Criação do banco de dados :heavy_check_mark:](#ancora1)
* [Inclusão de dados no bd através de arquivos JSON :heavy_check_mark:](#ancora2)
* [Criação de _index_ para _queries_ mais complexas :heavy_check_mark:](#ancora3)
* [Utilização de _queries_ para extração de dados :heavy_check_mark:](#ancora4)

<a id="ancora1"></a>
## Criação do banco de dados
```
aws dynamodb create-table \
    --table-name Musica \
    --attribute-definitions \
        AttributeName=Artista,AttributeType=S \
        AttributeName=TituloMusica,AttributeType=S \
    --key-schema \
        AttributeName=Artista,KeyType=HASH \
        AttributeName=TituloMusica,KeyType=RANGE \
    --provisioned-throughput \
        ReadCapacityUnits=10,WriteCapacityUnits=5  
```

<a id="ancora2"></a>
## Inclusão de dados no bd através de arquivos JSON
### Inserção de um unico item
```
aws dynamodb put-item \
    --table-name Musica \
    --item file://itemmusic.json \
```
### Inserção de múltiplos itens
```
aws dynamodb batch-write-item \
    --request-items file://batchmusic.json
```

<a id="ancora3"></a>
## Criação de _index_ para _queries_ mais complexas
### Criação de um _index_ global secundário referenciado ao título do álbum
```
aws dynamodb update-table \
    --table-name Musica \
    --attribute-definitions AttributeName=TituloAlbum,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"TituloAlbum-index\",\"KeySchema\":[{\"AttributeName\":\"TituloAlbum\",\"KeyType\":\"HASH\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
```
### Criação de um _index_ global secundário referenciado ao artista e ao título do álbum
```
aws dynamodb update-table \
    --table-name Musica \
    --attribute-definitions\
        AttributeName=Artista,AttributeType=S \
        AttributeName=TituloAlbum,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"ArtistaTituloAlbum-index\",\"KeySchema\":[{\"AttributeName\":\"Artista\",\"KeyType\":\"HASH\"}, {\"AttributeName\":\"TituloAlbum\",\"KeyType\":\"RANGE\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
```
### Criação de um _index_ global secundário referenciado ao título e ao ano da musica
```
aws dynamodb update-table \
    --table-name Musica \
    --attribute-definitions\
        AttributeName=TituloMusica,AttributeType=S \
        AttributeName=AnoMusica,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"TituloMusicaAno-index\",\"KeySchema\":[{\"AttributeName\":\"TituloMusica\",\"KeyType\":\"HASH\"}, {\"AttributeName\":\"AnoMusica\",\"KeyType\":\"RANGE\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
```

<a id="ancora4"></a>
## Utilização de _queries_ para extração de dados
### Pesquisa de item por artista
```
aws dynamodb query \
    --table-name Musica \
    --key-condition-expression "Artista = :artista" \
    --expression-attribute-values  '":artista":{"S":"Charlie Brown Jr."}}'
aws dynamodb query \
    --table-name Musica \
    --key-condition-expression "Artista = :artista" \
    --expression-attribute-values  '":artista":{"S":"CPM 22"}}'
aws dynamodb query \
    --table-name Musica \
    --key-condition-expression "Artista = :artista" \
    --expression-attribute-values  '":artista":{"S":"Detonautas Roque Clube"}}'
```
### Pesquisa de item por artista e título da música
```
aws dynamodb query \
    --table-name Musica \
    --key-condition-expression "Artista = :artista and TituloMusica = :titulo" \
    --expression-attribute-values file://keyconditions.json
```
### Pesquisa de item pelo _index_ secundário referenciado ao título do álbum
```
aws dynamodb query \
    --table-name Musica \
    --index-name TituloAlbum-index \
    --key-condition-expression "TituloAlbum = :name" \
    --expression-attribute-values  '{":name":{"S":"Imunidade Musical"}}'
aws dynamodb query \
    --table-name Musica \
    --index-name TituloAlbum-index \
    --key-condition-expression "TituloAlbum = :name" \
    --expression-attribute-values  '{":name":{"S":"Detonautas Roque Clube"}}'
aws dynamodb query \
    --table-name Musica \
    --index-name TituloAlbum-index \
    --key-condition-expression "TituloAlbum = :name" \
    --expression-attribute-values  '{":name":{"S":"Felicidade Instantânea"}}'
```
### Pesquisa de item pelo _index_ secundário referenciado ao artista e ao título do álbum
```
aws dynamodb query \
    --table-name Musica \
    --index-name ArtistaTituloAlbum-index \
    --key-condition-expression "Artista = :v_artista and TituloAlbum = :v_titullo" \
    --expression-attribute-values  '{":v_artista":{"S":"Charlie Brown Jr."},":v_titullo":{"S":"Imunidade Musical"} }'
aws dynamodb query \
    --table-name Musica \
    --index-name ArtistaTituloAlbum-index \
    --key-condition-expression "Artista = :v_artista and TituloAlbum = :v_titullo" \
    --expression-attribute-values  '{":v_artista":{"S":"Detonautas Roque Clube"},":v_titullo":{"S":"Detonautas Roque Clube"} }'
aws dynamodb query \
    --table-name Musica \
    --index-name ArtistaTituloAlbum-index \
    --key-condition-expression "Artista = :v_artista and TituloAlbum = :v_titullo" \
    --expression-attribute-values  '{":v_artista":{"S":"CPM 22"},":v_titullo":{"S":"Felicidade Instantânea"} }'
```
### Pesquisa de item pelo _index_ secundário referenciado ao título e ao ano da musica
```
aws dynamodb query \
    --table-name Musica \
    --index-name TituloMusicaAno-index \
    --key-condition-expression "TituloMusica = :v_musica and AnoMusica = :v_ano" \
    --expression-attribute-values  '{":v_musica":{"S":"Dias de Luta, Dias de Glória"},":v_ano":{"S":"2005"} }'
aws dynamodb query \
    --table-name Musica \
    --index-name TituloMusicaAno-index \
    --key-condition-expression "TituloMusica = :v_musica and AnoMusica = :v_ano" \
    --expression-attribute-values  '{":v_musica":{"S":"Dias Atrás"},":v_ano":{"S":"2002"} }'
aws dynamodb query \
    --table-name Musica \
    --index-name TituloMusicaAno-index \
    --key-condition-expression "TituloMusica = :v_musica and AnoMusica = :v_ano" \
    --expression-attribute-values  '{":v_musica":{"S":"Olhos Certos"},":v_ano":{"S":"2002"} }'
```

