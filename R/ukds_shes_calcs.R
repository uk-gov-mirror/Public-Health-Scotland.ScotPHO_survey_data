
# ============================================================================
# ===== Processing UKDS survey data files: SCOTTISH HEALTH SURVEY (shes) =====
# ============================================================================

## NB. THE PROCESSING CAN TAKE A LOT OF MEMORY. IF THE SCRIPT FAILS, OPEN IT IN A SESSION WITH MORE MEMORY.

# Notes on SHeS

# 25 adult indicators: 

# 99107 = adt10gp_tw2	(also in CWB and PA profiles) Percentage of adults who met the recommended moderate or vigorous physical activity guideline in the previous four weeks. In July 2011, the Chief Medical Officers of each of the four UK countries agreed and introduced revised guidelines on physical activity. Adults are recommended to accumulate 150 minutes of moderate activity or 75 minutes of vigorous activity per week, or an equivalent combination of both, in bouts of 10 minutes or more. The variable used was adt10gpTW. This bandings used for this variable include the new walking definition for those aged 65 years and over. 
# 99108 = gen_helf	(also in CWB profile) Percentage of adults who, when asked "How good is your health in general?", selected "good" or "very good". The five possible options ranged from very good to very bad, and the variable was GenHelf2. 
# 99109 = limitill2	(also in CWB profile) Percentage of adults who have a limiting long-term illness. Long-term conditions are defined as a physical or mental health condition or illness lasting, or expected to last, 12 months or more. A long-term condition is defined as limiting if the respondent reported that it limited their activities in any way. The variable used was limitill. 
# 30001 = wemwbs	Mean score on the WEMWBS scale (adults). WEMWBS stands for Warwick-Edinburgh Mental Wellbeing Scale. N.B. This indicator is also available from the ScotPHO Online Profiles (national, health board, and council area level, but not by SIMD). The questionnaire consists of 14 positively worded items designed to assess: positive affect (optimism, cheerfulness, relaxation) and satisfying interpersonal relationships and positive functioning (energy, clear thinking, self-acceptance, personal development, mastery and autonomy). It is scored by summing the response to each item answered on a 1 to 5 Likert scale ('none of the time', 'rarely', 'some of the time', often', 'all of the time'). The total score ranges from 14 to 70 with higher scores indicating greater wellbeing. The variable used was WEMWBS. 
# 30002 = life_sat	Percentage with the highest levels of life satisfaction: responses above the mode (9 to 10-Extremely satisfied) when asked "All things considered, how satisfied are you with your life as a whole nowadays?"
# 30052 = work_bal	Mean score for how satisfied adults are with their work-life balance (paid work). Respondents were asked "How satisfied are you with the balance between the time you spend on your paid work and the time you spend on other aspects of your life?" on a scale between 0 (extremely dissatisfied) and 10 (extremely satisfied). The intervening scale points were numbered but not labelled. The variable was WorkBal. 
# 30003 = gh_qg2	Percentage of adults with a possible common mental health problem. N.B. This indicator is also available from the ScotPHO Online Profiles (national, health board, and council area level, but not by SIMD). A score of four or more on the General Health Questionnaire-12 (GHQ-12) indicates a possible mental health problem over the past few weeks. GHQ-12 is a standardised scale which measures mental distress and mental ill-health. There are 12 questions which cover concentration abilities, sleeping patterns, self-esteem, stress, despair, depression, and confidence in the past few weeks. For each of the 12 questions one point is given if the participant responded 'more than usual' or 'much more than usual'. Scores are then totalled to create an overall score of zero to twelve. A score of four or more (described as a high GHQ-12 score) is indicative of a potential psychiatric disorder. Conversely a score of zero is indicative of psychological wellbeing. As GHQ-12 measures only recent changes to someone's typical functioning it cannot be used to detect chronic conditions. The variable used was GHQg2. 
# 30013 = porftvg3	Percentage of adults who met the daily fruit and vegetable consumption recommendation - five or more portions - in the previous day (survey variables porftvg3Intake and porftvg3). According to the guidelines, it is recommended for adults to consume at least five varied portions of fruit and vegetables per day. The module includes questions on consumption of the following food types in the 24 hours to midnight preceding the interview: vegetables (fresh, frozen or canned); salads; pulses; vegetables in composites (e.g. vegetable chilli); fruit (fresh, frozen or canned); dried fruit; fruit in composites (e.g. apple pie); fresh fruit juice. Fruit and vegetable consumption figures for 2021 have been calculated from online dietary recalls using INTAKE24. In 2021, less than half a portion of fruit and vegetables is defined as none. This is due to the inclusion of fruit and vegetables from composite dishes which has led to a decrease in the proportion consuming no fruit or vegetables. Data from earlier years were taken from the fruit and vegetable module. Fruit and vegetable consumption data for NHS health boards and council area areas for 2017-2021 combined are not available, as due to the different method of data collection, it was not possible to combine data for these years. Respondents to the INTAKE24 food diary were included if they had provided data for two days. 
# 30004 = depsymp	Percentage of adults who had a symptom score of two or more on the depression section of the Revised Clinical Interview Schedule (CIS-R). A score of two or more indicates symptoms of moderate to high severity experienced in the previous week. The variable used was depsymp (or dvg11 in 2008). 
# 30005 = anxsymp	Percentage of adults who had a symptom score of two or more on the anxiety section of the Revised Clinical Interview Schedule (CIS-R). A score of two or more indicates symptoms of moderate to high severity experienced in the previous week. The variable used was anxsymp (or dvj12 in 2008). 
# 30009 = suicide2	Percentage of adults who made an attempt to take their own life, by taking an overdose of tablets or in some other way, in the past year. The variable used was suicide2. 
# 30010 = dsh5sc	Percentage of adults who deliberately harmed themselves but not with the intention of killing themselves in the past year. The variable used was DSH5 from 2008 to 2011, or DSH5SC from 2013 onwards. 
# 30021 = involve	Percentage of adults who, when asked "How involved do you feel in the local community?", responded "a great deal" or "a fair amount". The four possible options ranged from "a great deal" to "not at all". The variables used were Involve and INVOLV19. 
# 30023 = p_crisis	Percentage of adults with a primary support group of three or more to rely on for comfort and support in a personal crisis. Respondents were asked "If you had a serious personal crisis, how many people, if any, do you feel you could turn to for comfort and support?", and the variables were PCrisis or PCRIS19. 
# 30051 = str_work2	Percentage of adults who find their job "very stressful" or "extremely stressful". Respondents were asked "In general, how do you find your job?" and were given options from "not at all stressful" to "extremely stressful". The variable was StrWork2. 
# 30053 = contrl	Percentage of adults who often or always have a choice in deciding how they do their work, in their current main job. The five possible responses ranged from "always" to "never". The variable was Contrl. 
# 30054 = support1	Percentage of adults who "strongly agree" or "tend to agree" that their line manager encourages them at work. The five options ranged from "strongly agree" to "strongly disagree". The variables used were Support1 and Support1_19. 
# 30026 = rg17a_new	Percentage of adults who provide 20 or more hours of care per week to a member of their household or to someone not living with them, excluding help provided in the course of employment. Participants were asked whether they look after, or give any regular help or support to, family members, friends, neighbours or others because of a long-term physical condition, mental ill-health or disability; or problems related to old age. Caring which is done as part of any paid employment is not asked about. From 2014 onwards, this question explicitly instructed respondents to exclude caring as part of paid employment. The variables used to construc this indicator were RG15aNew (Do you provide any regular help or care for any sick, disabled, or frail people?) and RG17aNew (How many hours do you spend each week providing help or unpaid care for him/her/them?). 
# 14001 - mus_rec - Adults meeting muscle strengthening guidelines. 2011 CMO guidelines recommend 2x 30 minute muscle strengthening sessions per week
# 14002 - adt10gp_tw_LOW - Adults with very low activity levels. Also in CWB, AMH profiles. 2011 CMO guidelines recommend 150 mins/week MVPA.
# 99105: Food insecurity
# 99106: Adult Healthy Weight 
# 4170: Alcohol consumption: Binge drinking (drinking over (6/8) units in a day (includes non-drinkers): Over 8 units for men, over 6 units for women" (previous indicator definition excluded non-drinkers from denom)
# 4171: Alcohol consumption: Hazardous/Harmful drinker" (% consuming over 14 units per week) (NB. original ScotPHO indicator excluded non-drinkers from denominator... it's not clear whether they are included here) 
# 4172: Alcohol consumption (mean weekly units)

