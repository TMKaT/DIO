# Descomplicando a criação de pacotes de processamento de imagens em Python
Este projeto tem por intuito ensinar a criar pacotes pacote de processamento de imagens em Python e disponibilizá-lo no repositório Pypi. Podendo, assim, reutilizá-lo com facilidade e compartilhá-lo com outras pessoas.

# Processamento básico de imagens

O Processamento básico de imagens deste pacote permite:
	
- **Módulo _processamento_**
  - Correspondência de histograma
  - Similaridade estrutural
  - Redimensionar imagem
	
- **Módulo _utilidades_**
  - Ler imagem
  - Salvar imagem
  - Plotar imagem
  - Resultado do gráfico
  - Plotar histograma

## Instalação


```Instalação de dependências
pip install -r requirements.txt
```

Use o gerenciador de pacotes [pip](https://pip.pypa.io/en/stable/processamento_basico_de_imagens) para processamento_basico_de_imagens

```bash
pip install processamento_basico_de_imagens
```

## Exemplo de uso

```python
from processamento_basico_de_imagens.processing import combinacao
combinacao.diferencas_imagens(img1, img2)
```

## Autor
Joadir Damasceno Junior

## Licença
[MIT](https://choosealicense.com/licenses/mit/)
