<?php
// $conn = new mysqli("db","user","test","myDb");
$conn = new mysqli("db","user","test","myDb");
if(isset($_POST['submit'])){
	$username=$_POST['username'];
	$password=$_POST['password'];
	$position=$_POST['position'];
	switch($position){

		case 'Admin':
		$sql = "SELECT admin_id, username FROM admin WHERE username='$username' AND password='$password'";
		$result = $conn->query($sql);
		$row=mysqli_fetch_array($result);
		if($row>0){
			session_start();
			$_SESSION['admin_id']=$row[0];
			$_SESSION['username']=$row[1];
			header("location:http://".$_SERVER['HTTP_HOST'].dirname($_SERVER['PHP_SELF'])."/admin.php");
		}else{
			$message="<font color=red><br><center>Invalid login Try Again</center></font>";
		}
		break;

		case 'Pharmacist':

		$sql = "SELECT pharmacist_id, first_name,last_name,staff_id,username FROM pharmacist WHERE username='$username' AND password='$password'";
		$result = $conn->query($sql);
		$row=mysqli_fetch_array($result);

		if($row>0){
			session_start();
			$_SESSION['pharmacist_id']=$row[0];
			$_SESSION['first_name']=$row[1];
			$_SESSION['last_name']=$row[2];
			$_SESSION['staff_id']=$row[3];
			$_SESSION['username']=$row[4];
			header("location:http://".$_SERVER['HTTP_HOST'].dirname($_SERVER['PHP_SELF'])."/pharmacist.php");
		}else{
			$message="<font color=red><br><center>Invalid login Try Again</center></font>";
		}
		break;

		case 'Cashier':
		$sql = "SELECT cashier_id, first_name,last_name,staff_id,username FROM cashier WHERE username='$username' AND password='$password'";
		$result = $conn->query($sql);
		$row=mysqli_fetch_array($result);
		if($row>0){
			session_start();
			$_SESSION['cashier_id']=$row[0];
			$_SESSION['first_name']=$row[1];
			$_SESSION['last_name']=$row[2];
			$_SESSION['staff_id']=$row[3];
			$_SESSION['username']=$row[4];
			header("location:http://".$_SERVER['HTTP_HOST'].dirname($_SERVER['PHP_SELF'])."/cashier.php");
		}else{
			$message="<font color=red><br><center>Invalid login Try Again</center></font>";
		}
		break;

		case 'Manager':
		$sql = "SELECT manager_id, first_name,last_name,staff_id,username FROM manager WHERE username='$username' AND password='$password'";
		$result = $conn->query($sql);
		$row=mysqli_fetch_array($result);
		if($row>0){
			session_start();
			$_SESSION['manager_id']=$row[0];
			$_SESSION['first_name']=$row[1];
			$_SESSION['last_name']=$row[2];
			$_SESSION['staff_id']=$row[3];
			$_SESSION['username']=$row[4];
			header("location:http://".$_SERVER['HTTP_HOST'].dirname($_SERVER['PHP_SELF'])."/manager.php");
		}else{
			$message="<font color=red><br><center>Invalid login Try Again</center></font>";
		}
		break;
	}}
	echo <<<LOGIN
	<!DOCTYPE html>
	<html>
	<head>
	<title>IITP MSMS</title>
	<link rel="stylesheet" type="text/css" href="style/ml.css">
	<style>
#content {
	height: auto;
}
#main{
height: auto;}

</style>

</head>
<body>

<div id="content">
<div id="header">

<h1 style="margin-left: 290px">IITP MSMS</h1>
</div>
<div id="main">

<section class="container">

<div class="login">
<img src="images/abcd.jpg" style="border-radius: 50%">
<!--<h1><center>Login here</center></h1>-->
<form method="post" action="index.php" align="center" >

<p><input type="text" name="username" value="" placeholder="Username" required></p>
<p><input type="password" name="password" value="" placeholder="Password" required></p>
<p><select name="position">
<option>--Select position--</option>
<option>Admin</option>
<option>Pharmacist</option>
<option>Cashier</option>
<option>Manager</option>
</select></p>
<p class="submit"><input type="submit" name="submit" value="Login"></p>
</form>
</div>
</section>
</div>
<div id="footer" align="Center"> </div>
</div>

</body>
</html>
LOGIN;

?>