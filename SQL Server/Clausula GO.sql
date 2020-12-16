/* DELIMITADOR DO SQL SERVER - GO */

CREATE DATABASE AULA_SQL
GO

USE AULA_SQL
GO

CREATE TABLE TESTE(
	NOME VARCHAR(30)
)
GO

-- MDF E LDF --
/*

MDF = MASTER DATA FILE (ARMAZENA DADOS DO SISTEMA - DICIONARIO)

LDF = LOG DATA FILE (ARMAZENA LOG)

*/


-- ORGANIZAR FISICAMENTE E LOGICAMENTE UM BANCO DE DADOS --
/*

	1 - CRIAR O BANCO COM ARQUIVOS PARA OS SETRORES DE MKT E VENDAS.
	2 - CRIAR UM ARQUIVO GERAL.
	3 - DEIXAR O MDF APENAS COM O DICIONARIO DE DADOS.
	4 - CRIAR 2 GRUPOS DE ARQUIVOS (PRIMARY - MDF).

*/
