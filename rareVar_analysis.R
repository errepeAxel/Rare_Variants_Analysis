# Axel R
# 03/Octubre/2023

# FILTER -----------------------------------------------------------------------
# Loading the data
data <- read.csv("FAM6.csv", header = TRUE, sep = ",")

# Attach data
attach(data)

# load library
library(dplyr)

# filter 
# Under the assumption of autosomal recessive
trim_aut_rec <- filter(data, TR>=10 & GQ >= 30 & EVE_ALT_FREQ <= 0.01 & 
                 ANNOTATION != "synonymous SNV" & 
                 Mother.ZYG == "Mother:het" & Proband.ZYG == "Proband:hom" & Father.ZYG == "Father:het" & 
                  UASib.ZYG == "UASib:het" & UASib.ZYG.1 == "UASib:het")

# Under the assumption of X-linked recessive
trim_x_rec <- filter(data, TR>=10 & GQ >= 30 & EVE_ALT_FREQ <= 0.01 & ANNOTATION != "synonymous SNV" &
                       Mother.ZYG == "Mother:het" & X.CHR == "X")