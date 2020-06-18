<?php
// enable, adjust and copy this code for each store you run
// Store #0, default one
//if (isHttpHost("example.com")) {
//    $_SERVER["MAGE_RUN_CODE"] = "default";
//    $_SERVER["MAGE_RUN_TYPE"] = "store";
//}
function isHttpHost($host)
{
    if (!isset($_SERVER['HTTP_HOST'])) {
        return false;
    }
    return strpos(str_replace('---', '.', $_SERVER['HTTP_HOST']), $host) === 0;
}
