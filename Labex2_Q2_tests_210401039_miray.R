library(testthat)

current_dir <- getwd()
print(current_dir)
relative_path <- file.path(current_dir, "Labex2_Q1_210401039_miraymutlu.R")

source(relative_path)


# Test 2.1
test_that("Global Workspace'de spotify_search_artist adlı bir değişken olmalı.", {
  expect_true(exists("spotify_search_artist"))
})


