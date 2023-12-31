dw-2023-parcial-1
================
Keneth Ruiz
9/11/2023

# Examen parcial

Indicaciones generales:

- Usted tiene el período de la clase para resolver el examen parcial.

- La entrega del parcial, al igual que las tareas, es por medio de su
  cuenta de github, pegando el link en el portal de MiU.

- Pueden hacer uso del material del curso e internet (stackoverflow,
  etc.). Sin embargo, si encontramos algún indicio de copia, se anulará
  el exámen para los estudiantes involucrados. Por lo tanto, aconsejamos
  no compartir las agregaciones que generen.

## Sección 0: Preguntas de temas vistos en clase (20pts)

- Responda las siguientes preguntas de temas que fueron tocados en
  clase.

1.  ¿Qué es una ufunc y por qué debemos de utilizarlas cuando
    programamos trabajando datos?

Es como una herramienta especial en programación que nos permite
realizar operaciones en grupos de datos de una manera más rápida y
efectiva. Usamos estas “funivs” cuando programamos con información
numérica porque hacen que nuestro código sea más eficiente al trabajar
con números y arreglos. Un ejemplo podria ser: Si queremos sumar todos
los elementos de una lista de números, podemos utilizar una ufunc para
hacerlo de manera rápida, en lugar de hacerlo uno por uno en un bucle.

2.  Es una técnica en programación numérica que amplía los objetos que
    son de menor dimensión para que sean compatibles con los de mayor
    dimensión. Describa cuál es la técnica y de un breve ejemplo en R.

Es el “broadcasting”. En R, “recycling”.Permite que las operaciones se
realicen entre arrays de diferentes formas de manera coherente. Por
ejemplo: si tenemos un vector en R y queremos sumarle un escalar, el
broadcasting permitirá que el escalar se sume a cada elemento del vector
automáticamente.

3.  ¿Qué es el axioma de elegibilidad y por qué es útil al momento de
    hacer análisis de datos?

El principio de accesibilidad nos dice que antes de analizar datos,
debemos asegurarnos de que estén en una condición adecuada para su
procesamiento. Esto implica que nuestros datos deben estar limpios y
bien estructurados para que podamos confiar en los resultados de nuestro
análisis. Es útil porque el análisis de datos de alta calidad depende en
gran medida de la disponibilidad y calidad de los datos subyacentes. Si
los datos no son elegibles, los resultados del análisis pueden ser
incorrectos o sesgados. Es como tener todas las piezas de un
rompecabezas en su lugar antes de armarlo.

4.  Cuál es la relación entre la granularidad y la agregación de datos?
    Mencione un breve ejemplo. Luego, exploque cuál es la granularidad o
    agregación requerida para poder generar un reporte como el
    siguiente:

| Pais | Usuarios |
|------|----------|
| US   | 1,934    |
| UK   | 2,133    |
| DE   | 1,234    |
| FR   | 4,332    |
| ROW  | 943      |

La granularidad es como el nivel de detalle de los datos, mientras que
la agregación es cuando agrupamos datos para ver el panorama general.
Por ejemplo, si tenemos información detallada de usuarios, primero
necesitamos agruparla por país para obtener el total de usuarios por
país y crear un informe como el que mencionas. La granularidad aquí se
refiere a los datos de usuario individuales, y la agregación los suma
para dar una visión general.

## Sección I: Preguntas teóricas. (50pts)

- Existen 10 preguntas directas en este Rmarkdown, de las cuales usted
  deberá responder 5. Las 5 a responder estarán determinadas por un
  muestreo aleatorio basado en su número de carné.

- Ingrese su número de carné en `set.seed()` y corra el chunk de R para
  determinar cuáles preguntas debe responder.

``` r
set.seed("20210104") 
v<- 1:10
preguntas <-sort(sample(v, size = 5, replace = FALSE ))

paste0("Mis preguntas a resolver son:  ",paste0(preguntas,collapse = ", "))
```

    ## [1] "Mis preguntas a resolver son:  3, 4, 6, 7, 10"

``` r
#"Mis preguntas a resolver son: 2, 4, 5, 6, 10"
```

### Listado de preguntas teóricas

1.  Para las siguientes sentencias de `base R`, liste su contraparte de
    `dplyr`:

    - `str()`
    - `df[,c("a","b")]`
    - `names(df)[4] <- "new_name"` donde la posición 4 corresponde a la
      variable `old_name`
    - `df[df$variable == "valor",]`

