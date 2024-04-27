-- Se�ao 20 - Database DML Triggers

-- Aula 2 - Database DML Triggers a N�vel de Comando

CREATE OR REPLACE TRIGGER B_I_EMPLOYEES_S_TRG
BEFORE INSERT
ON employees
BEGIN
    IF(TO_CHAR(SYSDATE, 'DAY') IN ('SABADO', 'DOMINGO') OR
       TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) NOT BETWEEN 8 AND 18)
    THEN
        RAISE_APPLICATION_ERROR(-20001, 'O cadastramento de Empregado s� � permitido em dia de semana dentro do hor�rio comercial');
    END IF;
END;

-- Testando a valida��o da Trigger

BEGIN
    PCK_EMPREGADOS.PRC_INSERE_EMPREGADO('George', 'Harrison', 'GHARRISON', '515.258.5690', 'SYSDATE','IT_PROG',25000,NULL,103,60);
    COMMIT;
END;

-- Criando uma Trigger Combinando Varios Eventos

CREATE OR REPLACE TRIGGER B_IUD_VALIDA_HORARIO_EMPLOYEES_S_TRG
BEFORE INSERT OR UPDATE OR DELETE
ON employees
BEGIN
    IF (TO_CHAR(SYSDATE, 'DAY') IN ('SABADO', 'DOMINGO') OR
        TO_NUMBER(TO-CHAR(SYSDATE,'HH24')) NOT BETWEEN 8 AND 18)
    THEN
        CASE
            WHEN INSERTING
            THEN
                RAISE_APPLICATION_ERROR (-20001, 'O cadastramento de Empregado s� � permitido em dia de semana dentro do hor�rio comercial');
            WHEN DELETING
            THEN
                RAISE_APPLICATION_ERROR(-20002, 'A dele��o de Empregados s� � permitido em dias de semana, dentro do hor�rio comercial');
            ELSE
                RAISE_APPLICATION_ERROR(-20003, 'A atualiza��o de Empregados s� � permitido em dias de semana, dentro do hor�rio comercial');
            END CASE;
    END IF;
END;
        