# 15 child indicators:
# 30130 = ch_ghq  Percentage of children aged 15 years or under who have a parent/carer who scores 4 or more on the General Health Questionnaire-12 (GHQ-12)
# 30129 = ch_audit  Percentage of children aged 15 years or under with a parent/carer who reports consuming alcohol at hazardous or harmful levels (AUDIT questionnaire score 8+)
# 30170	Peer relationship problems - Percentage of children with a 'slightly raised', 'high' or 'very high' score (a score of 3-10) on the peer relationship problems scale of the Strengths and Difficulties Questionnaire (SDQ)
# 99117	Total difficulties - Percentage of children with a 'slightly raised', 'high' or 'very high' total difficulties score (a score of 14-40) on the Strengths and Difficulties Questionnaire (SDQ). A total difficulties score of 14 or over is also referred to as borderline (14-16) or abnormal (17-40).
# 30172	Emotional symptoms - Percentage of children with a 'slightly raised', 'high' or 'very high' score (a score of 4-10) on the emotional symptoms scale of the Strengths and Difficulties Questionnaire (SDQ)
# 30173	Conduct problems - Percentage of children with a 'slightly raised', 'high' or 'very high' score (a score of 3-10) on the conduct problems scale of the Strengths and Difficulties Questionnaire (SDQ)
# 30174	Hyperactivity/inattention - Percentage of children with a 'slightly raised', 'high' or 'very high' score (a score of 6-10) on the hyperactivity/inattention scale of the Strengths and Difficulties Questionnaire (SDQ)
# 30175	Prosocial behaviour - Percentage of children with a 'close to average' score (a score of 8-10) on the prosocial scale of the Strengths and Difficulties Questionnaire (SDQ)
# 30111 % children meeting 1 hour PA per day (INCL. SCHOOL)
# 14003 - c00sum7s - Children with very low activity levels
# 14006 - spt1ch - Children participating in sport
# 14007 - ch30plyg - Children engaging in active play
# 14012 % children meeting activity guidelines (NOT inc school) (var ch00sum7)
# 30114 = gen_helf	Percentage of children who, when asked "How good is your health in general?", selected "good" or "excellent". The five possible options ranged from very good to very bad, and the variable was GenHelf2. 
# 30115 = limitill2	Percentage of children who have a limiting long-term illness. Long-term conditions are defined as a physical or mental health condition or illness lasting, or expected to last, 12 months or more. A long-term condition is defined as limiting if the respondent reported that it limited their activities in any way. The variable used was limitill. 

