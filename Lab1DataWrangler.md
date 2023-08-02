LABORATORIO 1 DATA WRANGLER
================
Keneth Ruiz
2023-08-02

## Incorporacion de librerias

``` r
library(readxl)
library(purrr)
library(readr)
```

# Problema 1

``` r
carpeta <- "C:/Users/Keneth Ruiz/OneDrive/Escritorio/Datasetlab1"

### Lista de archivos Excel en la carpeta
archivos <- list.files(path = carpeta, pattern = "\\.xlsx$", full.names = TRUE)

### Importar archivos y combinar en una única tabla utilizando map_dfr
tabla_final <- map_dfr(archivos, ~ {
  datos <- read_excel(.x)
  datos$archivo <- tools::file_path_sans_ext(basename(.x))
  datos$fecha <- tools::file_path_sans_ext(basename(.x)) 
### Crear la columna "fecha"
  return(datos)
})
```

    ## New names:
    ## • `` -> `...10`

``` r
### Verificar la tabla final
head(tabla_final)
```

    ## # A tibble: 6 × 12
    ##   COD_VIAJE CLIENTE UBICACION CANTIDAD PILOTO     Q CREDITO UNIDAD archivo fecha
    ##       <dbl> <chr>       <dbl>    <dbl> <chr>  <dbl>   <dbl> <chr>  <chr>   <chr>
    ## 1  10000001 EL PIN…     76002     1200 Ferna… 300        30 Camio… 01-2018 01-2…
    ## 2  10000002 TAQUER…     76002     1433 Hecto… 358.       90 Camio… 01-2018 01-2…
    ## 3  10000003 TIENDA…     76002     1857 Pedro… 464.       60 Camio… 01-2018 01-2…
    ## 4  10000004 TAQUER…     76002      339 Angel…  84.8      30 Panel  01-2018 01-2…
    ## 5  10000005 CHICHA…     76001     1644 Juan … 411        30 Camio… 01-2018 01-2…
    ## 6  10000006 UBIQUO…     76001     1827 Luis … 457.       30 Camio… 01-2018 01-2…
    ## # ℹ 2 more variables: TIPO <dbl>, ...10 <dbl>

``` r
tabla_final
```

    ## # A tibble: 2,180 × 12
    ##    COD_VIAJE CLIENTE      UBICACION CANTIDAD PILOTO     Q CREDITO UNIDAD archivo
    ##        <dbl> <chr>            <dbl>    <dbl> <chr>  <dbl>   <dbl> <chr>  <chr>  
    ##  1  10000001 EL PINCHE O…     76002     1200 Ferna… 300        30 Camio… 01-2018
    ##  2  10000002 TAQUERIA EL…     76002     1433 Hecto… 358.       90 Camio… 01-2018
    ##  3  10000003 TIENDA LA B…     76002     1857 Pedro… 464.       60 Camio… 01-2018
    ##  4  10000004 TAQUERIA EL…     76002      339 Angel…  84.8      30 Panel  01-2018
    ##  5  10000005 CHICHARRONE…     76001     1644 Juan … 411        30 Camio… 01-2018
    ##  6  10000006 UBIQUO LABS…     76001     1827 Luis … 457.       30 Camio… 01-2018
    ##  7  10000007 CHICHARRONE…     76002     1947 Ismae… 487.       90 Camio… 01-2018
    ##  8  10000008 TAQUERIA EL…     76001     1716 Juan … 429        60 Camio… 01-2018
    ##  9  10000009 EL GALLO NE…     76002     1601 Ismae… 400.       30 Camio… 01-2018
    ## 10  10000010 CHICHARRONE…     76002     1343 Ferna… 336.       90 Camio… 01-2018
    ## # ℹ 2,170 more rows
    ## # ℹ 3 more variables: fecha <chr>, TIPO <dbl>, ...10 <dbl>

### Nombres de cada columna

``` r
names(tabla_final)
```

    ##  [1] "COD_VIAJE" "CLIENTE"   "UBICACION" "CANTIDAD"  "PILOTO"    "Q"        
    ##  [7] "CREDITO"   "UNIDAD"    "archivo"   "fecha"     "TIPO"      "...10"

### Cantidad de documentos de excel

``` r
# Obtener la cantidad de documentos de Excel en la tabla
num_documentos <- length(unique(tabla_final$archivo))

# Imprimir la cantidad de documentos
print(num_documentos)
```

    ## [1] 11

# Problema 2

``` r
### Crear una lista con al menos 3 vectores
lista_vectores <- list(
  vector1 = c(1, 0, 1, 3, 1, 0, 1, 1, 1),
  vector2 = c(4, 4, 4, 4, 4, 4, 3, 4, 3),
  vector3 = c(77, 44, 77, 55, 77, 33, 77, 44, 77)
)

### Definir una función para calcular la moda de un vector
calcular_moda <- function(x) {
  tab <- table(x)
  moda <- as.numeric(names(tab)[tab == max(tab)])
  return(moda)
}

### Usar lapply para encontrar la moda de cada vector en la lista
moda_por_vector <- lapply(lista_vectores, calcular_moda)

### Mostrar los resultados
print(moda_por_vector)
```

    ## $vector1
    ## [1] 1
    ## 
    ## $vector2
    ## [1] 4
    ## 
    ## $vector3
    ## [1] 77

# problema 3

``` r
library(readr)

ruta <- "C:/Users/Keneth Ruiz/OneDrive/Escritorio/Datasetlab1/INE_PARQUE_VEHICULAR_080219.txt"
datos <- read_delim(ruta, delim = '|', show_col_types = FALSE)
```

    ## New names:
    ## • `` -> `...11`

    ## Warning: One or more parsing issues, call `problems()` on your data frame for details,
    ## e.g.:
    ##   dat <- vroom(...)
    ##   problems(dat)

``` r
head(datos)
```

    ## # A tibble: 6 × 11
    ##   ANIO_ALZA MES   NOMBRE_DEPARTAMENTO NOMBRE_MUNICIPIO MODELO_VEHICULO
    ##       <dbl> <chr> <chr>               <chr>            <chr>          
    ## 1      2007 05    HUEHUETENANGO       "HUEHUETENANGO"  2007           
    ## 2      2007 05    EL PROGRESO         "EL JICARO"      2007           
    ## 3      2007 05    SAN MARCOS          "OCOS"           2007           
    ## 4      2007 05    ESCUINTLA           "SAN JOS\xc9"    2006           
    ## 5      2007 05    JUTIAPA             "MOYUTA"         2007           
    ## 6      2007 05    GUATEMALA           "FRAIJANES"      1997           
    ## # ℹ 6 more variables: LINEA_VEHICULO <chr>, TIPO_VEHICULO <chr>,
    ## #   USO_VEHICULO <chr>, MARCA_VEHICULO <chr>, CANTIDAD <dbl>, ...11 <lgl>
