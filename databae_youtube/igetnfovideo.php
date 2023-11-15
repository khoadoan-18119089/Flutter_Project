<?php
// Bạn cần tải xuống và bao gồm thư viện getID3
require_once('getid3/getid3.php');

// Khởi tạo đối tượng getID3
$getID3 = new getID3;

// URL của video bạn muốn phân tích
$video_url = 'https://res.cloudinary.com/dpuotvqb5/video/upload/video/mvI89TLSuBo.mp4';

// Tải video về máy chủ tạm thời
$temp_video_path = tempnam(sys_get_temp_dir(), 'getID3');
file_put_contents($temp_video_path, file_get_contents($video_url));

// Phân tích video
$file_info = $getID3->analyze($temp_video_path);

// In ra thời lượng video
echo "Duration: " . $file_info['playtime_string'];

// Xóa video tạm thời
unlink($temp_video_path);
?>