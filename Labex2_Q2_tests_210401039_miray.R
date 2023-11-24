library(testthat)

current_dir <- getwd()
print(current_dir)
relative_path <- file.path(current_dir, "Labex2_Q1_210401039_miray_mutlu.R")

source(relative_path)


# Test 2.1
test_that("Global Workspace'de spotify_search_artist adlı bir değişken olmalı.", {
  expect_true(exists("spotify_search_artist"))
})
# Test 2.2: spotify_search_artist adlı değişkenin tipi function olmalı.
test_that("spotify_search_artist adlı değişkenin tipi 'function' olmalı.", {
  expect_is(spotify_search_artist, "function")
})
# Test 2.3: spotify_search_artist() herhangi bir artist ismi ile bir liste olmalı.
test_that("spotify_search_artist() herhangi bir artist ismi ile bir liste olmalı.", {
  result <- spotify_search_artist("Random Artist")
  expect_is(result, "list")
})

# Test 2.4: spotify_search_artist()  listenin iki elementi olmalı
test_that("spotify_search_artist()  listenin iki elementi olmalı.", {
  result <- spotify_search_artist("Random Artist")
  expect_length(result, 2)
})
# Test 2.5
test_that("spotify_search_artist()  listenin ilk elementinin ismi status_code olmal.", {
  result <- spotify_search_artist("Random Artist")
  expect_named(result, c("status_code", "search_results"))
})