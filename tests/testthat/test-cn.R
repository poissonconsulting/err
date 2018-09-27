context("cn")

test_that("cn", {
  expect_identical(cn(0), "there are 0 values")
  expect_identical(cn(1), "there is 1 value")
  expect_identical(cn(2), "there are 2 values")
  expect_identical(cn(4, "%n element%s %n"), "4 elements 4")
})
