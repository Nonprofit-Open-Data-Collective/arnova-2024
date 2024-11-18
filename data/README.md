This folder contains the following files: 

- toy_df_1000.cvs: demo dataset with 1,000 nonprofits
- toy_df_10.csv: demo dataset with 10 nonprofits

```r
# DEMO NONPROFIT EINS 

EIN <- c(  "20240383", "30179298", "42104310",
           "42259692", "42592472", "42596491",
           "43266589", "43543134", "50258941", "60840436"  )
```

#### Efile Datasets

- [Efile Catalog](https://nccs.urban.org/nccs/catalogs/catalog-efile.html)
- [Data Dictionary](https://nonprofit-open-data-collective.github.io/irs990efile/data-dictionary/data-dictionary.html)

We will use the following tables: 

- F9-P00-T00-HEADER
- F9-P01-T00-SUMMARY
- partvii/PARTVII

```r
root <- "https://nccs-efile.s3.us-east-1.amazonaws.com/parsed/"
fn   <- "F9-P00-T00-HEADER-2020.csv"
d <- read.csv( paste0( root, fn ) )
```



#### Unified BMF 

- [DOWNLOAD FULL BMF](https://nccsdata.s3.amazonaws.com/harmonized/bmf/unified/BMF_UNIFIED_V1.1.csv) 
- [details](https://nccs.urban.org/nccs/datasets/bmf/) 

```r
gh   <- "https://raw.githubusercontent.com"
org  <- "/Nonprofit-Open-Data-Collective/"
repo <- "arnova-2024/refs/heads/main/data/"
fn   <- "bmf_unified_10.csv"
bmf <- read.csv( paste0( gh, org, repo, fn ) )
```

|ORG_NAME_CURRENT                          |EIN2           |NTEEV2     | ORG_RULING_YEAR|
|:-----------------------------------------|:--------------|:----------|---------------:|
|PORTSMOUTH HISTORICAL SOCIETY             |EIN-02-0240383 |ART-A82-RG |            1993|
|PRESIDENT & FELLOWS OF MIDDLEBURY COLLEGE |EIN-03-0179298 |UNI-B43-RG |            1944|
|CAPE COD ACADEMY INC                      |EIN-04-2592472 |EDU-B20-RG |            1977|
|RESOLVE OF THE BAY STATE INC              |EIN-04-3266589 |HEL-E60-RG |            2010|
|DOUG FLUTIE JR FOUNDATION FOR AUTISM INC  |EIN-04-3543134 |HEL-G84-RG |            2001|
|BETHANY HOME OF RHODE ISLAND              |EIN-05-0258941 |HEL-E32-RG |            1943|

