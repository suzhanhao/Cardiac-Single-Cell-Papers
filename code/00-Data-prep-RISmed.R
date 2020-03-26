library(RISmed)
library(here) 

# Build the search query
query = "heart OR cardiac AND single-cell" 

# Summary of the query 
query_summary <- EUtilsSummary(query, type = 'esearch', db = 'pubmed', retmax = 1600)
# Other arguments to be modified: reldate, mindate, maxdate, datetype

# Collect query data
query_record <- EUtilsGet(query_summary)

# Select variables of interest and create dataframe
Record_data <- data.frame(
        Title = query_record@ArticleTitle,
        Abstract = query_record@AbstractText,
        Journal = query_record@Title,
        PMID = query_record@PMID,
        Year = query_record@YearPubmed,
        Country = query_record@Country
    )

# Change title and abstract column as character 
Record_data$Title <- as.character(Record_data$Title)
Record_data$Abstract <- as.character(Record_data$Abstract)

# Output the dataframe as csv file for later use
write.csv(Record_data, file = here("data", "record-data.csv"), row.names = F)


    