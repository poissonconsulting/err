context("cc")

test_that("cc", {
  expect_identical(cc(1), "1")
  expect_identical(cc(1:2), "1, 2")
  expect_identical(cc(1:3), "1, 2, 3")
  expect_identical(cc(1,2,3), "1, 2, 3")
  expect_identical(cc(1,2:3,5), "1, 2, 3, 5")
  expect_identical(cc(1,2:3,5, bracket = "'"), "'1', '2', '3', '5'")
  expect_identical(cc(1,2:3,4, ellipsis = 4, bracket = "'"), "'1', '2', ..., '4'")
  expect_identical(cc(5:1, ellipsis = 4), "5, 4, ..., 1")
  expect_error(cc(1,2:3,4, ellipsis = 3), "ellipsis must be a count greater than 3")
})

test_that("cc_condition", {
  expect_identical(cc_condition(1, oxford = FALSE, bracket = "", ellipsis  = 100, condition = "or"), "1")
  expect_identical(cc_condition(1:2, oxford = FALSE, bracket = "", ellipsis  = 100,  condition = "or"), "1 or 2")
  expect_identical(cc_condition(1:3, oxford = FALSE, bracket = "", ellipsis  = 100,  condition = "or"), "1, 2 or 3")
  expect_identical(cc_condition(1:3, oxford = TRUE, bracket = "", ellipsis  = 100,  condition = "or"), "1, 2, or 3")
  expect_identical(cc_condition(1:3, oxford = TRUE, bracket = "'", ellipsis  = 100,  condition = "or"), "'1', '2', or '3'")
  expect_identical(cc_condition(1:5, oxford = TRUE, bracket = "'", ellipsis  = 5,  condition = "or"), "'1', '2', ..., '4', or '5'")
  expect_error(cc_condition(1:4, ellipsis  = 4,  condition = "or"), "ellipsis must be a count greater than 4")
})

test_that("cc_or", {
  expect_identical(cc_or(1,2:4,5, oxford = TRUE, ellipsis = 5, bracket = "'"), "'1', '2', ..., '4', or '5'")
})

test_that("cc_and", {
  expect_identical(cc_and(1,2:4,5:6, ellipsis = 5,  bracket = "'"), "'1', '2', ..., '5' and '6'")
})
