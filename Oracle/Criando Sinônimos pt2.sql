-- S� o DBA pode criar sin�nimos p�blicos


CREATE PUBLIC SYNONYM empregados1
FOR hr.employees;

DROP PUBLIC SYNONYM empregados;
DROP PUBLIC SYNONYM empregados1;