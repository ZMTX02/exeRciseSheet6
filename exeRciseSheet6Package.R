# Verzeichnisstruktur erstellen
dir.create("myPackage")
dir.create("myPackage/R")
dir.create("myPackage/man")
dir.create("myPackage/tests")
dir.create("myPackage/vignettes")

install.packages("devtools")
install.packages("remotes")

# DESCRIPTION Datei erstellen
desc <- "
Package: myPackage
Type: Package
Title: A Sample R Package
Version: 0.1.0
Author: Your Name <your.email@example.com>
Maintainer: Your Name <your.email@example.com>
Description: This is a sample R package created for Exercise 6.
License: GPL-3
Imports: 
    dplyr
"
writeLines(desc, "myPackage/DESCRIPTION")

# NAMESPACE Datei erstellen
namespace <- "
export(hello_world)
export(sum_numbers)
"
writeLines(namespace, "myPackage/NAMESPACE")

# hello_world Funktion erstellen
hello_world <- "
#' Print Hello World
#'
#' This function prints 'Hello, world!'.
#' 
#' @examples
#' hello_world()
#' @export
hello_world <- function() {
  print('Hello, world!')
}
"
writeLines(hello_world, "myPackage/R/hello_world.R")

# sum_numbers Funktion erstellen
sum_numbers <- "
#' Sum Two Numbers
#'
#' This function returns the sum of two numbers.
#' 
#' @param a A numeric value.
#' @param b A numeric value.
#' @examples
#' sum_numbers(3, 5)
#' @export
sum_numbers <- function(a, b) {
  return(a + b)
}
"
writeLines(sum_numbers, "myPackage/R/sum_numbers.R")

# Tests für Funktionen erstellen
test_hello_world <- "
test_that('hello_world works', {
  expect_output(hello_world(), 'Hello, world!')
})
"
writeLines(test_hello_world, "myPackage/tests/test_hello_world.R")

test_sum_numbers <- "
test_that('sum_numbers works', {
  expect_equal(sum_numbers(3, 5), 8)
  expect_equal(sum_numbers(-3, 5), 2)
})
"
writeLines(test_sum_numbers, "myPackage/tests/test_sum_numbers.R")

# devtools verwenden um die Dokumentation zu erstellen
devtools::document(pkg = "myPackage")

# Paket installieren und testen
devtools::install(pkg = "myPackage")

remotes::install_github("ZMTX02/exeRciseSheet6/exeRciseSheet6Package")


