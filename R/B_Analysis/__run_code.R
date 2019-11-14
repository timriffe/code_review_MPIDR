
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Code to produce estimates of Child Death, Child Survival, and derived measures
# described in the main text and in the SI appendix.
# Make sure that all scripts in the directory `A_Data_formatting` have been run before
# attempting to run these scripts - otherwise they won't work.
# The scripts in this directory carry out the analysis of the data but do not produce
# any of the tables or figures included in the paper. 
# These are produced by a separate set of scripts in the directory `C_Results`.
# 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


if(!require("stringr")) {
  install.packages("stringr")
  library(stringr)
} 

files <- list.files(pattern = ".R$")[-1]
( files <- stringr::str_sort(files, numeric = TRUE) )

# Create

# 1. Load the functions and packages needed in the scripts ====

source(files[1])

# 2. Load the data needed for the analysis ====

source(files[2])

# 3. Load data about country grouping and format them for the analysis ==== 

source(files[3])

# A. Child Death ----

# 4. Estimate the cumulative number of child deaths for a woman reaching age a (CD) ====

# This script takes cohort age-specific fertility rates (ASFRC) 
# and matrices of survival probabilities (lx.kids.arr) to implement 
# equation 1 in the main text for all countries:

# \underbrace{CD_{(a,c, r)}}_{\text{child death}}= \underbrace{\sum_{x=15}^{x=a} {_1F_{(x,c,r)}}}_{\text{children born}}-\underbrace{\sum_{x=15}^{x=a} {_1F_{(x,c,r)}} l_{(a-x,c+x,r)}}_{\text{children surviving}}

# where $CD_{(a,c,r)}$, the expected number of child deaths experienced
# by a woman born in cohort $c$ and UN SDG region $r$ (using the M49 standard), 
# conditional on her surviving to age $a$

# The output, df_cl_m_full, is a data frame containing the expected CD value by woman's age.

# Child death estimates
source(files[4])
source(files[5])
source(files[6])
source(files[7])
source(files[8])
source(files[9])

# Child survival estimates
source(files[10])
source(files[11])
source(files[12])
