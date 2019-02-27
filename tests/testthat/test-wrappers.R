context("cc-conjunction")

test_that("cc_or", {
  expect_identical(cc_and(1), "1")
  expect_identical(cc_and(1:2), "1 and 2")
  expect_identical(cc_and(1:3), "1, 2 and 3")
  expect_identical(cc_and(1:10), "1, 2, 3, 4, 5, 6, 7, 8, ... and 10")
})

test_that("cc_or", {
  expect_identical(cc_or(1), "1")
  expect_identical(cc_or(1:2), "1 or 2")
  expect_identical(cc_or(1:3), "1, 2 or 3")
  expect_identical(cc_or(1:10), "1, 2, 3, 4, 5, 6, 7, 8, ... or 10")
})


test_that("co_and", {
  expect_identical(co_and(1:100), 
                   "1:100 has 100 values: 1, 2, 3, 4, 5, 6, 7, 8, ... and 100")
})

test_that("co_or", {
  expect_identical(co_or(100:1), 
                   "100:1 has 100 values: 100, 99, 98, 97, 96, 95, 94, 93, ... or 1")
})
