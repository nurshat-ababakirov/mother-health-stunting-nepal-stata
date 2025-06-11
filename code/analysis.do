

*Y* stuntstat
describe f7cstustat
codebook f7cstustat
tab f7cstustat
summarize f7cstustat
//f7cstustat is coded as 0 - not stunted, 1 stunted 
generate stuntstat = f7cstustat
//labeling new variable 
label variable stuntstat "stunting status of children" 
//allotting labels for subcategories 
label define stuntstat_labels 0 "not stunted" 1 "stunted" 
label values stuntstat stuntstat_labels
//checking new variable
describe stuntstat
codebook stuntstat
tab stuntstat

*X1* muacavg
//MUACAverage, avg of 3 MUACs taken of the mother
describe MUACAverage
codebook MUACAverage
tab MUACAverage
summarize MUACAverage
//generating a copy of the variable 
generate muacavg = MUACAverage
//labeling new variable 
label variable muacavg "avg of 3 MUACs taken of the mother"
//the ranges in muacavg for understanding, is min/24=underweight 24/29=ideal weight 29/max=overweight 99.9=Dont know
//removing do not knows
recode muacavg 99.9=.
//checking new variable 
describe muacavg
codebook muacavg
tab muacavg
summarize muacavg

*X2* HHfoodinsec
//f4hfiasct, HH Food Insecurity category 
describe f4hfiasct
codebook f4hfiasct
tab f4hfiasct
summarize f4hfiasct
//f4hfiasct is coded as 0 = missing values, 1 = none, 2 = mild, 3 = moderate and 4 = severe
//generating a copy of the variable called HHfoodsec
generate HHfoodinsec = f4hfiasct
//labeling new variable 
label variable HHfoodinsec "household food insecurity" 
//recoding none/no food insecutity currently coded as 1 to 0, mild insecurity currently coded as 2 to 1, moderate currently coded as 3 to 2, severe currently coded as 4 to 3, and 0 which are the missing values to 99
recode HHfoodinsec (0 = .)
//allotting labels for subcategories 
label define HHfoodinsec_labels 1 "none" 2 "mild" 3 "moderate" 4 "severe" 
label values HHfoodinsec HHfoodinsec_labels
//checking new variable 
describe HHfoodinsec
codebook HHfoodinsec
tab HHfoodinsec

*X3* childsex
//f7chld_sex, Gender of child
describe f7chld_sex
codebook f7chld_sex
tab f7chld_sex
summarize f7chld_sex
//f7chld_sex is coded as 1 = boy , 2 = girl , 66 = missing
//generating a copy of the variable called childsex
generate childsex = f7chld_sex
label variable childsex "sex of child"
//recoding boy currently coded as 1 to 0, that is the, base category 
//recoding girl which is currently 2 to 1
recode childsex (66 = .)
recode childsex 1=0 2=1 
//allotting labels for subcategories 
label define childsex_labels 0 "male" 1 "female" 
label values childsex childsex_labels
//checking new variable 
describe childsex
codebook childsex
tab childsex

*X4* treatwater
//f4c_4, treat water before drinking it to make it safe
describe f4c_4
codebook f4c_4
tab f4c_4
summarize f4c_4
//f4c_4 is coded as: No 0, Yes 1, Sometimes 2, NA	97
//generating a copy of the variable called water_treat
generate treatwater = f4c_4
label variable treatwater "treat water before drinking it to make it safe"
//recoding sometimes and NA both as 99
recode treatwater (2 = .) 
recode treatwater (97 = .)
//allotting labels for subcategories 
label define treatwater_labels 0 "no" 1 "yes" 
label values treatwater treatwater_labels
//checking new variable  
describe treatwater
codebook treatwater
tab treatwater

*X5* defpract
//f4c_7, where do children defecate or defecation practices
describe f4c_7
codebook f4c_7
tab f4c_7
summarize f4c_7
//f4c_4 is coded as Own toilet - 1, Neighbor's toilet - 2, Outdoor near the house - 3, Open field - 4 , Bush/Jungle - 6, Diaper - 7, Other - 8, Missing - 66, NA - 97
//River Pool 5 and Do not know 9, both do not show up in the tab, there were zero entries to these categories
//generating a copy of the variable called def_prac
generate defpract = f4c_7
label variable defpract "where do children defecate or defecation practices"
//recoding def_prac as 0 - Outdoor, 1 - Indoor, other, missing and NA as .
recode defpract (8 = .)
recode defpract (66 = .) 
recode defpract (97 = .)
recode defpract 1=1 2=1 3=0 4=0 6=0 7=1 
//allotting labels for subcategories 
label define defpract_labels 0 "outdoor" 1 "indoor" 
label values defpract defpract_labels
//checking new variable  
describe defpract
codebook defpract
tab defpract

