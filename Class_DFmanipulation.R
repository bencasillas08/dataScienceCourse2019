getwd()                                 # Se obtiene la dirección actual
setwd("/home/Ben/dataScience/data")     # Se direge a la dirección marcada
rm(test)                                # borra variable marcada
rm(list=ls())                           # borra todas las variables
# ******************************************************************************
# Carga el dataFrame
sueldos <- read.table('8 LGT_Art_70_Fr_VIII_1er semestre_229363.tsv',
                      sep='\t', skip = 5,
                      quote = "",
                      stringsAsFactors = FALSE,
                      header = TRUE)
view(sueldos)       # muestra data frame
class(sueldos)      # clase de variable
str(sueldos)        # Muestra la estructura contenida
dim(sueldos)        # Equal size(matrix)
names(sueldos)      # Muestra los nombres de las variables (col)
head(sueldos)       # Muestra las primeras 6 filas del DataFrame
gender <- sueldos$'SEXO (CATALAGO)'
head(gender)        # Extrae columnas por nombre
head(sueldos[3,])   # Extrae solo una fila por todas las columnas

# Extrae fila 3, 6 y 8 por todas las columnas
head(sueldos[c(3,6,8), ])
# Extrae los primeros 6 filas de la columna 1 y 2
head(sueldos[ ,1:2])
sueldos([1:3,1:2]); sueldos[1:3,c('ID',"EJERCICIO")];
# Extrae los primeros 6 usuarios femeninos (filas) con sus 5 columnas
head(sueldos[sueldos$'SEXO..CATÁLOGO' == 'Femenino',1:5])
