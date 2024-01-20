-- Criando o Package Specification

CREATE OR REPLACE PACKAGE PCK_EMPREGADOS
IS
gMinSalary employees.salary%TYPE

    PROCEDURE PRC_INSERE_EMPREGADO
    (pfirst_name        IN VARCHAR2,
     plast_name         IN VARCHAR2,
     pemail             IN VARCHAR2,
     pphone_number      IN VARCHAR2,
     phire_date         IN DATE DEFAULT SYSDATE,
     pjob_id            IN VARCHAR2,
     psalary            IN NUMBER,
     pcommission_pct    IN NUMBER,
     pmanager_id        IN NUMBER,
     pdepartment_id     IN NUMBER);
     
     PROCEDURE PRC_AUMENTA_SALARIO_EMPREGADO
     (pemployee_id  IN NUMBER,
     ppercentual    IN NUMBER);
     
    FUNCTION FNC_CONSULTA_SALARIO_EMPREGADO
    (pemployee_id IN NUMBER)
    RETURN NUMBER;
    
END PCK_EMPREGADOS;