2.  Al momento de filtrar en SQL, ¿cuál keyword cumple las mismas
    funciones que el keyword `OR` para filtrar uno o más elementos una
    misma columna?

3.  ¿Por qué en R utilizamos funciones de la familia apply
    (lapply,vapply) en lugar de utilizar ciclos?

4.  ¿Cuál es la diferencia entre utilizar `==` y `=` en R?

5.  ¿Cuál es la forma correcta de cargar un archivo de texto donde el
    delimitador es `:`?

6.  ¿Qué es un vector y en qué se diferencia en una lista en R?

7.  ¿Qué pasa si quiero agregar una nueva categoría a un factor que no
    se encuentra en los niveles existentes?

8.  Si en un dataframe, a una variable de tipo `factor` le agrego un
    nuevo elemento que *no se encuentra en los niveles existentes*,
    ¿cuál sería el resultado esperado y por qué?

    - El nuevo elemento
    - `NA`

9.  En SQL, ¿para qué utilizamos el keyword `HAVING`?

10. Si quiero obtener como resultado las filas de la tabla A que no se
    encuentran en la tabla B, ¿cómo debería de completar la siguiente
    sentencia de SQL?

    - SELECT \* FROM A \_\_\_\_\_\_\_ B ON A.KEY = B.KEY WHERE
      \_\_\_\_\_\_\_\_\_\_ = \_\_\_\_\_\_\_\_\_\_

Extra: ¿Cuántos posibles exámenes de 5 preguntas se pueden realizar
utilizando como banco las diez acá presentadas? (responder con código de
R.)

## Sección II Preguntas prácticas. (30pts)

- Conteste las siguientes preguntas utilizando sus conocimientos de R.
  Adjunte el código que utilizó para llegar a sus conclusiones en un
  chunk del markdown.

A. De los clientes que están en más de un país,¿cuál cree que es el más
rentable y por qué?

``` r
library(readr)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
# Cargamos los datos del excel que esta en la misma carpeta.
parcial_anonimo <- read_rds("parcial_anonimo.rds")

# clientes que hay en más de un país
clientes_multinacionales <- parcial_anonimo %>%
  group_by(Cliente) %>%
  summarise(paises_distintos = n_distinct(Pais)) %>%
  filter(paises_distintos > 1)

# cliente más rentable entre los multinacionales
cliente_mas_rentable <- parcial_anonimo %>%
  filter(Cliente %in% clientes_multinacionales$Cliente) %>%
  group_by(Cliente) %>%
  summarise(total_vendido = sum(Venta)) %>%
  arrange(desc(total_vendido)) %>%
  slice(1)

# cliente más rentable
cliente_mas_rentable
```

    ## # A tibble: 1 × 2
    ##   Cliente  total_vendido
    ##   <chr>            <dbl>
    ## 1 a17a7558        19818.

El cliente “a17a7558” se considera el más rentable debido a que ha
generado ventas totales de 19,817.7 unidades, lo que indica su
contribución significativa a los ingresos de la empresa

B. Estrategia de negocio ha decidido que ya no operará en aquellos
territorios cuyas pérdidas sean “considerables”. Bajo su criterio,
¿cuáles son estos territorios y por qué ya no debemos operar ahí?

``` r
# Filtrar los datos para obtener solo las pérdidas 
territorios_con_perdidas <- parcial_anonimo %>%
  filter(Venta < 0)

# Hacer el calculo de el total de pérdidas que hay por cada territorio
perdidas_por_territorio <- territorios_con_perdidas %>%
  group_by(Pais) %>%
  summarise(total_perdido = sum(Venta))

# Ordenar los territorios por pérdidas de manera descendiente
perdidas_por_territorio <- perdidas_por_territorio %>%
  arrange(desc(total_perdido))

# territorios con pérdidas considerables
perdidas_por_territorio
```

    ## # A tibble: 2 × 2
    ##   Pais     total_perdido
    ##   <chr>            <dbl>
    ## 1 4f03bd9b       -25893.
    ## 2 4046ee34       -42074.

La justificación para no operar en estos territorios es debido a que las
pérdidas superan significativamente las ganancias, lo que llega a ser de
tal manera insostenible para el negocio. La estrategia de negocio podría
decidir no operar en estos territorios para lograr reducir las pérdidas
y asi concentrar recursos en áreas más rentables o para buscar
soluciones que reviertan la situación en esos territorios.

