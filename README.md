# The Evolving Nonprofit Sector Data Infrastructure


A demonstration of reproducible workflows with nonprofit data for the ARNOVA Conference 2024.


---


### Nonprofit Data Packages

```r
install.packages( "devtools" )
devtools::install_github( "Nonprofit-Open-Data-Collective/peopleparser" )
devtools::install_github( 'nonprofit-open-data-collective/titleclassifier' )
devtools::install_github( 'nonprofit-open-data-collective/fiscal')
devtools::install_github( 'nonprofit-open-data-collective/irs990efile')
```

If you are having problems downloading packages try: 

```
# options( download.file.method = "wininet" )    # for windows
# options( download.file.method = "libcurl" )    # for all op systems
```

- [NODC on GitHub](https://github.com/Nonprofit-Open-Data-Collective)
- [List of Nonprofit Packages](https://nonprofit-open-data-collective.github.io/tools/)


### R Packages

```r
package.list <- 
  c( "tidyverse",
     "knitr", "pander",
     "ggrepel", "RecordLinkage",
     "data.table", "reshape2",)

install.packages( package.list )
```


### Workflow Demo

<a href="https://nonprofit-open-data-collective.github.io/arnova-2024/glass-cliff-workflow.html" class="btnStack"><b>WORKFLOW EXAMPLE</b></a>

1. Build tables using the irs990efile package.
1. Standardize names of the leadership team present in Part VII (the compensation tables) using the peopleparser package.
1. Standardize titles in Part VII using the titleclassifier package.
1. Identify CEO transition years within the data.
1. Build a financial dataset by combining the following 990 Parts: revenues, expenses, and assets.
1. Generate common financial operating ratios using the fiscal package.
1. Add NTEE codes and standardized address fields from the Unified BMF.
1. Merge financial tables and compensation tables into a single table for the analysis.


```r
# REPRODUCIBLE WORKFLOWS
library( dplyr )
library( data.table )

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

### NCCS CORE Panel Downloads: 

<a href="https://nccs-urban.shinyapps.io/sector-in-brief/" class="btnStack"><b>Sector in Brief Dashboard</b></a>



### This repo: 

![image](https://github.com/user-attachments/assets/1065788a-abe6-47c1-90ee-4e9764f283e1)




### NCCS data catalog: 

[ ![image](https://github.com/user-attachments/assets/d94c76e8-e0cf-4dad-a5db-81f71ca462e9) ](https://nccs.urban.org/nccs/datasets/)






<style>

.btnStack {
  background-color: #D4AF37;
  color: #000;
  text-decoration: none;
  display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 18px;
  font-weight: normal;
  line-height: 1.8;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  cursor: pointer;
  border: 1px solid transparent;
  border-radius: 4px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  -o-user-select: none;
  user-select: none;
}
a.btnStack:hover {
  background-color: #000;
  color: #fff;
}
</style>
