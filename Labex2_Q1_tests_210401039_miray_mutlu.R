#Test 1.1) 
library(testthat)

testthat::test_that("Global Workspace'te spotify_token adlı değişken olmalı", {
  expect_true(exists("spotify_token", envir = .GlobalEnv))
})
#Test 1.2) 
testthat::test_that("spotify_token adl değişkenin tipi 'function' olmalı", {
  expect_true(is.function(spotify_token))
})

#Test 1.3)
testthat::test_that("spotify_token() ??a??r??ld??????nda d??nd??rd?????? ????kt?? bir liste olmal??", {
  result <- spotify_token()
  expect_true(is.list(result))
})