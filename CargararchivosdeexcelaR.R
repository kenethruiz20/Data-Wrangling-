###Cargar Librerias###
library(readxl)
library(readr)
library(tidyverse)
library(tidytext)

install.packages("readxl")

### cargar archivo de excel ###
excel <- readxl::read_excel("example_1.xlsx")
head(excel)
str(Excel)

### quiero saber las hojas de mi excel###
excel_sheets("example_1.xlsx")

###sleccionar por hoja
excel_2<- read_excel("example_1.xlsx", sheet = 3)

##exportar excel 
write_excel_csv2("excel_excel.xls",delim = ",")

#### Caso 1: CSV
csv <- read_csv("example_2.csv")

### Caso 2: archivo deliminato por un separado punto y coma
txt_1 <-read.delim("example_3.txt", delim = ";")
txt_1

##Cargar archivos no tabulados
dorian <- read_lines("dorian_gray.txt", skip_empty_rows = TRUE)
