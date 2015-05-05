# RTajo
RTajo provides both parallel interactive and batch processing capabilities connecting to the Tajo

## Build RTajo
````
$ sh build.sh
````

## Install RTajo
````
$ R CMD INSTALL RTajo_0.0.1.tar.gz 
````
## Usage
````
> library('RTajo')
> rtajo.init(tajo_home='/usr/lib/tajo/', tajo_jdbc_driver_file ='/usr/lib/tajo/share/jdbc-dist/tajo-jdbc.jar');
An object of class "JDBCDriver"
Slot "identifier.quote":
[1] NA

Slot "jdrv":
[1] "Java-Object{org.apache.tajo.jdbc.TajoDriver@4fd74bb1}"

> conn <- rtajo.connect(IP='localhost',port='26002');
> rtajo.showtables()
[1] "columns"       "databases"     "indexes"       "partitions"   
[5] "table1"        "table_options" "table_stats"   "tables"       
[9] "tablespace"   
> rtajo.query("select * from table1")
  id name score type
1  1  abc   1.1    a
2  2  def   2.3    b
3  3  ghi   3.4    c
4  4  jkl   4.5    d
5  5  mno   5.6   e1
6  2  def   2.3    b
7  3  ghi   3.4    c
8  4  jkl   4.5    d
9  5  mno   5.6    e
> 
`````
