#Una empresa de transportes tiene dos tipos de camiones, los del tipo A con 
#un espacio refrigerado de 30 m3 y un espacio no refrigerado de 50 m3.
#Los del tipo B, con igual cubicaje total, al 45 % de refrigerado 
#y no refrigerado. La contratan para el transporte de 7,000 m3 de producto
#que necesita refrigeración y 4,350 m3 de otro que no la necesita. 
#El coste por kilómetro de un camión del tipo A es de 450 pesos y el B de 860
#pesos. ¿Cuántos camiones de cada tipo ha de utilizar para que el coste 
#total sea mínimo?

# Espacio/tipo	     A	  B	
# Refrigerado		    10	  30		    
# No Refrijerado  	20	  50		    
#	    

# ¿De qué manera puede minimizarse el costo de transporte?

library(lpSolve)

# matriz de flete
costos<-matrix(c(30,50,36,44), nrow = 2) 
costos

#Símbolo de restricción de salida
row.signs <-rep ("<=", 2) 
row.signs

# Vector de restricción de producto a trasport
row.rhs <-c (7000,4350) 
row.rhs

#Símbolo de restricción de costo por kilometro
col.signs <-rep ("=", 2) 
col.signs

# Vector de restricción de costo por kilometro
col.rhs <-c (450,860) 
col.rhs

# Ejecutamos la función y se guarda el resultado en res
res<-lp.transport(costos,"min",row.signs,row.rhs,col.signs, col.rhs)

# Se muestra el resultado de la función 
# objetivo o el costo total mínimo
res

# Se muestra la tabla con los totales de envío
res$solution

