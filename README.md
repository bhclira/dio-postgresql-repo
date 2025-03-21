# dio-postgresql-repo
This repository contains everything that was worked in PostgreSQL Training Course from DIO

1. IDEMPOTENCIA
   - conceito
   - 

2. Melhores Praticas em DDL
   - criar colunas que sao atributos basicos do objeto
   - cuidado com regras (constraints)
   - cuidado com o excesso de FK
   - Cuidado com o tamanho indevido de colunas CEP varchar(250)

3. DML - CRUD
   - SELECT (campos, ) FROM tabela [condições]
    SELECT numero, nome FROM banco WHERE ativo IS TRUE;
    SELECT nome FROM cliente WHERE email LIKE '%gmail.com';
   - SELECT - Condição (WHERE / AND / OR)
    primeira condição sempre WHERE e demais AND ou OR
   - SELECT - Idempotencia
    SELECT (campo, ) FROM tabela1 WHERE EXISTS ( SELECT (campo, ) FROM tabela2 WHERE campo1 = valor1 [AND/OR campoN = valorN]
    ); nao é uma boa pratica
    LEFT JOIN melhor prática
   - evite SELECT *
   - INSERTs
    INSERT (campos da tabela, ) VALUES (valores, );
    INSERT (campos da tabela, ) SELECT (valores, );
    exemplo recomendado:
    INSERT INTO agencia (banco_numero, numero, nome) VALUES (341, 1, 'Apipucos')
    ON CONFLICT (banco_numero, numero) DO NOTHING
   - UPDATE
    update (tabela) SET campo1 = novo_valor WHERE (condição);
   - DELETE
    DELETE FROM (tabela) SET campo1 = novo_valor WHERE (condição);

4. TRUNCATE - esvazia a tabela
    - TRUNCATE [ TABLE ] [ ONLY ] name [ * ] [, ... ]
        [ RESTART IDENTITY | CONTINUE IDENTITY ] [ CASCADE | RESTRICT ]
        exemplo:

5. FUNÇÕES AGREGADAS - agregated functions on doc on-line pesquisar no youtube:
   - AVG
   - COUNT
   - MAX
   - MIN
   - SUM

