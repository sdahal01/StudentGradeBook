<?php
// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
<?php include 'header.php';	?>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        body{ font: 14px Arial; text-align: center; }
		        
    </style>
</head>
<body>
    <div class="page-header">
        <h1>Hello, <b><?php echo htmlspecialchars($_SESSION["username"]); ?></b>. Welcome to my site.</h1>
		<p> </p>
		<p> </p>
		<p> </p>
		<p> </p>
		<p> To Log Out press Log Out </p>
    </div>
    <p>
		<a href="test.php" class="btn btn-info">Select, Insert, Update, Delete, Data</a>
        <a href="logout.php" class="btn btn-danger">Log Out</a>
    </p>
	<?php include 'footer.php';	?>
</body>
</html>