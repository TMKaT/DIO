'''
===============================================
DESAFIO INTERMEDIÁRIO 3/3 - Aumento Salarial
===============================================
~~~~ENUNCIADO:
A empresa que você trabalha resolveu conceder um aumento salarial a todos funcionários, de acordo com a tabela abaixo:
--------------------------------------------
Salario            | Percentual de Reajuste
--------------------------------------------
0 - 600.00         | 17%
--------------------------------------------
600.01 - 900.00    | 13%
--------------------------------------------
900.01 - 1500.00   | 12%
--------------------------------------------
1500.01            | 10%
--------------------------------------------
Acima de 2000.00   | 5%
--------------------------------------------

~~~~ENTRADA:
A entrada contém apenas um valor de ponto flutuante, que pode ser maior ou igual a zero, com duas casas decimais, conforme exemplos abaixo.

~~~~SAÍDA:
Leia o salário do funcionário e calcule e mostre o novo salário, bem como o valor de reajuste ganho e o índice reajustado, em percentual.

--------------------------------------------
Exemplo de Entrada | Exemplo de Saída
--------------------------------------------
1000               | Novo salario: 1120,00
                   | Reajuste ganho: 120,00
                   | Em percentual: 12%
--------------------------------------------
2000               | Novo salario: 2200,00
                   | Reajuste ganho: 200,00
                   | Em percentual: 10%
--------------------------------------------
'''

# DICAS SOBRE PYTHON:
# FUNÇÃO input(): Ela recebe como parâmetro uma String que será visível ao usuário, 
# onde geralmente informa que tipo de informação ele está esperando receber;
# FUNÇÃO print(): Ela é a responsável por imprimir os dados e informar os valores no terminal;
# MÉTODO split(): permite dividir o conteúdo da variável de acordo com as condições especificadas 
# em cada parâmetro da função ou com os valores predefinidos por padrão;

# Abaixo segue um exemplo de código que você pode ou não utilizar
salario = float(input()) 

# TODO:  Calcule o salário do funcionário e print o novo salário, bem como o valor de reajuste ganho e o índice reajustado (em porcentagem)
def reajuste(a, b):
  novo_salario = salario*(1+b)
  print(f'Novo salario: {novo_salario:.2f}')
  print(f'Reajuste ganho: {(novo_salario-a):.2f}')
  print(f'Em percentual: {b*100:.0f} %')


if salario <= 600:
  reajuste(salario, 0.17)
elif 600 < salario <= 900:
  reajuste(salario, 0.13)
elif 900 < salario <= 1500:
  reajuste(salario, 0.12)
elif 1500 < salario <= 2000:
  reajuste(salario, 0.10)
else: 
  reajuste(salario, 0.05)
