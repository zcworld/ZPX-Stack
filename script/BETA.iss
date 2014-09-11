[Setup]
AppName=ZPanel Server Stack
AppVerName=ZPanel Server Stack v10.1.1 - BETA
DefaultDirName=c:\zpanel
DefaultGroupName=ZPanel
OutputBaseFilename=BETA
SolidCompression=True
Compression=lzma2/ultra64
InternalCompressLevel=ultra
CompressionThreads=2
UninstallLogMode=new
OutputDir=..\Output

[Files]
Source: "E:\_ISS_\ZPX\CORE\Stack v10.1.1-1\{app}\_CORE_\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Core 
source: "E:\_ISS_\ZPX\CORE\Stack v10.1.1-1\{app}\php-5.3.20\*"; DestDir: "{app}\bin\php\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: php5320
Source: "E:\_ISS_\ZPX\CORE\Stack v10.1.1-1\{app}\php-5.5.12\*"; DestDir: "{app}\bin\php\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: php5512

[Dirs]
Name: {app}\backups\
Name: {app}\bin\apache\logs\
Name: {app}\bin\bind\etc\
Name: {app}\bin\bind\zones\
Name: {app}\bin\php\extras\
Name: {app}\configs\
Name: {app}\hostdata\zadmin\public_html\
Name: {app}\logs\apache\
Name: {app}\logs\bind\
Name: {app}\logs\hmailserver\
Name: {app}\logs\mysql\
Name: {app}\logs\php\
Name: {app}\logs\sendmail\
Name: {app}\panel\
Name: {app}\temp\


[Run]

Filename: {tmp}\1.exe; Parameters: /q; Flags: skipifdoesntexist
Filename: {tmp}\2.exe; Parameters: /q; Flags: skipifdoesntexist
Filename: {tmp}\3.exe; Parameters: /q; Flags: skipifdoesntexist
Filename: {app}\bin\zpss\register_paths.bat; StatusMsg: Registering application paths; MinVersion: 0.0,5.0
Filename: {app}\bin\zpss\install_services.bat; StatusMsg: Installing services and registering applications; MinVersion: 0.0,5.0



[Icons]
Name: {group}\Support\ZPanel website; Filename: http://www.zpanelcp.com/; IconFilename: {app}\bin\zpss\icons\internet.ico; MinVersion: 0.0,5.0
Name: {group}\Support\ZPanel forums; Filename: http://forums.zpanelcp.com/; IconFilename: {app}\bin\zpss\icons\forums.ico; MinVersion: 0.0,5.0
Name: {group}\Support\ZPanel bug database; Filename: http://bugs.zpanelcp.com/; IconFilename: {app}\bin\zpss\icons\bugs.ico; MinVersion: 0.0,5.0
Name: {group}\Management\hMailServer Console; Filename: {app}\bin\hmailserver\Bin\hMailAdmin.exe; MinVersion: 0.0,5.0
Name: {group}\Management\FileZilla Console; Filename: {app}\bin\filezilla\FileZilla Server Interface.exe; MinVersion: 0.0,5.0
Name: {group}\Management\Apache Monitor; Filename: {app}\bin\apache\bin\ApacheMonitor.exe; MinVersion: 0.0,5.0
Name: {group}\Logs; Filename: {app}\logs; IconFilename: {app}\bin\zpss\icons\logs.ico; MinVersion: 0.0,5.0
Name: {group}\Backups; Filename: {app}\backups; IconFilename: {app}\bin\zpss\icons\backups.ico; MinVersion: 0.0,5.0
Name: {group}\Hostdata; Filename: {app}\hostdata; IconFilename: {app}\bin\zpss\icons\hostdata.ico; MinVersion: 0.0,5.0
Name: {group}\Tasks\Run ZPanel Daemon; Filename: {app}\bin\php\php.exe; Parameters: C:\zpanel\panel\bin\daemon.php; IconFilename: {app}\bin\zpss\icons\runtasks.ico; MinVersion: 0.0,5.0


[CustomMessages]
AutoStartProgramGroupDescription=Startup:
AutoStartProgram=Automatically start %1
AddonHostProgramNotFound=%1 could not be located in the folder you selected.%n%nDo you want to continue anyway?
NameAndVersion=%1 version %2
AdditionalIcons=Additional icons:
CreateDesktopIcon=Create a &desktop icon
CreateQuickLaunchIcon=Create a &Quick Launch icon
ProgramOnTheWeb=%1 on the Web
UninstallProgram=Uninstall %1
LaunchProgram=Launch %1
AssocFileExtension=&Associate %1 with the %2 file extension
AssocingFileExtension=Associating %1 with the %2 file extension...


[Components]
Name: "core"; Description: "Zpanel Core"; Types: "zpx-php5.3.20 zpx-php5.5.12"; MinVersion: 0.0,5.0; 
Name: "php5320"; Description: "Zp54x"; Types: "zpx-php5.3.20"; MinVersion: 0.0,5.0; 
Name: "php5512"; Description: "p55112"; Types: "zpx-php5.5.12"; MinVersion: 0.0,5.0; 

[Types]
Name: "zpx-php5.3.20"; Description: " Zpanel Core + php 5.3.20 + php-shuion"; MinVersion: 0.0,5.0; 
Name: "zpx-php5.5.12"; Description: "Zpanel Core + PHP 5.5.12 without php-shuion"; MinVersion: 0.0,5.0; 



  
[_ISToolDownload]
Source: http://192.168.137.1/1.exe; DestDir: {tmp}; DestName: 1.exe
Source: http://192.168.137.1/2.exe; DestDir: {tmp}; DestName: 2.exe
Source: http://192.168.137.1/3.exe; DestDir: {tmp}; DestName: 3.exe
