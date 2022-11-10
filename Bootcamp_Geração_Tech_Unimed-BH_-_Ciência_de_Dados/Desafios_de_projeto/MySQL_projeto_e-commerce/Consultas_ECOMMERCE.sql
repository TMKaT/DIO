use ecommerce;

-- Quantos pedidos foram feitos por cliente?
SELECT 
    c.id,
    nome_razaosocial AS Comprador,
    COUNT(*) AS QNTD_Pedidos
FROM
    conta c
        INNER JOIN
    formas_pagamento fp ON c.id = fp.idconta
        INNER JOIN
    pedido p ON fp.id = p.idf_pagamentos
GROUP BY c.id;

-- Algum vendedor também é fornecedor? R. Nenhum vendedor fornce itens para o estoque do E-COMMERCE
-- Relação de produtos e fornecedor R. Todos os produtos são de fabricação por parte do E-COMMERCE (modelo idem aos melhores itens da amazon)

-- Localização dos produtos:
SELECT 
    p.id,
    p.nome AS Produto,
    ee.cidade AS Cidade_Estoque,
    et.cidade AS Cidade_Terceiros
FROM
    produto p
        INNER JOIN
    endereco_estoque ee ON p.idestoque = ee.idestoque
        INNER JOIN
    endereco_terceiros et ON p.idterceiros = et.idterceiros
ORDER BY p.nome;
        
-- Balanço das vendas
SELECT 
    c.nome_razaosocial AS Comprador,
    p.nome AS Produto,
    ip.qntd_produto,
    p.valor_uni,
    ROUND(p.valor_uni * ip.qntd_produto, 2) AS Valor_da_Compra,
    pe.valor_frete AS Valor_frete,
    ROUND((p.valor_uni * ip.qntd_produto) + Valor_frete, 2) AS Valor_total,
    pe.estatos AS Status_pedido
FROM
    conta c
        INNER JOIN
    formas_pagamento fp ON c.id = fp.idconta
        INNER JOIN
    pedido pe ON fp.id = pe.idf_pagamentos
        INNER JOIN
    item_pedido ip ON pe.id = ip.idpedido
        INNER JOIN
    produto p ON ip.idproduto = p.id
ORDER BY Comprador , Produto, Valor_total;   
        
-- Quantos clientes cadastrados?
SELECT 
    COUNT(*)
FROM
    conta;   

-- Quantos produtos cadastrados com preço maior que 1000 reais?
SELECT 
    COUNT(*)
FROM
    produto
WHERE
    valor_uni > 1000;  

-- Mostrar o nome e preço dos produtos com preço maior que 1000 reais
SELECT 
    nome, categoria, valor_uni
FROM
    produto
HAVING valor_uni > 1000
ORDER BY categoria , nome , valor_uni;

-- Quanto há de mercadorias em cada estoque
SELECT 
    ee.cidade AS Cidade_Estoque,
    ROUND(SUM(p.valor_uni), 2) AS Total
FROM
    produto p
        INNER JOIN
    estoque e ON p.idestoque = e.id
        INNER JOIN
    endereco_estoque ee ON p.idestoque = ee.idestoque
GROUP BY ee.id; 
 
 -- Quanto cada vendedor possui em mercadorias
 SELECT 
    t.nome_fantasia AS Vendedor,
    ROUND(SUM(p.valor_uni), 2) AS Total
FROM
    produto p
        INNER JOIN
    terceiros t ON p.idterceiros = t.id
GROUP BY t.nome_fantasia;
 
-- Balanço das entregas
SELECT 
    eet.nome_fantasia AS Empresa_responsavel,
    e.id AS N_entrega,
    e.cod_rastreamento AS cod_Rastreio,
    e.idpedido AS Pedido_n,
    CONCAT(ec.cidade, '-', ec.estado) AS Destino,
    c.nome_razaosocial AS Destinatario
FROM
    empresa_entrega eet
        INNER JOIN
    entrega e ON eet.id = e.idempresa_entrega
        INNER JOIN
    endereco_cliente ec ON e.idendereco_cliente = ec.id
        INNER JOIN
    conta c ON ec.idconta = c.id
ORDER BY Empresa_responsavel; 

