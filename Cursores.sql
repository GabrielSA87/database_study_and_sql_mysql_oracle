/* CURSORES */

CREATE DATABASE CURSORES;

USE CURSORES;

CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	JAN INT,
	FEV INT,
	MAR INT
);

INSERT INTO VENDEDORES VALUES(NULL,'GABRIEL',32432,232334,573337);
INSERT INTO VENDEDORES VALUES(NULL,'MAFRA',65465,32135,844854);
INSERT INTO VENDEDORES VALUES(NULL,'JOAO',44844,47548,31321);
INSERT INTO VENDEDORES VALUES(NULL,'MARIA',123123,234234,46456456);
INSERT INTO VENDEDORES VALUES(NULL,'SEBASTIAO',2442342,727527,72727);
INSERT INTO VENDEDORES VALUES(NULL,'PEDRO',42522,45452,42424);

SELECT * FROM VENDEDORES;

SELECT NOME, (JAN+FEV+MAR) AS 'TOTAL' FROM VENDEDORES;

SELECT NOME, (JAN+FEV+MAR) AS 'TOTAL', TRUNCATE(((JAN+FEV+MAR)/3),2) AS 'MEDIA' FROM VENDEDORES;

--SUPONDO QUE A ULTIMA QUERY ACIMA, ESTEJA DEMANDANDO MUITO TEMPO PARA RETORNAR--

CREATE TABLE VEND_TOTAL(
	NOME VARCHAR(30),
	JAN INT,
	FEV INT,
	MAR INT,
	TOTAL INT,
	MEDIA INT
);

DELIMITER #

CREATE PROCEDURE INSEREDADOS()
BEGIN
	DECLARE FIM INT DEFAULT 0;
	DECLARE VAR01, VAR02, VAR03, VTOTAL, VMEDIA INT;
	DECLARE VNOME VARCHAR(30);
	DECLARE REG CURSOR FOR (
		SELECT NOME, JAN, FEV, MAR FROM VENDEDORES
	);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM = 1;
	OPEN REG;
	REPEAT
		FETCH REG INTO VNOME, VAR01, VAR02, VAR03;
		IF NOT FIM THEN
			SET VTOTAL = (VAR01 + VAR02 + VAR03);
			SET VMEDIA = (VTOTAL / 3);
			INSERT INTO VEND_TOTAL VALUES (VNOME, VAR01, VAR02, VAR03, VTOTAL, VMEDIA);
		END IF;
	UNTIL FIM END REPEAT;
	CLOSE REG;
END
#

DELIMITER ;

SELECT * FROM VENDEDORES;

SELECT * FROM VEND_TOTAL;

CALL INSEREDADOS();