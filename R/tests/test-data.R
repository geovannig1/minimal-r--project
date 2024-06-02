## Test data validity

context("Data validity")

# Test AirPassengers exists
test_that("AirPassengers exists", {
    expect_true(exists("AirPassengers"))
})

# Test that AirPassengers is a timeseries
test_that("AirPassengers is a timeseries", {
    expect_is(AirPassengers, "ts")
})

