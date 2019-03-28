<?php
$con = mysqli_connect("localhost","root","","e_commerce");
    if(!$con){
        die("Couldn't connect: " . mysqli_error($con));
    }
    $query = "Select * from e_commerce";
    $result = mysqli_query($con,$query);
    // $n = 0;
    // $list = [];
    while($row = mysqli_fetch_array($result)){
        console.log($row);
        // $list[$n] = $row;
        // $n++;
    }
    // echo json_encode($list);
?>