context("cs")

test_that("cs", {
  expect_identical(cs(0), "0 values")
  expect_identical(cs(1), "1 value")
  expect_identical(cs(2), "2 values")
  expect_identical(cs(4, "%n element%s %n"), "4 elements 4")
})
