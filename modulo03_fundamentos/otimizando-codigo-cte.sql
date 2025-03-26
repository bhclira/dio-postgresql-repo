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

-- sub-select fica meio confuso mas é assim:
SELECT banco.numero, banco.nome
FROM banco
JOIN (
SELECT 213 AS banco_numero
) params ON params.banco_numero = banco.numero;
)