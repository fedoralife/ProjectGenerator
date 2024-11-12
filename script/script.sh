#!/bin/bash

# Function to set Dark Mode
set_dark_mode() {
    export GTK_THEME=Adwaita:dark
    echo "Dark mode enabled."
}
#Add a theme switcher
#also make it do c poject

# Function to create a new project
create_project() {
    PROJECT_NAME=$(zenity --entry --title="C++ Project Setup" --height=400 --width=400 --text="Enter your project name:")

    if [ -z "$PROJECT_NAME" ]; then
        zenity --error --text="Project name cannot be empty. Exiting."
        return 1
    fi

    mkdir "$PROJECT_NAME"
    cd "$PROJECT_NAME" 
    mkdir header src asset lib scripts

    # Create .gitignore, README, CMakeLists.txt, and other project files
    cat > .gitignore <<EOL
# Ignore build files
/build/

# Ignore CMake cache and temp files
CMakeCache.txt
CMakeFiles/
Makefile
*.cmake
*.swp

# Ignore IDE specific files
.idea/
.vscode/
EOL

    cat > .Readme << EOL
# Provide instructions for building the project
zenity --info --title="Build Instructions" --text="To build the project, follow these steps:
1. Open a terminal.
2. Navigate to the project directory.
3. Run the following commands:
   mkdir build
   cd build 
   cmake ..
   make
4. Run the executable:
   ./$PROJECT_NAME
EOL

    cat > CMakeLists.txt <<EOL
cmake_minimum_required(VERSION 3.10)
project(CppFileGenerator VERSION 1.0)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED True)

# Set output directory within the build directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY \${CMAKE_BINARY_DIR}/bin)

if (WIN32)
    message(STATUS "Configuring for Windows...")
    if (MSVC)
        set(CMAKE_GENERATOR_PLATFORM x64)
    else()
        find_program(GCC_BIN g++)
        find_program(CLANG_BIN clang)
        if (GCC_BIN)
            set(CMAKE_C_COMPILER \${GCC_BIN})
        elseif (CLANG_BIN)
            set(CMAKE_C_COMPILER \${CLANG_BIN})
        else()
            message(FATAL_ERROR "Neither MSVC, GCC, nor Clang found! Please install a compiler.")
        endif()
    endif()
elseif (APPLE)
    set(CMAKE_C_COMPILER clang++)
elseif (UNIX)
    find_program(GCC_BIN g++)
    find_program(CLANG_BIN clang)
    if (GCC_BIN)
        set(CMAKE_C_COMPILER \${GCC_BIN})
    elseif (CLANG_BIN)
        set(CMAKE_C_COMPILER \${CLANG_BIN})
    else()
        message(FATAL_ERROR "Neither G++ nor Clang found! Please install a compiler.")
    endif()
endif()

# Locate source files
file(GLOB SOURCES "src/*.cpp")

# Add executable target with source files
add_executable(app \${SOURCES})

# Link header file directory
target_include_directories(app PRIVATE header)

if (MSVC)
    target_compile_options(app PRIVATE /W4 /permissive-)
else()
    target_compile_options(app PRIVATE -Wall -Wextra -Wpedantic)
endif()
EOL


EOL

    cat > header/win.h <<EOL
#ifndef WIN_H
#define WIN_H

#include <iostream>

void displayMessage() {
    std::cout << "Hello, World from $PROJECT_NAME!" << std::endl;
}

#endif // WIN_H
EOL

    cat > src/main.cpp <<EOL
#include "win.h"

int main() {
    displayMessage();
    return 0;
}
EOL

    zenity --info --title="Project Created" --text="Project '$PROJECT_NAME' created successfully!"

    # Ask if the user wants to initialize a git repository
    INIT_GIT=$(zenity --question --title="Git Initialization" --text="Do you want to initialize a Git repository?" --ok-label="Yes" --cancel-label="No")

    if [ $? -eq 0 ]; then
        git init
        git add .
        git commit -m "Initial commit for $PROJECT_NAME"
        zenity --info --text="Git repository initialized and initial commit made."
    else
        zenity --info --text="No Git repository initialized."
    fi
}

# Function to delete a project
delete_project() {
    PROJECT_NAME=$(zenity --entry --title="Delete Project" --height=400 --width=400 --text="Enter the project name you want to delete:")

    if [ -z "$PROJECT_NAME" ]; then
        zenity --error --text="No project name provided. Exiting."
        return 1
    fi

    if [ -d "$PROJECT_NAME" ]; then
        zenity --question --title="Confirm Deletion" --text="Are you sure you want to delete the project '$PROJECT_NAME'?"
        if [ $? -eq 0 ]; then
            rm -rf "$PROJECT_NAME"
            zenity --info --text="Project '$PROJECT_NAME' has been deleted."
        else
            zenity --info --text="Project deletion canceled."
        fi
    else
        zenity --error --text="Project '$PROJECT_NAME' does not exist."
    fi
}

# Function to display help
show_help() {
    zenity --info --title="Help" --text="This is a simple script to create, delete, and manage a C++ project.

1. Create: Creates a new C++ project with a template structure.
2. Delete: Deletes an existing project directory by specifying its name.
3. Help: Shows this help message."
}

# Main loop for handling user actions
while true; do
    # Load theme
           set_dark_mode

    # Launch Zenity for project-related actions
    ACTION=$(zenity --list --title="C++ Project Setup" --column="Action" \
        "Create" "Delete" "Help" --height=400 --width=400)

    # Check the user's action and call the corresponding function
    case $ACTION in
        "Create")
            create_project
            ;;
        "Delete")
            delete_project
            ;;
        "Help")
            show_help
            ;;

        *)
            echo "Exiting the script."
            break  # Exit the loop if no valid action is selected
            ;;
    esac
done
