# Econometrics Final Project
This readme file contains basic process of the project, further conclusion is saved in this repo
named "Conclusion.pdf".

Team member: Jeanette, Kota, Tony

Source of Data:
CDC, BLS, BEA

This repo contains all the datasets we used for the project.
Conclusion.pdf ----------------------------- The full summary of the project
Descriptive statistics.pdf ----------------- Descriptive statistics of the original data
List of contributors.txt ------------------- List of contributors
README.md ---------------------------------- Readme
cdc_tax.csv -------------------------------- The tax burden on tobacco data from CDC
codebook.pdf ------------------------------- Table that shows variable names and their definitions
combined_data.txt -------------------------- The cleaned and combined data from step one
cpi.csv ------------------------------------ Inflation data from BLS
general_sales_tax.csv ---------------------- Sales tax data clipped from TBT data
income_by_state.csv ------------------------ Income and population data from BEA
step1_clean_data.R ------------------------- The code of first step: cleaning data
step2_processing.Rmd ----------------------- The markdown code for step 2: can run independent of step 1
table.txt ---------------------------------- The regression results table

The analysis contains 2 main steps: 
The first step is to combine all datasets into one, and edited for further process. The combined
dataset is also stored in the repo named as "combined.txt".

The second step is to analyze the data, and the process is listed below:

1. Graphically show:
The inflation-adjusted price of cigarettes by state 1970–2014.

2. Graphically show:
Average cigarette consumption by state 1970–2014.

3. Graphically show:
Average cigarette consumption by year (across all states) 1970–2014.

4. Graphically show: 
Average price by year (across all states) 1970–2014.

5. Graph:
Scatterplot of consumption (Y axis) and inflation-adjusted prices (X axis).

6. Using this dataset carry out analyses the parallel those presented in Chapter 12 of the text.
Present these analyses in a single table, similar to Table 12.1 in the text. In cases where the 
analysis is cross-sectional, use year-2014 data. In cases where the analysis is in differences, 
use 2014 as the “after” year and 1996 as the “before”.

  The following regressions have been run:

  log(consumption) ~ log(price) 
  Use sales tax as an instrument for price.

  log(consumption) ~ log(price) + log(income) 
  Use sales tax as an instrument for price.

  log(consumption) ~ log(price) + log(income) 
  Use the cigarette-specific tax as an instrument for price.

  Δlog(consumption) ~ Δlog(price) + Δlog(income) 
  Use sales tax as an instrument for price.

  Δlog(consumption) ~ Δlog(price) + Δlog(income) 
  Use the cigarette-specific tax as an instrument for price.

  Δlog(consumption) ~ Δlog(price) + Δlog(income) 
  Use sales tax & the cigarette-specific tax as an instrument for price.
