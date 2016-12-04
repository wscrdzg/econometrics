# Import saved file from github repo
download.file("https://raw.githubusercontent.com/wscrdzg/econometrics/master/cpi.csv",
              destfile = "cpi.csv")
download.file("https://raw.githubusercontent.com/wscrdzg/econometrics/master/cdc_tax.csv",
              destfile = "cdc_tax.csv")
download.file("https://raw.githubusercontent.com/wscrdzg/econometrics/master/income_by_state.csv",
              destfile = "income_by_state.csv")

income_by_state <- read.csv("income_by_state.csv", na.strings = "(NA)")
cdc <- read.csv("cdc_tax.csv")
cpi <- read.csv("cpi.csv")

library(tidyr)

# rename the column
colnames(cdc) <- c("year","state","Data.Source","Topic.Description","measure_disc","measure","data.units","value")

# drop unnecessery columns
cdc <- cdc[c("year","state","measure","value")]

# spread data (make the tall data wide)
cdc2 <- spread(cdc, key = measure, value = value)

# and now rename cdc2
colnames(cdc2) <- c("year","state","cost_per_pack","pack_sales_per_capita","total_tax_percent_of_Price","tax_per_pack","gross_tax_revenue","state_tax_per_pack")

library(ggplot2)
g <- ggplot(data = cdc2, aes(x = year, y = cost_per_pack, group = state, color = state))
g + geom_line()

# ================================================================== #

# now the BEA income and population by states
colnames(income_by_state)[5:91] <- 1929:2015

# only keep necessery columns
keep <- setdiff(names(income_by_state), c("GeoFips","LineCode"))
income_by_state <- income_by_state[,keep]

# make the wide data a tall data
income_by_state <- gather(income_by_state, key = year, value = value, -GeoName, - Description)
colnames(income_by_state) <- c("state", "disc", "year", "value")

income_by_state$value <- as.numeric(income_by_state$value)
income_by_state2 <- spread(income_by_state, key = disc, value = value)
income_by_state2$state <- gsub(pattern = "*", replacement = "", x = income_by_state2$state, fixed = T)

# ================================================================== #

# to combine all data
income_by_state3 <- subset(income_by_state2, year > 1969)
income_n_cdc <- merge(income_by_state3, cdc2, by = c("year", "state"))

colnames(cpi) <- c("year", "cpi")
base_cpi <- 236.736 # use 2014 as the base year
cpi$inflation_factor <- cpi$cpi / base_cpi

# now combine all into one called 'combined'
combined <- merge(income_n_cdc, cpi, by = "year")
combined$year <- as.numeric(combined$year)

# ================================================================== #

# rename all variable and add additional entries to combined data
colnames(combined) <- c("year","name","acpp","cc","fstprp","fstpp","gctr","stpp","pcpi","pi","pop","cpi","inflation_factor")

combined$racpp <- combined$acpp / combined$inflation_factor
combined$rfstpp <- combined$fstpp / combined$inflation_factor
combined$rgctr <- combined$gctr / combined$inflation_factor
combined$rstpp <- combined$stpp / combined$inflation_factor
combined$rpi <- combined$pi / combined$inflation_factor
combined$rpcpi <- combined$pcpi / combined$inflation_factor

# output combined tidy data
write.table(combined, file = "cdcbeacpi.txt")
