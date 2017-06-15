@echo off

netcfg.exe -c s -i MS_Server
netcfg.exe -c s -i MS_Pacer
netcfg.exe -c p -i MS_LLTDIO
netcfg.exe -c p -i MS_RSPNDR


netsh advfirewall firewall set rule group="windows management instrumentation (wmi)" new enable=yes profile=domain
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=yes profile=domain
netsh firewall set service remoteadmin enable profile=domain
netsh advfirewall firewall set rule group="remote administration" new enable=yes profile=domain

netsh advfirewall firewall add rule name="135TCP-In" dir=in action=allow protocol=TCP localport=135 profile=domain
netsh advfirewall firewall add rule name="135TCP-Out" dir=out action=allow protocol=TCP localport=135 profile=domain
netsh advfirewall firewall add rule name="135UDP-In" dir=in action=allow protocol=UDP localport=135 profile=domain
netsh advfirewall firewall add rule name="135UDP-Out" dir=out action=allow protocol=UDP localport=135 profile=domain

reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1 /f
