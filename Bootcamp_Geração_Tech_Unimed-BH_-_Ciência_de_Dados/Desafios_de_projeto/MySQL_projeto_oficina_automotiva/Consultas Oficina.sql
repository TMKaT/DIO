USE oficina;

-- Relação de cliente pf e os veículos possuídos
SELECT 
    cad.id,
    pf.nome AS Nome,
    vei.tipo AS Categoria,
    vei.marca AS Marca,
    vei.modelo AS Modelo,
    vei.ano AS ANO
FROM
    cadastro cad
        INNER JOIN
    cliente_pf pf ON cad.id = pf.idcadastro
        INNER JOIN
    veiculo vei ON cad.id = vei.idcadastro
ORDER BY nome, categoria;

-- Relação de cliente pj e os veículos possuídos
SELECT 
    cad.id,
    pj.razao_social AS Razão_Social,
    vei.tipo AS Categoria,
    vei.marca AS Marca,
    vei.modelo AS Modelo,
    vei.ano AS ANO
FROM
    cadastro cad
        INNER JOIN
    cliente_pj pj ON cad.id = pj.idcadastro
        INNER JOIN
    veiculo vei ON cad.id = vei.idcadastro
ORDER BY Razão_Social, categoria;

-- Quais clientes possuem determinado tipo de veículo
SELECT 
    cad.id, vei.tipo, vei.marca, vei.modelo, vei.ano
FROM
    veiculo vei
        INNER JOIN
    cadastro cad ON vei.idcadastro = cad.id
HAVING vei.tipo = 'Caminhão'
ORDER BY marca;

-- Quantas OS executadas
SELECT COUNT(*) FROM ordem_servico;

-- Detalhamento da OS
SELECT 
    pf.nome,
    vei.tipo,
    vei.marca,
    vei.modelo,
    orc.id AS numero_orc,
    os.id AS numero_os,
    os.data_emissao AS data_incial
FROM
    cliente_pf pf
        INNER JOIN
    cadastro cad ON pf.idcadastro = cad.id
        INNER JOIN
    veiculo vei ON vei.idcadastro = cad.id
        INNER JOIN
    orcamento orc ON orc.idcadastro = cad.id
        INNER JOIN
    ordem_servico os ON orc.id = os.idorcamento;

-- Balanço Estoque
SELECT CONCAT ('R$ ', SUM(ROUND((qntd*valor_uni),2))) AS Balanço_estoque FROM peca;        

-- Tabela de equipes
SELECT 
    fun.nome, fun.funcao
FROM
    funcionarios fun
ORDER BY fun.funcao, fun.nome;

-- Equipe responsável por cada OS
SELECT 
    equ.id AS ID_equipe, equ.especialidade, os.id AS Numero_os
FROM
    ordem_servico os
        INNER JOIN
    equipe equ ON equ.id = os.idequipe;
