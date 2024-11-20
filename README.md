# The Evolving Nonprofit Sector Data Infrastructure


Demo scripts for the data workshop at ARNOVA Conference 2024:

<a href="glass-cliff-workflow.html" class="btnStack"><b>WORKFLOW EXAMPLE</b></a>


---


### Nonprofit Data Packages

```r
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

### Demo Scripts

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


### This repo: 

![image](https://github.com/user-attachments/assets/1065788a-abe6-47c1-90ee-4e9764f283e1)




## NCCS data catalog: 

![image](https://github.com/user-attachments/assets/d94c76e8-e0cf-4dad-a5db-81f71ca462e9)






<style>
  .btnStack {
  background-color: steelblue;
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
