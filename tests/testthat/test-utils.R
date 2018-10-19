context("utils")

test_that("p", {
  expect_identical(p(character(0)), character(0))
  expect_identical(p("e"), "e")
  expect_identical(p("e", "1"), "e 1")
  expect_identical(p(c("e", "f"), "1"), c("e 1", "f 1"))
  expect_identical(p("e", "1", sep = "--"), "e--1")
  expect_identical(p("e", "1", sep = "--", collapse = "__"), "e--1")
  expect_identical(p(c("e", "f"), "1", sep = "--", collapse = "__"), "e--1__f--1")
})

test_that("p0", {
  expect_identical(p0(character(0)), character(0))
  expect_identical(p0("e"), "e")
  expect_identical(p0("e", "1"), "e1")
  expect_identical(p0(c("e", "f"), "1"), c("e1", "f1"))
  expect_identical(p0(c("e", "f"), "1", collapse = "__"), "e1__f1")
})