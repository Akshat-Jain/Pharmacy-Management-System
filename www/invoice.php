<?php
$conn = new mysqli("db","user","test","myDb");
session_start();
$c_id=$_SESSION['custId'];
$cname=$_SESSION['custName'];
$age=$_SESSION['age'];
$sex=$_SESSION['sex'];
$postal=$_SESSION['postal_address'];
$phone=$_SESSION['phone'];
$quantity=$_SESSION['quantity'];
$user=$_SESSION['username'];
$invoiceNo=$_SESSION['invoice'];

$getPresid=mysqli_query($conn,"SELECT 1+MAX(prescription_id) FROM prescription");
$presId=mysqli_fetch_array($getPresid);
if($presId[0]=='')
	{$presIdd=999; }
else{$presIdd=$presId[0];}

$sqlP=mysqli_query($conn,"INSERT INTO prescription(prescription_id,customer_id,customer_name,age,sex,postal_address,invoice_id,phone)
	VALUES('{$presIdd}','{$c_id}','{$cname}','{$age}','{$sex}','{$postal}','{$invoiceNo}','{$phone}')  ");
$sqlI=mysqli_query($conn,"INSERT INTO invoice(invoice_id, customer_name,served_by,status)
	VALUES('{$invoiceNo}','{$cname}','{$user}','Pending') ");

$getDetails=mysqli_query($conn,"SELECT * FROM tempprescri WHERE customer_id='{$c_id}'");
while($item1=mysqli_fetch_array($getDetails))
{	
	$getDetails1=mysqli_query($conn,"SELECT stock_id, cost FROM stock WHERE drug_name='{$item1['drug_name']}'");	
	
	$details=mysqli_fetch_array($getDetails1);
	$sqlId=mysqli_query($conn,"INSERT INTO invoice_details(invoice,drug,cost,quantity)
		VALUES('{$invoiceNo}','{$details['stock_id']}','{$details['cost']}','{$item1['quantity']}')");
	$count[]=$details['cost']*$item1['quantity'];
}
$tot=array_sum($count);
$getDetails=mysqli_query($conn,"SELECT * FROM tempprescri WHERE customer_id='{$c_id}'");
while($item12=mysqli_fetch_array($getDetails))
{
	$getDetails12=mysqli_query($conn,"SELECT stock_id, cost FROM stock WHERE drug_name='{$item12['drug_name']}'");	
	
	$details2=mysqli_fetch_array($getDetails12);
	$sqlIp=mysqli_query($conn,"INSERT INTO prescription_details(pres_id,drug_name,strength,dose,quantity)
		VALUES('{$presIdd}','{$details2['stock_id']}','{$item12['strength']}','{$item12['dose']}','{$item12['quantity']}') ");	
	
}
$sqlD=mysqli_query($conn,"DELETE FROM tempprescri WHERE customer_id='{$c_id}' ");

unset($_SESSION['custId'], $_SESSION['custName'], $_SESSION['age'], $_SESSION['sex'], $_SESSION['postal_address'], $_SESSION['phone']);
echo "<SCRIPT type='text/javascript'>
window.location.replace('prescription.php');
</SCRIPT>";
exit;

?>