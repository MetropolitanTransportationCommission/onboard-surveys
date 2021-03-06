# Onboard Data Request from SFCTA - Weights.r
# SI


# Set working directory

wd <- "M:/Data/Requests/Bhargava Sana/"
setwd(wd)

# Import libraries

suppressMessages(library(tidyverse))

# Set up input and output directories

username      <- Sys.getenv("USERNAME")
Box_location  <- paste0("C:/Users/",username,"/Box/Modeling and Surveys/Share Data/Onboard-Surveys/Survey_Database_122717/")
onboard <- read.csv(paste0(Box_location,"OBS_PopulationSim_Weights.csv"),stringsAsFactors = FALSE, header = TRUE)

save(onboard, file = paste0(Box_location,"OBS_PopulationSim_Weights.rdata"))

# Select out operator, ID, weighting variables

final <- onboard %>% 
  select(operator,Unique_ID,ID,weight,trip_weight,boardWeight_2015,
         tripWeight_2015,exp_factor,final_boardWeight_2015,final_tripWeight_2015,final_expansionFactor)


# Write out final CSV files

write.csv(final,"MTC_OBS_PopulationSim_Weights.csv",row.names = FALSE,quote=T)




