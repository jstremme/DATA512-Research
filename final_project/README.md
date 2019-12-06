# Chicago Food Inspection Failure Analysis

This directory of the DATA512-Research repository contains my final project for DATA512 at University of Washington.  The notebooks are written in a literate style and the data is supplied in the `data` directory with the intention of making my analysis reproducible.  This research was conducted according to [the project plan detailed here](https://github.com/jstremme/DATA512-Research/blob/master/a5/project_plan.md), which I highly reocmmend reviewing for an understanding of the research questions, hypotheses, and methods considered in this analysis.

# Final Report
This `README.md` file serves as my final report, though the notebooks provide additional details of my analysis.

### Project Overview

As a Seattle resident, I am always intrigued by the signs outside of restaurants that indicate a restaurant's health safety rating. Not all cities have this, but certainly it is important information for consumers. It can also have a big impact on business owners, particularly if they fail a food inspection. The city of Chicago has a large dataset of food inspections on https://healthdata.gov/ that provides the opportunity to understand the rates at which food establishments of various types pass or fail food inspections, and what other attributes of these establishments are associated with passing or failing. This research has been conducted in a reproducable fashion, such that these same methods could be applied to analyze food inspections in other cities.

### Questions and Hypothesis

This research aims to address two questions and test the assumptions of one hypothesis:

**Questions**

- Which types of food establishments (i.e. restaurants, bars, cafes, school cafeterias) are most likely to fail food inspections in the city of Chicago?
- Which neighborhoods in Chicago are most likely to fail food inspections?

**Hypothesis**

- The neighborhoods in Chicago most likely to fail food inspections are also relatively impoverished compared to those likely to pass inspections.

These research questions are aimed at building an understanding of factors that may contribute to establishments failing an inspection, while the hypothesis represents an assumption on my part as the researcher.  I am interested in addressing this assumption to better understand whether or not geographical features are predictive precisely because they stand in for economic features missing from the dataset, or if, perhaps, there are other factors that drive inspection failure rates.  It might also be the case that failures occur uniformly across neighborhoods.

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

To address the potential confounding effects of economic status, I include median household income by zip code using the American Community Five Year Survey which I access through the US Census Data API.  See details on these data resources here:

- US Census Data API Terms of Service: https://www.census.gov/data/developers/about/terms-of-service.html
- API Key Signup: https://api.census.gov/data/key_signup.html
- API User Guide: https://www.census.gov/data/developers/guidance/api-user-guide.html
- American Community and Five Year Survey: https://www.census.gov/data/developers/data-sets/acs-5year.html
- American Community and Five Year Survey Variables: https://api.census.gov/data/2017/acs/acs5/variables.html
- Blogpost I Read to Help with Setup: https://towardsdatascience.com/getting-census-data-in-5-easy-steps-a08eeb63995d

**Disclaimers**
- As required by census.gov: "This product uses the Census Bureau Data API but is not endorsed or certified by the Census Bureau."
- The `data` directory includes data licensed under the [odbl license](http://opendefinition.org/licenses/odc-odbl/) and that license is reproduced in `LICENSE.txt` in accordance with the requirements of the odbl license.

**Example Records**

| Inspection ID | DBA Name             | AKA Name             | License # | Facility Type        | Risk            | Address              | City    | State | Zip     | Inspection Date | Inspection Type       | Results         | Violations                                                                                                                                                                                                                              | Latitude           | Longitude    | Location                                 |
|---------------|----------------------|----------------------|-----------|----------------------|-----------------|----------------------|---------|-------|---------|-----------------|-----------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------|--------------|------------------------------------------|
| 2320831       | OGDEN PLAZA INC.     | OGDEN PLAZA INC.     | 2475982.0 | Grocery Store        | Risk 3 (Low)    | 3459 W OGDEN AVE     | CHICAGO | IL    | 60623.0 | 10/31/19        | Canvass               | Out of Business |                                                                                                                                                                                                                                         | 41.85526591        | -87.71240156 | (-87.71240156240032, 41.85526590922669)  |
| 2320793       | TACO MARIO'S LIMITED | TACO MARIO'S LIMITED | 2622418.0 | Mobile Food Preparer | Risk 2 (Medium) | 2300 S THROOP ST     | CHICAGO | IL    | 60608.0 | 10/30/19        | License               | Pass            |                                                                                                                                                                                                                                         | 41.85045102        | -87.65879786 | (-87.65879785567869, 41.85045102427)     |
| 2320830       | THE HOXTON, CHICAGO  | THE HOXTON, CHICAGO  | 2694640.0 | Restaurant           | Risk 2 (Medium) | 200 N GREEN ST       | CHICAGO | IL    | 60607.0 | 10/31/19        | License               | Pass            | 36. THERMOMETERS PROVIDED & ACCURATE - Comments: MUST PROVIDE THERMOMETERS IN ALL REFRIGERATION UNITS AND MAINTAIN.                                                                                                                     | 41.885699200000005 | -87.64878909 | (-87.64878908937915, 41.885699197163355) |
| 2320717       | ROCKS LAKEVIEW       | ROCKS LAKEVIEW       | 2304161.0 | Restaurant           | Risk 1 (High)   | 3463-3467 N BROADWAY | CHICAGO | IL    | 60657.0 | 10/29/19        | Canvass Re-Inspection | Pass            | 47. FOOD & NON-FOOD CONTACT SURFACES CLEANABLE, PROPERLY DESIGNED, CONSTRUCTED & USED - Comments: NOTED TORN RUBBER GASKET INSIDE THE PREP SERVICE COOLER AT THE KITCHEN PREP. INSTRUCTED TO DETAIL REPAIR AND MAINTAIN AND/OR REPLACE. | 41.94497417        | -87.64565976 | (-87.64565975587642, 41.94497417145062)  |
| 2320618       | A BEAUTIFUL RIND     | A BEAUTIFUL RIND     | 2670347.0 |                      | Risk 1 (High)   | 2211 N MILWAUKEE AVE | CHICAGO | IL    | 60647.0 | 10/28/19        | License               | Not Ready       |                                                                                                                                                                                                                                         | 41.92107616        | -87.69413786 | (-87.69413785909323, 41.921076157561416) |

### Summary Plots and Visualizations

To address my first question, I plot the inspection failure rates by facilitiy type. ![plot1](https://github.com/jstremme/DATA512-Research/blob/master/final_project/images/eda/failure_rates_by_facility_type.png)

I also inspect failure rates by zip code, as my aim is to understand neighborhoods most likely to fail inspections.  I explore zip codes as features in a linear model for predicting failures to measure the effect of belonging to a given zip when controling for other features in the dataset. ![plot2](https://github.com/jstremme/DATA512-Research/blob/master/final_project/images/eda/failure_rates_by_zip.png)

Using the US Census API, I collect median household income for each zip code in the data.  Here I show the failure rate for food inspections by median household income group. ![plot3](https://github.com/jstremme/DATA512-Research/blob/master/final_project/images/eda/failure_rates_by_median_household_income_bucket.png)

### Models

### Analysis of Variables Associated with Failing Food Inspections

### Reflection

### References

Fill out...
