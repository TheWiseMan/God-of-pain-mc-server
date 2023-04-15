@echo off

echo [92m WiseMan Updater Started [37m
set "wisepackJavaRep=https://download.oracle.com/java/17/latest/jdk-17_windows-x64_bin.zip"
set "wisepackForgeRep=https://maven.minecraftforge.net/net/minecraftforge/forge/1.19.4-45.0.43/forge-1.19.4-45.0.43-installer.jar"
set "wisepackJavaFol=%cd%\jdk-17.0.6"
set "wisepackJavaVer=JAVA17"
set "wisepackJavaZipPath=%cd%\java.zip"
set "wisepackForgeVer=FORGE45.0.43"
set "wisepackForgePath=%cd%/forge.jar"
set "wisepackModsRep=https://dl.dropboxusercontent.com/s/imhvx9mfv7htum8/modpack.zip"
set "wisepackModsZipPath=%cd%\wisepack.zip"
set "appdata=%appdata%"

if [%1]==[-replace-mods] (
    call :replaceMods
)
if [%1]==[-update-mods] (
    call :updateMods
)


echo [96m Downloading %wisepackJavaVer%. [37m
curl -o %wisepackJavaZipPath% %wisepackJavaRep%
echo [92m Downloaded. [37m

echo [96m Downloading %wisepackForgeVer%. [37m
curl -o %wisepackForgePath% %wisepackForgeRep%
echo [92m Downloaded. [37m

echo [96m Extracting %wisepackJavaVer%. [37m
tar -xf %wisepackJavaZipPath%
echo [92m %wisepackJavaVer% Extracted. [37m

cls

echo [93m [    YOU WILL NEED TO CLICK 'OK'.    ] [37m

echo [96m Installing %wisepackForgeRep%. [37m
cd %wisepackJavaFol%/bin
java.exe -jar %wisepackForgePath%
echo [92m %wisepackForgeVer% installed. [37m

echo [96m Deleting %wisepackForgeVer% [37m
del /f %wisepackForgePath%
echo [92m Deleted. [37m

echo [96m Deleting %wisepackJavaVer% [37m
rmdir /S /Q %wisepackJavaFol%
del /f %wisepackJavaZipPath%
echo [92m Deleted. [37m

:replaceMods

echo [93m Please note that installing this modpack will remove all existing mods.
echo "Consider making a backup of your mods folder before proceeding."
choice /M "Do you want to proceed ? "

if %errorlevel% EQU 2 (
    echo [37m Installation aborted.
    exit
)

echo [96m Cleaning mod folder. [37m
rmdir /S /Q "%appdata%/.minecraft/mods"
mkdir "%appdata%/.minecraft/mods"
echo [92m mod folder cleaned. [37m

:updateMods

echo [96m Downloading WisePack. [37m
curl -o %wisepackModsZipPath% %wisepackModsRep%
echo [92m Downloaded WisePack. [37m

echo [96m Extracting WisePack. [37m
cd "%appdata%/.minecraft/mods/"
tar -xf %wisepackModsZipPath%
echo [92m Extracted WisePack. [37m

echo [96m Deleting WisePack [37m
del /f %wisepackModsZipPath%
echo [92m Deleted. [37m

echo [93m [    INSTALLATION FINISHED ! ] [37m
echo [93m [    Server IP:  51.68.204.137:25572 ] [37m
echo [92m END. [37m

rem self-destruction
(goto) 2>nul & del "%~f0"