*X6* brstfeedpract
//Average number of times child was breastfed per day in the last 7 days
describe f7h_4
codebook f7h_4
tab f7h_4
summarize f7h_4
//f7h_4 is coded as none - 0 , 1-10 times - 1, 11-20 times - 2, 21 or more times - 3, NA - 97
//generating a copy of the variable
gen brstfeedpract = f7h_4
label variable brstfeedpract "average number of times child breastfed per day in the last 7 days"
recode brstfeedpract (97 = .)
//allotting labels for subcategories  
label define brstfeedpract_labels 0 "none" 1 "1-10 times" 2 "11-20 times" 3 "21 or more times" 
label values brstfeedpract brstfeedpract_labels
//checking new variable 
describe brstfeedpract
codebook brstfeedpract
tab brstfeedpract
summarize brstfeedpract

*X7* HHexp
//Total household expenditure (Rs.) during the last 30 days
describe f4e1_1
codebook f4e1_1
tab f4e1_1
summarize f4e1_1
//f4e1_1 is coded as none - 0, 999998 or more - 999998, NA - 9999997
//generating a copy of the variable
gen HHexp = f4e1_1
label variable HHexp "total household expenditure (Rs.) during the last 30 days" 
recode HHexp min/7999=1 8000/19999=2 20000/max=3 9999997=.
label define HHexplabels 1 "Low Expense" 2 "Medium Expense" 3 "High Expense"
label values HHexp HHexplabels
//checking new variable 
describe HHexp
codebook HHexp
tab HHexp
summarize HHexp

*X8* motherage
//f6moth_age, Age of mother 
//Variable good as is, no NA/Missing, can remain quantitative
describe f6moth_age
codebook f6moth_age
tab f6moth_age
summarize f6moth_age
//generating a copy of the variable
gen motherage = f6moth_age
label variable motherage "mother's age"
//checking new variable
describe motherage
codebook motherage
tab motherage
summarize motherage

*X9* motherstress
//f6b7_b, if respondent felt sad all the time in the last 30 days
describe f6b7_b
codebook f6b7_b
tab f6b7_b
summarize f6b7_b
//f6b7_b is coded as no - 0, yes - 1, NA - 97
//generating a copy of the variable
generate motherstress = f6b7_b
label variable motherstress "if respondent felt sad all the time in the last 30 days"
recode motherstress (97=.)
label define motherstress_labels 0 "no" 1 "yes" 
label values motherstress motherstress_labels
//checking new variable
describe motherstress
codebook motherstress
tab motherstress
summarize motherstress

*X10* expdecision
//f6l_3h, Who normally takes the decision regarding daily household expenditures 
describe f6l_3h
codebook f6l_3h
tab f6l_3h
summarize f6l_3h
//f6l_3h is coded as self - 1, spouse - 2, self and spouse jointly - 3, other male household member - 4, other female household member - 5, self and other household member - 6, spouse and other household member - 7, Other - 8, NA - 97
//generating a copy of the variable
gen expdecision = f6l_3h
label variable expdecision "who normally takes the decision regarding daily HH expenditures"
//recoding
recode expdecision (97=.)
recode expdecision (6=.)
recode expdecision (7=.)
recode expdecision (8=.) 
recode expdecision 1=1 2=2 3=3 4=2 5=1 6=3 7=3
label define expdecision_labels 1 "female only" 2 "male only" 3 "female and spouse"  
label values expdecision expdecision_labels
//checking new variable
describe expdecision
codebook expdecision
tab expdecision
summarize expdecision

*X11* mothersicknesstatus
//mothersicknesstatus, mother's current ongoing sickness status
egen mothersicknesstatus = rowtotal(f6b_p1 f6b_q1 f6b_r1)
label variable mothersicknesstatus "mother's current ongoing sickness status"
recode mothersicknesstatus (291=.)
label define sickness_status_lbl 0 "No sickness" 1 "Mild sickness" 2 "Moderate sickness" 3 "Severe sickness"
label values mothersicknesstatus sickness_status_lbl
//checking new variable
describe mothersicknesstatus
codebook mothersicknesstatus
tab mothersicknesstatus
summarize mothersicknesstatus

*X12* region
//region, agro-ecological regions : mountains / hills / terai
//terai is plains 
label variable region "agro-ecological regions : mountains / hills / terai"
label define region_labels 1 "Mountains" 2 "Hills" 3 "Terai" 
label values region region_labels
//checking variable
describe region
codebook region
tab region
summarize region

