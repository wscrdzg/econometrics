income_by_state <- read.csv("income_by_state.csv", na.strings = "(NA)")
cdc <- read.csv("cdc_tax.csv")
cpi <- read.csv("cpi.csv")

install.packages("tidyr")
library(tidyr)

# rename the column
names(cdc)
colnames(cdc) <- c("year","state","Data.Source","Topic.Description","measure_disc","measure","data.units","value")

# drop unnecessery columns
cdc <- cdc[c("year","state","measure","value")]

# spread data (make the tall data wide)
cdc2 <- spread(cdc, key = measure, value = value)

# and now rename cdc2
names(cdc2)
colnames(cdc2) <- c("year","state","cost_per_pack","pack_sales_per_capita","total_tax_percent_of_Price","tax_per_pack","gross_tax_revenue","state_tax_per_pack")

library(ggplot2)
g <- ggplot(data = cdc2, aes(x = year, y = cost_per_pack, group = state, color = state))
g + geom_line()

# ================================================================== #

# now the BEA income and population by states
colnames(income_by_state)[5:91] <- 1929:2015

# only keep necessery columns
names(income_by_state)
keep <- setdiff(names(income_by_state), c("GeoFips","LineCode"))
income_by_state <- income_by_state[,keep]

# make the wide data a tall data
income_by_state <- gather(income_by_state, key = year, value = value, -GeoName, - Description)
colnames(income_by_state) <- c("state", "disc", "year", "value")

income_by_state$value <- as.numeric(income_by_state$value)
income_by_state2 <- spread(income_by_state, key = disc, value = value)
income_by_state2$state <- gsub(pattern = "*", replacement = "", x = income_by_state2$state, fixed = T)
