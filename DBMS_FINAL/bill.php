
<?php
session_start();
function generate_bill()
{
    include('database-connect.php');
    $pid = $_SESSION['pid'];
    $id = $_GET['ID'];
    $output = '';
    //$query = mysqli_query($con, "select p.pid,p.ID,p.fname,p.lname,p.doctor,p.appdate,p.apptime,p.disease,p.allergy,p.prescription,a.docFees from prestb p inner join appointmenttb a on p.ID=a.ID and p.pid = '$pid' and p.ID = '" . $_GET['ID'] . "'");
    
    $q = "select p.pid,p.ID,pa.fname,pa.lname,p.doctor,a.appdate,a.apptime,p.disease,p.allergy,p.prescription,d.docFees 
    from prestb p inner join appointmenttb a 
    on p.ID=a.ID and p.pid = '$pid' and p.ID = '$id'
    join patreg pa on pa.pid=p.pid join doctb d on d.username=p.doctor ;
    ";

    $query = mysqli_query($con, $q);
    
    while ($row = mysqli_fetch_array($query)) {
        $output = '
    <div style="border:1px solid black; padding:10px; width:fit-content">
    <label> Patient ID : </label>' . $row["pid"] . '<br/><br/>
    <label> Appointment ID : </label>' . $row["ID"] . '<br/><br/>
    <label> Patient Name : </label>' . $row["fname"] . ' ' . $row["lname"] . '<br/><br/>
    <label> Doctor Name : </label>' . $row["doctor"] . '<br/><br/>
    <label> Appointment Date : </label>' . $row["appdate"] . '<br/><br/>
    <label> Appointment Time : </label>' . $row["apptime"] . '<br/><br/>
    <label> Disease : </label>' . $row["disease"] . '<br/><br/>
    <label> Allergies : </label>' . $row["allergy"] . '<br/><br/>
    <label> Prescription : </label>' . $row["prescription"] . '<br/><br/>
    <label> Fees Paid : </label>' . $row["docFees"] . '<br/>
    <div>
    ';
    }

    return $output;
}


//include('admin-panel.php');
echo generate_bill();
?>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill</title>
</head>

<body>

</body>

</html>