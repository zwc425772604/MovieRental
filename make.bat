@echo off
REM Build script for CSE305 Project Assignment 3
REM This build script attempts to emulate the functionality of a Makefile on Windows.
REM Author: Sean Pesce
echo:

IF "%1"=="all" (
	:make_all
	echo Task: Build
	echo:
	REM Remove old build files:
	del /f /s /q "%~dp0build" 2> nul > nul
	rmdir "%~dp0build" /s /q 2> nul > nul

	echo Creating build directory...
	REM Create build directory:
	echo mkdir build
	echo:
	mkdir "%~dp0build" 2> nul

	echo Compiling Java...
	REM Compile the .java files:
	echo javac -d build -classpath .;lib/*.jar src/java/users/*.java src/java/movieData/*.java
	javac -d "%~dp0build" -classpath .;"%~dp0lib/apache-tomcat-6.0.53/servlet-api.jar";"%~dp0lib/MySQLDriver/mysql-connector-java-5.1.23-bin.jar";"%~dp0lib/javaee-endorsed-api-6.0/javaee-doc-api.jar";"%~dp0lib/javaee-endorsed-api-6.0/javax.annotation.jar";"%~dp0lib/javaee-endorsed-api-6.0/jaxb-api-osgi.jar";"%~dp0lib/javaee-endorsed-api-6.0/webservices-api-osgi.jar";"%~dp0lib/CopyLibs/org-netbeans-modules-java-j2seproject-copylibstask.jar" "%~dp0src/java/users/"*.java "%~dp0src/java/movieData/"*.java
	
	goto :done
)

IF "%1"=="clean" (
	:make_clean
	echo Task: Clean
	echo:
	echo Removing old build files...
	REM Remove old build files:
	echo del /f /s /q build
	del /f /s /q "%~dp0build" 2> nul > nul
	echo rmdir build /s /q
	rmdir "%~dp0build" /s /q 2> nul > nul
	
	goto :done
) ELSE (
	goto :make_all
)

:done
echo:
echo Done.
IF "%1"=="-p" (
	pause
	goto :end
)
IF "%2"=="-p" (
	pause
)
:end
echo:
