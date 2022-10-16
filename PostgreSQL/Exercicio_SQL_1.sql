/* ----------- EXERCICIO 1 -----------

Crie uma instrução SQL que retorne a média de idade, número de filhos e grau de instrução dos funcionários cujo
salario_hora estiver acima da média de todos os funcionários.

Retorna os dados somente de funcionários da capital e estado civil casado, com ordem decrescente da média de idade.*/

SELECT round(AVG(idade)), numeros_filhos, grau_instrucao
FROM cap16."TB_FUNC"
WHERE reg_procedencia = 'capital' AND estado_civil = 'casado' AND salario_hora > (select avg(salario_hora) from cap16."TB_FUNC")
GROUP BY numeros_filhos, grau_instrucao
ORDER BY AVG(idade) DESC
