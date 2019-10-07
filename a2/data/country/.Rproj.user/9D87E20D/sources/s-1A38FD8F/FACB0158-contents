# Standard functions to do a variety of little tasks within this project

# Load the libraries
library(httr) # The actual querying logic

# A function to make the actual query to the API and return the results
query_wp <- function(params, error_message = ""){
  result <- httr::GET("https://en.wikipedia.org/w/api.php",
                      query = params,
                      httr::user_agent("Category data retrieval - okeyes@uw.edu"))
  if(result$status_code != 200){
    stop(error_message)
  }
  return(httr::content(result))
}

# A function that cleans up a category title enough for the API to accept it as input.
# Specifically this involves adding a "Category:" prefix if there isn't one, and
# replacing all underscores with spaces.
clean_cat <- function(category){
  if(!grepl(x = category, pattern = "Category")){
    category <- paste0("Category:", category)
  }
  return(gsub(x = category, pattern = " ", replacement = "_"))
}

# The API requires "continuation tokens" to handle a task that goes above the limit
# for a single request. This function wraps any API-querying function and continues running
# until there is no longer a continuation token, passing said token on to future iterations
# of the function in the meantime.
loop_func <- function(func, ...){
  
  output <- NULL
  
  holding <- func(...)
  
  while("continue" %in% names(holding)){
    output <- c(output, holding$query)
    holding <- func(..., continue_token = holding$continue$cmcontinue)
  }
  output <- c(output, holding$query)
  
  return(unlist(output, recursive = FALSE, use.names = FALSE))
}