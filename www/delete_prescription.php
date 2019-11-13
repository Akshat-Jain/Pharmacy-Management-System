<?php
$conn = new mysqli("db","user","test","myDb");
session_start();
if(isset($_SESSION['username'])){
	$id=$_SESSION['pharmacist_id'];
	$user=$_SESSION['username'];
}else{
	header("location:http://".$_SERVER['HTTP_HOST'].dirname($_SERVER['PHP_SELF'])."/index.php");
	exit();
}
$id=$_GET['prescription_id'];
$sql="delete from prescription where prescription_id='$id'";
$sql2="delete from prescription_details where pres_id='$id'";
if ($conn->query($sql) === TRUE) {
	echo "Prescription deleted successfully";
} else {
	echo "Error: " . $sql . "<br>" . $conn->error;
}
if ($conn->query($sql2) === TRUE) {
	echo "Prescription deleted successfully";
} else {
	echo "Error: " . $sql2 . "<br>" . $conn->error;
}
echo "<SCRIPT type='text/javascript'>
window.location.replace('prescription.php');
</SCRIPT>";
?>


