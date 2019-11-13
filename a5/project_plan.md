# A5: Final Project Plan
- **DATA512 University of Washington**
- **Joel Stremmel**
- **11-11-19**

**Note:** This project plan contains both the text from the original proposal (a4), as well as additions to extend this document into a full project plan (a5).

# Project Proposal

### Motivation and Problem Statement: 
I plan to analyze food inspection data from restaurants and other food establishments in Chicago from 2010 to the present.  As a Seattle resident, I am always intrigued by the signs outside of restaurants that indicate a restaurant's health safety rating.  Not all cities have this, but certainly it is important information for consumers.  It can also have a big impact on business owners, particularly if they fail a food inspection.  The city of Chicago has a large dataset of food inspections on HealthData.gov that will provide the opportunity to understand the rates at which food establishments of various types pass or fail food inspections, and what other attributes of these establishments are associated with passing or failing.  I intend to do this research in a reproducible fashion, such that these same methods could be applied to analyze food inspections in other cities.  

### Scientific and Human-Centered Considerations: 
Understanding attributes associated with passing or failing food inspections could help uncover what types of establishments in which locations are at greater risk of failing these inspections and why.  While I will build a classifier to predict types of establishments likely to fail food inspections, the purpose of this analysis is to understand both the trends in the data collected about food inspections in Chicago as well as possible confounding factors and potential sources of bias.  To do this I will analyze whether or not establishments in poor neighborhoods are more likely to fail food inspections, and controlling for this, attempt to uncover what other factors drive food inspection results.  I will also provide a descriptive analysis of whether or not certain types of inspections (i.e. Canvass or License) for certain types of food establishments (i.e. School or Restaurant) are more likely to result in passing or failing inspections.  These results will inform food inspectors, business owners, and consumers, providing tools to summarize and draw insights from this growing data asset.  

### Data Used:
For this analysis, I plan to use the Chicago Food Inspections data from HealthData.gov: https://healthdata.gov/dataset/food-inspections.  At the time of writing, it has 194,684 records of food inspections, and represents food inspections in the city of Chicago going back to 2010 as individual records.  Each record contains a facility type, name, address, date, zip code, longitude, latitude, risk status of the business, and inspection result, in addition to specific violations.  The dataset is licensed under the ODbL (Open Database License): http://opendefinition.org/licenses/odc-odbl/.  Of particular note, the dataset provides detailed location information that will allow me to identify geographic patterns associated with passing or failing food inspections in the city of Chicago, and link to additional information about city neighborhoods to assess correlations with economic status.  While this dataset has been made freely available by the city of Chicago, one ethical consideration is that the names of restaurants are made public in this dataset.  That said, it is precisely for public health reasons that this information is made public, so I will not remove these identifiers from my analysis.  That said, I will be courteous by not calling attention to or disparaging specific establishments over others, instead focusing on group trends and considering assumptions and possible confounding effects when summarizing my findings.

### Unknowns and Dependencies: 
I expect to be able to complete this project in the allotted time.  To analyze my selected data for economic bias, I will need access to economic indicators by geography.  The www.census.gov website has the data I will need; however, I may not have access to data that corresponds precisely to the years of food inspections I am analyzing.  Therefore, I will need to carefully document these assumptions.

# Project Plan

### Research Questions and Hypotheses:
This research aims to address two questions and test the assumptions of one hypothesis:

Questions:

- Which types of food establishments (i.e. restaurants, bars, cafes, school cafeterias) are most likely to fail food inspections in the city of Chicago?
- Which neighborhoods in Chicago are most likely to fail food inspections?

Hypothesis:

- The neighborhoods in Chicago most likely to fail food inspections are also relatively impoverished compared to those likely to pass inspections.

These research questions are aimed at building an understanding of factors that may contribute to establishments failing an inspection, while the hypothesis represents an assumption on my part as the researcher.   I am interested in addressing this assumption to better understand whether or not geographical features are predictive precisely because they stand in for economic features missing from the dataset, or if, perhaps, there are other factors that drive inspection failure rates.  It might also be the case that failures occur uniformly across neighborhoods.

As discussed in the project proposal, these questions are of interest to me but also relevant to restaurant owners, customers, and the city of Chicago in general.  Restaurant owners may be interested in which types of establishments represent higher risk investments compared to others, based on propensity to fail a food inspection.  Customers may be interested in which neighborhoods have restaurants that fail inspections at higher rates than other neighborhoods and whether or not this is merely due to economic factors.  While the city has implemented a model to pinpoint establishments at high-risk of failing inspections, an analysis of the features associated with failures and potential economic bias associated with the likelihood of failure will provide additional information and context.  Citizens of other cities may also be interested in the reproducible methods applied in this analysis to see how these methods could be applied to food inspection data for their cities.

