-- def funcao ():
-- 	return 1
CREATE OR REPLACE FUNCTION fn_valor_aleatorio_entre(lim_inferior INT, lim_superior INT)
RETURNS INT AS
$$
BEGIN
	RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
END;
$$ LANGUAGE plpgsql;
----------------------------------
SELECT fn_valor_aleatorio_entre (2, 10);
----------------------------------


DO $$
DECLARE
 valor INT;
BEGIN
	SELECT fn_valor_aleatorio_entre(1, 30) INTO valor;
	RAISE NOTICE 'O valor gerado foi %', valor;
	IF valor BETWEEN 1 AND 20 THEN
		RAISE NOTICE 'Metade de % igual a %', valor, valor / 2;
	END IF;
END;
$$

---------------------------------------------
DO $$
DECLARE
	valor INT := fn_valor_aleatorio_entre(1, 100);
BEGIN
	IF valor % 2 = 0 THEN
		RAISE NOTICE 'Valor % é par', valor;	
	ELSE
		RAISE NOTICE 'Valor % é ímpar', valor;
	END IF;
END;
$$

------------------------------------------






