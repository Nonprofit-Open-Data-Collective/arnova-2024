# arnova-2024

Demo scripts for data workshop at ARNOVA Conference 2024

![image](https://github.com/user-attachments/assets/1065788a-abe6-47c1-90ee-4e9764f283e1)


```r
nodc <- "https://raw.githubusercontent.com/Nonprofit-Open-Data-Collective/"
repo <- "arnova-2024/refs/heads/main/"
file <- "functions.R"
source( paste0( nodc, repo, file ) )

hd.2016 <- get_table( "F9-P00-T00-HEADER", year=2016 )
p1.2016 <- get_table( "F9-P01-T00-SUMMARY", year=2016 )
bmf <- get_bmf()

df <- merge( hd.2016, p1.2016, by="URL", all=TRUE )
df <- merge( df, bmf, by="EIN2" )
```
