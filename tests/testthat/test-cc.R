context("cc")

test_that("cc_internal", {
  expect_identical(cc_internal(1, bracket = "'", ellipsis = 10), "'1'")
  expect_identical(cc_internal(1:2, bracket = "'", ellipsis = 10), "'1', '2'")
  expect_identical(cc_internal(1:3, bracket = "'", ellipsis = 10), "'1', '2', '3'")
  expect_identical(cc_internal(1:4, ellipsis = 4, bracket = ""), "1, 2, ..., 4")
  expect_identical(cc_internal(5:1, ellipsis = 4, bracket = "'"), "'5', '4', ..., '1'")
  expect_identical(cc_internal(c(1,2:3,4), ellipsis = 2, bracket = "'"), "'1', '2', ..., '4'")
  expect_identical(cc_internal(1:3, ellipsis = 1, bracket = "'"), "'1', '2', '3'")
})

test_that("cc_conjunction", {
  expect_identical(cc_conjunction(1, oxford = FALSE, bracket = "", ellipsis  = 100, conjunction = "or"), "1")
  expect_identical(cc_conjunction(1:2, oxford = FALSE, bracket = "", ellipsis  = 100,  conjunction = "or"), "1 or 2")
  expect_identical(cc_conjunction(1:3, oxford = FALSE, bracket = "", ellipsis  = 100,  conjunction = "or"), "1, 2 or 3")
  expect_identical(cc_conjunction(1:3, oxford = TRUE, bracket = "", ellipsis  = 100,  conjunction = "or"), "1, 2, or 3")
  expect_identical(cc_conjunction(1:3, oxford = TRUE, bracket = "'", ellipsis  = 100,  conjunction = "or"), "'1', '2', or '3'")
  expect_identical(cc_conjunction(1:5, oxford = TRUE, bracket = "'", ellipsis  = 5,  conjunction = "or"), "'1', '2', ..., '4', or '5'")
  expect_identical(cc_conjunction(1:4, ellipsis  = 1,  bracket = "", conjunction = "or", oxford = FALSE), "1, 2, 3 or 4")
})

test_that("cc", {
  expect_identical(cc(c(1,2:4,5), conjunction = "or", oxford = TRUE, ellipsis = 5), "'1', '2', ..., '4', or '5'")
  expect_identical(cc(1:6, conjunction = "and", ellipsis = 5,  bracket = ""), "1, 2, ..., 5 and 6")
  expect_identical(cc(character(0), conjunction = "or"), "")
  expect_identical(cc(datasets::mtcars), "'mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', ..., 'carb'")
})

test_that("cc_or", {
  expect_identical(cc_or(c(1,2:4,5), oxford = TRUE, ellipsis = 5), "'1', '2', ..., '4', or '5'")
})

test_that("cc_and", {
  expect_identical(cc_and(c(1,2:4,5:6), ellipsis = 5,  bracket = ""), "1, 2, ..., 5 and 6")
})
