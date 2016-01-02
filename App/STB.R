library(ggplot2)
temp <- read.csv("temp.csv")

#temp[(temp$Viewer.Age.Range==levels(temp$Viewer.Age.Range)[4] & temp$Viewer.Gender== "Male")]



#sub <- subset(temp,ProgramId==50041)
#(table(sub$Viewer.Age.Range))
#table(as.factor(sub$Program.Id))
#str(as.factor(temp$Program.Id))

#table(temp[,15],temp[,21])[1,] / max(table(temp[,15],temp[,21])[1,])

VSRR <- function(var1,var2)
{
   index1 <- grep(var1,colnames(temp))
   index2 <- grep(var2,colnames(temp))
   #table(temp[,index1],temp[,index2])
   table(temp[,index1],temp[,index2])
   for(i in 1:nrow(table(temp[,index1],temp[,index2])))
   {
     if(i == 1){
     x <- data.frame((table(temp[,index1],temp[,index2])[i,] / max(table(temp[,index1],temp[,index2])[i,]))*10)
     colnames(x)[i] <- rownames(table(temp[,index1],temp[,index2]))[[i]]
     }
     else if(i==nrow(table(temp[,index1],temp[,index2]))){
     x <- cbind(x,(table(temp[,index1],temp[,index2])[i,] / max(table(temp[,index1],temp[,index2])[i,]))*10)
     colnames(x)[i] <- rownames(table(temp[,index1],temp[,index2]))[[i]]  
     return (x)    
     }
     else{
     #print(table(temp[,index1],temp[,index2])[i,] / max(table(temp[,index1],temp[,index2])[i,]))
     x <- cbind(x,(table(temp[,index1],temp[,index2])[i,] / max(table(temp[,index1],temp[,index2])[i,]))*10)
     colnames(x)[i] <- rownames(table(temp[,index1],temp[,index2]))[[i]]
     
     }
     
   }
   
}

#x <- VSRR("Viewer.Gender","Genre")
