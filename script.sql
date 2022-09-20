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
--calcular potenciais raizes de uma equação de segundo grau
--dados seus coeficientes
DO $$
DECLARE
	a INT := fn_valor_aleatorio_entre(0, 20);
	b INT := fn_valor_aleatorio_entre(0, 20);
	c INT := fn_valor_aleatorio_entre(0, 20);
	delta NUMERIC (10, 2);
	raizUm NUMERIC (10, 2);
	raizDois NUMERIC (10, 2);
BEGIN
	RAISE NOTICE '%x% + %x + % = 0', a, U&'\00B2', b, c;
	IF a = 0 THEN
		RAISE NOTICE 'Não é uma equação do segundo grau';
	ELSE
		--delta := b ^ 2 - (4 * a * c);
		delta := b ^ 2 - 4ac;
		RAISE NOTICE 'Delta: %', delta;
		IF delta < 0 THEN
			RAISE NOTICE 'Nenhuma raiz';
		-- pode ser ELSEIF ou ELSIF
		ELSIF delta = 0 THEN
			raizUm := (-b + |/delta) / 2a;
			RAISE NOTICE 'Apenas uma raiz: %', raizUm;
		ELSE
			raizUm := (-b + |/delta) / 2a;
			raizDois := (-b - |/delta) / 2a;
			RAISE NOTICE 'Duas raizes: % e %', raizUm, raizDois;
		END IF;
	END IF;
END;
$$
----------------------------------
DO $$
DECLARE
	valor INT;
	mensagem VARCHAR(200);
BEGIN
	valor := fn_valor_aleatorio_entre (1, 12);
	RAISE NOTICE 'valor: %', valor;
	CASE valor
		WHEN 1 THEN
			mensagem := 'ímpar';
		WHEN 3 THEN
			mensagem := 'ímpar';
		WHEN 5 THEN
			mensagem := 'ímpar';
		WHEN 7 THEN
			mensagem := 'ímpar';
		WHEN 9 THEN
			mensagem := 'ímpar';
		WHEN 2 THEN
			mensagem := 'par';
		WHEN 4 THEN
			mensagem := 'par';
		WHEN 6 THEN
			mensagem := 'par';
		WHEN 8 THEN
			mensagem := 'par';
		WHEN 10 THEN
			mensagem := 'par';
		--ELSE
			--mensagem := 'valor fora do intervalo';	
	END CASE;
		RAISE NOTICE '%', mensagem;
END;
$$
-------------------------------------------
DO $$
DECLARE
	valor INT := fn_valor_aleatorio_entre(1, 12);
	mensagem VARCHAR(200);
BEGIN
	RAISE NOTICE 'Valor: %', valor;
	CASE valor
		WHEN 1, 3, 5, 7, 9 THEN
			mensagem := 'ímpar';
		WHEN 2, 4, 6, 8, 10 THEN
			mensagem := 'par';
		ELSE
			mensagem := 'Fora do intervalo';
	END CASE;
		RAISE NOTICE '%', mensagem;
END;
$$
-----------------------------------------
DO $$
DECLARE
	valor INT := fn_valor_aleatorio_entre(1, 12);
BEGIN
	RAISE NOTICE 'Valor: %', valor;
	CASE
		WHEN valor BETWEEN 1 AND 10 THEN
			CASE
				WHEN valor % 2 = 0 THEN
					RAISE NOTICE '% é par', valor;
				ELSE
					RAISE NOTICE '% é ímpar', valor;
			END CASE;
		ELSE
			RAISE NOTICE 'Valor fora do intervalo';
	END CASE;
END;
$$



