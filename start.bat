@echo off
title Rust Server Setup by xlebavich
color 0A


set STEAMCMD_DIR=%~dp0steamcmd
set RUST_SERVER_DIR=%~dp0rust_server
set SERVER_NAME=MyRustServer
set WORLD_SEED=12345
set WORLD_SIZE=3000
set MAX_PLAYERS=50
set RCON_PASSWORD=changeme
set SERVER_PORT=28015
set RCON_PORT=28016
set HOSTNAME="My Rust Server"
set DESCRIPTION="Welcome to my Rust server"
set URL="https://mywebsite.com"


if not exist "%STEAMCMD_DIR%\steamcmd.exe" (
    echo [INFO] Загрузка SteamCMD...
    mkdir "%STEAMCMD_DIR%"
    powershell -Command "Invoke-WebRequest -Uri https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip -OutFile steamcmd.zip"
    powershell -Command "Expand-Archive steamcmd.zip -DestinationPath '%STEAMCMD_DIR%'"
    del steamcmd.zip
)

echo [INFO] Установка / обновление Rust Dedicated Server...
"%STEAMCMD_DIR%\steamcmd.exe" +login anonymous +force_install_dir "%RUST_SERVER_DIR%" +app_update 258550 validate +quit


echo [INFO] Запуск сервера...
cd /d "%RUST_SERVER_DIR%"
RustDedicated.exe -batchmode +server.port %SERVER_PORT% +rcon.port %RCON_PORT% +rcon.password "%RCON_PASSWORD%" ^
+server.hostname "%HOSTNAME%" +server.identity "rust_server" +server.level "Procedural Map" ^
+server.seed %WORLD_SEED% +server.worldsize %WORLD_SIZE% +server.maxplayers %MAX_PLAYERS% ^
+server.description "%DESCRIPTION%" +server.url "%URL%"

pause
