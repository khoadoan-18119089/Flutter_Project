<!DOCTYPE html>
<html>
    <body>
    <?php
    $query = "SELECT 
        video.* 
        ,acount_chanel.img_chanel 
        ,acount_chanel.name_chanel 
    FROM `video` as video 
    LEFT JOIN `acount_chanel` as acount_chanel 
    ON video.ID_chanel = acount_chanel.ID";
    $getdata = new Getdata();
    $getdata-> processRequest($query,"video");
    ?>
    </body>
</html>