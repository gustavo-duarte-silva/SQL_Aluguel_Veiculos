/* 
	Agrupando a tabela clientes pelo pagamento
*/
USE aluguel_veiculos;

SELECT * 
FROM clientes
INNER JOIN pagamento
USING (id_clientes);

/* 
	Agrupando Clientes onde alugaram veiculos FLEX
*/

WITH veiculos_flex AS(
	SELECT modelo, combustivel, id_clientes
    FROM inventario
    INNER JOIN pagamento
    USING (id_inventario)
    WHERE combustivel = "Flex")
    
SELECT id_clientes, nome, sobrenome, modelo, combustivel
FROM clientes
INNER JOIN veiculos_flex
USING (id_clientes)
ORDER BY id_clientes;

/*
	Quantidade de Veiculos alugados por clientes
*/

SELECT id_clientes, nome, sobrenome, COUNT(id_clientes) as total_veiculos_alugados
FROM clientes
INNER JOIN pagamento
USING (id_clientes)
GROUP BY id_clientes;

/*
	Veiculos mais Alugados por Marca e o Total de pagamentos
*/

WITH marcas AS(
SELECT id_inventario, nome_marca
FROM marcas
INNER JOIN inventario
USING (id_marcas)
)

SELECT nome_marca, COUNT(nome_marca) AS total_alugados, SUM(valor_aluguel) AS total_valor
FROM pagamento
INNER JOIN marcas
ON marcas.id_inventario = pagamento.id_inventario
GROUP BY nome_marca
ORDER BY total_valor DESC;
