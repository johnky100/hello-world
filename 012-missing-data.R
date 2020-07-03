housing.data <- read.csv('../RStudio/r-course-udemy/data/tema1/housing-with-missing-value.csv',
                         header = TRUE, stringsAsFactors = FALSE)

summary(housing.data) #este comando muestra un resumen general sobre las variables del data 
#frame housing.data (mínimo, máximo, media, mediana, primer y tercer cuartil).

#Tres formas basicas de hacer desaparecer NA

#Eliminar todas las observaciones que contengan algún NA (Mas bestia)
housing.data.1 <- na.omit(housing.data)

#Eliminar los NA de algunas columnas por medio del filtrado selectivo

drop_na <- c('rad')

housing.data.2 <- housing.data[
  complete.cases(housing.data[,!(names(housing.data))%in% drop_na]),]

#names(housing.data): Raiz de todos los nombres de variables
#%in% drop_na: Dentro de drop_na
#!(names(housing.data))%in% drop_na Me muestra la ubicación del drop_na que es FALSE:
#[1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
#[13]  TRUE  TRUE  TRUE

summary(housing.data)

#Eliminar una columna de un dataframe
housing.data$rad <- NULL

summary(housing.data)


drops <- c('rad', 'ptratio')
housing.data3 <- housing.data[,!(names(housing.data) %in% drops)]
summary(housing.data3)


install.packages('Hmisc')
library(Hmisc)

housing.data.copy1 <- housing.data
housing.data.copy1$ptratio <- impute(housing.data.copy1$ptratio, mean)
housing.data.copy1$rad <- impute(housing.data.copy1$rad, mean)
summary(housing.data.copy1)

housing.data.copy2 <- housing.data
housing.data.copy2$ptratio <- impute(housing.data.copy2$ptratio, median)
housing.data.copy2$rad <- impute(housing.data.copy2$rad, median)
summary(housing.data.copy2)

housing.data.copy3 <- housing.data
housing.data.copy3$ptratio <- impute(housing.data.copy3$ptratio, 18)
housing.data.copy3$rad <- impute(housing.data.copy3$rad, 7)
summary(housing.data.copy3)

install.packages('mice')
library(mice)
md.pattern(housing.data)


install.packages('VIM')
library(VIM)
