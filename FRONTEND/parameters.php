<!DOCTYPE html>
<html>
<head>
<style>
#header {
    background-color: #FAEBD7;
    color:black;
    text-align:center;
    padding:40px;
}
#nav 
{
    line-height:30px;
    background-color: #FFF0F5;
    height:770px;
    width:300px;
    float:left;
    padding:5px;	      
}
a
{
    color:red;
}
#footer
{
    background-color: #7B68EE;
    clear:both;
    text-align:center;
   padding:10px;	 	 
}
</style>
</head>
<body>

<div id="header">
<h1><font size="8">TCP Evaluation in Semi-Live Streams</font></h1>
</div>

<div id="nav">
<p><font size="5"><a href="RTT.php">RTT</font></a></p>
<p><font size="5"><a href="">Socket set up time</font></a></p>
<p><font size="5"><a href="">Data rate per stream</font></a></p>
<p><font size="5"><a href="">Statistics</font></a></p>
<p><font size="5"><a href="Threshold.php">Threshold</font></a></p>

</div>
<div id="footer">
</div>

</body>
</html>
 

<?php
$path = dirname(__FILE__);

$path1 = explode("/",$path,-1);
$path1[count($path1)+1]='db.conf';
$finalpath = implode("/",$path1);

$handle = fopen($finalpath, "r");
while (!feof($handle)) {
   $line = fgets($handle);

  $data = explode("'",$line);

    if($data[0]=='host=>')
    {
      $host= $data[1];
    }
    elseif($data[0]=='port=>')
    {
     $port= $data[1];
    }
    elseif($data[0]=='username=>')
    {
     $username= $data[1];
    }
    elseif($data[0]=='password=>')
    {
     $password= $data[1];
    }
    elseif($data[0]=='database=>')
    {
     $database= $data[1];
    }
 }

$dbhandle = mysql_connect($hostname, $username, $password) 
 or die("Unable to connect to MySQL");
echo "Connected to MySQL<br>";

//select a database to work with
$selected = mysql_select_db("ENIGMA",$dbhandle) 
  or die("Could not select databse");

//execute the SQL query and return records
$result = mysql_query("SELECT * FROM customers");

//fetch tha data from the database 
while ($row = mysql_fetch_array($result)) {
   echo "ID:".$row{'customer_id'}." Name:".$row{'revanth'}."Year: ". //display the results
   $row{'tv'}."<br>";
}
//close the connectionx
mysql_close($dbhandle);
?>
 
</body>
</html>
