CREATE DATABASE GYM;
---------------------------------------------------------------------------
CREATE TABLE personas (id_persona serial,
					  nombre text,
					  apellidos text,
					  curp text,
					  experiencia text,
					  observaciones text,
					  passwd text,
					  tipo_usuario int,
CONSTRAINT pk_persona PRIMARY KEY (id_persona));

CREATE TABLE dietas (id_cliente int,
					id_entrenador int,
					dieta text,
CONSTRAINT fk_dieta_cliente FOREIGN KEY (id_cliente) REFERENCES personas (id_persona),
CONSTRAINT fk_dieta_entrenador FOREIGN KEY (id_entrenador) REFERENCES personas (id_persona));

CREATE TABLE rutinas (id_cliente int,
					 id_entrenador int,
					 lunes text,
					 martes text,
					 miercoles text,
					 jueves text,
					 viernes text,
					 sabado text,
					 domingo text,
CONSTRAINT fk_rutina_cliente FOREIGN KEY (id_cliente) REFERENCES personas (id_persona),
CONSTRAINT fk_rutina_entrenador FOREIGN KEY (id_entrenador) REFERENCES personas (id_persona));

CREATE TABLE pagos (id_pago serial,
				   id_cliente int,
				   fecha_pago date,
				   monto float,
				   paquete text,
CONSTRAINT pk_pago PRIMARY KEY (id_pago),
CONSTRAINT fk_pago_cliente FOREIGN KEY (id_cliente) REFERENCES personas (id_persona));

CREATE TABLE inscripciones (id_inscripcion serial,
						   fecha_inicio date,
						   fecha_termino date,
						   id_pago int,
CONSTRAINT pk_inscripciones PRIMARY KEY (id_inscripcion),
CONSTRAINT fk_inscripciones_pago FOREIGN KEY (id_pago) REFERENCES pagos (id_pago)) ;

CREATE TABLE progresos (id_persona int,
					   id_progreso serial,
					   fecha_captura date,
					   peso float,
					   estatura float,
CONSTRAINT pk_progresos PRIMARY KEY (id_persona,id_progreso));
----------------------------------------------------------------------------- FUNCIONES 
SELECT * FROM personas
CREATE OR REPLACE FUNCTION insertar_persona (IN nom text, IN apell TEXT, IN cp text, IN exper text,
											IN obser text, IN pass text, IN tipo_user int)
returns varchar
AS $$
	BEGIN 
		INSERT INTO personas (nombre,apellidos,curp,experiencia,observaciones,passwd,tipo_usuario) 
		VALUES (nom,apell,cp,exper,obser,pass,tipo_user);
		RETURN ('Se insertó el registro correctamente');
	END;
$$ LANGUAGE plpgsql;


SELECT * FROM rutinas

CREATE OR REPLACE FUNCTION insertar_rutina (IN cliente int, IN entrenador int, IN monday text, IN tuesday text,
											IN wedsday text, IN thursday text, IN friday text, IN saturday text, IN sunday text)
returns varchar
AS $$
	BEGIN 
		INSERT INTO rutinas VALUES (cliente, entrenador, monday, tuesday, wedsday, thursday, friday, saturday, sunday);
		RETURN ('Se insertó el registro correctamente');
	END;
$$ LANGUAGE plpgsql;

(SELECT * FROM inscripciones) -- HACER TRIGGER

SELECT * from pagos
CREATE OR REPLACE FUNCTION insertar_pagos (IN cliente int, IN mont float, IN paq text)
RETURNS varchar 
AS $$
	BEGIN
		INSERT INTO pagos (id_cliente, fecha_pago,monto,paquete) VALUES (cliente, NOW(), mont,paq );
		RETURN ('Se insertó el registro correctamente');
	END;
$$ LANGUAGE plpgsql;

SELECT * FROM progresos
	(SELECT CASE WHEN MAX(id_progreso WHERE id_persona=1cliente) IS NULL THEN '1'
	ELSE MAX(id_progreso)+1 END FROM progresos)
	