# Denominators = Total number of respondents answering the question. 'Don't know' is omitted, except for in the case of the caring hours indicator rg17a_new (where it is included in the denominator, on the assumption that people giving this response probably don't give more than 20 hours of care a week) 

# Survey weights = 
# 4 different types of weights need to be used, depending on the variable being analysed:
# main sample weights of the form int...wt
# VERA weights of the form vera...wt
# biological/nurse sample weights of the form bio...wt or nurs...wt
# child interview weights of the form cint..wt
# scintwt incorporates a separate self-completion weight that was used in 2023, and has intwt for other years. To be used for all self-completion adult indicators. 
# And from 2021 the fruit/veg indicator comes from a food diary, so uses intake24 weights. 

# The adult SIMD figures are age-standardised to the population of Scotland (in private households) to aid comparison between the quintiles. 
# This is the SHeS team approach, who advised on this calculation. The standardisation is achieved by adjusting the weights before the calculation is done.
# Note from SHeS dashboard re: age-standardisation:
# Age-standardisation was undertaken separately within each sex and it was carried out using the age groups: 
# 16-24, 25-34, 35-44, 45-54, 55-64, 65-74 and 75 and over. The standard population to which the age distribution of sub-groups was adjusted was the 
# mid-year private household population estimates for Scotland. The estimates used for each report can be found here:
# https://scotland.shinyapps.io/sg-scottish-health-survey/_w_df4c62c7/Private%20household%20population%20estimates,%202008-2021,%20Scotland.xlsx

# Survey design = psu and strata variables are used in the analysis (R package 'survey') to account for clustered survey design.

# Confidence intervals:
## CI calc uses Wilson's Score method:
## Commonly used public health statistics and their confidence intervals
## https://fingertips.phe.org.uk/documents/APHO%20Tech%20Briefing%203%20Common%20PH%20Stats%20and%20CIs.pdf

# Availability = varies by indicator. 

# Suppression: 
# On SHeS dashboard SG say: "To ensure the robustness of published findings, results are not presented where the unweighted bases are below 30 participants. 
#                                 Estimates with bases between 30 and 50 should also be treated with caution."
# We follow these suppression rules.

# More information:
# SHeS dashboard: https://scotland.shinyapps.io/sg-scottish-health-survey/
# SHeS web pages: https://www.gov.scot/collections/scottish-health-survey/
# =================================================================================================================



# Packages and functions
# =================================================================================================================

## A. Load in the packages

pacman::p_load(
  here, # for file paths within project/repo folders
  arrow, # work with parquet files
  survey, # analysing data from a clustered survey design
  tidyverse
)

## B. Source generic and specialist functions 

source(here("functions", "functions.R")) # sources the file "functions/functions.R" within this project/repo

