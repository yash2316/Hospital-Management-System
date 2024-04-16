<?php
session_start();
include('database-connect.php');

/// admin Login 
if (isset($_POST['adsub'])) {
	$username = $_POST['username1'];
	$password = $_POST['password2'];
	$query = "select * from admintb where username='$username' and password='$password';";
	$result = mysqli_query($con, $query);
	if (mysqli_num_rows($result) == 1) {
		$_SESSION['username'] = $username;
		header("Location:admin-panel1.php");
	} else
		echo ("<script>alert('Invalid Username or Password. Try Again!');
          window.location.href = 'index.php';</script>");
}
