# Chicago Food Inspection Failure Analysis

This directory of the DATA512-Research repository contains my final project for DATA512 at University of Washington.  The notebooks are written in a literate style and the data is supplied in the `data` directory with the intention of making my analysis reproducible.  This research was conducted according to [the project plan detailed here](https://github.com/jstremme/DATA512-Research/blob/master/a5/project_plan.md), which I highly reocmmend reviewing for an understanding of the research questions, hypotheses, and methods considered in this analysis.

### Project Overview

As a Seattle resident, I am always intrigued by the signs outside of restaurants that indicate a restaurant's health safety rating. Not all cities have this, but certainly it is important information for consumers. It can also have a big impact on business owners, particularly if they fail a food inspection. The city of Chicago has a large dataset of food inspections on HealthData.gov that provides the opportunity to understand the rates at which food establishments of various types pass or fail food inspections, and what other attributes of these establishments are associated with passing or failing. This research has been conducted in a reproducable fashion, such that these same methods could be applied to analyze food inspections in other cities.

### Questions and Hypothesis

This research aims to address two questions and test the assumptions of one hypothesis:

Questions:

- Which types of food establishments (i.e. restaurants, bars, cafes, school cafeterias) are most likely to fail food inspections in the city of Chicago?
- Which neighborhoods in Chicago are most likely to fail food inspections?

Hypothesis:

- The neighborhoods in Chicago most likely to fail food inspections are also relatively impoverished compared to those likely to pass inspections.

These research questions are aimed at building an understanding of factors that may contribute to establishments failing an inspection, while the hypothesis represents an assumption on my part as the researcher.   I am interested in addressing this assumption to better understand whether or not geographical features are predictive precisely because they stand in for economic features missing from the dataset, or if, perhaps, there are other factors that drive inspection failure rates.  It might also be the case that failures occur uniformly across neighborhoods.

## Programming Resources Used
This analysis was prepared using Python 3.7 running in a Jupyter Notebook environment on my 2016 MacBook Pro with a 2.7 GHz Intel Core i7 processor and 16 GB 2133 MHz LPDDR3 memory.  
Documentation for Python can be found here: https://docs.python.org/3.7/  
Documentation for Jupyter Notebook can be found here: http://jupyter-notebook.readthedocs.io/en/latest/  

The following Python packages were used:
- pandas 0.24.2
- requests 2.21.0   
- matplotlib 3.0.3
- numpy 1.17.2
- statsmodels 0.9.0 
- scikit-learn 0.21.3
- xgboost 0.90  

### Data and Licenses

Chicago Food Inspections data from HealthData.gov: https://healthdata.gov/dataset/food-inspections.  At the time of writing, it has 194,684 records of food inspections, and represents food inspections in the city of Chicago going back to 2010 as individual records.  Each record contains a facility type, name, address, date, zip code, longitude, latitude, risk status of the business, and inspection result, in addition to specific violations.  The dataset is licensed under the ODbL (Open Database License): http://opendefinition.org/licenses/odc-odbl/.  Of particular note, the dataset provides detailed location information that allowing me to identify geographic patterns associated with passing or failing food inspections in the city of Chicago, and link to additional information about city neighborhoods to assess correlations with economic status.  While this dataset has been made freely available by the city of Chicago, one ethical consideration is that the names of restaurants are made public in this dataset.  That said, it is precisely for public health reasons that this information is made public, so I do not remove these identifiers from my analysis.  That said, I do not call attention to or disparage specific establishments over others, instead focusing on group trends and considering assumptions and possible confounding effects when summarizing my findings.

**Disclaimers**
- As required by census.gov: "This product uses the Census Bureau Data API but is not endorsed or certified by the Census Bureau."
- The `data` directory includes data licensed under the [odbl license](http://opendefinition.org/licenses/odc-odbl/) and that license is reproduced in `LICENSE.txt` in accordance with the requirements of the odbl license.

### Summary Plots and Visualizations

### Models

### Analysis of Variables Associated with Failing Food Inspections

### Reflection

### References

Fill out...
