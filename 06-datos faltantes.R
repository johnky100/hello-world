data <- read.csv('../RStudio/r-course-udemy/data/tema1/missing-data.csv', 
                 na.strings = '')
data.cleaned <- na.omit(data)
#na.omit utiliza otra funcion que se llama is.na que nos permite identificar si alguno
#de los argumentos que hemos pasado es de tipo na (No disponible)
#Cuando se aplica a un valor simple nos devuelve un valor booleano, si nos aplica a una
#Coleccion nos aplica a un Vector booleano

is.na(data[4,2]) #Fila 4 columna 2
is.na(data[4,1]) #Fila 4 columna 1
is.na(data$Income)# Datos de la columna de ingresos

#Limpiar NA de solamente la variable income (Ingresos)
data.income.cleaned <- data[!is.na(data$Income),]

#Filas completas para un data frame
complete.cases(data)
data.cleaned.2 <- data[complete.cases(data), ]#data[complete.cases(data), ]
#Quedarme con las filas que tienen datos completos complete.cases(data), Todas las 
#columnas])

#Convertir los ceros de ingresos en NA
data$Income[data$Income == 0] 
data$Income[data$Income == 0] <- NA #Cambiar los ceros a NA

#Medidas de tendencia centray y dispersión
mean(data$Income)
mean(data$Income, na.rm = TRUE)

sd(data$Income)
sd(data$Income, na.rm = TRUE)
