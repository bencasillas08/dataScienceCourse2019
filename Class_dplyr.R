# dplyr library
rm(list=ls());
# Carga y lectura de datos
path <- 'https://github.com/caramirezal/dataScience/raw/master/data/8%20LGT_Art_70_Fr_VIII_1er%20semestre_229363.tsv'
sueldos <- read.table(path,header = TRUE,sep = '\t',skip = 5,quote =""); names(sueldos)
# Cálculo el porcentaje de salario destinado a impuestos y otros cargos
# Contenido en las columnas 16 y 18
# Renombra las columnas para mandarlos llamar con facilidad
names(sueldos)[c(16,18)] <- c('brute','net')
# Cálculo el salario extra
sueldos$'extraSalary'= (100*(sueldos$brute-sueldos$net))/sueldos$brute; head(sueldos$extraSalary)
# ifelse condition [iselse(condition,v1,v2) --> TRUE v1 || FALSE v2]
sueldos$translatedGenera = ifelse(sueldos$'SEXO..CATÁLOGO' == 'Femenino','Female','Male')
head(sueldos$translatedGenera)
# is.na() función que da como resultado si existe un valor NA dentro del vector
head(is.na(sueldos$NOMBRE..S.))
sum(is.na(sueldos$FECHA.CREACION)); # is.na() combinado con sum()
# complete.cases() es FALSE cuando por lo menos 1 dato del vector es NA
sum(complete.cases(sueldos))
# Filtrando los vectores que están completos y no contienen ningun NA en la columna
sueldosFilteres = sueldos[complete.cases(sueldos), ]
# Obtener el maximo valor en el vector
neto <- sueldos$net; max(as.numeric(neto));
# Se obtiene la frecuencia de los datos contenidos en una columna
table(sueldos$SEXO..CATÁLOGO)
head(sort(neto,decreasing=TRUE))  # Ordenan los valores
head(order(neto))   # indexado de los valores ordenados
# Indices usando el ordenamiento del vector
indexes <- order(neto,decreasing=TRUE); head(sueldos[indexes,1:5])

# *********************************************************************************
library(dplyr);       # libreria dplyr
# Renombramiento de las columnas de los datos
sueldosRenamed <- rename(sueldos,
                         date = FECHA.CREACION, 
                         userType = TIPO.DE.INTEGRANTE.DEL.SUJETO.OBLIGADO..CATÁLOGO.,
                         employmentType = DENOMINACIÓN.O.DESCRIPCIÓN.DEL.PUESTO,
                         position = DENOMINACIÓN.DEL.CARGO,
                         name = NOMBRE..S.,
                         surname_1 = PRIMER.APELLIDO,
                         surname_2 = SEGUNDO.APELLIDO,
                         genera = SEXO..CATÁLOGO.)
# Selección de datos por medio de select()
sueldosSelected = select(sueldosRenamed,date,userType,employmentType,position,name:brute,net)
str(sueldosSelected) # esto brinda una mejor sintaxis
# En el caso que quisieramos eliminar columnas en el dataFrame
sueldosProcessed = select(sueldosSelected, -c(userType,employmentType))
# Extrae datos dado una categoria contenida en el DataFrame
sueldosFemenine = filter(sueldosSelected,genera == 'Femenino')
# Creación de una nueva columna en el dataFrame
sueldosProcessed = mutate(sueldosSelected,extraSalary=100*(brute-net)/brute)
# arrange() ordena el dataFrame completo en funcion de los valores en una columna dada
sueldosArrange = arrange(sueldosSelected, desc(brute))
# Operador [ %>% ] traslada el resultado de una operación a la siguiente
arrange(sueldosSelected,desc(net)) %>% filter(genera == 'Femenino') %>% select(name:surname_2) %>% head