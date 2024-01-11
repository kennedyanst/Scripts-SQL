ACCEPT pid PROMPT 'Digite o ID do empregado:'
SELECT employee_id, first_name, last_name
FROM employees
WHERE employee_id = &pid;