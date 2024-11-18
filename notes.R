# df.list <- list()
# df.list[[ "2009" ]] <- get_table( "F9-P01-T00-SUMMARY", year=2009 ) 
# df.list[[ "2010" ]] <- get_table( "F9-P01-T00-SUMMARY", year=2010 ) 
# df.list[[ "2011" ]] <- get_table( "F9-P01-T00-SUMMARY", year=2011 ) 
# df <- dplyr::bind_rows( df.list )

get_panel <- function( table.name, years=2009:2019 ){
  df.list <- list()
  for( i in years )
  {
    df.list[[ "2009" ]] <- get_table( "F9-P01-T00-SUMMARY", year=2009 ) 
  }
  df <- dplyr::bind_rows( df.list )
  return( df )
}