### Background and Related Work:
The problem of identifying establishments likely to fail inspections has been addressed in part by the city of Chicago, using the data they have collected and made available.  Their approach focuses primarily on predicting establishments likely to fail inspections as a way of triaging which establishments need attention.  Their research is located here: https://github.com/Chicago/food-inspections-evaluation.

Blogposts have covered the way the city of Chicago breaks up food establishments by risk of foodborne illness according to the type of food they serve and the way they serve it.  This blogpost details the way in which inspectors visit high-risk establishments more often than low-risk ones: http://redlineproject.org/foodinspections.php.  This blogpost has informed my thinking about the problem at hand.

Though I found this dataset on HealthData.gov, some Chicago food inspection data has been made available on Kaggle with limited engagement from Kagglers: https://www.kaggle.com/chicago/chicago-food-inspections.  If I examine or use anything from the kernels published here, I will reference them in my final report.

GitHub user trupti-jadhav has also analyzed this data here: https://github.com/trupti-jadhav/Food-Inspection-in-City-of-Chicago-Python/blob/master/FOOD_INSPECTION_FINAL.ipynb.  I will reference his analysis if I examine it in detail or use anything from his report.

### Methodology:
To address the questions and hypothesis posed for this research, I will use a number of methods.  

To prepare the data for analysis I will:  

- Download the food inspections data CSV from the HealthData.gov website.
- Rename columns as appropriate and drop columns not relevant to my analysis.
- Examine and display the prevalence of categorical features such as food establishment type.
- Drop rare categorical features and document my criteria for dropping these features.
- Create a matrix of continuous and one hot encoded categorical features to analyze.
- Transform features appropriately before modeling, i.e. standard scaling inputs.

To address my questions and hypothesis I will apply methods in two phases.  

In phase 1 I will:

- Generate summary statistics about the features in the feature matrix such as means and spread statistics like standard deviation, min, and max.
- Split the data into train, validation, and test sets.
- Apply a Lasso Logistic Regression model to predict likelihood of failing a food inspection using the available categorical and continuous features to examine which features explain a large percentage of variation and are statistically significant in the presence of other features.  Lasso is an appropriate tool because it will set weights of irrelevant features to zero.
- Apply other ML models such as K-Nearest-Neighbors and tree-based models such as Random Forest to model non-linear relationships in the data and compare classification accuracy between approaches.
- I will examine a variety of classification metrics such as precision and recall in addition to raw accuracy to provide a sense for how a classification model could be valuable in practice.

In phase 2 I will:

- Join zip level data with economic statistics about zip regions.
- Examine correlation between failure rates and poverty levels across zip regions.
- Include economic statistics in the Lasso model to see if, when controlling for economic factors, the geographic features are as important in the regression model as in phase 1.
- Apply addition models to evaluate classification accuracy with these additional features to compare to phase 1.
- Generate relevant plots to explain predictor variables and their relationship to the target variable.

My reason for using a model to answer my questions as opposed to merely examining counts of failures by food establishment and geographical category is to control for the other features present in the data to understand, in the presence of all available features, which categories and geographical regions are most predictive of failures.

As I conduct this analysis, I may find it useful to compare statistics for failing and passing inspections using traditional inferential methods such as the Two Sample T Test to assess whether or not there is a significant difference in the rates of binary predictors or means of continuous predictors between failing and passing food establishments.  Similarly, it may become apparent that unsupervised methods such as K Means would be useful for grouping types of food establishments.  I will apply these methods as appropriate, but will start with the methods outlined in phase 1 and 2 to adhere to my project plan. 

To present my analysis I will provide a detailed Jupyter Notebook including instructive visualizations and tables.  If I am able to store code in other files and generate a single notebook of plots and tables, I will present my final analysis in this notebook.  Otherwise, I will extract images, tables, and summary statistics from my notebooks to create a final PowerPoint presentation to share my analysis.

### Data Sample:
To provide an understanding of the data elements in the Chicago Food Inspections data:

- Data Source: https://healthdata.gov/dataset/food-inspections
- License: http://opendefinition.org/licenses/odc-odbl/

I include the following first 5 rows of the dataset with headers, as well as a brief frequency analysis of important fields.  

