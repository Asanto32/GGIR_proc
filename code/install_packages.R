install.packages("pak")
install.packages("matlab", repos="http://cran.us.r-project.org")
install.packages("read.gt3x")
pak::pkg_install("GGIR")
list = installed.packages();
list[4]
match("GGIR", list)
