@echo off 
ver
echo Welcome To One Click Setup
pause

prompt myprompt$G

echo Checking for Java in your system
timeout 5
@echo off
@break off
@title Create folder with batch but only if it doesn't already exist - D3F4ULT
@color 0a
setlocal EnableDelayedExpansion
if not exist "C:\Program Files\Java\jdk1.8.0_291" (
  echo Downloading Java
  wget https://www.dropbox.com/s/8kasbdv9fjb064c/jdk-8u291-windows-x64.exe
  pause
  start jdk-8u291-windows-x64.exe
  echo installation under progress
  timeout 70
  if "!errorlevel!" EQU "0" (
    echo Java installed successfully
  ) else (
    echo Error while creating folder
  )
) else (
  echo Java Folder already exists
)

echo.
java -version
pause
       

@echo off
echo Checking for Python in your system
timeout 5
@echo off
@break off
@title Create folder with batch but only if it doesn't already exist - D3F4ULT
@color 0a
setlocal EnableDelayedExpansion
if not exist "C:\Users\%username%\AppData\Local\Programs\Python" (
  echo Downloading Python
  wget https://www.dropbox.com/s/cy0up8kzyn9cuh0/python-3.6.5-amd64.exe
  pause
  start python-3.6.5-amd64.exe
  echo installation under progress
  timeout 40
  if "!errorlevel!" EQU "0" (
    echo Python installed successfully
  ) else (
    echo Error while creating folder
  )
) else (
  echo Python Folder already exists
)


echo.
python --version
pause


echo.
echo Checking for spark in your system
timeout 5
if not exist "C:\spark-3.1.1-bin-hadoop2.7" (
  echo Downloading Spark
  wget https://www.dropbox.com/s/zpilyk0koaxqni6/spark-3.1.1-bin-hadoop2.7.zip
  tar -xf spark-3.1.1-bin-hadoop2.7.zip
  move spark-3.1.1-bin-hadoop2.7 C:\
  echo installation under progress
  timeout 5
  if "!errorlevel!" EQU "0" (
    echo Spark installed successfully
  ) else (
    echo Error while creating folder
  )
) else (
  echo Spark Folder already exists
)

pause
echo.
echo Checking for Eclipse in your system
timeout 5
if not exist "C:\Users\%username%\eclipse" (
  echo Downloading Eclipse
  wget https://www.dropbox.com/s/e5s8vaodnl3ssnp/eclipse-inst-jre-win64.exe
  pause
  start eclipse-inst-jre-win64.exe
  echo installation under progress
  timeout 240
  if "!errorlevel!" EQU "0" (
    echo Eclipse installed successfully
  ) else (
    echo Error while creating folder
  )
) else (
  echo Eclipse Folder already exists
)


echo.
echo Adding Path into your Environment Variables
timeout 5
echo.
cd ..
cd ..
cd ..
cd ..
cd ..
setx SPARK_HOME "C:\spark-3.1.1-bin-hadoop2.7"
setx HADOOP_HOME "C:\spark-3.1.1-bin-hadoop2.7"
pause


cd \Users\admin\Documents\kockpit-tools
@echo off
@ECHO OFF
:start
SET choice=
SET /p choice=Install PostgreSQL? [y/n]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO yes
IF '%choice%'=='y' GOTO yes
IF '%choice%'=='N' GOTO no
IF '%choice%'=='n' GOTO no
IF '%choice%'=='' GOTO no
    ECHO "%choice%" is not valid
    ECHO.
    GOTO start
    
    :no
    ECHO PostgreSQL installation Skipped
    PAUSE
    EXIT
    
    
    :yes
    echo Checking for PostgreSQL in your system
    timeout 5
    @echo off
    @break off
    @title Create folder with batch but only if it doesn't already exist - D3F4ULT
    @color 0a
    setlocal EnableDelayedExpansion
    if not exist "C:\Program Files\PostgreSQL" (
      echo Downloading PostgreSQL
      wget https://www.dropbox.com/s/jgdlk5w3qwl4q2p/postgresql-10.17-2-windows-x64.exe
      pause
      start postgresql-10.17-2-windows-x64.exe
      echo installation under progress
      timeout 240
      wget https://github.com/anmolpal/Spark-Drivers/raw/main/postgresql-42.2.20.jre7.jar
      move postgresql-42.2.20.jre7.jar C:\spark-3.1.1-bin-hadoop2.7\jars
      if "!errorlevel!" EQU "0" (
        echo PostgreSQL installation done
      ) else (
        echo Error while creating folder
      )
    ) else (
      echo PostgreSQL Folder already exists
    )
    
PAUSE


