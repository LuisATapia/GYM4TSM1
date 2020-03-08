SELECT * FROM personas
SELECT * FROM rutina
SELECT * FROM dieta
SELECT * FROM progresos
SELECT * FROM inscripciones
SELECT * FROM pagos

SELECT * FROM inscripciones WHERE fecha_termino between   '2019-01-01' AND (SELECT current_date)

SELECT id_cliente FROM pagos pay
INNER JOIN inscripciones pro ON pay.id_pago= pro.id_pago

SELECT id_pago FROM pagos WHERE id_cliente=10 ORDER BY id_pago DESC LIMIT 1
INNER JOIN inscripciones ins ON ins 

SELECT fecha_inicio, fecha_termino FROM inscripciones ins
INNER JOIN pagos pa ON pa.id_pago=ins.id_pago WHERE id_cliente=10

SELECT DATE '2019-02-06' - DATE'2019-02-06' As Dias
SELECT DATE '2020-02-04'- (SELECT CURRENT_DATE)


SELECT fecha_termino - (SELECT current_date) FROM inscripciones ins
INNER JOIN pagos pa ON pa.id_pago=ins.id_pago WHERE id_cliente=10 ORDER BY pa.id_pago DESC LIMIT 1



SELECT * FROM progresos
	(SELECT CASE WHEN MAX(id_progreso WHERE id_persona=cliente) IS NULL THEN '1'
	ELSE MAX(id_progreso)+1 END FROM progresos)
----------------------------------------------------------------------------

SELECT DATE '2020-02-06' + INTERVAL '6 days'
SELECT CURRENT_DATE + INTERVAL '1 days'
SELECT * FROM pagos
SELECT * FROM inscripciones
SELECT * FROM personas
SELECT * FROM progresos
SELECT insertar_pagos (5,'100','Visita');
SELECT insertar_pagos(10,'1000','Anual');
DELETE FROM pagos WHERE id_pago=9;
------------------------------------------------------------------------------------------
TRUNCATE TABLE inscripciones
TRUNCATE TABLE  pagos CASCADE
DELETE FROM pagos
DELETE FROM inscripciones
CREATE OR REPLACE FUNCTION insertar_pagos (IN cliente int, IN mont float, IN paq text)
RETURNS varchar 
AS $$
DECLARE id_pagoViejo int;
	BEGIN
		IF (paq='Visita')
		THEN
		INSERT INTO pagos (id_cliente, fecha_pago,monto,paquete) VALUES (cliente, NOW(), mont,paq);
		RETURN ('Se insertó el registro correctamente');
		END IF;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION tr_insertar_inscripcion()
RETURNS trigger
LANGUAGE 'plpgsql'
AS $$
DECLARE pagoid int;
BEGIN
	IF (NEW.paquete = 'Visita') THEN
	SELECT MAX(id_pago) FROM pagos INTO pagoid;
	INSERT INTO inscripciones (fecha_inicio,fecha_termino,id_pago) VALUES (NOW(),(SELECT CURRENT_DATE + INTERVAL '1 days'), NEW.id_pago);
	END IF;
	RETURN NEW;
END;
$$;
CREATE TRIGGER tr_insertar_inscripcion AFTER INSERT 
ON pagos FOR EACH ROW
EXECUTE PROCEDURE tr_insertar_inscripcion();


CREATE OR REPLACE FUNCTION tr_insertar_inscripcion()
RETURNS trigger
LANGUAGE 'plpgsql'
AS $$
DECLARE pagoid int;
BEGIN
	IF (NEW.paquete = 'Visita') THEN
	SELECT MAX(id_pago) FROM pagos INTO pagoid;
	INSERT INTO inscripciones (fecha_inicio,fecha_termino,id_pago) VALUES (NOW(),(SELECT CURRENT_DATE + INTERVAL '1 days'), NEW.id_pago);
	END IF;
	IF (NEW.paquete = 'Semanal') THEN
	SELECT MAX(id_pago) FROM pagos INTO pagoid;
	INSERT INTO inscripciones (fecha_inicio,fecha_termino,id_pago) VALUES (NOW(),(SELECT CURRENT_DATE + INTERVAL '8 days'), NEW.id_pago);
	END IF;
	IF (NEW.paquete = 'Mensual') THEN
	SELECT MAX(id_pago) FROM pagos INTO pagoid;
	INSERT INTO inscripciones (fecha_inicio,fecha_termino,id_pago) VALUES (NOW(),(SELECT CURRENT_DATE + INTERVAL '31 days'), NEW.id_pago);
	END IF;
	IF (NEW.paquete = 'Anual') THEN
	SELECT MAX(id_pago) FROM pagos INTO pagoid;
	INSERT INTO inscripciones (fecha_inicio,fecha_termino,id_pago) VALUES (NOW(),(SELECT CURRENT_DATE + INTERVAL '366 days'), NEW.id_pago);
	END IF;
	RETURN NEW;
END;
$$;
