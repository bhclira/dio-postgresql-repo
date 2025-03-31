# dio-postgresql-repo
This repository contains everything that was worked in PostgreSQL Training Course from DIO

1. IDEMPOTENCIA
   - conceito

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

21/03
4. TRUNCATE - esvazia a tabela
    - TRUNCATE [ TABLE ] [ ONLY ] name [ * ] [, ... ]
        [ RESTART IDENTITY | CONTINUE IDENTITY ] [ CASCADE | RESTRICT ]
        exemplo:

22/03
5. FUNÇÕES AGREGADAS - agregated functions on doc on-line pesquisar no youtube:
   - AVG
   - COUNT
   - MAX
   - MIN
   - SUM

25/03
6. RELACIONAMENTO ENTRE TABELAS - JOINS
   - JOIN: inner campos iguais em ambas as tabelas (intersecção)
   - LEFT JOIN - left join (outer) prioridade às tabelas do lado esquerdo
   - RIGHT JOIN right (outer) prioridade às tabelas À direita
   - FULL JOIN
   - CROSS JOIN - nao recomendável. todos os dados são cruzados criando uma matriz (consome recursos em demasia)

26/03
7. OTIMIZANDO O CODIGO COM CTE - COMON TABLE EXPRESSION
   - Conteito: forma de organizar "statments" ou blocos de códigos para consultas muito grandes, gerando tabelas temporárias e criando relacionamento entre elas;
   - Podem conter: SELECTs, INSERTs, UPDATEs ou DELETEs;
   - Se você tem apenas duas tabelas você usa o JOIN, etc; Não usa o CTE

31/03
8. COMO AS VIEWS AUXILIAM NO ACESSO AO BANCO DE DADOS
   - Views são consultas armazenadas no banco de dados que se comportam como tabelas virtuais, permitindo encapsular consultas complexas e reutilizá-las de forma simples.
   - Benefícios:
     - Reutilização de consultas complexas.
     - Melhora na segurança, restringindo o acesso direto às tabelas.
     - Organização e clareza no código SQL.
     - Facilidade de manutenção, já que alterações podem ser feitas diretamente na View.
   - Tipos de Views:
     - Views Simples: baseadas em consultas simples.
     - Recursive Views: permitem consultas recursivas, úteis para hierarquias.
     - Materialized Views: armazenam os dados fisicamente, melhorando o desempenho em consultas pesadas.
   - Exemplo:
     ```sql
     CREATE VIEW clientes_transacoes AS
     SELECT 
         cliente.nome AS cliente_nome,
         tipo_transacao.nome AS tipo_transacao_nome,
         cliente_transacoes.valor AS valor_transacao
     FROM cliente_transacoes
     JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
     JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id;

     SELECT * FROM clientes_transacoes WHERE valor_transacao > 1000;
     ```