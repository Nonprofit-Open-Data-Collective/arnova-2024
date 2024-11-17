# arnova-2024

Demo scripts for data workshop at ARNOVA Conference 2024

### Packages

```r
devtools::install_github( "Nonprofit-Open-Data-Collective/peopleparser" )
devtools::install_github( 'nonprofit-open-data-collective/titleclassifier' )
# options( download.file.method = "wininet" )    # for windows
# options( download.file.method = "libcurl" )    # for all op systems
# devtools::install_github( 'nonprofit-open-data-collective/titleclassifier' )
```

### Demo Script

```r
library( dplyr )
library( data.table )
library( peopleparser )
library( titleclassifier )

nodc <- "https://raw.githubusercontent.com/Nonprofit-Open-Data-Collective/"
repo <- "arnova-2024/refs/heads/main/"
file <- "functions.R"
source( paste0( nodc, repo, file ) )

hd.2016 <- get_table( "F9-P00-T00-HEADER", year=2016 )
p1.2016 <- get_table( "F9-P01-T00-SUMMARY", year=2016 )
bmf <- get_bmf()

df <- merge( hd.2016, p1.2016, by="URL", all=TRUE )
df <- merge( df, bmf, by="EIN2", all.x=TRUE )
```

## For the URL to this repo: 

![image](https://github.com/user-attachments/assets/1065788a-abe6-47c1-90ee-4e9764f283e1)

## For the NCCS data catalog: 

![image](https://github.com/user-attachments/assets/d94c76e8-e0cf-4dad-a5db-81f71ca462e9)

