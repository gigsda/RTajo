library('RTajo')
rtajo.init(tajo_home='/usr/lib/tajo/', tajo_jdbc_driver_file ='/usr/lib/tajo/share/jdbc-dist/tajo-jdbc.jar');
conn <- rtajo.connect(IP='localhost',port='26002');

rtajo.showtables()
rtajo.query("select * from table1")
