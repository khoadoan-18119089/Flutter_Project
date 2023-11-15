<?php
    $servername = "localhost";
    $username = "id21256148_youtube";
    $password = "Youtube123@";
    $database = "id21256148_youtube";

    $conn= new mysqli($servername,$username,$password,$database);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    mysqli_set_charset($conn, 'UTF8');
    echo 'a';
?>