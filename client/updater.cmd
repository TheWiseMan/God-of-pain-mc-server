@echo off
echo [92m WiseMan Updater Started [37m
set "wisepackJavaRep=https://download.oracle.com/java/17/latest/jdk-17_windows-x64_bin.zip"
set "wisepackForgeRep=https://maven.minecraftforge.net/net/minecraftforge/forge/1.19.4-45.0.43/forge-1.19.4-45.0.43-installer.jar"
set "wisepackJavaFol=jdk-17.0.6"
set "wisepackJavaVer=JAVA17"
set "wisepackForgeVer=FORGE45.0.43"
set "wisepackModsRep=https://dl.dropboxusercontent.com/s/imhvx9mfv7htum8/modpack.zip"

echo [96m Downloading %wisepackJavaVer%. [37m
curl -o java.zip %wisepackJavaRep%
echo [92m Downloaded. [37m

echo [96m Downloading %wisepackForgeVer%. [37m
curl -o forge.jar %wisepackForgeRep%
echo [92m Downloaded. [37m

echo [96m Downloading WisePack. [37m
curl -o wisepack.zip %wisepackModsRep%
echo [92m Downloaded WisePack. [37m

echo [96m Extracting %wisepackJavaVer%. [37m
tar -xf java.zip
echo [92m %wisepackJavaVer% Extracted. [37m

cls

echo [93m [	YOU WILL NEED TO CLICK 'OK'.	] [37m

echo [96m Installing %wisepackForgeRep%. [37m
cd %wisepackJavaFol%/bin
java.exe -jar ../../forge.jar
cd ../../
echo [92m %wisepackForgeVer% installed. [37m
echo [96m Creating mod folder [37m
mkdir "%appdata%/.minecraft/mods"
echo [92m Mod folder created. [37m

echo [96m Copying WisePack. [37m
copy /B/Y wisepack.zip %appdata%/.minecraft/mods/wisepack.zip
echo [92m Copied WisePack. [37m

echo [96m Extracting WisePack. [37m
tar -xf %appdata%/.minecraft/mods/wisepack.zip
echo [92m Extracted WisePack. [37m

cls

echo [96m Deleting %wisepackForgeVer% [37m
del /f forge.jar
echo [92m Deleted. [37m

echo [96m Deleting %wisepackJavaVer% [37m
del /f %wisepackJavaFol%
del /f java.zip
echo [92m Deleted. [37m

echo [96m Deleting WisePack [37m
del /f wisepack.zip
del /f %appdata%/.minecraft/mods/wisepack.zip
echo [92m Deleted. [37m

echo [93m [	INSTALLATION FINISHED !	] [37m
echo [93m [	51.68.204.137:25572	] [37m
echo [92m END. [37m
pause
