<?php
$conn = new mysqli("db","user","test","myDb");
session_start();
if(isset($_SESSION['username'])){
	$id=$_SESSION['admin_id'];
	$user=$_SESSION['username'];
}else{
	header("location:http://".$_SERVER['HTTP_HOST'].dirname($_SERVER['PHP_SELF'])."/index.php");
	exit();
}
$id=$_GET['pharmacist_id'];
$sql="delete from pharmacist where pharmacist_id='$id'";
if ($conn->query($sql) === TRUE) {
	echo "Pharmacist deleted successfully";
} else {
	echo "Error: " . $sql . "<br>" . $conn->error;
}
echo "<SCRIPT type='text/javascript'>
window.location.replace('admin_pharmacist.php');
</SCRIPT>";
?>


