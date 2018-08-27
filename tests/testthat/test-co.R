context("co")

test_that("co_sub", {
  expect_identical(co_sub("%c | %n %o%s", 0:1, "obj"), "'0', '1' | 2 objs")
  expect_identical(co_sub("%c | %n %o%s", 2, "obj", bracket = ""), "2 | 1 obj")
  expect_identical(co_sub("%c | %n %o%s", character(0), "obj"), " | 0 objs")
})

test_that("co", {
  expect_identical(co(1, "1", "2", "3", "4"), "1")
  expect_identical(co(1:2, "1", "2", "3", "4"), "2")
  expect_identical(co(character(0), "1", "2", "3", "4"), "3")
  expect_identical(co(1:10, "1", "2", "3", "4"), "4")
  expect_identical(co(1:9, "1", "2", "3", "4"), "2")
  
  expect_identical(co(1:3, "the %n things: %c", bracket = "'"), "the 3 things: '1', '2', '3'")
})

test_that("co_or", {
  expect_identical(co_or(1:3, "the %n things: %c"), "the 3 things: '1', '2' or '3'")
  expect_identical(co_or(1:3, "the %n things: %c", oxford = TRUE), "the 3 things: '1', '2', or '3'")
})

test_that("co_and", {
  expect_identical(co_and(1:3, "the %n things: %c"), "the 3 things: '1', '2' and '3'")
  expect_identical(co_and(1:3, "the %n things: %c", bracket = "", oxford = TRUE), "the 3 things: 1, 2, and 3")
})
