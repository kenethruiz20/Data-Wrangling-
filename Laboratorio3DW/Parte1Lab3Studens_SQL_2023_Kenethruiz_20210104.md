# Laboratorio 3 

## Keneth Ruiz 20210104
    1. parte 1 del lab



```python
pip install mysql-connector-python

```

    Requirement already satisfied: mysql-connector-python in c:\users\keneth ruiz\anaconda3\envs\data-wrangling-2023\lib\site-packages (8.1.0)
    Requirement already satisfied: protobuf<=4.21.12,>=4.21.1 in c:\users\keneth ruiz\anaconda3\envs\data-wrangling-2023\lib\site-packages (from mysql-connector-python) (4.21.12)
    Note: you may need to restart the kernel to use updated packages.
    


```python
import pandas as pd

# Ajustar opciones de visualización
pd.set_option('display.max_columns', None)  # todas las columnas
pd.set_option('display.max_rows', None)     # todas las filas
pd.set_option('display.width', 1000)        # ancho de la salida

```

Creamos una función la cual tendrá como parámetros lo necesario para poder establecer la conexión al SQL:


```python
import mysql.connector
from mysql.connector import Error

def create_connection(host_name, user_name, user_password):
    connection = None
    try:
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            passwd=user_password
        )
        print("Connection to MySQL DB successful")
    except Error as e:
        print(f"The error '{e}' occurred")

    return connection
```


```python
host = "relational.fit.cvut.cz"
user = "guest"
pwd = "relational"
connection = create_connection(host_name = host, user_name =user ,user_password = pwd)
```

    Connection to MySQL DB successful
    

### Parte 1: (15 pts) Utilizando la base de datos vista en clase, conteste las siguientes preguntas.

1.	Obtener el nombre, apellido, salario, título y vigencia del mismo para el empleado 12557. Su resultado se debe de ver de la siguiente manera:



```python
pregunta1 = '''
SELECT
    A.emp_no,
    C.first_name, 
    C.last_name, 
    A.title,
    B.from_date,
    B.to_date, 
    B.salary
FROM employee.titles A
LEFT JOIN employee.salaries B ON A.emp_no = B.emp_no
LEFT JOIN employee.employees C ON A.emp_no = C.emp_no 
WHERE B.emp_no = 12557
ORDER BY B.from_date;
'''

```


```python
resultado = pd.read_sql(pregunta1, connection)
print(resultado)
```

    C:\Users\Keneth Ruiz\AppData\Local\Temp\ipykernel_13920\40459054.py:1: UserWarning: pandas only supports SQLAlchemy connectable (engine/connection) or database string URI or sqlite3 DBAPI2 connection. Other DBAPI2 objects are not tested. Please consider using SQLAlchemy.
      resultado = pd.read_sql(pregunta1, connection)
    

        emp_no first_name last_name            title   from_date     to_date  salary
    0    12557   Stafford    Kopetz  Senior Engineer  1988-03-20  1989-03-20   41840
    1    12557   Stafford    Kopetz  Senior Engineer  1989-03-20  1990-03-20   46021
    2    12557   Stafford    Kopetz  Senior Engineer  1990-03-20  1991-03-20   48699
    3    12557   Stafford    Kopetz  Senior Engineer  1991-03-20  1992-03-19   51610
    4    12557   Stafford    Kopetz  Senior Engineer  1992-03-19  1993-03-19   51351
    5    12557   Stafford    Kopetz  Senior Engineer  1993-03-19  1994-03-19   51660
    6    12557   Stafford    Kopetz  Senior Engineer  1994-03-19  1995-03-19   52878
    7    12557   Stafford    Kopetz  Senior Engineer  1995-03-19  1996-03-18   54053
    8    12557   Stafford    Kopetz  Senior Engineer  1996-03-18  1997-03-18   57950
    9    12557   Stafford    Kopetz  Senior Engineer  1997-03-18  1998-03-18   58055
    10   12557   Stafford    Kopetz  Senior Engineer  1998-03-18  1999-03-18   58863
    11   12557   Stafford    Kopetz  Senior Engineer  1999-03-18  2000-03-17   60447
    12   12557   Stafford    Kopetz  Senior Engineer  2000-03-17  2001-03-17   60959
    13   12557   Stafford    Kopetz  Senior Engineer  2001-03-17  2002-03-17   62951
    14   12557   Stafford    Kopetz  Senior Engineer  2002-03-17  9999-01-01   64554
    

### Ejercicio 2 

2.	Encontrar el último departamento en el que trabajó el empleado con la siguiente información del mismo: nombre, apellido, número de empleado, fecha de nacimiento, código de departamento, nombre del departamento, fecha cuando inició su trabajo en ese departamento y la fecha cuando concluyó su trabajo



```python
pregunta2 = """ 
SELECT
    A.emp_no,
    A.birth_date, 
    A.first_name, 
    A.last_name,
    B.dept_no,
    B.from_date,
    B.to_date, 
    C.dept_name
FROM employee.employees A
LEFT JOIN employee.dept_emp B on A.emp_no = B.emp_no
LEFT JOIN employee.departments C on C.dept_no = B.dept_no
WHERE A.emp_no = 12557
LIMIT 1
"""

```


```python
resultado2 = pd.read_sql(pregunta2, connection)
print(resultado2)
```

    C:\Users\Keneth Ruiz\AppData\Local\Temp\ipykernel_13920\1249884466.py:1: UserWarning: pandas only supports SQLAlchemy connectable (engine/connection) or database string URI or sqlite3 DBAPI2 connection. Other DBAPI2 objects are not tested. Please consider using SQLAlchemy.
      resultado2 = pd.read_sql(pregunta2, connection)
    

       emp_no  birth_date first_name last_name dept_no   from_date     to_date   dept_name
    0   12557  1954-01-01   Stafford    Kopetz    d004  1994-09-23  9999-01-01  Production
    

### Ejercicio 3

#### 3.	Encontrar el salario máximo de cada empleado utilizando la función Partition By con toda la información del empleado y de su salario
   


```python
pregunta3 = """
SELECT DISTINCT
    A.emp_no,
    A.birth_date,
    A.first_name, 
    A.last_name,
    A.gender,
    A.hire_date,
    MAX(B.salary) OVER (PARTITION BY A.emp_no) AS max_salary
FROM employee.employees A
LEFT JOIN employee.salaries B ON A.emp_no = B.emp_no
ORDER BY max_salary
LIMIT 5;
"""

```


```python
resultado3 = pd.read_sql(pregunta3, connection)
print(resultado3)
```

    C:\Users\Keneth Ruiz\AppData\Local\Temp\ipykernel_13920\3337817780.py:1: UserWarning: pandas only supports SQLAlchemy connectable (engine/connection) or database string URI or sqlite3 DBAPI2 connection. Other DBAPI2 objects are not tested. Please consider using SQLAlchemy.
      resultado3 = pd.read_sql(pregunta3, connection)
    

       emp_no  birth_date  first_name  last_name gender   hire_date  max_salary
    0  245576  1963-05-12  Abdelwaheb  Besselaar      F  1994-08-09       40000
    1  225113  1954-07-01      Murthy     Pappas      F  1990-10-22       40000
    2  265392  1961-07-29    Sangeeta   Orlowski      F  1989-10-04       40000
    3  446677  1959-09-29       Lijia  Magalhaes      M  1987-08-25       40000
    4   25287  1957-05-18     Florina   Meszaros      F  1988-10-17       40000
    


```python

```
