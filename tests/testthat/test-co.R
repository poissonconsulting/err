test_that("co_sub", {
  expect_identical(co_sub("%c | %n %o%s", 0:1, "obj", bracket = "'"), "'0', '1' | 2 objs")
  expect_identical(co_sub("%c | %n %o%s", 2, "obj"), "2 | 1 obj")
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

test_that("co.data.frame", {
  expect_identical(co(datasets::mtcars), "datasets::mtcars has 11 columns\nmpg: 21, 21, 22.8, 21.4, 18.7, 18.1, 14.3, 24.4, ..., 21.4\ncyl: 6, 6, 4, 6, 8, 6, 8, 4, ..., 4\ndisp: 160, 160, 108, 258, 360, 225, 360, 146.7, ..., 121\nhp: 110, 110, 93, 110, 175, 105, 245, 62, ..., 109\ndrat: 3.9, 3.9, 3.85, 3.08, 3.15, 2.76, 3.21, 3.69, ..., 4.11\nwt: 2.62, 2.875, 2.32, 3.215, 3.44, 3.46, 3.57, 3.19, ..., 2.78\nqsec: 16.46, 17.02, 18.61, 19.44, 17.02, 20.22, 15.84, 20, ..., 18.6\nvs: 0, 0, 1, 1, 0, 1, 0, 1, ..., 1\n...\ncarb: 4, 4, 1, 1, 2, 1, 4, 2, ..., 2")
})

test_that("co or", {
  expect_identical(co(1:3, "the %n things: %c", conjunction = "or"), "the 3 things: 1, 2 or 3")
  expect_identical(co(factor(1:3), "the %n things: %c", oxford = TRUE, conjunction = "or"), "the 3 things: '1', '2', or '3'")
  expect_identical(co(1:3, "the %n things: %c of %o", bracket = "'", conjunction = "or"), "the 3 things: '1', '2' or '3' of 1:3")
})

test_that("co and", {
  expect_identical(co(1:3, "the %n things: %c", conjunction = "and"), "the 3 things: 1, 2 and 3")
  expect_identical(co(1:3, "the %n things: %c", oxford = TRUE, conjunction = "and"), "the 3 things: 1, 2, and 3")
})
