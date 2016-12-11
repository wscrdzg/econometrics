# Econometrics Final Project
This is the econometrics group project
of 
Team member: Jeanette, Kota, Tonyinflation 

Source of Data:
CDC, BLS, BEA

SURGEON GENERAL'S WARNING: Smoking Causes Lung Cancer, Heart Disease, Emphysema, And May Complicate Pregnancy. SURGEON GENERAL'S WARNING: Quitting Smoking Now Greatly Reduces Serious Risks to Your Health.
The glaring warning on a package of cigarettes ought to cause a smoker to take pause before lighting up a cigarette.  And yet, the shocking warning label has not been enough to reduce smoking rates among the citizens of Utah.  Long term risks of smoking include cancer, heart disease, emphysema, and stroke, to name just a few serious diseases, although smoking harms every part of the body.  Cigarettes pose a  risk to non-smokers too.  The dangers of breathing second hand smoke have been well documented to show adverse and immediate effects on the cardiovascular system.  Exposure to second hand smoke is a real danger to children, in particular, who don’t have the option of removing themselves from smoky environments.  There are multiple public externalities associated with cigarette smoke, including the financial burden on the health care system.  In a quest to reduce illness and deaths from smoking, and the externalities imposed on the rest of society, lawmakers have proposed a tax hike on cigarettes in order to encourage current smokers to cut back and to deter potential new smokers from taking up the habit.  A team of economists, Tony, Kota, and Jeanette, from the Utah Department of Health, have been commissioned to compile an analysis to determine the size of a tax hike required in order to achieve a 20% reduction in cigarette consumption.  These findings will be presented in a legislative session where laws determining public policy will be made.  

 “What would the after-tax sales price of cigarettes need to be to achieve a 20% reduction in cigarette consumption?”  In order to answer this question, we need to examine data on the prices and sales of cigarettes and estimate the elasticity of demand. First, data was extracted from Government Agency records to ensure that the numbers we used were reliable.  The CDC provides the base source of data on the tax burden of tobacco and the negative financial effects of tobacco on public health.  Using the CPI data from the BLS, we 
We gathered data from Government Agencies to ensure that the numbers we used came from reliable sources.  The CDC provides a large source of data on the tax burden of tobacco and the negative financial effects of tobacco on public health. The BEA website provided state personal income data, from which we calculated the per capita income values.  We collected CPI data from the BLS and used the year 2014 as the base year to adjust for inflation.  All variables with dollars as units have been converted to real 2014 dollars in order to make accurate comparisons.  A panel data structure was used in order to eliminate the influence of factors that vary across states.  We analyzed changes over time using the log functions. Ultimately our goal was to compare the cigarette consuption (defined as the number of packs of cigarettes sold per capita in a particular state, with the Price (average real price per pack of cigarettes including all taxes.

In step 1, the 3 datasets have been merged into one data frame, and the columns has been renamed for later processing.

In addition, all the prices were adjusted by inflation using 2014 as base year.
(see attached codebook for detail)

In step 2, following steps has been done to analyze the data:

1. Graphically showed the inflation-adjusted price of cigarettes by state 1970–2014.

2. Graphically showed the average cigarette consumption by state 1970–2014.

3. Graphically showed the average cigarette consumption by year (across all states) 1970–2014.

4. Graphically showed the average price by year (across all states) 1970–2014.

5. Generated a scatterplot of consumption and inflation-adjusted prices.

6. Generated another scatterplot using log consumption and log prices.

