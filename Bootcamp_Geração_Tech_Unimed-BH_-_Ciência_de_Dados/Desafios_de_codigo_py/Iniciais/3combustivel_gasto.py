'''
=======================================
DESAFIO BÁSICO 3/3 - COMBUSTIVEL GASTO
=======================================
~~~~ENUNCIADO:
Rubens quer calcular e mostrar a quantidade de litros de combustível gastos em uma viagem de carro, sendo que seu carro faz 12 KM/L. Como ele não sabe fazer um programa que o auxilie nessa missão, ele te pede ajuda. Para efetuar o cálculo, deve-se fornecer o tempo gasto em horas na viagem e a velocidade média durante a mesma em km/h. Assim, você conseguirá passar para Rubens qual a distância percorrida e, em seguida, calcular quantos litros serão necessários para a viagem que ele quer fazer. Mostre o valor com 3 casas decimais após o ponto.

~~~~ENTRADA:
O arquivo de entrada contém dois inteiros. O primeiro é o tempo gasto na viagem em horas e o segundo é a velocidade média durante a mesma em km/h.

~~~~SAÍDA:
Imprima a quantidade de litros necessária para realizar a viagem, com três dígitos após o ponto decimal

--------------------------------------
Exemplo de Entrada | Exemplo de Saída
--------------------------------------
10 85              | 70.833
--------------------------------------
22 67              | 122.833
--------------------------------------
'''

# DICAS SOBRE PYTHON:
# FUNÇÃO input(): Ela recebe como parâmetro uma String que será visível ao usuário, 
# onde geralmente informa que tipo de informação ele está esperando receber;
# FUNÇÃO print(): Ela é a responsável por imprimir os dados e informar os valores no terminal;
# MÉTODO split(): permite dividir o conteúdo da variável de acordo com as condições especificadas 
# em cada parâmetro da função ou com os valores predefinidos por padrão;

# Abaixo segue um exemplo de código que você pode ou não utilizar
valores = input().split()

# TODO:  Calcule quantidade de litros necessária para realizar a viagem e imprima com TRÊS dígitos após o ponto decimal
tempo  = int(valores[0])
velocidade  = int(valores[1])

result = (tempo * velocidade) / 12

print(f"{result:.3f}")
