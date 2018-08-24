context("cn")

test_that("cn", {
  expect_identical(cn(0), "0 values")
  expect_identical(cn(1), "1 value")
  expect_identical(cn(2), "2 values")
  expect_identical(cn(4, "%n element%s %n"), "4 elements 4")
})
