--1--
CREATE OR REPLACE
PROCEDURE HelloWorld()
AS 
BEGIN
	DBMS_OUTPUT.PUT_LINE('Hola mundo');
END;


BEGIN 
	HelloWorld();
END;
--2--
CREATE OR REPLACE
PROCEDURE Mensaje()
AS 
	Mensaje VARCHAR2:='Hola que tal amigos';
BEGIN
	DBMS_OUTPUT.PUT_LINE(Mensaje);
END;

BEGIN 
	Mensaje();
END;

--3--
CREATE OR REPLACE PROCEDURE SERIE(MINIMO NUMBER ,MAXIMO NUMBER, PASO NUMBER)
AS 
	i NUMBER(3):=MINIMO;
BEGIN
	WHILE i<=MAXIMO LOOP
		DBMS_OUTPUT.PUT_LINE(i);
		i:= i+PASO;
	END LOOP;
END;

BEGIN
	SERIE(1,8,3);
END;

--4--
CREATE OR REPLACE FUNCTION DUMMY.AZAR(MINIMO NUMBER, MAXIMO NUMBER) RETURN NUMBER 
AS 
	BEGIN 
	RETURN MOD(ABS(DBMS_RANDOM.RANDOM),MAXIMO)+MINIMO;
	END;

SELECT AZAR(1,10) FROM DUAL;

--5--
CREATE OR REPLACE FUNCTION DUMMY.NOTAS(nota NUMBER) RETURN VARCHAR2
AS 
	resultado VARCHAR2(50);
	BEGIN 
	CASE nota
    WHEN 10 THEN resultado:='Sobresaliente';
    WHEN 9  THEN resultado:='Sobresaliente';
    WHEN 8  THEN resultado:='Notable';
    WHEN 7  THEN resultado:='Notable';
    WHEN 6  THEN resultado:='Bien';
    WHEN 5  THEN resultado:='Suficiente';
    WHEN 4  THEN resultado:='Insuficiente';
    WHEN 3  THEN resultado:='Insuficiente';
    WHEN 2  THEN resultado:='Insuficiente';
    WHEN 1  THEN resultado:='Insuficiente';
    WHEN 0  THEN resultado:='Insuficiente';
    ELSE resultado:='Nota no válida';
  
  END CASE;
  RETURN resultado;
	END;

SELECT NOTAS(6) FROM DUAL;


