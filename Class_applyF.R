# Apply functions
rm(list=ls());
# data example from Moignard et al, 2013.
path <- 'https://raw.githubusercontent.com/caramirezal/dataScience/master/data/NIHMS53736-supplement-9.csv'
transcripts <- read.csv(path,header = TRUE)
# Seleccionan solo valores numéricos
transcriptsNum = transcripts[ ,2:ncol(transcripts)]; str(transcriptsNum);
# Se calcula el valor promedio para cada gen (columna) y guardado en un vector
means = vector('numeric',ncol(transcriptsNum))
for (i in 1:ncol(transcriptsNum)) { means[i] = mean(transcriptsNum[,i]) }; means
# Indexado por nrow or ncol

# *************************************************************************************

# Mismo procedimiento pero con sapply [sapply(variable,function)]
meanSapply <- vector('numeric', ncol(transcriptsNum))
meanSapply = sapply(transcriptsNum, mean); meanSapply
# Parametros adicionales en sapply
meanSapply = sapply(transcriptsNum,mean,na.rm=TRUE)
head(meanSapply)

# *************************************************************************************
# A diferencia de sapply, lapply da como resultado una lista
meanlapply = lapply(transcriptsNum,mean); head(meanlapply)

# *************************************************************************************
# Apply realiza iteraciones sobre los margenes del arreglo (dim -> 1 row, 2 col)
# apply(variable,dim,function)
meanbyrow = apply(transcriptsNum,1,mean); head(meanbyrow)
meanbycol = apply(transcriptsNum,2,mean); head(meanbycol)

# *************************************************************************************
# Funciones personalizadas [Normalización de la señal]
# En donde --> Zi = ( Xi-min(X) ) / ( max(X)-min(X) )
# sapply(variable, function(x) Zi)
transcriptsNorm = sapply(transcriptsNum, function(x) (x-min(x))/(max(x)-min(x)) )
# muestra las primeras 6 filas de los datos normalizados donde: [0 < x < 1]
head(transcriptsNorm[ ,1:5])