# # Source functions/packages/lookups from ScotPHO's scotpho-indicator-production repo
# # (works if you've stored the ScotPHO repo in same location as the current repo)
# #source("../scotpho-indicator-production/1.indicator_analysis.R")
# #source("../scotpho-indicator-production/2.deprivation_analysis.R")
# # change wd first
setwd("../scotpho-indicator-production/")
source("functions/main_analysis.R") # for packages and QA function
source("functions/deprivation_analysis.R") # for packages and QA function (and path to lookups)

# move back to the ScotPHO_survey_data repo
setwd("/conf/MHI_Data/Liz/repos/ScotPHO_survey_data")

## C. Path to the data derived by this script

derived_data <- "/conf/MHI_Data/derived data/"

# Read in the processed data
# =================================================================================================================


shes_adult_data <- arrow::read_parquet(paste0(derived_data, "shes_adult_data.parquet")) 
shes_child_data <- arrow::read_parquet(paste0(derived_data, "shes_child_data.parquet")) 


# 8. Calculate indicator values by various groupings
# =================================================================================================================

# These survey calculation functions are in the functions.R script
# There are some warnings that appear: a deprecated bit (I can't find where to change this) and some 'NAs introduced by coercion'. These are OK.
# optional code to write out the svy_ files after each run: I added this when Posit kept falling over mid-runs, even with 64GB session. Shouldn't be necessary...

# CAN BE WORTH SAVING EACH SVY_ FILE AS YOU GO ALONG (THE COMMENTED OUT BITS), IN CASE POSIT RUNS OUT OF MEMORY
# df = shes_adult_data
# var = "gh_qg2"
# wt = "intwt"
# ind_id = 30003
# type= "percent"
# split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "agegp7")

setwd(here(derived_data, "shes_indicator_files"))

# ADULT

# percents:

# 1. intwt used with main sample variables 
svy_percent_gen_helf <- calc_indicator_data(shes_adult_data, "gen_helf", "intwt", ind_id=99108, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "agegp7")) 
arrow::write_parquet(svy_percent_gen_helf, "svy_percent_gen_helf.parquet")
svy_percent_lifesat2 <- calc_indicator_data(shes_adult_data, "lifesat2", "intwt", ind_id=30002, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "agegp7")) 
arrow::write_parquet(svy_percent_lifesat2, "svy_percent_lifesat2.parquet")
svy_percent_limitill <- calc_indicator_data(shes_adult_data, "limitill2", "intwt", ind_id=99109, type= "percent", split_cols=c("quintile", "urban_rural", "eqv5_15", "agegp7"))  
arrow::write_parquet(svy_percent_limitill, "svy_percent_limitill.parquet")
svy_percent_adt10gp_tw <- calc_indicator_data(shes_adult_data, "adt10gp_tw2", "intwt", ind_id=99107, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "agegp7")) 
arrow::write_parquet(svy_percent_adt10gp_tw, "svy_percent_adt10gp_tw.parquet")
svy_percent_porftvg3 <- calc_indicator_data(shes_adult_data, "porftvg3", "intwt", ind_id=30013, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "agegp7")) 
arrow::write_parquet(svy_percent_porftvg3, "svy_percent_porftvg3.parquet")
svy_percent_rg17a_new <- calc_indicator_data(shes_adult_data, "rg17a_new", "intwt", ind_id=30026, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age65plus")) 
arrow::write_parquet(svy_percent_rg17a_new, "svy_percent_rg17a_new.parquet")
svy_percent_mus_rec <- calc_indicator_data(shes_adult_data, "mus_rec", "intwt", ind_id = 14001, type = "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age65plus"))
arrow::write_parquet(svy_percent_mus_rec, "svy_percent_mus_rec.parquet")
svy_percent_adt10gp_tw_LOW <- calc_indicator_data(shes_adult_data, "adt10gp_tw_LOW", "intwt", ind_id= 14002, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age65plus")) 
arrow::write_parquet(svy_percent_adt10gp_tw_LOW, "svy_percent_adt10gp_tw_LOW.parquet")
svy_percent_healthyweight <- calc_indicator_data(shes_adult_data, "healthyweight", "intwt", ind_id=99106, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "agegp7")) 
arrow::write_parquet(svy_percent_healthyweight, "svy_percent_healthyweight.parquet")
svy_percent_binge <- calc_indicator_data(shes_adult_data, "binge", "intwt", ind_id = 4170, type = "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "agegp7"))
arrow::write_parquet(svy_percent_binge, "svy_percent_binge.parquet")
svy_percent_hazharmful <- calc_indicator_data(shes_adult_data, "hazharmful", "intwt", ind_id= 4171, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "agegp7")) 
arrow::write_parquet(svy_percent_hazharmful, "svy_percent_hazharmful.parquet")

