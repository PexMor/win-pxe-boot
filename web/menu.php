<?php
    $trg = "/rwdata/menu/".microtime(true).".json";
    $fc=file_get_contents("php://input");
    $data=[];
    $data['body']=$fc;
    $data['get']=$_GET;
    $data['cookie']=$_COOKIES;
    $data['post']=$_POST;
    $data['hdrs']=getallheaders();
    file_put_contents($trg,json_encode($data,JSON_PRETTY_PRINT));
    readfile("/tftp/boot/menu.ipxe");
    //readfile("/tftp/boot/vars.ipxe");