# DATA512 A1

Note that at each step, data is saved to the `data` directory within the repository, while the final `wiki_views.png` resides in the top level directory.  The `data` directory contains 5 API call result JSONS and one CSV file with aggregated page view data.

# Step 1: Data Aquisition
- Sample code for accessing the Wikipedia API was made available for re-use under a CC0 license.
- Wikimedia Foundation REST API terms of use: https://www.mediawiki.org/wiki/REST_API#Terms_and_conditions
- Legacy Pagecounts API: https://wikitech.wikimedia.org/wiki/Analytics/AQS/Legacy_Pagecounts
- Modern Pageviews API: https://wikitech.wikimedia.org/wiki/Analytics/AQS/Pageviews

**Note:** Because the Pageview API makes it possible to filter for user traffic only, there is a slight discrepency in the counts of hits in the years for which both Pagecount and Pageview results exist.  This impacts the final analysis, as the results from the Pagecount API might include bot and web crawler traffic.

# Step 2: Data Processing
Aggregate the information from the various API calls into a single, user-friendly CSV files containing Desktop and Mobile page view counts from both the legacy and new pageview Wikipedia APIs.

- Column | Value
- year | YYYY
- month | MM
- pagecount_all_views | num_views
- pagecount_desktop_views | num_views
- pagecount_mobile_views | num_views
- pageview_all_views | num_views
- pageview_desktop_views | num_views
- pageview_mobile_views | num_views

# Step 3: Analysis
View time series of page views.

**Note**: Because the Pageview API makes it possible to filter for user traffic only, there is a slight discrepency in the counts of hits in the years for which both Pagecount and Pageview results exist.  This impacts the visualization below, as the results from the Pagecount API might include bot and web crawler traffic.  In cases where API results exist for both the Pagecount and Pageview APIs, the Pageview results are displayed.

See the `wiki_views.png` file in the data directory to view the visualization.