### I. Preguntas teóricas 2,4,5,6,9EXTRA

## 2 Al momento de filtrar en SQL, ¿cuál keyword cumple las mismas funciones que el keyword `OR` para filtrar uno o más elementos una misma columna?

``` r
###Respuesta Pregunta 2
####BETWEEN/IN
####La keyword IN se utiliza para especificar un conjunto de valores que se deben cumplir para que un registro se incluya en el resultado de la consulta.
####---como por ejemplo usando la base OR:---
####SELECT *
####FROM cars
####WHERE model = 'Toyota'
####OR model = 'Honda';
####---Ejemplo usando IN:---
####SELECT *
####FROM cars
####WHERE model IN ('Toyota', 'Honda');
####---Ejemplo usando Between:---
####SELECT *
####FROM cars
####WHERE year BETWEEN 2022 AND 2023;
```

## 4 ¿Cuál es la diferencia entre utilizar `==` y `=` en R?

``` r
###Respuesta pregunta 4
###El `= ` funciona como asignación, es como usar el `<-`, el  `==` funciona como *comparador* se indico en clase y devuelve un TRUE o FALSE, dependiendo el resultado. adjunto un codigo donde se explica mejor su diferencia:
x = 5
print(x)
```

    ## [1] 5

``` r
x1 <- 5
print(x1)
```

    ## [1] 5

``` r
x == 4
```

    ## [1] FALSE

\#5 ¿Cuál es la forma correcta de cargar un archivo de texto donde el
delimitador es `:`?

``` r
###Respuesta a pregunta 5
### Se puede leer con la funcion `read_delim` y en el argumento `delim` ponemos *:*
### ejemplo : **txt_1 <- read_delim("example.txt" , delim = ":")**
```

\#6 ¿Qué es un vector y en qué se diferencia en una lista en R?

``` r
### **RESPUESTA**
###Un vector es la estructura de datos más simple en R. Son un conjunto de datos del mismo tipo, se pueden combinar vectores, contar los valores, cambiar algun valor específico, la diferencia entre un vector y una lista en R es que los elementos de un vector deben de ser del mismo tipo y los de una lista pueden ser de distinto tipo.
### A  continuacion dare un ejemplo de un vector y entrare mas a detalle con el tema de la lista.
###Ejemplo vector
c(1,2,3,4,5,6)
```

    ## [1] 1 2 3 4 5 6

``` r
###Una lista puede contener más de un tipo de dato a la vez y puede ser multidimensional (algo que los vectores no pueden) y se crean usando la funcion *list()*
###ejemplo lista
ejemplo <- list('Keneth' , 'Ruiz' , TRUE , 2,4,6 , c(13,24,20))
print(ejemplo)
```

    ## [[1]]
    ## [1] "Keneth"
    ## 
    ## [[2]]
    ## [1] "Ruiz"
    ## 
    ## [[3]]
    ## [1] TRUE
    ## 
    ## [[4]]
    ## [1] 2
    ## 
    ## [[5]]
    ## [1] 4
    ## 
    ## [[6]]
    ## [1] 6
    ## 
    ## [[7]]
    ## [1] 13 24 20

\#pregunta 9 En SQL, ¿para qué utilizamos el keyword HAVING?

``` r
### En SQL, el keyword HAVING se utiliza para filtrar los resultados de una consulta que ha sido agrupada por una o más columnas.El keyword HAVING se utiliza ya sea después de la cláusula GROUP BY y antes de la cláusula ORDER BY. La cláusula HAVING contiene una condición que se aplica a los grupos de registros.
###A continacion adjuntare un ejemplo que muestra: 
###SELECT model, AVG(mpg) AS avg_mpg
###FROM cars
###GROUP BY model
###HAVING AVG(mpg) > 20;
###El resultado seria que Having filtraría los grupos de registros donde el promedio de millas por galón es menor que 20.
```

\#Pregunta Extra

``` r
###Extra: ¿Cuántos posibles exámenes de 5 preguntas se pueden realizar utilizando como banco las diez acá presentadas?
###(responder con código de R.)
```

``` r
library(gtools)

N <- 10
n <- 5

values <- c(1:N)
combinaciones <- combinations(N, n, values)
nrow(combinaciones)
```

    ## [1] 252

``` r
#252 combinaciones posibles
```
