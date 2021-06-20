# Deliverable 1
library(dplyr)
library(tidyverse)
mecha_mpg <- read.csv(file='./Resources/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg))

#Deliverable 2
mecha_coil <- read.csv(file='./Resources/Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
total_summary <- mecha_coil %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Var_PSI=var(PSI), Std_Dev_PSI=sd(PSI), Num_Coil=n(), .groups = 'keep')
lot_summary <- mecha_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Var_PSI=var(PSI), Std_Dev_PSI=sd(PSI), Num_Coil=n(), .groups = 'keep')
  #Plots
plt1 <- ggplot(mecha_coil,aes(y=PSI))
plt1 + geom_boxplot()

plt2 <- ggplot(mecha_coil,aes(x=Manufacturing_Lot,y=PSI))
plt2 + geom_boxplot()

# Deliverable 3
t.test(mecha_coil$PSI,mu=1500)
lot1 <- subset(mecha_coil, Manufacturing_Lot=="Lot1")
lot2 <- subset(mecha_coil, Manufacturing_Lot=="Lot2")
lot3 <- subset(mecha_coil, Manufacturing_Lot=="Lot3")

t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)
