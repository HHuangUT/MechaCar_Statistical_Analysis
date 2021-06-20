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

![image](https://user-images.githubusercontent.com/80546200/122690405-066b0d00-d1ef-11eb-94af-de78ef035a9d.png)


Box Plot of Total Lot:

![image](https://user-images.githubusercontent.com/80546200/122690406-0d921b00-d1ef-11eb-98b9-bcc1fa627441.png)


Results by Lot:

![image](https://user-images.githubusercontent.com/80546200/122690416-14b92900-d1ef-11eb-9a9c-0a7a1fa1849c.png)


Box Plot of by Lot:

![image](https://user-images.githubusercontent.com/80546200/122690417-18e54680-d1ef-11eb-92a6-c456eddae87b.png)


**Takeaways**

1. When considering the Total Lot, the variance is 62.29356, which is within the 100 limit.

2. When considering each Lot individually, only Lots 1 & 2 fall within the 100 variance requirement (0.9795918
 and 7.4693878, respectively). Lot 3 did not meet the requirement (170.2861224). The Box Plot 2 (above) illustrates the distinct difference in the lots.

## Deliverable 3
**Instructions**

Using your knowledge of R, perform t-tests to determine if all manufacturing lots and each lot individually are statistically different from the population mean of 1,500 pounds per square inch.


**Code Used**

    # Deliverable 3
    t.test(mecha_coil$PSI,mu=1500)
    lot1 <- subset(mecha_coil, Manufacturing_Lot=="Lot1")
    lot2 <- subset(mecha_coil, Manufacturing_Lot=="Lot2")
    lot3 <- subset(mecha_coil, Manufacturing_Lot=="Lot3")

    t.test(lot1$PSI,mu=1500)
    t.test(lot2$PSI,mu=1500)
    t.test(lot3$PSI,mu=1500)

**Console Result**

    > # Deliverable 3
    > t.test(mecha_coil$PSI,mu=1500)

        One Sample t-test

    data:  mecha_coil$PSI
    t = -1.8931, df = 149, p-value = 0.06028
    alternative hypothesis: true mean is not equal to 1500
    95 percent confidence interval:
    1497.507 1500.053
    sample estimates:
    mean of x 
    1498.78 

    > lot1 <- subset(mecha_coil, Manufacturing_Lot=="Lot1")
    > lot2 <- subset(mecha_coil, Manufacturing_Lot=="Lot2")
    > lot3 <- subset(mecha_coil, Manufacturing_Lot=="Lot3")
    > 
    > t.test(lot1$PSI,mu=1500)

        One Sample t-test

    data:  lot1$PSI
    t = 0, df = 49, p-value = 1
    alternative hypothesis: true mean is not equal to 1500
    95 percent confidence interval:
    1499.719 1500.281
    sample estimates:
    mean of x 
        1500 

    > t.test(lot2$PSI,mu=1500)

        One Sample t-test

    data:  lot2$PSI
    t = 0.51745, df = 49, p-value = 0.6072
    alternative hypothesis: true mean is not equal to 1500
    95 percent confidence interval:
    1499.423 1500.977
    sample estimates:
    mean of x 
    1500.2 

    > t.test(lot3$PSI,mu=1500)

        One Sample t-test

    data:  lot3$PSI
    t = -2.0916, df = 49, p-value = 0.04168
    alternative hypothesis: true mean is not equal to 1500
    95 percent confidence interval:
    1492.431 1499.849
    sample estimates:
    mean of x 
    1496.14


**Takeaways**

1. **Total Lot**: Total Lot p-value (0.06028) is greater than the signigicance level (0.05), suggesting that there is not enough evidence to reject the null hypothesis, and that all 3 of the Lots are statistically similar to the population mean of 1500.

2. Looking at individual lots:
    
    - **Lot 1** has a p-value of 1, suggesting no statistical difference from the population mean of 1500, and that the null hypotheses cannot be rejected.

    - **Lot 2** has a p-value of 0.6072, and suggest the same takeaways as Lot 1.

    - **Lot 3** has a p-value of 0.04168, and a sample mean of 1496.14, suggesting to reject the null hypothesis.

    Biggest takeaway is that Lot 3 is statistically different from the other Lots, and the system needs to be re-evaluated and/or calibrated before it can reach the designated criteria.


## Deliverable 4
**Instructions**

Using your knowledge of R, design a statistical study to compare performance of the MechaCar vehicles against performance of vehicles from other manufacturers.

**Metrics**

Example metrics to test the consumers' interest in purchasing a car:

- Fuel Efficiency (Independent Variable)
- Cost of Ownership (Independent Variable)
- Color Options (Dependent)
- Drivetrain Options/Package (Independent)
- Selling Value (Dependent)
- Selling Value (by Age since Manufactured, Dependent)
- Year Manufactured (Independent)
- Number Sold (by Year, Independent)
- Number on Road (by Year, Independent)
- Car Class (Dependent)
- Safety Ratings (Independent)


**Hypothesis**

In order to test the relevance of the metrics:

 - Null: MechaCar is optimally priced based on metrics for its class.
 
 - Alt: MechaCar is not optimally priced based on metrics for its class.

If the metrics do not provide statistical relevance, find and test new metrics.

 **Statistical Tests**

 Examples of a statistical test:
 
  - Multiple Linear Regression to determine factors with highest impact on selling price or resale value after X amount of years.

- Multiple Linear Regression to if amount of options (color, drive, features) have an impact on total amount sold.
