# Bias in Data

Name: Joel Stremmel

Date: 10-10-19

## Goal
The goal of this project is to analyze the number of articles on politicians for a given country relative to the country's population, as well as the quality of articles.  The analysis also looks at politician article coverage and quality grouped by regions of countries.  There is a brief write-up at the end of the notebook that discusses bias in these articles. Notebook is broken out into the following sections:

- **1.** Load, Score, and Clean Wikipedia Page and Population Data
- **2.** Compute Country Level Statistics
- **3.** Compute Region Level Statistics
- **4.** Display Deliverables
- **5.** Reflection

## Data sources used

"This project contains data on most English-language Wikipedia articles within the category "Category:Politicians by nationality" and subcategories, along with the code used to generate that data. Both are released under the CC-BY-SA 4.0 license." - https://wiki.communitydata.science/Human_Centered_Data_Science_(Fall_2019)/Assignments#Getting_the_article_and_population_data

To create these tables, we will draw from three data sources: 

- https://www.prb.org/international/indicator/population/table/ 2018 World Population Data Sheet.
- https://figshare.com/articles/Untitled_Item/5513449 Keyes, Os (2017): Politicians by Country from the English-language Wikipedia. figshare. Dataset. 


## Resources used
This analysis was prepared using Python 3.7 running in a Jupyter Notebook environment.  
Documentation for Python can be found here: https://docs.python.org/3.7/  
Documentation for Jupyter Notebook can be found here: http://jupyter-notebook.readthedocs.io/en/latest/  

The following Python packages were used:
- pandas 0.24.2
- ores 1.3.1

Their documentation can be found at the accompanying links:
- https://pandas.pydata.org/pandas-docs/version/0.24/
- https://www.mediawiki.org/wiki/ORES

## Files Created
This notebook creates 2 CSV files of data extracted and compiled as part of this analysis.

1. `data/wp_wpds_countries-no_match.csv` containing Wikipedia page records that do not match population data
2. `data/wp_wpds_politicians_by_country.csv` containing merged wikipedia pages and country-level population data


## Data Tables Created

- Table 1: Top 10 countries by coverage: 10 highest-ranked countries in terms of number of politician articles as a proportion of country population (in millions)

- Table 2: Bottom 10 countries by coverage: 10 lowest-ranked countries in terms of number of politician articles as a proportion of country population (in millions)

- Table 3: Top 10 countries by relative quality: 10 highest-ranked countries in terms of the relative proportion of politician articles that are of GA or FA-quality

- Table 4: Bottom 10 countries by relative quality: 10 lowest-ranked countries in terms of the relative proportion of politician articles that are of GA and FA-quality

- Table 5: Geographic regions by coverage: Ranking of geographic regions (in descending order) in terms of the total count of politician articles from countries in each region as a proportion of total regional population (in millions)

- Table 6: Geographic regions by coverage: Ranking of geographic regions (in descending order) in terms of the relative proportion of politician articles from countries in each region that are of GA and FA-quality


## License

- This assignment code is released under the MIT license in `LICENSE.txt`.
- The data sources are licensed under the CC-BY-SA 4.0 license.