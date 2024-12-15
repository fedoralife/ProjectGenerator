@echo off
:: Function to set Dark Mode (Windows doesn't support GTK theme, so it's skipped in this case)
echo Dark mode is not supported in Windows batch scripts.

:: Function to create a new project
:create_project
set /p PROJECT_NAME="Enter your project name: "

if "%PROJECT_NAME%"=="" (
    echo Project name cannot be empty. Exiting.
    exit /b
)

:: Ask user to choose the parent directory
echo Select the parent directory (Full path required):
set /p PARENT_DIR="Enter directory path: "

if "%PARENT_DIR%"=="" (
    echo No directory selected. Exiting.
    exit /b
)

:: Create the project directory inside the selected parent directory
set PROJECT_DIR=%PARENT_DIR%\%PROJECT_NAME%

:: Check if the directory already exists
if exist "%PROJECT_DIR%" (
    echo Project directory '%PROJECT_NAME%' already exists. Exiting.
    exit /b
)

mkdir "%PROJECT_DIR%"
cd "%PROJECT_DIR%"
mkdir header src assets lib scripts

:: Create .gitignore file
echo # Ignore build files > .gitignore
echo /build/ >> .gitignore
echo CMakeCache.txt >> .gitignore
echo CMakeFiles/ >> .gitignore
echo Makefile >> .gitignore
echo *.cmake >> .gitignore
echo *.swp >> .gitignore
echo .idea/ >> .gitignore
echo .vscode/ >> .gitignore

:: Create README.md
echo # Provide instructions for building the project > README.md
echo To build the project, follow these steps: >> README.md
echo 1. Open a terminal. >> README.md
echo 2. Navigate to the project directory. >> README.md
echo 3. Run the following commands: >> README.md
echo mkdir build >> README.md
echo cd build >> README.md
echo cmake .. >> README.md
echo make >> README.md
echo 4. Run the executable: >> README.md
echo .\%PROJECT_NAME% >> README.md

:: Create CMakeLists.txt
echo cmake_minimum_required(VERSION 3.10) > CMakeLists.txt
echo project(CppFileGenerator VERSION 1.0) >> CMakeLists.txt
echo set(CMAKE_C_STANDARD 99) >> CMakeLists.txt
echo set(CMAKE_C_STANDARD_REQUIRED True) >> CMakeLists.txt
echo set(CMAKE_EXPORT_COMPILE_COMMANDS ON) >> CMakeLists.txt
echo set(CMAKE_RUNTIME_OUTPUT_DIRECTORY \${CMAKE_BINARY_DIR}/bin) >> CMakeLists.txt

:: Add Windows-specific instructions for compilers
echo if(WIN32) >> CMakeLists.txt
echo message(STATUS "Configuring for Windows...") >> CMakeLists.txt
echo find_program(GCC_BIN g++) >> CMakeLists.txt
echo find_program(CLANG_BIN clang) >> CMakeLists.txt
echo if(GCC_BIN) >> CMakeLists.txt
echo set(CMAKE_C_COMPILER \${GCC_BIN}) >> CMakeLists.txt
echo elseif(CLANG_BIN) >> CMakeLists.txt
echo set(CMAKE_C_COMPILER \${CLANG_BIN}) >> CMakeLists.txt
echo else() >> CMakeLists.txt
echo message(FATAL_ERROR "Neither GCC nor Clang found! Please install a compiler.") >> CMakeLists.txt
echo endif() >> CMakeLists.txt
echo endif() >> CMakeLists.txt

:: Create header and main source files
echo #ifndef WIN_H > header\win.h
echo #define WIN_H >> header\win.h
echo #include <iostream> >> header\win.h
echo void displayMessage() { >> header\win.h
echo std::cout << "Hello, World from %PROJECT_NAME%!" << std::endl; >> header\win.h
echo } >> header\win.h
echo #endif // WIN_H >> header\win.h

echo #include "win.h" > src\main.cpp
echo int main() { >> src\main.cpp
echo displayMessage(); >> src\main.cpp
echo return 0; >> src\main.cpp
echo } >> src\main.cpp

echo Project '%PROJECT_NAME%' created successfully!

:: Ask if the user wants to initialize a git repository
set /p INIT_GIT="Do you want to initialize a Git repository? (Y/N): "

if /i "%INIT_GIT%"=="Y" (
    git init
    git add .
    git commit -m "Initial commit for %PROJECT_NAME%"
    echo Git repository initialized and initial commit made.
) else (
    echo No Git repository initialized.
)

:: Create .clangd configuration
echo CompileFlags: > .clangd
echo Add: >> .clangd
echo - -std=c++17 >> .clangd
echo - -Wall >> .clangd
echo - -Wextra >> .clangd
echo - -Wpedantic >> .clangd
echo CompilationDatabase: ./build/compile_commands.json >> .clangd

:: Create build script in scripts folder
echo #!/bin/bash > scripts\build.sh
echo if [ ! -d "build" ]; then >> scripts\build.sh
echo echo "Build directory doesn't exist. Creating build directory." >> scripts\build.sh
echo mkdir build >> scripts\build.sh
echo fi >> scripts\build.sh
echo cd build >> scripts\build.sh
echo cmake .. >> scripts\build.sh
echo make >> scripts\build.sh
echo chmod +x scripts\build.sh

:: Create run script in scripts folder
echo #!/bin/bash > scripts\run.sh
echo if [ ! -d "build" ]; then >> scripts\run.sh
echo echo "Build directory does not exist. Please build the project first using build.sh." >> scripts\run.sh
echo exit 1 >> scripts\run.sh
echo fi >> scripts\run.sh
echo cd build >> scripts\run.sh
echo cd bin >> scripts\run.sh
echo .\app >> scripts\run.sh
echo chmod +x scripts\run.sh

exit /b

:: Function to delete a project
:delete_project
set /p PROJECT_NAME="Enter the project name you want to delete: "

if "%PROJECT_NAME%"=="" (
    echo No project name provided. Exiting.
    exit /b
)

:: Check if the project exists
if exist "%PROJECT_NAME%" (
    set /p CONFIRM_DELETE="Are you sure you want to delete the project '%PROJECT_NAME%'? (Y/N): "
    if /i "%CONFIRM_DELETE%"=="Y" (
        rmdir /s /q "%PROJECT_NAME%"
        echo Project '%PROJECT_NAME%' has been deleted.
    ) else (
        echo Project deletion canceled.
    )
) else (
    echo Project '%PROJECT_NAME%' does not exist.
)

exit /b

:: Show help
:show_help
echo This is a simple script to create, delete, and manage a C++ project.
echo.
echo 1. Create: Creates a new C++ project with a template structure.
echo 2. Delete: Deletes an existing project directory by specifying its name.
echo 3. Help: Shows this help message.

exit /b

:: Main menu loop
:main_menu
cls
echo C++ Project Setup
echo 1. Create Project
echo 2. Delete Project
echo 3. Help
set /p CHOICE="Choose an option: "

if "%CHOICE%"=="1" (
    goto create_project
) else if "%CHOICE%"=="2" (
    goto delete_project
) else if "%CHOICE%"=="3" (
    goto show_help
) else (
    echo Exiting...
    exit /b
)

