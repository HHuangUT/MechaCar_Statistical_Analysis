# MechaCar_Statistical_Analysis


## Deliverable 1
**Instructions**

The *MechaCar_mpg.csv* dataset contains mpg test results for 50 prototype MechaCars. The MechaCar prototypes were produced using multiple design specifications to identify ideal vehicle performance. Multiple metrics, such as vehicle length, vehicle weight, spoiler angle, drivetrain, and ground clearance, were collected for each vehicle. Using your knowledge of R, you’ll design a linear model that predicts the mpg of MechaCar prototypes using several variables from the *MechaCar_mpg.csv* file.

**Code Used**

    # Deliverable 1
    library(dplyr)
    library(tidyverse)
    mecha_mpg <- read.csv(file='./Resources/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
    lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg)
    summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg))

**Console Result**

    > lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg)

        Call:
        lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
            ground_clearance + AWD, data = mecha_mpg)

        Coefficients:
            (Intercept)    vehicle_length    vehicle_weight     spoiler_angle  ground_clearance               AWD  
            -1.040e+02         6.267e+00         1.245e-03         6.877e-02         3.546e+00        -3.411e+00  

        > summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg))

        Call:
        lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
            ground_clearance + AWD, data = mecha_mpg)

        Residuals:
            Min       1Q   Median       3Q      Max 
        -19.4701  -4.4994  -0.0692   5.4433  18.5849 

        Coefficients:
                        Estimate Std. Error t value Pr(>|t|)    
        (Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
        vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
        vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
        spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
        ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
        AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
        ---
        Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

        Residual standard error: 8.774 on 44 degrees of freedom
        Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
        F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11

### Linear Regression to Predict MPG

**Resulting Model**

    MPG = (6.267e+00)vehicle_length + (1.245e-03)vehicle_weight + (6.877e-02)spoiler_angle + (3.546e+00)ground_clearance + (-3.411)AWD + (-1.040e+02)

**Table Summary**

|            | vehicle_length | vehicle_weight | spoiler_angle | ground_clearance | AWD    | Y-int     |
|------------|----------------|----------------|---------------|------------------|--------|-----------|
| Scientific | 6.27E+00       | 1.25E-03       | 6.88E-02      | 3.55E+00         | -3.411 | -1.04E+02 |
| Decimal    | 6.27           | 0.00125        | 0.0688        | 3.55             | -3.411 | -104.00   |

**Takeaways**

1. Variables **vehicle_length** & **ground_clearance** are less likely to provide statically random amounts of variance, and have a high impact on determining the MPG of the MechaCar. 
    
    Conversely- **vehicle_weight**, **spoiler_angle**, and **AWD** show high amounts of randomness/variance, showing less signigicant effect on determining MPG.

2. The p-value for this dataset (5.35e-11) is significantly smaller than the significance level (0.05), rejecting the null hypothesis, suggesting the slope of this linear model is not zero.

3. the r2-value for this dataset (0.7149) suggested that ~71% of the predictions will follow this model, suggesting that this multiple regression model predicts the MPG of MechaCar prototypes effectively.

## Deliverable 2
**Instructions**

The MechaCar Suspension_Coil.csv dataset contains the results from multiple production lots. In this dataset, the weight capacities of multiple suspension coils were tested to determine if the manufacturing process is consistent across production lots. Using your knowledge of R, you’ll create a summary statistics table to show:

 - The suspension coil’s PSI continuous variable across all manufacturing lots
 - The following PSI metrics for each lot: mean, median, variance, and standard deviation.


**Code Used**

    #Deliverable 2
    mecha_coil <- read.csv(file='./Resources/Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
    total_summary <- mecha_coil %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Var_PSI=var(PSI), Std_Dev_PSI=sd(PSI), Num_Coil=n(), .groups = 'keep')
    lot_summary <- mecha_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Var_PSI=var(PSI), Std_Dev_PSI=sd(PSI), Num_Coil=n(), .groups = 'keep')
    #Plots
    plt1 <- ggplot(mecha_coil,aes(y=PSI))
    plt1 + geom_boxplot()

    plt2 <- ggplot(mecha_coil,aes(x=Manufacturing_Lot,y=PSI))
    plt2 + geom_boxplot()

**Console Result**

Total Lot Results:



Box Plot of Total Lot:



Results by Lot:



Box Plot of by Lot:


**Takeaways**

1. When considering the Total Lot, the variance is 62.29356, which is within the 100 limit.

2. When considering each Lot individually, only Lots 1 & 2 fall within the 100 variance requirement (0.9795918
 and 7.4693878, respectively). Lot 3 did not meet the requirement (170.2861224). The Box Plot 2 (above) illustrates the distinct difference in the lots.

 