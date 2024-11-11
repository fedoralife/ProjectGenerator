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

![Screenshot From 2024-11-11 17-05-08](https://github.com/user-attachments/assets/c32ec272-6e79-4266-ac54-3a8baa63b1d3)
![Screenshot From 2024-11-11 17-04-53](https://github.com/user-attachments/assets/659e64c9-1e1b-4139-88e3-7f516cf4d7e6)
![Screenshot From 2024-11-11 17-04-30](https://github.com/user-attachments/assets/20f5c24b-7881-4e20-b0b7-be39bcf43a7a)
![Screenshot From 2024-11-11 16-35-15](https://github.com/user-attachments/assets/590b418e-f618-4bba-a320-0105959d98c2)


## Dependency installation

If you dont have the dependencies required you can install theme from here
- **Arch based distro** :
```sh
    sudo pacman -S cmake zenity
```
- **Debian based distro** :
 ```sh
sudo apt install cmake zenity
```
- **Fedora based distro**:
```sh
sudo dnf install cmake zenity
```

## Installation 

Simply clone the github repository : 
1. Clone the repository:
```sh
git clone https://github.com/fedoralife/C---Project---Setup.git
```
2. Finally:
```sh
./script.sh
```
## How It Works And Use



## Enjoy!!

