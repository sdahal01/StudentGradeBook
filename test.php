<?php

define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'cpsc431');
define('DB_PASSWORD', 'cpsc431');
define('DB_NAME', 'cpsc431');

	$Course_Num = "";
	$Section_Num = "";
	$Student_Cwid = "";
	$Grade= "";
$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
// connect to mysql database


// get values from the form
function getPosts()
{
    $posts = array();
    $posts[0] = $_POST['Course_Num'];
    $posts[1] = $_POST['Section_Num'];
    $posts[2] = $_POST['Student_Cwid'];
    $posts[3] = $_POST['Grade'];
    return $posts;
}

// Search

if(isset($_POST['search']))
{
    $data = getPosts();
    
    $search_Query = "SELECT * FROM records WHERE Course_Num = $data[0]";
    
    $search_Result = mysqli_query($link, $search_Query);
    
    if($search_Result)
    {
        if(mysqli_num_rows($search_Result))
        {
            while($row = mysqli_fetch_array($search_Result))
            {
               
				echo "CorseNum: " . $row["Course_Num"].
				" SectionNum: ".$row["Section_Num"]." StudentCwid: ".
				$row["Student_Cwid"]. " Grade: ". $row["Grade"]."<br>";
            }
        }else{
            echo "No Data For This Id";
        }
    }else{
        echo "Result Error";
    }
}


// Insert
if(isset($_POST['insert']))
{
    $data = getPosts();
    $insert_Query = "INSERT INTO records(Course_Num,Section_Num, Student_Cwid, Grade) VALUES ('$data[0]',
	'$data[1]','$data[2]',
	'$data[3]')";
    
        $insert_Result = mysqli_query($link, $insert_Query);
        
        if($insert_Result)
        {
            if(mysqli_affected_rows($link) > 0)
            {
                echo "Data Inserted Successfully";
            }
			else
				{
					echo "Data was not inserted, please try again.";
				}
        }
     else {
        echo "Error Insert ";
    }
}

// Delete
if(isset($_POST['delete']))
{
    $data = getPosts();
    $delete_Query = "DELETE FROM records WHERE Student_Cwid = $data[2]";
    
        $delete_Result = mysqli_query($link, $delete_Query);
        
        if($delete_Result)
        {
            if(mysqli_affected_rows($link) > 0)
            {
                echo "Data Deleted Successfully";
            }
			else{
				echo "Data could not be deleted, try again";
			}
        }
     else {
        echo "Error Delete ";
    }
}

// Edit
if(isset($_POST['update']))
{
    $data = getPosts();
    $update_Query = "UPDATE records SET Grade='$data[3]'
	WHERE Section_Num = $data[1]";
    
        $update_Result = mysqli_query($link, $update_Query);
        
        if($update_Result)
        {
            if(mysqli_affected_rows($link) > 0)
            {
                echo "Data Updated Successfully";
            }else{
                echo "Data could not be updated, please try again.";
            }
        }
     else {
        echo "Error Update ";
    }
}
?>
<!DOCTYPE Html>
<html>
    <head>
	<?php include 'header.php';	?>
	<meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        body{ font: 14px "Arial"; }
        .wrapper{ width: 350px; padding: 20px; }
    </style>
        <title>PHP INSERT UPDATE DELETE SEARCH</title>
		<p> To Search for student grade please enter the Course Number.<p>
		<p> To Insert data please enter all the fields and press on insert.<p>
		<p> To Update please enter the Section Num and the Grade you would like to update.<p>
		<p> To Delete plese enter the Student Cwid that you would like to delete.<p>
    </head>
    <body>
        <form action="test.php" method="post">
            <input type="number" name="Course_Num" class="form-control" placeholder="Course Number" value="<?php echo $Course_Num;?>"><br><br>
            <input type="number" name="Section_Num" class="form-control" placeholder="Section Number" value="<?php echo $Section_Num;?>"><br><br>
            <input type="number" name="Student_Cwid" class="form-control" placeholder="Student Cwid" value="<?php echo $Student_Cwid;?>"><br><br>
            <input type="text" name="Grade" class="form-control" placeholder="Grade" value="<?php echo $Grade;?>"><br><br>
            <div>
                <!-- Input For Find Values With The given ID -->
                <input type="submit" class = "btn btn-success" name="search" value="Search">
				
				<!-- Input For Add Values To Database-->
                <input type="submit" class = "btn btn-success" name="insert" value="Insert">
                
                <!-- Input For Edit Values -->
                <input type="submit" class = "btn btn-success" name="update" value="Update">
                
                <!-- Input For Clear Values -->
                <input type="submit" class = "btn btn-success" name="delete" value="Delete">
                
                
            </div>
			
			<p>
	
				<a href="logout.php" class="btn btn-danger">Log Out</a>
			</p>
        </form>
		<?php include 'footer.php';	?>
    </body>
</html>