| Inspection ID | DBA Name             | AKA Name             | License # | Facility Type        | Risk            | Address              | City    | State | Zip     | Inspection Date | Inspection Type       | Results         | Violations                                                                                                                                                                                                                              | Latitude           | Longitude    | Location                                 |
|---------------|----------------------|----------------------|-----------|----------------------|-----------------|----------------------|---------|-------|---------|-----------------|-----------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------|--------------|------------------------------------------|
| 2320831       | OGDEN PLAZA INC.     | OGDEN PLAZA INC.     | 2475982.0 | Grocery Store        | Risk 3 (Low)    | 3459 W OGDEN AVE     | CHICAGO | IL    | 60623.0 | 10/31/19        | Canvass               | Out of Business |                                                                                                                                                                                                                                         | 41.85526591        | -87.71240156 | (-87.71240156240032, 41.85526590922669)  |
| 2320793       | TACO MARIO'S LIMITED | TACO MARIO'S LIMITED | 2622418.0 | Mobile Food Preparer | Risk 2 (Medium) | 2300 S THROOP ST     | CHICAGO | IL    | 60608.0 | 10/30/19        | License               | Pass            |                                                                                                                                                                                                                                         | 41.85045102        | -87.65879786 | (-87.65879785567869, 41.85045102427)     |
| 2320830       | THE HOXTON, CHICAGO  | THE HOXTON, CHICAGO  | 2694640.0 | Restaurant           | Risk 2 (Medium) | 200 N GREEN ST       | CHICAGO | IL    | 60607.0 | 10/31/19        | License               | Pass            | 36. THERMOMETERS PROVIDED & ACCURATE - Comments: MUST PROVIDE THERMOMETERS IN ALL REFRIGERATION UNITS AND MAINTAIN.                                                                                                                     | 41.885699200000005 | -87.64878909 | (-87.64878908937915, 41.885699197163355) |
| 2320717       | ROCKS LAKEVIEW       | ROCKS LAKEVIEW       | 2304161.0 | Restaurant           | Risk 1 (High)   | 3463-3467 N BROADWAY | CHICAGO | IL    | 60657.0 | 10/29/19        | Canvass Re-Inspection | Pass            | 47. FOOD & NON-FOOD CONTACT SURFACES CLEANABLE, PROPERLY DESIGNED, CONSTRUCTED & USED - Comments: NOTED TORN RUBBER GASKET INSIDE THE PREP SERVICE COOLER AT THE KITCHEN PREP. INSTRUCTED TO DETAIL REPAIR AND MAINTAIN AND/OR REPLACE. | 41.94497417        | -87.64565976 | (-87.64565975587642, 41.94497417145062)  |
| 2320618       | A BEAUTIFUL RIND     | A BEAUTIFUL RIND     | 2670347.0 |                      | Risk 1 (High)   | 2211 N MILWAUKEE AVE | CHICAGO | IL    | 60647.0 | 10/28/19        | License               | Not Ready       |                                                                                                                                                                                                                                         | 41.92107616        | -87.69413786 | (-87.69413785909323, 41.921076157561416) |

Here are the most common food establishments in the data:

| index | facility_type                   | count  | prevalence |
|-------|---------------------------------|--------|------------|
| 0     | Restaurant                      | 129938 | 0.667430   |
| 1     | Grocery Store                   | 24829  | 0.127535   |
| 2     | School                          | 12062  | 0.061957   |
| 3     | Children's Services Facility    | 3031   | 0.015569   |
| 4     | Bakery                          | 2837   | 0.014572   |
| 5     | Daycare (2 - 6 Years)           | 2682   | 0.013776   |
| 6     | Daycare Above and Under 2 Years | 2355   | 0.012097   |
| 7     | Long Term Care                  | 1340   | 0.006883   |
| 8     | Catering                        | 1190   | 0.006112   |
| 9     | Liquor                          | 847    | 0.004351   |

And the most common Chicago zip codes represented:

| index | zip     | count | prevalence |
|-------|---------|-------|------------|
| 0     | 60614.0 | 7284  | 0.037414   |
| 1     | 60647.0 | 7088  | 0.036408   |
| 2     | 60657.0 | 6824  | 0.035052   |
| 3     | 60622.0 | 6108  | 0.031374   |
| 4     | 60611.0 | 6094  | 0.031302   |
| 5     | 60608.0 | 5925  | 0.030434   |
| 6     | 60618.0 | 5923  | 0.030424   |
| 7     | 60625.0 | 5387  | 0.027670   |
| 8     | 60639.0 | 5208  | 0.026751   |
| 9     | 60607.0 | 5145  | 0.026427   |

Certain types of inspections might also result in failures at higher rates than others.  Here are the most common inspection types:

| index | inspection_type          | count  | prevalence |
|-------|--------------------------|--------|------------|
| 0     | Canvass                  | 102944 | 0.528775   |
| 1     | License                  | 25614  | 0.131567   |
| 2     | Canvass Re-Inspection    | 20457  | 0.105078   |
| 3     | Complaint                | 18093  | 0.092935   |
| 4     | License Re-Inspection    | 8899   | 0.045710   |
| 5     | Complaint Re-Inspection  | 7499   | 0.038519   |
| 6     | Short Form Complaint     | 6717   | 0.034502   |
| 7     | Suspected Food Poisoning | 850    | 0.004366   |
| 8     | Consultation             | 669    | 0.003436   |
| 9     | License-Task Force       | 604    | 0.003102   |
