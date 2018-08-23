context("cc")

test_that("cc", {
  expect_identical(cc(1), "1")
  expect_identical(cc(1:2), "1, 2")
  expect_identical(cc(1:3), "1, 2, 3")
  expect_identical(cc(1,2,3), "1, 2, 3")
  expect_identical(cc(1,2:3,5), "1, 2, 3, 5")
  expect_identical(cc(1,2:3,5, bracket = "'"), "'1', '2', '3', '5'")
})

test_that("cc_condition", {
  expect_identical(cc_condition(1, oxford = FALSE, bracket = "", condition = "or"), "1")
  expect_identical(cc_condition(1:2, oxford = FALSE, bracket = "", condition = "or"), "1 or 2")
  expect_identical(cc_condition(1:3, oxford = FALSE, bracket = "", condition = "or"), "1, 2 or 3")
  expect_identical(cc_condition(1:3, oxford = TRUE, bracket = "", condition = "or"), "1, 2, or 3")
  expect_identical(cc_condition(1:3, oxford = TRUE, bracket = "'", condition = "or"), "'1', '2', or '3'")
})

test_that("cc_or", {
  expect_identical(cc_or(1,2:3,5, oxford = TRUE, bracket = "'"), "'1', '2', '3', or '5'")
})

test_that("cc_and", {
  expect_identical(cc_and(1,2:3,5, oxford = TRUE, bracket = "'"), "'1', '2', '3', and '5'")
})
