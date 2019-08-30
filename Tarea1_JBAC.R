# Serie del 1 al 100 usando for
cont <- 1; for (i in 2:50) {cont[i] <- cont[i-1]+2 }
# Serie del 1 al 100 usando while
cont <- 1; i <- 2; while (i < 51) { cont[i] <- cont[i-1]+2; i<-i+1}
# Serie del 1 al 100 sin bucle
cont <- seq(1,99, by=2);
# Bucle For con sumas parciales
cont=1; n=17;  # cualquier número "n" que se quiera asignar#
ab=(n+1)/2;    # N° de iteraciones para llegar al valor n desado
cont <- seq(1,n, by=2);
t <- 1; for (i in 2:ab) {t[i] <- sum(cont[1:i])}
# El patrón que sigue la suma acumulativa
# de los números impares es el cuadrado de los números
# naturales de 1 a n