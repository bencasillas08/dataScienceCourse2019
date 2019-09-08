rm(list=ls()); setwd('/home/Ben/dataScienceCourse2019');

# Se define un vector con elementos Char
x <- c('10.5','6','5','8','5');  print(x)
as.numeric(x)   # Se convierte a elementos numéricos
as.integer(x)   # O valores enteros
# Convirtiendo a valores logicos
l = c(0,1,10.5); print(l); as.logical(l)
# Convirtiendo valores sin sentido 
# (erroneos o sin equivalencias)
y = c('3.1416','0.999','3M','2,6'); print(y); as.numeric(y)
# Dando como resultado valores NA (Not available)
# 3.1416 0.9990     NA     NA  || NA --> Missing value
sum(as.numeric(y))
# nos arroja advertencia y como un resultado NA

# Efecto de coerción entre diferentes clases de elementos
x = c(0.9,4.5,'3');