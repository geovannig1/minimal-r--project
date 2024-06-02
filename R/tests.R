## Test code in the project

# Use the testthat package
library(testthat)

# Should run the ./tests/test-data.R script
# Note any errors will propagate to `make`
test_dir("R/tests/")