*X13* legumecons 
//f7i1_8, no. of times consumed Other legumes (chickpeas, dried peas, lima beans & soyabeans) within last 7 days
generate legumecons = f7i1_8	
recode legumecons (997=.)
label variable legumecons "no. of times legumes (chickpeas, dried peas, lima beans & soybeans) were consumed within last 7 days"
//checking new variable
describe legumecons
codebook legumecons
tab legumecons
summarize legumecons

*X14* peanutcons
//f7i1_9, no. of times peanuts were consumed within last 7 days
generate peanutcons = f7i1_9	
recode peanutcons (997=.)
label variable peanutcons "no. of times peanuts were consumed within last 7 days"
//checking new variable
describe peanutcons
codebook peanutcons
tab peanutcons
summarize peanutcons

*X15* milkcons
//no. of times consumed Milk within last 7 days: F7i1_10 
generate milkcons = f7i1_10	
recode milkcons (997=.)
label variable milkcons "no. of times milk was consumed within last 7 days"
//checking new variable
describe milkcons
codebook milkcons
tab milkcons
summarize milkcons

*X16* curdcons
//no. of times consumed curd/whey within last 7 days: F7i1_11
generate curdcons = f7i1_11
recode curdcons (997=.)
label variable curdcons "no. of times curd was consumed within last 7 days"
//checking new variable
describe curdcons
codebook curdcons
tab curdcons
summarize curdcons

*X17* proteincons
//no. of times consumed Chicken/duck within last 7 days: F7i1_17 
generate proteincons = f7i1_17
recode proteincons (997=.)
label variable proteincons "no. of times chicken/duck were consumed within last 7 days"
//checking new variable
describe proteincons
codebook proteincons
tab proteincons
summarize proteincons

//Visualizing Y
graph bar (count), over (stuntstat) title (Stunting in Children(6 to 24 months of age))
graph save StuntinginChildren , replace 
graph export StuntinginChildren.png , replace 

//Visualizing X1
histogram muacavg, bin(100) frequency title (Mother's Nutritional Status(as measured by MUAC))
graph save MothersMUAC , replace 
graph export MothersMUAC.png , replace 

//Exploring categories of X1
generate MUACAverage_cat = MUACAverage
label variable MUACAverage_cat "MUAC"
recode MUACAverage_cat min/24=1 24/29=2 29/max=3  99.9=. 
label define  MUACAverage_cat_labels 1 "Underweight" 2 "Ideal weight" 3 "Overweight"
label values  MUACAverage_cat  MUACAverage_cat_labels
tabulate MUACAverage_cat

//Exploring distribution of quantitative response variable across different categories
graph box muacavg, over(stuntstat) title (Distribution of MUAC over Stunting Status)
graph save SidebysideBoxplots , replace 
graph export SidebysideBoxplots.png , replace 

//Comparing the mean on the quantitative response variable across different categories
tab stuntstat, summarize (muacavg) 
sum muacavg if stuntstat == 0
sum muacavg if stuntstat == 1

//Scatterplot
twoway (scatter stuntstat muacavg) (lfit stuntstat muacavg), title (Stunting and Mother's Health Association) xtitle (Mother's MUAC) ytitle (Stunting in Children (6 to 24 months of age))
graph save Scatterplot , replace 
graph export Scatterplot.png , replace 

//Correlation matrix
pwcorr stuntstat muacavg

//LPM Regression results, naive approach 
regress stuntstat muacavg i.HHfoodinsec i.childsex i.treatwater i.defpract i.brstfeedpract i.HHexp motherage i.motherstress i.expdecision i.mothersicknesstatus c.muacavg##i.motherstress i.region legumecons peanutcons milkcons curdcons proteincons

//Checking for multicollinearity 
vif

//Logit results (without interaction term)
logit stuntstat muacavg i.HHfoodinsec i.childsex i.treatwater i.defpract i.brstfeedpract i.HHexp motherage i.motherstress i.expdecision i.mothersicknesstatus i.region legumecons peanutcons milkcons curdcons proteincons

//margins (without interaction term)
margins, at(muacavg = (17(1)28)) atmeans

//marginsplot (without interaction term)
marginsplot, noci

//Logit results (with interaction term)
logit stuntstat muacavg i.HHfoodinsec i.childsex i.treatwater i.defpract i.brstfeedpract i.HHexp motherage i.motherstress i.expdecision i.mothersicknesstatus c.muacavg##i.motherstress i.region legumecons peanutcons milkcons curdcons proteincons

//margins (with interaction term)
margins, at(muacavg = (17(1)28)) atmeans

//marginsplot (with interaction term)
marginsplot, noci

//margins for Mother's Stress Levels
margins, at(muacavg = (17.5(1)28.9)  motherstress = (0 1))

//marginsplot for Mother's Stress Levels
marginsplot, noci

//Checking for sensitivity and specificity/soundness of model 
lstat

//done
