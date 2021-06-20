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

