# A5: Final Project Plan
- **DATA512 University of Washington**
- **Joel Stremmel**
- **11-11-19**

**Note:** This project plan contains both the text from the original proposal, as well as additions to extend this document into a full project plan.

# Project Proposal

### Motivation and Problem Statement: 
I plan to analyze food inspection data from restaurants and other food establishments in Chicago from 2010 to the present.  As a Seattle resident, I am always intrigued by the signs outside of restaurants that indicate a restaurant's health safety rating.  Not all cities have this, but certainly it is important information for consumers.  It can also have a big impact on business owners, particularly if they fail a food inspection.  The city of Chicago has a large dataset of food inspections on HealthData.gov that will provide the opportunity to understand the rates at which food establishments of various types pass or fail food inspections, and what other attributes of these establishments are associated with passing or failing.  I intend to do this research in a reproducible fashion, such that these same methods could be applied to analyze food inspections in other cities.  

### Scientific and Human-Centered Considerations: 
Understanding attributes associated with passing or failing food inspections could help uncover what types of establishments in which locations are at greater risk of failing these inspections and why.  While I will build a classifier to predict types of establishments likely to fail food inspections, the purpose of this analysis is to understand both the trends in the data collected about food inspections in Chicago as well as possible confounding factors and potential sources of bias.  To do this I will analyze whether or not establishments in poor neighborhoods are more likely to fail food inspections, and controlling for this, attempt to uncover what other factors drive food inspection results.  I will also provide a descriptive analysis of whether or not certain types of inspections (i.e. Canvass or License) for certain types of food establishments (i.e. School or Restaurant) are more likely to result in passing or failing inspections.  These results will inform food inspectors, business owners, and consumers, providing tools to summarize and draw insights from this growing data asset.  

### Data Used:
For this analysis, I plan to use the Chicago Food Inspections data from HealthData.gov: https://healthdata.gov/dataset/food-inspections.  At the time of writing, it has 194,684 records of food inspections, and represents food inspections in the city of Chicago going back to 2010 as individual records.  Each record contains a facilitiy type, name, address, date, zip code, longitute, latitute, risk status of the business, and inspection result, in addition to specific violations.  The dataset is licensed under the ODbL (Open Database License): http://opendefinition.org/licenses/odc-odbl/.  Of particular note, the dataset provides detailed location information that will allow me to identify geographic patterns associated with passing or failing food inspections in the city of Chicago, and link to additional information about city neighborhoods to assess correlations with economic status.  While this dataset has been made freely available by the city of Chicago, one ethical consideration is that the names of restaurants are made public in this dataset.  That said, it is precisely for public health reasons that this information is made public, so I will not remove these identifiers from my analysis.  That said, I will be courteous by not calling attention to or disparaging specific establishments over others, instead focusing on group trends and considering assumptions and possible confounding effects when summarizing my findings.

### Unknowns and Dependencies: 
I expect to be able to complete this project in the alloted time.  To analyze my selected data for economic bias, I will need access to economic indicators by geography.  The www.census.gov website has the data I will need, however I may not have access to data that corresponds precisely to the years of food inspections I am analyzing.  Therefore, I will need to carefully document these assumptions.

# Project Plan

### Research Questions and Hypotheses:
This research aims to address two questions and test the assumptions of one hypothesis:

Questions:

- Which types of food establishments (i.e. restaurants, bars, cafes, school cafeterias) are most likely to fail food inspections in the city of Chicago?

- Which neighborhoods in Chicago are most likely to fail food inspections?

Hypothesis:

- The neighborhoods in Chicago most likely to fail food inspections are also relatively impoverished compared to those likely to pass inspections.

These research questions are aimed at building an understanding of factors that may contribute to establishments failing an inspection, while the hypothesis represents an assumption on my part as the researcher.   I am interested in addressing this assumption to better understand whether or not geographical features are predictive precisely because they stand in for economic features missing from the dataset, or if, perhaps, there are other factors that drive inspection failure rates.  It might also be the case that failures occur uniformly across neighborhoods.

### Background and Related Work:
The problem of identifying establishments likely to fail inspections has been addressed in part by the city of Chicago, using the data they have collected and made available.  Their approach focuses primarily on predicting establishments likely to fail inspections as a way of triaging which establishments need attention.  Their research is located here: https://github.com/Chicago/food-inspections-evaluation.

Blogposts have covered the work done by the city of Chicago in the GitHub repository linked above to analyze risk of foodborne illness for specific food establishments.  This blogpost details the way in which inspectors visit high-risk establishments more often than low-risk ones, following the use of the model developed by the city: http://redlineproject.org/foodinspections.php.  This blogpost has informed my thinking about the problem at hand.

Though I found this dataset on healthdata.gov, some Chicago food inspection data has been made available on Kaggle with limited engagement from Kagglers: https://www.kaggle.com/chicago/chicago-food-inspections.  If I examine or use anything from the kernels published here, I will reference them in my final report.

GitHub user trupti-jadhav has also analyzed this data here: https://github.com/trupti-jadhav/Food-Inspection-in-City-of-Chicago-Python/blob/master/FOOD_INSPECTION_FINAL.ipynb.  I will reference his analysis if I examine it in detail or use anything from his report.

### Methodology:
To address the questions and hypothesis posed for this research, I will use a number of methods.  

To prepare the data for analysis I will:  

- Download the food inspections data CSV from the healthdata.gov website
- Rename columns as appropriate and drop columns not relevant to my analysis
- Examine and display the prevalence of categorical features such as food establishment type
- Drop rare categorical features and document my criteria for dropping these features
- Create a matrix of continuous and one hot encoded categorical features to analyze
- Transform features appropriately before modeling, i.e. standard scaling inputs

To address my questions and hypothesis I will apply methods in two phases.  

In phase 1 I will:

- Generate summary statistics about the features in the feature matrix such as means and spread statistics like standard deviation, min, and max.
- Split the data into train, validation, and test sets.
- Apply a Lasso logistic regression model to predict liklihood of failing a food inspection using the available categorical and continuous features to examine which features explain a large percentage of variation and are statistically significant in the presence of other features.
- Apply other ML models such as K-Nearest-Neighbors and tree-based models such as Random Forest to model nonlinear relationships in the data and compare classification accuracy between approaches.
- I will examine a variety of classification metrics such as precision and recall in addition to raw accuracy to provide a sense for how a classification model could be valuable in practice.

In phase 2 I will:

- Join zip level data with economic statistics about zip regions
- Examine correlation between failure rates and poverty levels across zip regions
- Include economic statistics in the Lasso model to see if, when controlling for economic factors, the geographic features are as important in the regression model as in phase 1.
- Apply addition models to evaluate classification accuracy with these additional features to compare to phase 1.
- Generate relevant plots to explain predictor variables and their relationship to the target variable.

As I conduct this analysis, I may find it useful to compare statistics for failing and passing inspections using traditional inferential methods such as the two sample t test to assess whether or not there is a significant difference in the rates of binary predictors or means of continous predictors between failing and passing food establishments.

To present my analysis I will provide a detailed Jupyter Notebook including instructive visualizations and tables.  If I am able to store code in other files and generate a single notebook of plots and tables, I will present my final analysis in this notebook.  Otherwise, I will extract images, tables, and summary statistics from my notebooks to create a final Powerpoint presentation to share my analysis.