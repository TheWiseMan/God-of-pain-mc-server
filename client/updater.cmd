@echo off
echo [92m WiseMan Updater Started [37m
set "wisepackJavaRep=https://download.oracle.com/java/17/latest/jdk-17_windows-x64_bin.zip"
set "wisepackForgeRep=https://maven.minecraftforge.net/net/minecraftforge/forge/1.19.4-45.0.43/forge-1.19.4-45.0.43-installer.jar"
set "wisepackJavaFol=jdk-17.0.6"
set "wisepackJavaVer=JAVA17"
set "wisepackForgeVer=FORGE45.0.43"
set "wisepackModsRep="

echo [96m
echo Downloading %wisepackJavaVer%. [37m
curl -o java.zip %wisepackJavaRep%
echo [92m Downloaded. [37m

echo [96m Extracting %wisepackJavaVer%. [37m
tar -xf java.zip
echo [92m %wisepackJavaVer% Extracted. [37m

echo [96m Downloading %wisepackForgeVer%. [37m
curl -o forge.jar %wisepackForgeRep%
echo [92m Downloaded. [37m

echo [96m Moving to %wisepackJavaFol%. [37m
cd %wisepackJavaFol%/bin

cls

echo [93m [	YOU WILL NEED TO CLICK 'OK'.	] [37m
echo [96m Installing %wisepackForgeRep%. [37m
java.exe -jar ../../forge.jar
echo [92m %wisepackForgeVer% installed. [37m
echo [96m Creating mod folder [37m
mkdir %appdata%/.minecraft/mods
echo [92m Mod folder created. [37m
pause