# 1b. scintwt used with main sample self-completion variables 
svy_percent_gh_qg2 <- calc_indicator_data(df = shes_adult_data, var = "gh_qg2", wt = "scintwt", ind_id = 30003, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "agegp7")) 
arrow::write_parquet(svy_percent_gh_qg2, "svy_percent_gh_qg2.parquet")
svy_percent_foodinsecure <- calc_indicator_data(shes_adult_data, "foodinsecure", "scintwt", ind_id=99105, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "agegp7")) 
arrow::write_parquet(svy_percent_foodinsecure, "svy_percent_foodinsecure.parquet")


# 2. verawt used for vera vars: National and SIMD only (samples too small for HB) 
svy_percent_involve <- calc_indicator_data(shes_adult_data, "involve", "newverawt", ind_id=30021, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age65plus")) 
arrow::write_parquet(svy_percent_involve, "svy_percent_involve.parquet")
svy_percent_p_crisis <- calc_indicator_data(shes_adult_data, "p_crisis", "newverawt", ind_id=30023, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age65plus")) 
arrow::write_parquet(svy_percent_p_crisis, "svy_percent_p_crisis.parquet")
svy_percent_str_work2 <- calc_indicator_data(shes_adult_data, "str_work2", "newverawt", ind_id=30051, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15")) 
arrow::write_parquet(svy_percent_str_work2, "svy_percent_str_work2.parquet")
svy_percent_contrl <- calc_indicator_data(shes_adult_data, "contrl", "newverawt", ind_id=30053, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15")) 
arrow::write_parquet(svy_percent_contrl, "svy_percent_contrl.parquet")
svy_percent_support1 <- calc_indicator_data(shes_adult_data, "support1", "newverawt", ind_id=30054, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age65plus")) 
arrow::write_parquet(svy_percent_support1, "svy_percent_support1.parquet")

# 3. biowt used with verb/bio sample variables (earlier surveys have nursxxwt not bioxxwt):
# National and SIMD only (samples too small for HB) 
svy_percent_depsymp <- calc_indicator_data(shes_adult_data, "depsymp", "bio_wt", ind_id=30004, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age65plus")) 
arrow::write_parquet(svy_percent_depsymp, "svy_percent_depsymp.parquet")
svy_percent_anxsymp <- calc_indicator_data(shes_adult_data, "anxsymp", "bio_wt", ind_id=30005, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age65plus")) 
arrow::write_parquet(svy_percent_anxsymp, "svy_percent_anxsymp.parquet")
svy_percent_dsh5sc <- calc_indicator_data(shes_adult_data, "dsh5sc", "bio_wt", ind_id=30010, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age65plus")) 
arrow::write_parquet(svy_percent_dsh5sc, "svy_percent_dsh5sc.parquet")
svy_percent_suicide2 <- calc_indicator_data(shes_adult_data, "suicide2", "bio_wt", ind_id=30009, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age65plus")) 
arrow::write_parquet(svy_percent_suicide2, "svy_percent_suicide2.parquet")

# # 4. intake24 wt used with intake24 porftvg3 variable (from 2021)
svy_percent_porftvg3intake <- calc_indicator_data(shes_adult_data, "porftvg3intake", "intakewt", ind_id=30013, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "agegp7")) 
arrow::write_parquet(svy_percent_porftvg3intake, "svy_percent_porftvg3intake.parquet")

# scores:

# 1. intwts used with main sample variables 
svy_score_alcunits <- calc_indicator_data(shes_adult_data, "drinker_units", "intwt", ind_id=4172, type= "score", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "agegp7")) 
arrow::write_parquet(svy_score_alcunits, "svy_score_alcunits.parquet")

# 1b. scintwt used with main sample self-completion variables 
svy_score_wemwbs <- calc_indicator_data(shes_adult_data, "wemwbs", "scintwt", ind_id=30001, type= "score", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "agegp7")) 
arrow::write_parquet(svy_score_wemwbs, "svy_score_wemwbs.parquet")

# 2. verawt used for vera vars: National and SIMD only (samples too small for HB) 
svy_score_work_bal <- calc_indicator_data(shes_adult_data, "work_bal", "newverawt", ind_id=30052, type= "score", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15")) 
arrow::write_parquet(svy_score_work_bal, "svy_score_work_bal.parquet")


# CHILDREN

# 1. cintwt used with main sample variables 
svy_percent_ch_ghq <- calc_indicator_data(shes_child_data, "ch_ghq", "cintwt", ind_id=30130, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age_group"))
arrow::write_parquet(svy_percent_ch_ghq, "svy_percent_ch_ghq.parquet")
svy_percent_cghq214 <- calc_indicator_data(shes_child_data, "cghq214", "cintwt", ind_id=30130, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age_group"))  
arrow::write_parquet(svy_percent_cghq214, "svy_percent_cghq214.parquet")
svy_percent_ch_audit <- calc_indicator_data(shes_child_data, "ch_audit", "cintwt", ind_id=30129, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age_group"))  
arrow::write_parquet(svy_percent_ch_audit, "svy_percent_ch_audit.parquet")
svy_percent_childpa1hr <- calc_indicator_data(shes_child_data, "childpa1hr", "cintwt", ind_id=30111, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age_group_chpa_dashbd"))  
arrow::write_parquet(svy_percent_childpa1hr, "svy_percent_childpa1hr.parquet")
svy_percent_sdq <- calc_indicator_data(shes_child_data, "sdq_totg", "cintwt", ind_id=99117, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age_group_sdq"))  
arrow::write_parquet(svy_percent_sdq, "svy_percent_sdq.parquet")
svy_percent_sdq_peer <- calc_indicator_data(shes_child_data, "sdq_peeg", "cintwt", ind_id=30170, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age_group_sdq"))  
arrow::write_parquet(svy_percent_sdq_peer, "svy_percent_sdq_peer.parquet")
svy_percent_sdq_emo <- calc_indicator_data(shes_child_data, "sdq_emog", "cintwt", ind_id=30172, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age_group_sdq"))  
arrow::write_parquet(svy_percent_sdq_emo, "svy_percent_sdq_emo.parquet")
svy_percent_sdq_cond <- calc_indicator_data(shes_child_data, "sdq_cong", "cintwt", ind_id=30173, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age_group_sdq"))  
arrow::write_parquet(svy_percent_sdq_cond, "svy_percent_sdq_cond.parquet")
svy_percent_sdq_hyp <- calc_indicator_data(shes_child_data, "sdq_hypg", "cintwt", ind_id=30174, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age_group_sdq"))  
arrow::write_parquet(svy_percent_sdq_hyp, "svy_percent_sdq_hyp.parquet")
svy_percent_sdq_pro <- calc_indicator_data(shes_child_data, "sdq_pro", "cintwt", ind_id=30175, type= "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age_group_sdq"))  
arrow::write_parquet(svy_percent_sdq_pro, "svy_percent_sdq_pro.parquet")
svy_percent_c00sum7s <- calc_indicator_data(shes_child_data[shes_child_data$age_group_chpa!="2 to 4y", ], "c00sum7s", "cintwt", ind_id = 14003, type = "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age_group_chpa"))
arrow::write_parquet(svy_percent_c00sum7s, "svy_percent_c00sum7s.parquet")
svy_percent_ch00sum7 <- calc_indicator_data(shes_child_data, "ch00sum7", "cintwt", ind_id = 14012, type = "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age_group_chpa_dashbd"))
arrow::write_parquet(svy_percent_ch00sum7, "svy_percent_ch00sum7.parquet")
svy_percent_spt1ch <- calc_indicator_data(shes_child_data[shes_child_data$age_group_chpa!="2 to 4y", ], "spt1ch", "cintwt", ind_id = 14006, type = "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age_group_chpa"))
arrow::write_parquet(svy_percent_spt1ch, "svy_percent_spt1ch.parquet")
svy_percent_ch30plyg <- calc_indicator_data(shes_child_data[shes_child_data$age_group_chpa!="2 to 4y", ], "ch30plyg", "cintwt", ind_id = 14007, type = "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age_group_chpa"))
arrow::write_parquet(svy_percent_ch30plyg, "svy_percent_ch30plyg.parquet")
svy_percent_child_gen_helf <- calc_indicator_data(shes_child_data, "gen_helf", "cintwt", ind_id = 30114, type = "percent", split_cols=c("quintile", "limitill_SPLIT", "urban_rural", "eqv5_15", "age_group_ch_dashbd")) %>%
  mutate(indicator="child_gen_helf")
arrow::write_parquet(svy_percent_child_gen_helf, "svy_percent_child_gen_helf.parquet")
svy_percent_child_limitill2 <- calc_indicator_data(shes_child_data, "limitill2", "cintwt", ind_id = 30115, type = "percent", split_cols=c("quintile", "urban_rural", "eqv5_15", "age_group_ch_dashbd")) %>%
  mutate(indicator="child_limitill2")
arrow::write_parquet(svy_percent_child_limitill2, "svy_percent_child_limitill2.parquet")

setwd(here())



# 9. Combine all the resulting indicator data into a single file
###############################################################################

# IF READING IN FROM FILE:
#*set up the 'svy_results' variable to contain all the svy_ parquet files in the data directory
svy_results <- list.files(path = paste0(derived_data, "shes_indicator_files"), pattern = "svy_.*\\.parquet$", recursive=TRUE, full.names=TRUE) 
# should be 42 paths in svy_results (Sept 2026)
# (i.e., representing 40 indicators, as porftveg is still 2 separate files, as is children with parent GHQ score 4+)

# Read in the files and join them
shes_results0 <- lapply(svy_results, arrow::read_parquet) %>% #read all the files in and store in a list
  bind_rows() # Sept 2026: n=681,982


# # BUT IF ALL DATA ARE IN THE GLOBAL ENVIRONMENT:
# shes_results0 <- mget(ls(pattern = "^svy_"), .GlobalEnv) %>% # finds all the dataframes produced by the functions above
#   bind_rows(.)

# save intermediate df:
arrow::write_parquet(shes_results0, paste0(derived_data, "shes_results0.parquet"))
shes_results0 <- arrow::read_parquet(paste0(derived_data, "shes_results0.parquet")) 

#rm(list=ls(pattern="^svy_"))

# Check out vars requiring it:
# May 2026 = 
# cghq214 (compare with ch_ghq): very close, use the official cghq214 var when available (2019, 2022, 2023 and 2024) and our derived var ch_ghq otherwise
# porftvg3 and porftvg3intake: porftvg3 stops at 2019-23, so use porftvg3intake after this (this is what SHeS team do)


shes_results1 <- shes_results0 %>% #n=681,982
  unique() %>% # get rid of duplicates. 
  mutate(indicator = ifelse(indicator=="porftvg3intake", "porftvg3", indicator)) %>% # harmonise the indicator name
  group_by(trend_axis, sex, code, ind_id, year, def_period, split_name, split_value) %>%
  mutate(count = n()) %>%
  ungroup() %>%
  filter(!(indicator=="ch_ghq" & count==2)) %>% # drop our derived data when there's cghq214 data available.
  mutate(indicator = ifelse(indicator=="ch_ghq", "cghq214", indicator)) %>% # harmonise the indicator name
  select(-count) #n=681,756



# SHeS suppress any figures derived from denoms <30, so we apply the same threshold.
# Let's check whether there are denominators under 30 for each of the splits.
# And decide if we want to present a split that contains some suppressed values, or just remove that split altogether.
# I've arbitrarily set the threshold at 25%: meaning we can cope with 25% (~1 in 4) data points being suppressed, but not more. 

drop_these_splits <- shes_results1 %>%
  mutate(split_name = ifelse(split_value=="Total", "Total", split_name)) %>%
  mutate(area = substr(code, 1, 3)) %>%
  mutate(areatype = case_when(area=="S00" ~ "Scot",
                              area=="S08" ~ "HB",
                              area=="S12" ~ "CA",
                              area=="S11" ~ "ADP",
                              area=="S32" ~ "PD",
                              area=="S37" ~ "HSCP",
                              TRUE ~ "NA")) %>%
  unique() %>%
  select(indicator, trend_axis, areatype, area, split_name, denominator) %>%
  group_by(indicator, areatype, area, split_name) %>%
  summarise(mean_denom = mean(denominator),
            min_denom = min(denominator),
            total = n(),
            n_under_30 = sum(denominator<30),
            pc_under_30 = 100 * n_under_30 / total) %>%
  ungroup()  %>%
  mutate(drop = ifelse(pc_under_30>25, 1, 0))



# drop splits as identified above:
shes_results1 <- shes_results1 %>% # 681,756 rows
  mutate(area = substr(code, 1, 3)) %>%
  merge(y=drop_these_splits, by=c("area", "indicator", "split_name"), all.x=TRUE) %>%
  filter(drop==0) %>% # now n=589,139
  select(-c(area, areatype:drop)) 



# drop splits by SIMD if they have data for fewer than three quintiles (+ total = 4)
shes_results1 <- shes_results1 %>% # n=589,139
  group_by(trend_axis, sex, indicator, ind_id, code, year, def_period, split_name) %>%
  mutate(count = n()) %>% # count all the values within each split, including the total
  ungroup() %>%
  filter(!(split_name=="Deprivation (SIMD)" & count<4)) %>% # case where e.g., and island board has 3 quintiles + a total
  select(-count) # now 583,865

# Suppress values where necessary:
# SHeS suppress values where denominator (unweighted base) is <30
shes_results1 <- shes_results1 %>%
  mutate(across(.cols = c(numerator, rate, lowci, upci),
                .fns = ~case_when(denominator < 30 ~ as.numeric(NA),
                                  TRUE ~ as.numeric(.x)))) 

# check: where has suppression occurred?
shes_results1 %>% 
  filter(is.na(rate)) %>%
  select(indicator, code, trend_axis, split_value) %>%
  arrange(indicator) 
# Sept 2026: ~45K values suppressed.

# save intermediate df:
arrow::write_parquet(shes_results1, paste0(derived_data, "shes_results1.parquet"))
# read back in if not in memory:
shes_results1 <- arrow::read_parquet(paste0(derived_data, "shes_results1.parquet"))

# Check the splits are ok:
table(shes_results1$split_name, shes_results1$split_value, useNA="always")
# Six splits (age group, SIMD, LTI, income, urb/rural, and sex) available
# No split_names or split_values are blank.
# Each split_name has a Total category.
# This is correct


# data checks:
table(shes_results1$trend_axis, useNA = "always") # 2008 to 2024, no NA
table(shes_results1$sex, useNA = "always") # Male, Female, Total 
table(shes_results1$indicator, useNA = "always") # 40 vars (25 adult, 15 child), no NA
table(shes_results1$year, useNA = "always") # 2008 to 2024
table(shes_results1$def_period, useNA = "always") # Aggregated years () and Survey year (), no NA
table(shes_results1$split_name, useNA = "always") # Deprivation, Age group, LTI, inc, urb/rur, or Sex, no NA
table(shes_results1$split_value, useNA = "always") # SIMD 1 to 5, income Q1 to Q5, M/F, age groups, LTI cats, urb/rur, no NA
# all good


# get indicator names into more informative names for using as filenames
shes_raw_data <- shes_results1 %>%
  mutate(indicator = case_when( indicator == "gh_qg2" ~ "common_mh_probs",    
                                indicator == "gen_helf" ~ "self_assessed_health",  
                                indicator == "limitill2" ~ "limiting_long_term_condition",  
                                indicator == "adt10gp_tw2" ~ "physical_activity",
                                indicator == "porftvg3" ~ "fruit_veg_consumption",  
                                indicator == "rg17a_new" ~ "unpaid_caring", 
                                indicator == "wemwbs" ~ "mental_wellbeing",    
                                indicator == "lifesat2" ~ "life_satisfaction",  
                                indicator == "cghq214" ~ "cyp_parent_w_ghq4",    
                                indicator == "ch_audit" ~ "cyp_parent_w_harmful_alc",
                                indicator == "involve" ~ "involved_locally",  
                                indicator == "p_crisis" ~ "support_network", 
                                indicator == "str_work2" ~ "stress_at_work",
                                indicator == "contrl" ~ "choice_at_work",   
                                indicator == "support1" ~ "line_manager", 
                                indicator == "depsymp" ~ "depression_symptoms",  
                                indicator == "anxsymp" ~ "anxiety_symptoms",  
                                indicator == "dsh5sc" ~ "deliberate_selfharm",   
                                indicator == "suicide2" ~ "attempted_suicide",
                                indicator == "work_bal" ~ "work-life_balance",
                                indicator == "sdq_totg" ~ "cyp_sdq_totaldiffs",
                                indicator == "childpa1hr" ~ "cyp_pa_over_1h_per_day",
                                indicator == "sdq_totg" ~ "cyp_sdq_totaldiffs",
                                indicator == "sdq_peeg" ~ "cyp_sdq_peer",
                                indicator == "sdq_cong" ~ "cyp_sdq_conduct",
                                indicator == "sdq_hypg" ~ "cyp_sdq_hyperactivity",
                                indicator == "sdq_emog" ~ "cyp_sdq_emotional",
                                indicator == "sdq_pro" ~ "cyp_sdq_prosocial",
                                indicator == "adt10gp_tw_LOW" ~ "adults_very_low_activity",    
                                indicator == "mus_rec" ~ "meeting_muscle_strengthening_recommendations",
                                indicator == "c00sum7s" ~ "children_very_low_activity",
                                indicator == "ch00sum7" ~ "children_meet_pa_recs_excl_school",
                                indicator == "spt1ch" ~ "children_participating_sport",
                                indicator == "ch30plyg" ~ "children_active_play",
                                indicator == "healthyweight" ~ "healthy_weight",
                                indicator == "foodinsecure" ~ "food_insecurity",
                                indicator == "binge" ~ "binge_drinking",
                                indicator == "hazharmful" ~ "problem_drinker",
                                indicator == "drinker_units" ~ "drinker_units",
                                indicator == "child_gen_helf" ~ "child_general_health",
                                indicator == "child_limitill2" ~ "cyp_llti",
                                TRUE ~ as.character(NA)  )) %>% #shouldn't be any of these
  select(-denominator) 

# save data ----
saveRDS(shes_raw_data, file = paste0(profiles_data_folder, '/Prepared Data/shes_raw.rds'))
#shes_raw_data <- readRDS(file = paste0(profiles_data_folder, 'Prepared Data/shes_raw.rds'))


# 10. Import into the SHeS script in scotpho-indicator-production repo and prepare final files there. 
###############################################################################

## END


