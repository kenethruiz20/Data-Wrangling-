```python
import numpy as np
import pandas as pd
heroes_information = pd.read_csv("heroes_information.csv")
```


```python
###instalar desde anaconda navigator######
####pandasql
####mysql
####mysql-connector-c
####mysql-connector-python
from pandasql import *
```


```python
####para enlistar los documentos en el directorio#####
os.listdir()
```




    ['.android',
     '.atom',
     '.bash_history',
     '.cache',
     '.conda',
     '.condarc',
     '.config',
     '.continuum',
     '.docker',
     '.eclipse',
     '.git',
     '.gitconfig',
     '.gradle',
     '.ipynb_checkpoints',
     '.ipython',
     '.jupyter',
     '.m2',
     '.matplotlib',
     '.ms-ad',
     '.node_repl_history',
     '.pylint.d',
     '.ssh',
     '.streamlit',
     '.VirtualBox',
     '.vscode',
     '3D Objects',
     'anaconda3',
     'AndroidStudioProjects',
     'AppData',
     'Application Data',
     'Autodesk',
     'build',
     'composetest',
     'Configuración local',
     'Contacts',
     'Cookies',
     'Datos de programa',
     'Documents',
     'Downloads',
     'econgraf.py',
     'edb_languagepack.exe',
     'edb_mtk.exe',
     'edb_npgsql.exe',
     'Entorno de red',
     'Favorites',
     'git_practice',
     'heroes_information.csv',
     'import pandas as pd.py',
     'Impresoras',
     'IntelGraphicsProfiles',
     'Links',
     'Menú Inicio',
     'MicrosoftEdgeBackups',
     'Mis documentos',
     'miuDocumento_876805_SQLCompetitionDataandNotebook_912112.zip',
     'Music',
     'NTUSER.DAT',
     'ntuser.dat.LOG1',
     'ntuser.dat.LOG2',
     'NTUSER.DAT{53b39e87-18c4-11ea-a811-000d3aa4692b}.TxR.0.regtrans-ms',
     'NTUSER.DAT{53b39e87-18c4-11ea-a811-000d3aa4692b}.TxR.1.regtrans-ms',
     'NTUSER.DAT{53b39e87-18c4-11ea-a811-000d3aa4692b}.TxR.2.regtrans-ms',
     'NTUSER.DAT{53b39e87-18c4-11ea-a811-000d3aa4692b}.TxR.blf',
     'NTUSER.DAT{53b39e88-18c4-11ea-a811-000d3aa4692b}.TM.blf',
     'NTUSER.DAT{53b39e88-18c4-11ea-a811-000d3aa4692b}.TMContainer00000000000000000001.regtrans-ms',
     'NTUSER.DAT{53b39e88-18c4-11ea-a811-000d3aa4692b}.TMContainer00000000000000000002.regtrans-ms',
     'ntuser.ini',
     'OneDrive',
     'pemhttpd.exe',
     'Plantillas',
     'population',
     'postgis_3_1_pg14.exe',
     'postgresql_10.exe',
     'Postman',
     'Reciente',
     'Saved Games',
     'Searches',
     'SendTo',
     'SQL Competition.ipynb',
     'tema3.m',
     'tema3parcial1.m',
     'tema3parcialSC.m',
     'test',
     'Untitled Folder',
     'Videos',
     'VirtualBox VMs']




```python
pysqldf = lambda q: sqldf(q,globals())
```


```python
query2 = " SELECT * FROM heroes_information limit 10"
```


