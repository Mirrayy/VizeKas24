#Test 1.1) 
library(testthat)

testthat::test_that("Global Workspace'te spotify_token adlı değişken olmalı", {
  expect_true(exists("spotify_token", envir = .GlobalEnv))
})


