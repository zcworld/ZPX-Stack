<?php
/*
############################################################
# BINDFIX configuration script for ZPX                     #
# Developedy by RusTus, 4th August 2013                    #
############################################################
# Last updated NEVER!					                   #
############################################################
*/

fwrite(STDOUT, "\r\n
##################################################\r\n
# ZPANELX BINDFIX WIZARD FOR WINDOWS              #\r\n
##################################################\r\n");

fwrite(STDOUT, "\r
Generating RCDN-KEY for BIND...");

// Generate rcdn-key for BIND
$rcdn_key_file = @fopen("C:/zpanel/bin/bind/etc/key.conf", "w");
fwrite($rcdn_key_file, "key \"rndc-key\" {\r\n");
fwrite($rcdn_key_file, "	algorithm hmac-md5;\r\n");
fwrite($rcdn_key_file, "	secret \"" . md5(uniqid(rand(), 1)) . "\";\r\n");
fwrite($rcdn_key_file, "};");
fclose($rcdn_key_file);

fwrite(STDOUT, "\r\n
RCDN-KEY created at: C:/zpanel/bin/bind/etc/key.conf\r\n
\r\n");
?>