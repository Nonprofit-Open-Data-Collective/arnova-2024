get_table <- function( table.name, year ){

  root <- "https://nccs-efile.s3.us-east-1.amazonaws.com/parsed/"
  url <- paste0( root, table.name, "-", year, ".csv" )
  
  df <- data.table::fread( url, colClasses=c( "ObjectId"="character" )  )
  df$EIN2 <- format_ein( df$ORG_EIN )
  
  return( df )
}


get_partvii <- function( year ){

  root <- "https://nccs-efile.s3.us-east-1.amazonaws.com/parsed/partvii/PARTVII-"
  url <- paste0( root, year, ".csv" )
  
  df <- data.table::fread( url, colClasses=c( "ObjectId"="character" )  )
  df$EIN2 <- format_ein( df$ORG_EIN )
  
  return( df )
}


get_bmf <- function( inactive=TRUE ){
  url <- "https://nccsdata.s3.us-east-1.amazonaws.com/harmonized/bmf/unified/BMF_UNIFIED_ACTIVE_ORGS_V1.1.csv"
  bmf <- data.table::fread( url )
  
  if( inactive ){
    url2 <- "https://nccsdata.s3.us-east-1.amazonaws.com/harmonized/bmf/unified/BMF_UNIFIED_INACTIVE_ORGS_V1.1.csv"
    bmf2 <- data.table::fread( url2 )
    bmf <- dplyr::bind_rows( bmf, bmf2 ) }
    
  return( bmf )
}

format_ein <- function( x, to="id" ) {

    if( to == "id" ){   
      x <- stringr::str_pad( x, 9, side="left", pad="0" )
      sub1 <- substr( x, 1, 2 )
      sub2 <- substr( x, 3, 9 )
      ein  <- paste0( "EIN-", sub1, "-", sub2 ) 
      return(ein) }
      
    if( to == "n" ){  
      x <- gsub( "[^0-9]", "", x )
      return( x ) }
      
}
