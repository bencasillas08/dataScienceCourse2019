# Lectura de datos en R
# ***********************************************************
# data from single cell sequencing on hematopoyetic 
# cells obtained by Moignard et. al., 2013
# ***********************************************************
setwd('/home/Ben/dataScienceCourse2019'); rm(list=ls());
# Se descarga los datos
path = 'https://raw.githubusercontent.com/caramirezal/dataScience/master/data/NIHMS53736-supplement-9.csv';
download.file(path,destfile = 'NIHMS53736-supplement-9.csv')
# Se confirma el documento leyendo las primeras 5 lineas
readLines('NIHMS53736-supplement-9.csv',n=5)
# Para obtener los datos al environment
transcripts = read.csv('NIHMS53736-supplement-9.csv',header=TRUE);
# Se muestran las diferentes propiedades de los datos
class(transcripts); dim(transcripts); str(transcripts);

# ********************************************************

# Función general de lectura de tablas (se procede como anteriormente)
path <- 'https://github.com/caramirezal/dataScience/raw/master/data/8%20LGT_Art_70_Fr_VIII_1er%20semestre_229363.tsv'
download.file(path, "sueldos_CONACYT.tsv")
readLines("sueldos_CONACYT.tsv", n=5)
# Se introduce los datos al environment
sueldos = read.table (path, sep='\t',skip=5,quote="",stringsAsFactors=FALSE,header=TRUE)
str(sueldos) # Estructura interna

# ********************************************************************
# La libreria readr es util cuando se necesita procesar grandes tablas
library(readr);
sueldos=read_tsv(path,skip=5,quote="",col_names=TRUE); str(sueldos)
