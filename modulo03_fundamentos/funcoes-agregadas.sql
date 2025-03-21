SELECT numero, nome FROM banco;
SELECT banco_numero, numero, nome FROM agencia;
SELECT numero, nome, email FROM cliente;
SELECT banco_numero, agencia_numero, cliente_numero FROM cliente_transacoes;

SELECT * FROM conta_corrente;

SELECT * FROM information_schema.columns WHERE table_name = 'banco';
SELECT column_name data_type FROM information_schema.columns WHERE table_name = 'banco';

-- AVG
-- COUNT
-- MAX
-- MIN
-- SUM

SELECT * FROM cliente_transacoes;

-- 1. AVG media de todos os valores da coluna
SELECT AVG(valor) FROM cliente_transacoes;

-- 2. COUNT a contagem de dados
SELECT COUNT(numero) FROM cliente;
-- quantidade de emails que tem gmail.com e qualquer coisa antes %
SELECT COUNT(numero), email FROM cliente
WHERE email ILIKE '%gmail.com'
GROUP BY email;

--3. MAX o maior número
SELECT MAX (valor)
FROM cliente_transacoes;

SELECT MAX (valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id;

--4. MIN o menor número
SELECT MIN (valor)
FROM cliente_transacoes;

SELECT MIN (valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id;

SELECT column_name data_type FROM information_schema.columns WHERE table_name = 'cliente_transacoes';

SELECT COUNT(id), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
HAVING COUNT (id) > 150; -- somente retorna a contagem maiores que 150

-- 5. SUM a soma de todos os valores

SELECT SUM(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
ORDER BY tipo_transacao_id ASC;

