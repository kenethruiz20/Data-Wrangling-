# Laboratorio 3 (parte 2)

### Keneth Ruiz 20210104
    Se ha cometido un delito y la policía necesita su ayuda. Un detective te dio el informe de la escena del crimen, pero de alguna manera lo perdiste. Recuerdas vagamente que el crimen fue un asesinato que ocurrió en algún momento del 15 de enero de 2018 y que tuvo lugar en SQL City. Empiece por recuperar el informe de la escena del crimen correspondiente de la base de datos del departamento de policía.

### Importamos la base de datos


```python
import sqlite3
```


```python
# Ruta completa hacia el archivo de la base de datos SQLite
db_file_path = 'C:/Users/Keneth Ruiz/OneDrive/Documentos/GitHub/Data-Wrangling-/Laboratorio3DW/sql-murder-mystery.db'

# Conectar a la base de datos
connection = sqlite3.connect(db_file_path)

```

### Ejecutamos lista de tablas de base datos para saber que si corrio la base de datos


```python
# Consulta SQL para seleccionar algunos registros de una tabla
query = "SELECT name FROM sqlite_master"  
# Ejecutar la consulta y obtener los resultados
results = connection.execute(query).fetchall()

# Imprimir los resultados
for row in results:
    print(row)


```

    ('crime_scene_report',)
    ('drivers_license',)
    ('person',)
    ('facebook_event_checkin',)
    ('interview',)
    ('get_fit_now_member',)
    ('sqlite_autoindex_get_fit_now_member_1',)
    ('get_fit_now_check_in',)
    ('income',)
    ('solution',)
    ('check_solution',)
    

### Buscamos reporte del 15 de enero de 2018 en SQL city de asesinato.


```python
query2 = """

SELECT *
FROM crime_scene_report
WHERE date = "20180115"
AND city = "SQL City"
AND type = "murder"

"""
```


```python
# Ejecutar la consulta y obtener los resultados
results = connection.execute(query2).fetchall()

# Imprimir los resultados
for row in results:
    print(row)

```

    (20180115, 'murder', 'Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".', 'SQL City')
    

### Localizamos a los testigos


```python
query3 = """

SELECT id, name, address_street_name, MAX(address_number)
FROM person
WHERE address_street_name = "Northwestern Dr"

"""
```


```python
# Ejecutar la consulta y obtener los resultados
results = connection.execute(query3).fetchall()

# Imprimir los resultados
for row in results:
    print(row)

```

    (14887, 'Morty Schapiro', 'Northwestern Dr', 4919)
    


```python
query4 = """

SELECT id, name, address_street_name, MAX(address_number)
FROM person
WHERE address_street_name = "Franklin Ave"
AND name LIKE "%Annabel%"

"""
```


```python
# Ejecutar la consulta y obtener los resultados
results = connection.execute(query4).fetchall()

# Imprimir los resultados
for row in results:
    print(row)
```

    (16371, 'Annabel Miller', 'Franklin Ave', 103)
    

### Ahora procedemos a buscar el testimonio de cada persona por medio de la tabla Interview


```python
query5 = """

SELECT *
FROM interview
WHERE person_id IN (14887, 16371)

"""
```


```python
# Ejecutar la consulta y obtener los resultados
results = connection.execute(query5).fetchall()

# Imprimir los resultados
for row in results:
    print(row)
```

    (14887, 'I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".')
    (16371, 'I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.')
    

### Buscamos a personas que cumplan con esas caracteristicas por medio de la tabla de check-in para saber quien llego el 9 de enero y driver license para verificar el numero de placa y persona para realizar el trazo.


```python
query6 = """

SELECT *
FROM get_fit_now_member G
INNER JOIN get_fit_now_check_in C ON G.id = C.membership_id

WHERE C.check_in_date = "20180109"

"""
```


```python
# Ejecutar la consulta y obtener los resultados
results = connection.execute(query6).fetchall()

# Imprimir los resultados
for row in results:
    print(row)
```

    ('X0643', 15247, 'Shondra Ledlow', 20170521, 'silver', 'X0643', 20180109, 957, 1164)
    ('UK1F2', 28073, 'Zackary Cabotage', 20170818, 'silver', 'UK1F2', 20180109, 344, 518)
    ('XTE42', 55662, 'Sarita Bartosh', 20170524, 'gold', 'XTE42', 20180109, 486, 1124)
    ('1AE2H', 10815, 'Adriane Pelligra', 20170816, 'silver', '1AE2H', 20180109, 461, 944)
    ('6LSTG', 83186, 'Burton Grippe', 20170214, 'gold', '6LSTG', 20180109, 399, 515)
    ('7MWHJ', 31523, 'Blossom Crescenzo', 20180309, 'regular', '7MWHJ', 20180109, 273, 885)
    ('GE5Q8', 92736, 'Carmen Dimick', 20170618, 'gold', 'GE5Q8', 20180109, 367, 959)
    ('48Z7A', 28819, 'Joe Germuska', 20160305, 'gold', '48Z7A', 20180109, 1600, 1730)
    ('48Z55', 67318, 'Jeremy Bowers', 20160101, 'gold', '48Z55', 20180109, 1530, 1700)
    ('90081', 16371, 'Annabel Miller', 20160208, 'gold', '90081', 20180109, 1600, 1700)
    

