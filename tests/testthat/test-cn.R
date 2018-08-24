context("cn")

test_that("cn_string", {
  expect_identical(cn_string(1, "1", "2", "3", "4", 10), "1")
  expect_identical(cn_string(1:2, "1", "2", "3", "4", 10), "2")
  expect_identical(cn_string(character(0), "1", "2", "3", "4", 10), "3")
  expect_identical(cn_string(1:10, "1", "2", "3", "4", 10), "4")
  expect_identical(cn_string(1:9, "1", "2", "3", "4", 10), "2")
})

test_that("cn_sub", {
  expect_identical(cn_sub("%c | %n %o%s", cc, 0:1, "obj"), "0, 1 | 2 objs")
  expect_identical(cn_sub("%c | %n %o%s", cc, 2, "obj"), "2 | 1 obj")
  expect_identical(cn_sub("%c | %n %o%s", cc, character(0), "obj"), " | 0 objs")
})

test_that("cn", {
  expect_identical(cn(1, "1", "2", "3", "4", 10), "1")
  expect_identical(cn(1:2, "1", "2", "3", "4", 10), "2")
  expect_identical(cn(character(0), "1", "2", "3", "4", 10), "3")
  expect_identical(cn(1:10, "1", "2", "3", "4", 10), "4")
  expect_identical(cn(1:9, "1", "2", "3", "4", 10), "2")
  
  expect_identical(cn(1:3, "the %n things: %c"), "the 3 things: 1, 2, 3")
  expect_identical(cn(1:3, "the %n things: %c", bracket = "'"), "the 3 things: '1', '2', '3'")
})

test_that("cn_or", {
  expect_identical(cn_or(1:3, "the %n things: %c"), "the 3 things: 1, 2 or 3")
  expect_identical(cn_or(1:3, "the %n things: %c", oxford = TRUE), "the 3 things: 1, 2, or 3")
})

test_that("cn_and", {
  expect_identical(cn_and(1:3, "the %n things: %c"), "the 3 things: 1, 2 and 3")
  expect_identical(cn_and(1:3, "the %n things: %c", oxford = TRUE), "the 3 things: 1, 2, and 3")
})
