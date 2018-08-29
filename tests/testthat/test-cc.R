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
  expect_identical(cc_conjunction(1:5, oxford = TRUE, bracket = "'", ellipsis  = 5,  conjunction = "or"), "'1', '2', '3', ..., or '5'")
  expect_identical(cc_conjunction(1:4, ellipsis  = 1,  bracket = "", conjunction = "or", oxford = FALSE), "1, 2, ... or 4")
    expect_identical(cc_conjunction(1:3, ellipsis  = 1,  bracket = "", conjunction = "or", oxford = FALSE), "1, 2 or 3")
})

test_that("cc", {
  expect_identical(cc(c(1,2:4,5), conjunction = "or", oxford = TRUE, ellipsis = 5), "1, 2, 3, ..., or 5")
  expect_identical(cc(1:6, conjunction = "and", ellipsis = 5), "1, 2, 3, ... and 6")
  expect_identical(cc(as.character(1:6), conjunction = "and", ellipsis = 5), "'1', '2', '3', ... and '6'")
  expect_identical(cc(character(0), conjunction = "or"), "")
})

test_that("cc.data.frame", {
  expect_identical(cc(datasets::mtcars), "mpg: 21, 21, 22.8, 21.4, 18.7, 18.1, 14.3, 24.4, ..., 21.4\ncyl: 6, 6, 4, 6, 8, 6, 8, 4, ..., 4\ndisp: 160, 160, 108, 258, 360, 225, 360, 146.7, ..., 121\nhp: 110, 110, 93, 110, 175, 105, 245, 62, ..., 109\ndrat: 3.9, 3.9, 3.85, 3.08, 3.15, 2.76, 3.21, 3.69, ..., 4.11\nwt: 2.62, 2.875, 2.32, 3.215, 3.44, 3.46, 3.57, 3.19, ..., 2.78\nqsec: 16.46, 17.02, 18.61, 19.44, 17.02, 20.22, 15.84, 20, ..., 18.6\nvs: 0, 0, 1, 1, 0, 1, 0, 1, ..., 1\n...\ncarb: 4, 4, 1, 1, 2, 1, 4, 2, ..., 2")
  expect_identical(cc(datasets::mtcars, "and", ellipsis = 3), "mpg: 21, 21, ... and 21.4\ncyl: 6, 6, ... and 4\n... and carb: 4, 4, ... and 2")
  expect_identical(cc(data.frame()), "")
  expect_identical(cc(data.frame(x = 1)), "x: 1")
  expect_identical(cc(data.frame(x = 1, y = "2")), "x: 1\ny: '2'")
  expect_identical(cc(data.frame(x = 1:2, y = 2)), "x: 1, 2\ny: 2, 2")
})
