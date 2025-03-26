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



-- ==================================================================================================
-- Explicação sobre a CTE 'clientes_e_transacoes':
-- ==================================================================================================
-- O código utiliza uma Common Table Expression (CTE) chamada 'clientes_e_transacoes' para consolidar
-- informações sobre clientes, tipos de transações e valores de transações, filtrando especificamente
-- por transações realizadas no banco "Itaú".
--
-- 1. A CTE seleciona três colunas principais:
--    - O nome do cliente (cliente_nome).
--    - O nome do tipo de transação (tipo_transacao_nome).
--    - O valor da transação (tipo_transacao_valor).
--
-- 2. Os dados são obtidos por meio de múltiplos JOINs:
--    - O primeiro JOIN relaciona 'cliente_transacoes' com 'cliente', associando cada transação ao cliente.
--    - O segundo JOIN conecta 'cliente_transacoes' com 'tipo_transacao', identificando o tipo de cada transação.
--    - O terceiro JOIN filtra as transações para incluir apenas aquelas realizadas no banco "Itaú",
--      utilizando a condição 'banco.nome ILIKE '%Itaú%'', que realiza uma busca case-insensitive.
--
-- 3. A consulta principal retorna os dados consolidados na CTE, exibindo o nome do cliente, o tipo de
--    transação e o valor correspondente.
--
-- Essa abordagem modular melhora a legibilidade e organização do código, especialmente em consultas
-- complexas que envolvem múltiplas tabelas e condições.
-- ==================================================================================================
WITH clientes_e_transacoes AS (
    SELECT cliente.nome AS cliente_nome,
    tipo_transacao.nome AS tipo_transacao_nome,
    cliente_transacoes.valor AS tipo_transacao_valor
    FROM cliente_transacoes
    JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
    JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id
    -- uma query de transacoes so no banco ITAU
    JOIN banco ON banco.numero = cliente_transacoes.banco_numero AND banco.nome ILIKE '%Itaú%'
    )
SELECT cliente_nome, tipo_transacao_nome, tipo_transacao_valor
FROM clientes_e_transacoes;