library(RISmed)
library(here) 

# Build the search query
query = "heart OR cardiac AND single-cell" 

# Summary of the query 
query_summary <- EUtilsSummary(query, type = 'esearch', db = 'pubmed', retmax = 1600)
# Other arguments to be modified: reldate, mindate, maxdate, datetype

# Collect query data
query_record <- EUtilsGet(query_summary)

# Export the query record 
saveRDS(query_record, file = here("data", "query-record.rds"))

    