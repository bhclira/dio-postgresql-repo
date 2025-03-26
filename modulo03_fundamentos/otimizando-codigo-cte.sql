-- CTEs syntax
SELECT numero, nome FROM banco;
SELECT banco_numero, numero, nome FROM agencia;

WITH tbl_temp_banco AS (
	SELECT numero, nome FROM banco
)
SELECT numero, nome -- vem do statament
FROM tbl_temp_banco;

-- params tabela temporaria
WITH params AS (
	SELECT 213 AS banco_numero
), tbl_temp_banco AS (
	SELECT numero, nome
	FROM banco
	JOIN params ON params.banco_numero = banco.numero
)
SELECT numero, nome FROM tbl_temp_banco;
-- ==================================================================================================
-- Explicação sobre o uso de CTEs no código:
-- ==================================================================================================

-- O código utiliza Common Table Expressions (CTEs) para organizar consultas de forma mais legível e modular.
-- 1. A CTE 'params' cria uma tabela temporária com um valor fixo (213) para o número do banco.
-- 2. A CTE 'tbl_temp_banco' realiza um JOIN entre a tabela 'banco' e a CTE 'params',
--    filtrando os resultados para retornar apenas os registros cujo número corresponde ao valor especificado (213).
-- 3. A consulta principal seleciona as colunas 'numero' e 'nome' da CTE 'tbl_temp_banco'.
-- Essa abordagem melhora a clareza e facilita a manutenção do código, especialmente em consultas mais complexas.

-- ==================================================================================================

-- sub-select fica meio confuso mas é assim:
SELECT banco.numero, banco.nome
FROM banco
JOIN (
SELECT 213 AS banco_numero
) params ON params.banco_numero = banco.numero;

