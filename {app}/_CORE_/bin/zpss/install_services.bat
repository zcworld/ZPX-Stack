@echo off
REM set DIR=%CD%
REM set DIR="C:\zpanel\bin"

echo Installing MySQL Service..
C:\zpanel\bin\mysql\bin\mysqld.exe --install
echo Starting MySQL Service..
net start MySQL

echo Installing Apache HTTPd Service..
C:\zpanel\bin\apache\bin\httpd.exe -k install -n Apache
echo Starting Apache HTTPd service..
net start Apache

echo Installing Filezilla service..
"C:\zpanel\bin\filezilla\Filezilla server.exe" /install auto
echo Starting Filezilla service..
net start "FileZilla Server"


"C:\zpanel\bin\crond\crons.exe" /install
echo Creating crontab file in 'C:\WINDOWS\System32'
COPY "C:\zpanel\bin\crond\temp_crontab.txt" "C:\WINDOWS\System32\crontab"
echo Starting Cron Service
net start "Cron Service"


echo Installing hMailServer...
C:\zpanel\bin\hmailserver\INSTALL\hMailServer-5.3.3-B1879.exe /DIR="C:\zpanel\bin\hmailserver" /VERYSILENT
echo Starting hMailServer
net stop hMailServer
net start hMailServer

@echo off
COLOR F2
echo Running configuration task..
php C:\zpanel\bin\zpss\enviroment_configure.php


echo Installing BIND9.9...
reg import C:\zpanel\bin\bind\bin\bind.reg
net start | find "named"
if ERRORLEVEL 1 sc create named binpath= C:\zpanel\bin\bind\bin\named.exe DisplayName= "named" start= auto
net start | find "named"
if ERRORLEVEL 1 %DIR%\bind\bin\sc.exe create named binpath= C:\zpanel\bin\bind\bin\named.exe DisplayName= "named" start= auto
C:\zpanel\bin\php\php.exe C:\zpanel\bin\bind\bin\config_bind.php 
echo Starting BIND
net stop named
net start named



DEL /F /Q c:\zpanel\bin\zpss\*.php
DEL /F /Q c:\zpanel\bin\zpss\*.bat



echo Done installing Services!
echo All done!
exit