# Load packages
library(WikipediR) # Standard Wikipedia API wrapper for some requests
library(magrittr) # Pipe operator
library(rlist) # Utilities for reformatting and manipulating lists

# Load other code files
source("./code/utils.R")

# Function to grab the initial set of categories from "Category:People by nationality"
# so that we can filter it down to actual per-country categories rather than include
# meta-categories like "People by continent and nationality".
get_categories <- function(){
  
  # Get the raw data and reformat it, returning a vector of category titles
  categories <- WikipediR::pages_in_category("en", "wikipedia",
                                             categories = "Politicians by nationality",
                                             properties = "title", type = "subcat",
                                             limit = 500)$query$categorymembers %>%
    lapply(rlist::list.extract, "title") %>%
    unlist
  
  # Filter it down to only include categories of the format "[nationality] people"
  # and return it
  return(categories[grepl(x = categories, pattern = "politicians$")])
  
}

# A function to get all of the subcategories within a category, recursively, to
# allow for complex structures within "Category: [X] people"
get_subcategories <- function(category, continue_token = NULL){
  
  # Clean category name and construct query
  query_params <- list(action = "query",
                       list = "categorymembers",
                       format = "json",
                       cmtitle = clean_cat(category),
                       cmprop = "title",
                       cmtype = "subcat",
                       cmlimit = 50)
  
  # Handle continuation token
  if(!is.null(continue_token)){
    query_params['cmcontinue'] <- continue_token
  }
  
  # Query the API and return
  return(query_wp(query_params))
}

# A functiont that, given a category name, provides all pages within that category,
# allowing us to (finally) retrieve the page titles!
get_pages <- function(category, continue_token = NULL){
  
  # Construct parameters
  query_params <- list(action = "query",
                       list = "categorymembers",
                       format = "json",
                       cmtitle = clean_cat(category),
                       cmprop = "title",
                       cmtype = "page",
                       cmlimit = 50)
  
  # Handle continuation token
  if(!is.null(continue_token)){
    query_params['cmcontinue'] = continue_token
  }
  
  # Make query and return results
  results <- query_wp(query_params,
                      "Pages in categories could not be retrieved")
  
  return(results)
}

# This gets the revision ID for the last edit to an article
get_last_edit <- function(titles){
 
  # Internal function for a single set of revision IDs
  get_last_edit_ <- function(titles){
    
    # Construct query parameters
    query_params <- list(action = "query",
                         prop = "revisions",
                         titles = paste0(titles, collapse = "|"),
                         rvprop = "ids",
                         format = "json")
    cat(".")
    # Make query and return results
    results <- query_wp(query_params,
                        "Revision IDs could not be retrieved")
    
    return(results$query$pages)
  }

  titles <- gsub(x = titles, pattern = " ", replacement = "_")
  if(length(titles) > 50){
    titles <- split(titles, ceiling(seq_along(titles)/50))
  } else {
    titles <- list(titles)
  }
  
  results <- unlist(
    lapply(titles, get_last_edit_),
    recursive = FALSE, use.names = FALSE
  )
  
  # Extract the actual revision IDs
  output <- lapply(results, function(x){
    
    return(data.frame(page = x$title,
                      rev_id = x$revisions[[1]]$revid,
                      stringsAsFactors = FALSE))
  }) %>%
    do.call("rbind", .)
  
  return(output)
}