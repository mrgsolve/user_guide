library(spelling)

path <- c(
  "index.Rmd", 
  "components.Rmd",
  "topics.Rmd", 
  "sequence.Rmd", 
  "install.Rmd", 
  "output.Rmd", 
  "datasets.Rmd", 
  "install.Rmd"
  
)

path <- list.files(pattern = "\\.Rmd$")

ignore <- readLines("WORDLIST")

spell_check_files(path,ignore)
