-- Só o DBA pode criar sinônimos públicos


CREATE PUBLIC SYNONYM empregados1
FOR hr.employees;

DROP PUBLIC SYNONYM empregados;
DROP PUBLIC SYNONYM empregados1;