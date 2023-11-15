<!DOCTYPE html>
<html>
    <body>
    <?php
    include "connect.php";
    $ID = $_GET["ID"];

    $sql = "SELECT 
                video.* 
                ,acount_chanel.img_chanel 
                ,acount_chanel.name_chanel 
            FROM `video` as video 
            LEFT JOIN `acount_chanel` as acount_chanel 
            ON video.ID_chanel = acount_chanel.ID
            WHERE video.ID = $ID";

    $result = $conn->query($sql);
    $data = array();

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $data[]= array(
                "ID" => $row["ID"],
                "ID_chanel"=>$row["ID_chanel"],
                "thumbal_video"=>$row["thumbal_video"],
                "video"=>$row["video"],
                "name_video"=>$row["name_video"],
                "create_video"=>$row["create_video"],
                "img_chanel"=>$row["img_chanel"],
                "name_chanel"=>$row["name_chanel"],
            );
        }
    }else {
        $data= array(
            'msg' => 'No Data!', 
            'status' => false,
        );
    }
    echo json_encode(array("video"=> $data));
    $conn->close();
    ?>
    </body>
</html>