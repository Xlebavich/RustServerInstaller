📄 README — Rust Server Installer & Updater
⚙ What does this script do?

This .bat file:

    Downloads and installs SteamCMD (if not already installed).

    Installs or updates the Rust Dedicated Server.

    Places the server files inside the rust_server folder.

🚀 How to Use

    📁 Extract or place this script in any folder, for example:
    D:\RustServer\

    ▶ Double-click install_update_rust_server.bat

    ⏳ Wait — the script will download SteamCMD and install the server.

    ✅ When done, the Rust server files will be located in the rust_server folder.

🛠 Requirements

    Windows 10 or 11

    At least 10+ GB of free disk space

    Internet connection

    Steam is not required

    It is recommended to run the script as Administrator

⚠ Common Issues

🔒 "Unable to access" or window closes immediately:

    Right-click the .bat file and choose Run as Administrator

    Make sure you're not running it from Desktop or Program Files

    Temporarily disable your antivirus or whitelist steamcmd.exe

📌 Next Step: Starting the Server

After installation, create a new .bat file like this to run your server:

@echo off
cd rust_server
RustDedicated.exe -batchmode +server.hostname "My Rust Server" +server.identity "my_server" +server.port 28015 +rcon.port 28016 +rcon.password "123456" +server.level "Procedural Map" +server.seed 12345 +server.worldsize 3000 +server.maxplayers 50 +server.description "Welcome!"
pause