### Buscamos al sospechoso que cumpla con la mayor coincidencia


```python
query7 = """

SELECT *
FROM get_fit_now_member G
INNER JOIN get_fit_now_check_in C ON G.id = C.membership_id
INNER JOIN person P ON p.id = G.person_id
INNER JOIN drivers_license L ON L.id = P.license_id
WHERE C.check_in_date = "20180109"
AND G.membership_status = "gold"
AND G.id LIKE "48Z%"
AND L.gender = "male"
AND L.plate_number LIKE "%H42W%"



"""
```


```python
# Ejecutar la consulta y obtener los resultados
results = connection.execute(query7).fetchall()

# Imprimir los resultados
for row in results:
    print(row)
```

    ('48Z55', 67318, 'Jeremy Bowers', 20160101, 'gold', '48Z55', 20180109, 1530, 1700, 67318, 'Jeremy Bowers', 423327, 530, 'Washington Pl, Apt 3A', 871539279, 423327, 30, 70, 'brown', 'brown', 'male', '0H42W2', 'Chevrolet', 'Spark LS')
    

### Verificamos si esta persona es la asesina con el codigo brindado.


```python
# Consulta SQL para insertar un nuevo registro en la tabla "solution"
insert_query = "INSERT INTO solution VALUES (1, 'Jeremy Bowers')"

# Ejecutar la consulta de inserción
connection.execute(insert_query)
```




    <sqlite3.Cursor at 0x1f06206ef10>



### Hemos Encontrado al asesino, ahora nos falta buscar a la mente maestra del asesinato.


```python
# Consulta SQL para seleccionar el valor recién insertado
select_query = "SELECT value FROM solution"

# Ejecutar la consulta de selección y obtener los resultados
results = connection.execute(select_query).fetchall()
# Imprimir los resultados
for row in results:
    print(row)

```

    ("Congrats, you found the murderer! But wait, there's more... If you think you're up for a challenge, try querying the interview transcript of the murderer to find the real villian behind this crime. If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. Use this same INSERT statement with your new suspect to check your answer.",)
    

### Buscamos el testimonio del asesino, para saber que pistas dejo sobre la mente maestra(Jefe)


```python
query8 = """

SELECT *
FROM interview
Where person_id = 67318

"""
```


```python
# Ejecutar la consulta y obtener los resultados
results = connection.execute(query8).fetchall()

# Imprimir los resultados
for row in results:
    print(row)
```

    (67318, 'I was hired by a woman with a lot of money. I don\'t know her name but I know she\'s around 5\'5" (65") or 5\'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.\n')
    

### Juntamos todas las pistas brindadas de la sospechosa para encontrar el nombre


```python
query9 = """

SELECT P.id, P.name, I.annual_income, F.event_name, F.date, L. *
FROM person P
INNER JOIN drivers_license L ON L.id = P.license_id
INNER JOIN income I ON I.ssn = p.ssn
INNER JOIN facebook_event_checkin F ON F.person_id = P.id
WHERE L.gender = "female"
AND L.car_make = "Tesla"
AND L.car_model = "Model S"
AND L.height >= 65
AND L.height <= 67
AND L.hair_color = "red"

"""
```


```python
# Ejecutar la consulta y obtener los resultados
results = connection.execute(query9).fetchall()

# Imprimir los resultados
for row in results:
    print(row)
```

    (99716, 'Miranda Priestly', 310000, 'SQL Symphony Concert', 20171206, 202298, 68, 66, 'green', 'red', 'female', '500123', 'Tesla', 'Model S')
    (99716, 'Miranda Priestly', 310000, 'SQL Symphony Concert', 20171212, 202298, 68, 66, 'green', 'red', 'female', '500123', 'Tesla', 'Model S')
    (99716, 'Miranda Priestly', 310000, 'SQL Symphony Concert', 20171229, 202298, 68, 66, 'green', 'red', 'female', '500123', 'Tesla', 'Model S')
    

### Comprobamos si efectivamente la sospechosa es la culpable


```python
# Consulta SQL para insertar un nuevo registro en la tabla "solution"
insert_query = "INSERT INTO solution VALUES (1, 'Miranda Priestly')"

# Ejecutar la consulta de inserción
connection.execute(insert_query)
```




    <sqlite3.Cursor at 0x1f0620430a0>




```python
# Consulta SQL para seleccionar el valor recién insertado
select_query = "SELECT value FROM solution"

# Ejecutar la consulta de selección y obtener los resultados
results = connection.execute(select_query).fetchall()
# Imprimir los resultados
for row in results:
    print(row)
```

    ('Congrats, you found the brains behind the murder! Everyone in SQL City hails you as the greatest SQL detective of all time. Time to break out the champagne!',)
    

### Efectivamente es la culpable por lo que completamos el SQL Murder Mystery obteniendo como asesino a Jeremy Bowers y mente maestra a Miranda Priestly.  