CREATE OR REPLACE FUNCTION insertar_progreso (IN cliente int, IN pes FLOAT, IN est FLOAT)
RETURNS varchar 
AS $$
DECLARE oldid int;
	BEGIN
	SELECT id_progreso FROM progresos WHERE id_persona=cliente INTO oldid;
	IF (oldid IS NULL) THEN 
		INSERT INTO progresos (id_persona, id_progreso, fecha_captura,peso, estatura) VALUES (cliente,1,NOW(),pes,est);
		RETURN ('Se insertó el registro correctamente');
		ELSE 
		INSERT INTO progresos (id_persona, id_progreso, fecha_captura,peso, estatura) VALUES (cliente,oldid+1,NOW(),pes,est);
		RETURN ('Se insertó el registro correctamente');
		END IF;
	END;
$$ LANGUAGE plpgsql;

SELECT * FROM dietas
CREATE OR REPLACE FUNCTION insertar_dieta (IN cliente INT, IN entrenador INT, IN diet text)
RETURNS varchar 
AS $$
	BEGIN
		INSERT INTO dietas (id_cliente, id_entrenador, dieta) VALUES (cliente,entrenador, diet);
		RETURN ('Se insertó el registro correctamente');
	END;
$$ LANGUAGE plpgsql;
--------------------------------------------------------------------------------------------FUNCIONES MODIFICAR
SELECT * FROM personas
CREATE OR REPLACE FUNCTION modificar_persona (IN nom text, IN apell TEXT,IN cp text,IN obser text, IN pass text)
RETURNS varchar 
AS $$
	BEGIN
		UPDATE personas SET nombre=nom, apellidos=apell, observaciones=obser, passwd=pass WHERE CURP=cp;
		RETURN ('Se modificó el registro correctamente');
	END;
$$ LANGUAGE plpgsql;

SELECT * FROM rutinas
SELECT * FROM personas
SELECT modificar_rutina (4,1,'LUNES','MM','mier','jue','vier','sab','dom');
CREATE OR REPLACE FUNCTION modificar_rutina (IN cliente int,IN entrenador int, IN monday text, IN tuesday text,
											IN wedsday text, IN thursday text, IN friday text, IN saturday text, IN sunday text)
returns varchar
AS $$
	BEGIN 
		UPDATE rutinas SET  id_entrenador=entrenador ,lunes=monday, martes=tuesday, miercoles=wedsday, jueves=thursday, viernes=friday, sabado=saturday, domingo=sunday WHERE id_cliente=cliente;  
		RETURN ('Se modificó el registro correctamente');
	END;
$$ LANGUAGE plpgsql;

SELECT * FROM progresos
select insertar_progreso(1,'5','10');
CREATE OR REPLACE FUNCTION modificar_progreso (IN cliente int,IN pes FLOAT, IN est float)
RETURNS varchar 
AS $$
	BEGIN
	UPDATE progresos SET peso=pes, estatura=est WHERE id_persona=cliente;
	END;
$$ LANGUAGE plpgsql;
SELECT * FROM rutinas
SELECT fecha_captura,peso,estatura FROM progresos WHERE id_persona=2
SELECT fecha_captura,peso,estatura FROM progresos WHERE id_persona=2
5



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

CREATE TRIGGER tr_insertar_inscripcion AFTER INSERT 
ON pagos FOR EACH ROW
EXECUTE PROCEDURE tr_insertar_inscripcion();


SELECT * FROM progresos;
SELECT * FROM personas;
SELECT * FROM rutinas;
SELECT * FROM dietas;
SELECT * FROM pagos;
SELECT * FROM inscripciones;
SELECT lunes,martes,miercoles,jueves,viernes,sabado,domingo,id_cliente FROM rutinas WHERE id_cliente=2
DELETE  FROM rutinas where lunes="lunes"

SELECT fecha_captura,peso,estatura FROM progresos WHERE id_persona=2