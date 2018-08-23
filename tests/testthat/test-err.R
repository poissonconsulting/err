context("err")

test_that("err", {
  expect_error(err(), "^$")
  expect_error(err(1,2), "^12$")
})

test_that("wrn", {
  expect_warning(wrn(), "^$")
  expect_warning(wrn(1,2), "^12$")
})

test_that("msg", {
  expect_message(msg(), "^\n$")
  expect_message(msg(1,2), "^12\n$")
})
