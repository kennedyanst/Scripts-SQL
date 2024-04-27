-- Seçao 20 - Database DML Triggers

-- Aula 2 - Database DML Triggers a Nível de Comando

CREATE OR REPLACE TRIGGER B_I_EMPLOYEES_S_TRG
BEFORE INSERT
ON employees
BEGIN
    IF(TO_CHAR(SYSDATE, 'DAY') IN ('SABADO', 'DOMINGO') OR
       TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) NOT BETWEEN 8 AND 18)
    THEN
        RAISE_APPLICATION_ERROR(-20001, 'O cadastramento de Empregado só é permitido em dia de semana dentro do horário comercial');
    END IF;
END;

-- Testando a validação da Trigger

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
                RAISE_APPLICATION_ERROR (-20001, 'O cadastramento de Empregado só é permitido em dia de semana dentro do horário comercial');
            WHEN DELETING
            THEN
                RAISE_APPLICATION_ERROR(-20002, 'A deleção de Empregados só é permitido em dias de semana, dentro do horário comercial');
            ELSE
                RAISE_APPLICATION_ERROR(-20003, 'A atualização de Empregados só é permitido em dias de semana, dentro do horário comercial');
            END CASE;
    END IF;
END;


-- Criando a Tabela de Log de Auditoria para Tabela EMPLOYEES para coluna SALARY

DROP TABLE employees_log;

CREATE TABLE employees_log
(employees_log_id NUMBER (11) NOT NULL,
dt_log DATE DEFAULT SYSDATE NOT NULL,
usuario VARCHAR2(30),
evento CHAR(1) NOT NULL,
employee_id NUMBER(6) NOT NULL,
salary-old NUMBER(8,2),
salary_new NUMBER(8,2));

ALTER TABLE employees_log
ADD CONSTRAINT employees_log_pk PRIMARY KEY (employees_log_id);

CREATE SEQUENCE employees_log_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE
NONAXVALUE;


-- Criando uma Trigger que gera Log de Auditoria para a Tabela EMPLOYEES para a coluna SALARY

CREATE OR REPLACE TRIGGER A_IUD_EMPLOYEES_R_TRG
    AFTER INSERT OR UPDATE OF SALARY OR DELETE
    ON EMPLOYEES
    FOR EACH ROW
DECLARE
    vevento         employees_log.evento%TYPE;
    vemployee_id    employees_log.employee_id%TYPE;
BEGIN
    CASE
        WHEN INSERTING 
        THEN
            vevento         := 'I';
            vemployee_id    := :new.employee_id;
        WHEN UPDATING 
        THEN
            vevento         := 'U';
            vemployee_id    := :new.employee_id;
        ELSE
            Vevento         :='D';
            vemployee-id    := :old.employee_id;
        END CASE;
        INSERT INTO employees_log
            (employees_log_id, 
            dt_log,
            usuario, 
            evento, 
            employee_id, 
            salary_old, 
            salary_new)
        VALUES
            (employees_log_seq.nextval,
            SYSDATE,
            USER,
            vevento,
            vemployee_id,
            :old.salary,
            :new.salary);
END A_IUD_EMPLOYEES_R_TRG;