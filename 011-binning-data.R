students <- read.csv('../RStudio/r-course-udemy/data/tema1/data-conversion.csv')
View(students)
bp <- c(-Inf, 10000, 31000, Inf)

nombres <- c('Bajo', 'Medio', 'Alto')

students$Income.cat <- cut(students$Income, breaks = bp, labels = nombres) #La funcion cut
#incluye en los limites de bp = (-Inf - 10000], (10000 - 310000], (31000 - Inf)
#las etiquetas se convierten en una categoria de clasificar los datos
View(students)

students$Income.cat2 <- cut(students$Income, breaks = bp) 

students$Income.cat3 <- cut(students$Income, 
                            breaks = 4, 
                            labels = c('Nivel 1', 'Nivel 2', 'Nivel 3', 'Nivel 4')) 

#dummy variables (variables ficticias)
students <- read.csv('../RStudio/r-course-udemy/data/tema1/data-conversion.csv')

install.packages('dummies')
library(dummies)

students.dummy <- dummy.data.frame(students, sep = '.')
names (students.dummy)

dummy(students$State, sep = '.')

dummy.data.frame(students, names = c('State', 'Gender'), sep = '.')
