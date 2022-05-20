--1. .- Desarrollar un procedimiento que visualice el nombre, apellidos y puesto
--de todos los empleados, ordenados por primer apellido
CREATE OR REPLACE PROCEDURE SACAR_INFO
AS 
	CURSOR C IS SELECT NOMBRE,APELLIDO1,APELLIDO2,PUESTO FROM EMPLEADO ORDER BY APELLIDO1;
BEGIN 
	FOR registro IN C 
	LOOP
	DBMS_OUTPUT.PUT_LINE('Nombre: ' || registro.NOMBRE);
	DBMS_OUTPUT.PUT_LINE('Apellido 1 : ' || registro.APELLIDO1);
	DBMS_OUTPUT.PUT_LINE('Apellido 2 : ' || registro.APELLIDO2);
	DBMS_OUTPUT.PUT_LINE('Puesto: ' || registro.PUESTO);
	DBMS_OUTPUT.PUT_LINE('------------------------');

	END LOOP;
	
END;


BEGIN
	SACAR_INFO();
END;

--2 Desarrollar un procedimiento que muestre el código de cada oficina y el
--número de empleados que tiene
CREATE OR REPLACE PROCEDURE JARDINERIA.SACARINFO_DEPT
AS 
	CURSOR C IS SELECT COUNT(CODIGO_EMPLEADO) AS NUMERO_EMPLEADOS, CODIGO_OFICINA 
	FROM EMPLEADO 
	GROUP BY CODIGO_OFICINA ;

BEGIN 
	FOR registro IN C 
	LOOP
		DBMS_OUTPUT.PUT_LINE('Numero de empleados: ' || registro.NUMERO_EMPLEADOS);
		DBMS_OUTPUT.PUT_LINE('Codigo de Oficina: ' || registro.CODIGO_OFICINA);
	
	END LOOP;
	
END;

BEGIN
	SACARINFO_DEPT();
END;

--3 Desarrollar un procedimiento que reciba como parámetro una cadena de
--texto y muestre el código de cliente y nombre de cliente de todos los
--clientes cuyo nombre contenga la cadena especificada. Al finalizar debe
--mostrar el número de clientes mostrados
CREATE OR REPLACE PROCEDURE JARDINERIA.SACARCODIGO(cadena VARCHAR2)
AS 
	CURSOR C (cadena VARCHAR2) IS SELECT CODIGO_CLIENTE,NOMBRE_CLIENTE
	FROM CLIENTE WHERE NOMBRE_CLIENTE LIKE '%' || cadena || '%' ;
BEGIN 
	FOR registro IN C (cadena)
	LOOP
		DBMS_OUTPUT.PUT_LINE('Codigo de Cliente: ' || registro.CODIGO_CLIENTE);
		DBMS_OUTPUT.PUT_LINE('Nombre del cliente: ' || registro.NOMBRE_CLIENTE);

	END LOOP;
	
	
END;

BEGIN
	SACARCODIGO('Fish');
END;

--4 Escribir un programa que muestre el código de producto, nombre y gama
--de los 5 productos más vendidos
CREATE OR REPLACE PROCEDURE JARDINERIA.MASVENDIDOS
AS 
	CURSOR C IS 
	SELECT b.*
	FROM (SELECT P.CODIGO_PRODUCTO,P.NOMBRE,P.GAMA,DP.CANTIDAD  FROM PRODUCTO P, DETALLE_PEDIDO DP 
	WHERE P.CODIGO_PRODUCTO = DP.CODIGO_PRODUCTO
	ORDER BY DP.CANTIDAD DESC) b 
	WHERE ROWNUM<=5;
BEGIN
	FOR registro IN C 
	LOOP
		DBMS_OUTPUT.PUT_LINE('Codigo: ' || registro.CODIGO_PRODUCTO);
		DBMS_OUTPUT.PUT_LINE('Nombre: ' || registro.NOMBRE);
		DBMS_OUTPUT.PUT_LINE('Gama: ' || registro.GAMA);
	DBMS_OUTPUT.PUT_LINE('Cantidad: ' || registro.CANTIDAD);
	DBMS_OUTPUT.PUT_LINE('--------------');


	END LOOP;
END;

BEGIN 
	MASVENDIDOS();
END;

-------
--5.Desarrollar un procedimiento que aumente el límite de crédito en un
--50% a aquellos clientes que cuyo valor sea inferior al límite de crédito
--medio actual
CREATE OR REPLACE PROCEDURE JARDINERIA.AUMENTAR
AS 
	CURSOR C IS 
	SELECT LIMITE_CREDITO AS LIMITE_CREDITO_MEDIO, LIMITE_CREDITO + (LIMITE_CREDITO*0.5) AS AUMENTO
	FROM CLIENTE
	HAVING NVL(AVG(LIMITE_CREDITO),0)<LIMITE_CREDITO
	GROUP BY LIMITE_CREDITO;
BEGIN 
	FOR registro IN C
	LOOP
		DBMS_OUTPUT.PUT_LINE('Limite de credito normal:' || registro.LIMITE_CREDITO_MEDIO);
		DBMS_OUTPUT.PUT_LINE('Limite de credito aumento:' || registro.AUMENTO);
	
	END LOOP;
	
END;

BEGIN
	AUMENTAR();
END;

-------
CREATE OR REPLACE PROCEDURE JARDINERIA.SACAR_INFODIFICIL
AS 
	CURSOR C IS SELECT NOMBRE,APELLIDO1,APELLIDO2,PUESTO FROM EMPLEADO ORDER BY APELLIDO1;
	registro C%ROWTYPE;
BEGIN 
	OPEN C;
	LOOP
		FETCH C INTO registro;
		EXIT WHEN C%NOTFOUND;
	DBMS_OUTPUT.PUT_LINE('Nombre: ' || registro.NOMBRE);
	DBMS_OUTPUT.PUT_LINE('Apellido 1 : ' || registro.APELLIDO1);
	DBMS_OUTPUT.PUT_LINE('Apellido 2 : ' || registro.APELLIDO2);
	DBMS_OUTPUT.PUT_LINE('Puesto: ' || registro.PUESTO);
	DBMS_OUTPUT.PUT_LINE('------------------------');

	END LOOP;

CLOSE C;
	
END;


BEGIN
	SACAR_INFODIFICIL();
END;



	
