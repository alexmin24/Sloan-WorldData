#Retrieving data from census API
#list of pumas to scrape later
#manhattan_pumas = c("3810", "3809", "3808", "3807", "3806", "3805", "3804", "3803", "3802", "3801")

#make census API call
key = "b160c2eb9fd55a20418e9c06517d8c7af11872ad"
# Add key to .Renviron
Sys.setenv(CENSUS_KEY=key)
# Reload .Renviron
readRenviron("~/.Renviron")
# Check to see that the expected key is output in your R console
Sys.getenv("CENSUS_KEY")

puma <- get_pums(
  variables = c("AGEP", "ANC1P"),
  state = "NY",
  puma = "03810",
  year = 2019,
  survey = "acs5",
  rep_weights = "both",
  show_call = TRUE,
  key = key
)
write.csv(puma,"puma.csv", row.names = FALSE)
