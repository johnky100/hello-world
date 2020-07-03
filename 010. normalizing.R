housting <- read.csv('../RStudio/r-course-udemy/data/tema1/BostonHousing.csv')
View(housting)

housting.z <- scale(housting)# scale solo se utiliza para variables numericas
# Z = X - µ/??

housting.z <- scale(housting, center = TRUE, scale = TRUE) #Otra forma es multiplicar por la
# media que es center = TRUE  y dividir scale = TRUE que es la desviacion típica 
housting.none <- scale(housting, center = FALSE, scale = FALSE)
housting.mean <- scale(housting, center = TRUE, scale = FALSE)
housting.sd <- scale(housting, center = FALSE, scale = TRUE)

# Z = X - µ/??
#sd = sqrt(sum(x^2)/(n-1))

scale.many = function(dataframe, cols) {#Escalar varias variables de golpe
  names <- names(dataframe)
  for (col in cols) {
    name <- paste(names[col], 'z', sep = '.')
    dataframe[name] <- scale(dataframe[,col])
  }

  cat(paste('Hemos normalizado ', length(cols), 'variable(s)'))
  dataframe
} 

housting <- scale.many(housting, c(1, 3, 5:8) )
