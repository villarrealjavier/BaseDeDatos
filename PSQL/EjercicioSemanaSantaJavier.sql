CREATE OR REPLACE PROCEDURE NUMEROPAR(num1 NUMBER)
AS 
BEGIN
	IF MOD(num1,2)=0 THEN 
		DBMS_OUTPUT.PUT_LINE('El numero es Par');
	ELSE 
		DBMS_OUTPUT.PUT_LINE('El numero es Impar');
	END IF;
END;

BEGIN
	NUMEROPAR(5);
END;

CREATE OR REPLACE PROCEDURE PRODUCTOSUMA(num1 NUMBER,num2 NUMBER)
AS 
	j NUMBER(3)=1;
	i NUMBER(3):=num1;
BEGIN
	WHILE j<num2 LOOP 
		i:= i+num1;
		j:=j+1;
		
	END LOOP;
	DBMS_OUTPUT.PUT_LINE(i);
END;
BEGIN
	PRODUCTOSUMA(9,3);
END;

