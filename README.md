# Purpose: 
This Bash script automates the setup of a C++ project by creating a standard project structure and essential files.

# Project Structure: 
The generator creates the following structure:
    src/: Source files for C++ code.
    include/: Header files.
    build/: Build files and output.
    CMakeLists.txt: CMake configuration file for building the project.

# C++ Project Generator

This script generates a boilerplate structure for C++ projects, setting up folders, essential files, a `CMakeLists.txt` for CMake-based builds and a `.gitignore` for when commiting to to github

## Features
- **Automated Folder Creation**: Sets up `src/`, `include/`, and `build/` directories.
- **CMake Integration**: Initializes a `CMakeLists.txt` file for managing the build process.

## Requirements
- **Bash**: Ensure Bash is installed.
- **CMake**: Required to use the generated `CMakeLists.txt`.
- **Zenity**: Required for the UI

Interface

![Screenshot From 2024-11-11 16-35-15](https://github.com/user-attachments/assets/5724d1f8-e97b-4c58-86be-29b2c0fdaea7)


## Dependency installation

If you dont have the dependencies required you can install theme from here
- **Arch based distro** : sudo pacman -S cmake zenity
- **Debian based distro** : sudo apt install cmake zenity
- **Fedora based distro**: sudo dnf install cmake zenity

## Installation 

Simply clone the github repository : 
git clone 

Then run ./script
enjoy

