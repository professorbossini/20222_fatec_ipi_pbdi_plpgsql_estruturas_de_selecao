-- def funcao ():
-- 	return 1
CREATE FUNCTION fn_valor_aleatorio_entre(lim_inferior INT, lim_superior INT)
RETURNS INT AS
$$
BEGIN
	RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
END;
$$ LANGUAGE plpgsql;