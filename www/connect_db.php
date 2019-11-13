<?php

error_reporting (E_ALL ^ E_NOTICE ^ E_WARNING);
$con=@mysqli_connect('db','user','test','myDb')or die("cannot connect to server");
?>