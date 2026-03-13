@echo off
chcp 65001
cls
cd /d "%~dp0"
setlocal
    if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto x64
    if "%PROCESSOR_ARCHITEW6432%"=="AMD64" goto x64
    if exist %windir%\SysWOW64 goto x64
    echo 32-bit system not supported..
    echo 不支持 32 位系统
    pause
    :x64
    if exist Tool\nw.exe goto exec
    echo Unable to find tool file. Please unzip(extract) All files before opening the tool.
    echo 找不到工具文件, 请解压所有文件后再打开工具.
    pause
    :exec
    set "CHECK_FILE=permission_check"
    set "CURRENT_TIME=%time%"
    echo %CURRENT_TIME%> "%CHECK_FILE%"
    set /p WRITTEN_TIME=< "%CHECK_FILE%"
    if "%WRITTEN_TIME%"=="%CURRENT_TIME%" (
        echo Permission check OK.
    ) else (
        echo Permission check failed, the location does not have write permission, the tool may not work properly.
        echo Make sure the file permissions are correct, or consider running the tool with administrator privileges.
        echo 权限检查失败, 该位置没有写入权限, 工具可能无法正常运行. 
        echo 请确保文件权限正确, 或者考虑使用管理员权限运行工具.
        pause
    )
endlocal
cd Tool
start nw.exe