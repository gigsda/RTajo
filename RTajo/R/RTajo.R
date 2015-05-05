.rtajoEnv <- new.env()
rtajo.init <- function(tajo_home='/usr/lib/tajo/', tajo_jdbc_driver_file ='/usr/lib/tajo/share/jdbc-dist/tajo-jdbc.jar') {

  libspath <- paste(tajo_home,'/lib/',sep ='')
      
  if(file.exists(libspath) == TRUE) {
    cp <- list.files(libspath, full.names=TRUE, pattern='jar$', recursive=FALSE)
    if (length(cp) == 0) {
      print('Error: Tajo Class library does not exist.\n')  
      return
    }
  } else {
    print('Error: Tajo Classpath does not exist.\n')
    return
  }
  
  if(file.exists(tajo_jdbc_driver_file) == FALSE) {
    print('Error: Tajo JDBC Driver does not exist.\n')
    return 
  }
  
  assign('classpath', cp, envir =.rtajoEnv )
  .jinit(classpath=cp)
    
  drv <- JDBC('org.apache.tajo.jdbc.TajoDriver', tajo_jdbc_driver_file)
  assign('driver', drv, envir =.rtajoEnv )
  drv
}

rtajo.connect <- function(IP='localhost',port='26002') {
  drv <- get('driver',envir =.rtajoEnv )
  conn <- dbConnect(drv, paste('jdbc:tajo://', IP, ':', port, sep=''))
  drv <- assign('connector', conn, envir =.rtajoEnv )
  conn
}

rtajo.close <- function() {
  conn <- get('connector',envir =.rtajoEnv )
  conn.close()
  conn
}

rtajo.query <- function(query) {
  conn <- get('connector',envir =.rtajoEnv )  
  dbGetQuery(conn, query)
}

rtajo.showtables <- function() {
  conn <- get('connector',envir =.rtajoEnv )  
  dbListTables(conn)
}