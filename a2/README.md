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

### Data Sources

"This project contains data on most English-language Wikipedia articles within the category "Category:Politicians by nationality" and subcategories, along with the code used to generate that data. Both are released under the CC-BY-SA 4.0 license." - From Figshare link below.

- https://www.prb.org/international/indicator/population/table/ 2018 World Population Data Sheet.

    - **column** | **Type**
    - page | object (string)
    - country | object (string)
    - rev_id | int64

- https://figshare.com/articles/Untitled_Item/5513449 Keyes, Os (2017): Politicians by Country from the English-language Wikipedia. figshare. Dataset. 

    - **column** | **Type**
    - Geography | object (string)
    - Population mid-2018 (millions) | object (string)


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
The following tables are created inside the Jupyter notebook to summarize the data.

- Table 1: Top 10 countries by coverage: 10 highest-ranked countries in terms of number of politician articles as a proportion of country population (in millions)

- Table 2: Bottom 10 countries by coverage: 10 lowest-ranked countries in terms of number of politician articles as a proportion of country population (in millions)

- Table 3: Top 10 countries by relative quality: 10 highest-ranked countries in terms of the relative proportion of politician articles that are of GA or FA-quality

- Table 4: Bottom 10 countries by relative quality: 10 lowest-ranked countries in terms of the relative proportion of politician articles that are of GA and FA-quality

- Table 5: Geographic regions by coverage: Ranking of geographic regions (in descending order) in terms of the total count of politician articles from countries in each region as a proportion of total regional population (in millions)

- Table 6: Geographic regions by coverage: Ranking of geographic regions (in descending order) in terms of the relative proportion of politician articles from countries in each region that are of GA and FA-quality

## Reflection
In this analysis, I expected to see a large difference in articles per person between wealthy, democratic countries and poor countries with centralized governments and limited rights for citizens.  In processing the data, there were opportunities to introduce bias into the analysis, beyond my personal bias going into this research, such as some articles not returning valid ORES scores.  It's possible that removing these articles from the analysis yields a sample, which though large, does not fully represent the full population of Wikipedia articles about politicians.

The 6 table results provide an opportunity to generate hypotheses about differences between Wikipedia pages across countries, but no basis to claim significant differences or explain mechanisms that could drive the observed variation.  One hypothesis, based on the tables I generated, is that small countries with more internet users have more pages per person than large countries in which a minority but sizeable percentage of the population may not have internet access.  

Another hypothesis, which seems questionable given the tables above, is that countries with greater civil liberties will have higher quality articles, as citizens will have unrestricted access to contribute to ongoing political dialogue, curation of media publications, and encyclopedic articles.  North Korea, ranking as highest in terms of article quality, casts doubt on this hypothesis, making it an interesting one to test.  However, limitations in the data could bias tests of this hypothesis.  For instance, the quality rankings from ORES may not adequetly capture the nuance of what makes an article factual.  And similarly, ranking countries by civil liberties could prove challenging.  The truthfulness of an article or the freedom of citizens is not easily reduced to numerical scores, and analysis that makes these reductions will always warrant skepticism. 

Related to the idea of truthfulness, this analysis brings to mind the question, which could also be formulated as a hypothesis, of how access to Wikipedia within a given country is related to article quality.  My expectation is that political regimes who restrict access to internet resources like Wikipedia are more likely to fabricate information, this fabrication might even go unchecked by citizens of other countries.  Again, testing this could prove difficult, as obtaining ground truth labels to know which articles are fabricated, or at least twisted so as to mislead citizens, begs the question posed, committing a logical fallacy which could also be considered a source of bias when performing data analysis of this sort. Furthermore, it could be the case that intense media focus on totalitarean governments such as North Korea actually increase scrutiny of articles about politicians in such countries, seeking to combat disinformation.  This could explain the high rate of GA and FA-quality articles about politicians in North Korea.

## License

- This assignment code is released under the MIT license in `LICENSE.txt`.
- The data sources are licensed under the CC-BY-SA 4.0 license.