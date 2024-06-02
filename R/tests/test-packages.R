## Test data validity

# Test required packages exist
context("Required packages")

test_that("Package rmarkdown is installed", {
    expect_true(require(rmarkdown))
})