```python
pysqldf(query2)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>id</th>
      <th>name</th>
      <th>Gender</th>
      <th>Eye color</th>
      <th>Race</th>
      <th>Hair color</th>
      <th>Height</th>
      <th>Publisher</th>
      <th>Skin color</th>
      <th>Alignment</th>
      <th>Weight</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>A-Bomb</td>
      <td>Male</td>
      <td>yellow</td>
      <td>Human</td>
      <td>No Hair</td>
      <td>203.0</td>
      <td>Marvel Comics</td>
      <td>None</td>
      <td>good</td>
      <td>441.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>Abe Sapien</td>
      <td>Male</td>
      <td>blue</td>
      <td>Icthyo Sapien</td>
      <td>No Hair</td>
      <td>191.0</td>
      <td>Dark Horse Comics</td>
      <td>blue</td>
      <td>good</td>
      <td>65.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>Abin Sur</td>
      <td>Male</td>
      <td>blue</td>
      <td>Ungaran</td>
      <td>No Hair</td>
      <td>185.0</td>
      <td>DC Comics</td>
      <td>red</td>
      <td>good</td>
      <td>90.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>Abomination</td>
      <td>Male</td>
      <td>green</td>
      <td>Human / Radiation</td>
      <td>No Hair</td>
      <td>203.0</td>
      <td>Marvel Comics</td>
      <td>None</td>
      <td>bad</td>
      <td>441.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>Abraxas</td>
      <td>Male</td>
      <td>blue</td>
      <td>Cosmic Entity</td>
      <td>Black</td>
      <td>-99.0</td>
      <td>Marvel Comics</td>
      <td>None</td>
      <td>bad</td>
      <td>-99.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>5</td>
      <td>Absorbing Man</td>
      <td>Male</td>
      <td>blue</td>
      <td>Human</td>
      <td>No Hair</td>
      <td>193.0</td>
      <td>Marvel Comics</td>
      <td>None</td>
      <td>bad</td>
      <td>122.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>6</td>
      <td>Adam Monroe</td>
      <td>Male</td>
      <td>blue</td>
      <td>None</td>
      <td>Blond</td>
      <td>-99.0</td>
      <td>NBC - Heroes</td>
      <td>None</td>
      <td>good</td>
      <td>-99.0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>7</td>
      <td>Adam Strange</td>
      <td>Male</td>
      <td>blue</td>
      <td>Human</td>
      <td>Blond</td>
      <td>185.0</td>
      <td>DC Comics</td>
      <td>None</td>
      <td>good</td>
      <td>88.0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>8</td>
      <td>Agent 13</td>
      <td>Female</td>
      <td>blue</td>
      <td>None</td>
      <td>Blond</td>
      <td>173.0</td>
      <td>Marvel Comics</td>
      <td>None</td>
      <td>good</td>
      <td>61.0</td>
    </tr>
    <tr>
      <th>9</th>
      <td>9</td>
      <td>Agent Bob</td>
      <td>Male</td>
      <td>brown</td>
      <td>Human</td>
      <td>Brown</td>
      <td>178.0</td>
      <td>Marvel Comics</td>
      <td>None</td>
      <td>good</td>
      <td>81.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
query1 = """
SELECT *
FROM heroes_information
WHERE Race='Human'
AND Height > 200;

"""
```


```python
pysqldf(query1)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>id</th>
      <th>name</th>
      <th>Gender</th>
      <th>Eye color</th>
      <th>Race</th>
      <th>Hair color</th>
      <th>Height</th>
      <th>Publisher</th>
      <th>Skin color</th>
      <th>Alignment</th>
      <th>Weight</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>A-Bomb</td>
      <td>Male</td>
      <td>yellow</td>
      <td>Human</td>
      <td>No Hair</td>
      <td>203.0</td>
      <td>Marvel Comics</td>
      <td>None</td>
      <td>good</td>
      <td>441.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>29</td>
      <td>Ant-Man</td>
      <td>Male</td>
      <td>blue</td>
      <td>Human</td>
      <td>Blond</td>
      <td>211.0</td>
      <td>Marvel Comics</td>
      <td>None</td>
      <td>good</td>
      <td>122.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>59</td>
      <td>Bane</td>
      <td>Male</td>
      <td>None</td>
      <td>Human</td>
      <td>None</td>
      <td>203.0</td>
      <td>DC Comics</td>
      <td>None</td>
      <td>bad</td>
      <td>180.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>119</td>
      <td>Bloodaxe</td>
      <td>Female</td>
      <td>blue</td>
      <td>Human</td>
      <td>Brown</td>
      <td>218.0</td>
      <td>Marvel Comics</td>
      <td>None</td>
      <td>bad</td>
      <td>495.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>221</td>
      <td>Doctor Doom</td>
      <td>Male</td>
      <td>brown</td>
      <td>Human</td>
      <td>Brown</td>
      <td>201.0</td>
      <td>Marvel Comics</td>
      <td>None</td>
      <td>bad</td>
      <td>187.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>373</td>
      <td>Juggernaut</td>
      <td>Male</td>
      <td>blue</td>
      <td>Human</td>
      <td>Red</td>
      <td>287.0</td>
      <td>Marvel Comics</td>
      <td>None</td>
      <td>neutral</td>
      <td>855.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>391</td>
      <td>Kingpin</td>
      <td>Male</td>
      <td>blue</td>
      <td>Human</td>
      <td>No Hair</td>
      <td>201.0</td>
      <td>Marvel Comics</td>
      <td>None</td>
      <td>bad</td>
      <td>203.0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>412</td>
      <td>Lizard</td>
      <td>Male</td>
      <td>red</td>
      <td>Human</td>
      <td>No Hair</td>
      <td>203.0</td>
      <td>Marvel Comics</td>
      <td>None</td>
      <td>bad</td>
      <td>230.0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>476</td>
      <td>Mr Incredible</td>
      <td>Male</td>
      <td>blue</td>
      <td>Human</td>
      <td>Blond</td>
      <td>201.0</td>
      <td>Dark Horse Comics</td>
      <td>None</td>
      <td>good</td>
      <td>158.0</td>
    </tr>
    <tr>
      <th>9</th>
      <td>557</td>
      <td>Rey</td>
      <td>Female</td>
      <td>hazel</td>
      <td>Human</td>
      <td>Brown</td>
      <td>297.0</td>
      <td>George Lucas</td>
      <td>None</td>
      <td>good</td>
      <td>-99.0</td>
    </tr>
    <tr>
      <th>10</th>
      <td>583</td>
      <td>Scorpion</td>
      <td>Male</td>
      <td>brown</td>
      <td>Human</td>
      <td>Brown</td>
      <td>211.0</td>
      <td>Marvel Comics</td>
      <td>None</td>
      <td>bad</td>
      <td>310.0</td>
    </tr>
    <tr>
      <th>11</th>
      <td>591</td>
      <td>She-Hulk</td>
      <td>Female</td>
      <td>green</td>
      <td>Human</td>
      <td>Green</td>
      <td>201.0</td>
      <td>Marvel Comics</td>
      <td>None</td>
      <td>good</td>
      <td>315.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
query = """
SELECT name
FROM heroes_information
ORDER BY id
LIMIT 1;
"""

```


