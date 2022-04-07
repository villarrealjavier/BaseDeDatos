 
 
 
--1. Ejecuta el siguiente bloque. Indica cuál es la salida. 
 
BEGIN
IF 10 > 5 THEN
DBMS_OUTPUT.PUT_LINE ('Cierto');
ELSE
DBMS_OUTPUT.PUT_LINE ('Falso');
END IF;
END;

/* Esto hará que si el numero 10 es mayor que 5, imprimirá cierto, y si el numero 10 es menor que 5 imprimirá falseo, cosa
que nunca se va a dar.

2. Ejecuta el siguiente bloque. Indica cuál es la salida
*/
BEGIN
IF 10 > 5 AND 5 > 1 THEN
DBMS_OUTPUT.PUT_LINE ('Cierto');
ELSE
DBMS_OUTPUT.PUT_LINE ('Falso');
END IF;
END;
/*  Este programa imprimirá cierto, si el numero 10 es mayor que el numero 5 
y el numero 5 es mayor que uno, si NO es así, por el contrario imprimirá FALSE,
pero esto nunca se va a dar*/


--3. Ejecuta el siguiente bloque. Indica cuál es la salida.

BEGIN
IF 10 > 5 AND 5 > 50 THEN
DBMS_OUTPUT.PUT_LINE ('Cierto');
ELSE
DBMS_OUTPUT.PUT_LINE ('Falso');
END IF;
END;

/*Esto imprimirá falso debido a que el numero 10 es mayor que el 5 pero el numero 5 NO es mayor que 50,
por lo cual entrará en el ELSE e imprimirá falso, si se corrige, imprimiría cierto.*/

--4. Ejecuta el siguiente bloque. Indica cuál es la salida.
BEGIN
CASE
WHEN 10 > 5 AND 5 > 50 THEN
DBMS_OUTPUT.PUT_LINE ('Cierto');
ELSE
DBMS_OUTPUT.PUT_LINE ('Falso');
END CASE;
END;
/*En este caso, imprimirá de nuevo FALSE debido que el numero 10 es mayor que el numero 5 pero el numero 5
NO es mayor que el numero 50, por lo cual a pesar de haber utilizado un CASE en lo mismo que el anterior.*/

--5. Ejecuta el siguiente bloque. Indica cuál es la salida
BEGIN
FOR i IN 1..10 LOOP
DBMS_OUTPUT.PUT_LINE (i);
END LOOP;
END;

/*Este programa imprimirá los numeros del 1 al 10.
 */

--6. Ejecuta el siguiente bloque. Indica cuál es la salida
BEGIN
FOR i IN REVERSE 1..10 LOOP
DBMS_OUTPUT.PUT_LINE (i);
END LOOP;
END;
/*
 * Hace lo mismo que el anterior solo que lo hace de froma inversa.
 */

--7. Ejecuta el siguiente bloque. Indica cuál es la salida.
DECLARE
num NUMBER(3) := 0;
BEGIN
WHILE num<=100 LOOP
DBMS_OUTPUT.PUT_LINE (num);
num:= num+2;
END LOOP;
END;
/*Declara un numero de 3 caracteres y lo iniicializa a 0, y imprime los numeros mientras que sea menor o igual que 100
 * pero conforme el bucle va dando vueltas a ese numero le va sumando 2.*/
--8. Ejecuta el siguiente bloque. Indica cuál es la salida.
DECLARE
num NUMBER(3) := 0;
BEGIN
LOOP
DBMS_OUTPUT.PUT_LINE (num);
IF num > 100 THEN EXIT; END IF;
num:= num+2;
END LOOP;
END;
/*Declara un numero de 3 caracteres y lo inicializa a 0, y realiza un bucle y le aplica dos condiciones, que cuando el numero sea 
 * mayor que 100 que se salga del bucle, mientras que le va incrementando un valor de 2.*/

--9. Ejecuta el siguiente bloque. Indica cuál es la salida.
DECLARE
num NUMBER(3) := 0;
BEGIN
LOOP
DBMS_OUTPUT.PUT_LINE (num);
EXIT WHEN num > 100;
num:= num+2;
END LOOP;
END;
/*Declara un numero de 3 caracteres y lo inicializa a 0, realiza un bucle el cual va imprimiendo el numero, y termina cuando el 
numero sea mayor que 100 y le va incrementando con un valor de 2.*/

