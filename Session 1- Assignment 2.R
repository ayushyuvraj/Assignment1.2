
# Session 1 Assignment 2

# What should be the output of the following Script? 
v <- c( 2,5.5,6) 
t <- c(8, 3, 4) 
print(v%/%t) 

#======================================================================================

# 2. You have 25 excel files with names as xx_1.xlsx, xx_2.xlsx,....xx_25.xlsx in a dir.
# Write a program to extract the contents of each excel sheet and make it one df.
setwd("Path containing your excel files")
files=list.files(pattern=".xlsx")

for(i in 1:length(files))
{
  filename=files[i]
  data=read.xlsx(file = filename,header = T)
  assign(x = filename,value = data)
}

#Suppose the columns are the same for each file, 
#you can bind them together in one dataframe with bind_rows from dplyr:
library(dplyr)
df <- bind_rows(files, .id = "id")

#one more option is as follows
df<-lapply(files, read_xlsx) %>% bind_rows()

#==================================================================================

# 3. If the above 25 files were csv files, what would be your script to read?
setwd("Path containing your excel files")
files=list.files(pattern=".csv")

for(i in 1:length(files))
{
  filename=files[i]
  data=read.csv(file = filename,header = T)
  assign(x = filename,value = data)
}

#Suppose the columns are the same for each file, 
#you can bind them together in one dataframe with bind_rows from dplyr:
library(dplyr)
df <- bind_rows(files, .id = "id")

#one more option is as follows
df<-lapply(files, read_csv) %>% bind_rows()