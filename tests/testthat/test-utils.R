context("utils")

test_that("n_string", {
  expect_identical(n_string(1, "1", "2", "3", "4", 10), "1")
  expect_identical(n_string(2, "1", "2", "3", "4", 10), "2")
  expect_identical(n_string(0, "1", "2", "3", "4", 10), "3")
  expect_identical(n_string(10, "1", "2", "3", "4", 10), "4")
  expect_identical(n_string(9, "1", "2", "3", "4", 10), "2")
})