```python
pysqldf(query)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>A-Bomb</td>
    </tr>
  </tbody>
</table>
</div>




```python
query = """
SELECT COUNT(DISTINCT publisher)
AS num_casas_publicadoras
FROM heroes_information

"""

```


```python
pysqldf(query)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>num_casas_publicadoras</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>24</td>
    </tr>
  </tbody>
</table>
</div>




```python
query = """
SELECT COUNT(*) AS num_superheroes_altos
FROM heroes_information
WHERE height > 200;

"""


```


```python
pysqldf(query)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>num_superheroes_altos</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>59</td>
    </tr>
  </tbody>
</table>
</div>




```python
query = """
SELECT COUNT(*) AS num_superheroes_humanos_altos
FROM heroes_information
WHERE race = 'human' AND height > 200;

"""

```


```python
pysqldf(query)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>num_superheroes_humanos_altos</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
    </tr>
  </tbody>
</table>
</div>




```python
query = """
SELECT COUNT(*) AS num_superheroes_peso_medio
FROM heroes_information
WHERE weight > 100 AND weight < 200;

"""

```


```python
pysqldf(query)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>num_superheroes_peso_medio</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>98</td>
    </tr>
  </tbody>
</table>
</div>




```python
query = """
SELECT COUNT(*) AS num_superheroes_ojos_azul_o_rojo
FROM heroes_information
WHERE "eye color" = 'blue' OR "eye color" = 'red';

"""

```


```python
pysqldf(query)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>num_superheroes_ojos_azul_o_rojo</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>271</td>
    </tr>
  </tbody>
</table>
</div>




```python
query = """
SELECT COUNT(*) AS num_superheroes_human_mutant_verde_o_vampiro_negro
FROM heroes_information
WHERE (race = 'Human' OR race = 'Mutant') AND "hair color" = 'Green'
      OR (race = 'Vampire' AND "hair color" = 'Black');

"""
```


```python
pysqldf(query)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>num_superheroes_human_mutant_verde_o_vampiro_negro</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>




```python
query = """
SELECT name
FROM heroes_information
ORDER BY race DESC
LIMIT 1;

"""

```


```python
pysqldf(query)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Solomon Grundy</td>
    </tr>
  </tbody>
</table>
</div>




```python
query = """
SELECT gender, COUNT(*) as count
FROM heroes_information
GROUP BY gender;

"""

```


```python
pysqldf(query)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Gender</th>
      <th>count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>None</td>
      <td>29</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Female</td>
      <td>200</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Male</td>
      <td>505</td>
    </tr>
  </tbody>
</table>
</div>




```python
query = """
SELECT publisher, COUNT(*) AS num_superheroes
FROM heroes_information
GROUP BY publisher
HAVING num_superheroes > 15;

"""


```


```python
pysqldf(query)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Publisher</th>
      <th>num_superheroes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>DC Comics</td>
      <td>215</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Dark Horse Comics</td>
      <td>18</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Marvel Comics</td>
      <td>388</td>
    </tr>
    <tr>
      <th>3</th>
      <td>NBC - Heroes</td>
      <td>19</td>
    </tr>
  </tbody>
</table>
</div>




```python

```
