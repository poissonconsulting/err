context("cc-conjunction")

test_that("cc_or", {
  expect_identical(cc_and(1), "'1'")
  expect_identical(cc_and(1:2), "'1' and '2'")
  expect_identical(cc_and(1:3), "'1', '2' and '3'")
  expect_identical(cc_and(1:10, bracket = "''"), "''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ... and ''10''")
})

test_that("cc_or", {
  expect_identical(cc_or(1), "'1'")
  expect_identical(cc_or(1:2), "'1' or '2'")
  expect_identical(cc_or(1:3), "'1', '2' or '3'")
  expect_identical(cc_or(1:10, bracket = "''"), "''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ... or ''10''")
})
