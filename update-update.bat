@echo off
title Rust Server Installer & Updater by xlebavich
color 0A


set STEAMCMD_DIR=%~dp0steamcmd
set RUST_SERVER_DIR=%~dp0rust_server

if not exist "%STEAMCMD_DIR%\steamcmd.exe" (
    echo [INFO] SteamCMD не найден. Скачиваем...
    mkdir "%STEAMCMD_DIR%"
    powershell -Command "Invoke-WebRequest -Uri https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip -OutFile steamcmd.zip"
    powershell -Command "Expand-Archive steamcmd.zip -DestinationPath '%STEAMCMD_DIR%'"
    del steamcmd.zip
    echo [INFO] SteamCMD установлен.
) else (
    echo [INFO] SteamCMD уже установлен.
)

echo [INFO] Установка или обновление Rust Dedicated Server...
"%STEAMCMD_DIR%\steamcmd.exe" ^
+login anonymous ^
+force_install_dir "%RUST_SERVER_DIR%" ^
+app_update 258550 validate ^
+quit

echo [INFO] Rust Dedicated Server установлен или обновлён.
pause
