# Purpose: 
This is a multiplatform applicaton used to generate a basic template for a c++ project which is useful for when u don't want to create it everytime.
The standalone applicaton is in the bin directory.
It is written both in bash as well as in C. 

# Project Structure: 
The generator creates the following structure:
    src/: Source files for C++ code.
    include/: Header files.
    build/: Build files and output.
    CMakeLists.txt: CMake configuration file for building the project.

# Build :
There if you want to build the project.
- **Create a folder/directory know as build**
Open Terminal
```sh
cd C---Project---Setup
```
```sh
mkdir build
```
```sh 
cmake build
```

# C++ Project Generator : 

This script generates a boilerplate structure for C++ projects, setting up folders, essential files, a `CMakeLists.txt` for CMake-based builds and a `.gitignore` for when commiting to to github

## Features
- **Automated Folder Creation**: Sets up `src/`, `include/`, and `build/` directories.
- **CMake Integration**: Initializes a `CMakeLists.txt` file for managing the build process.

## Requirements - For Direct Running
- **Bash**: Ensure Bash is installed.
- **CMake**: Required to use the generated `CMakeLists.txt`.
- **Zenity**: Required for the UI

Interface

![Screenshot From 2024-11-11 17-04-53](https://github.com/user-attachments/assets/71cf47f9-1ad3-4fd2-be31-49a9b4b99310)
![Screenshot From 2024-11-11 17-04-30](https://github.com/user-attachments/assets/4de70fd9-47db-45d7-9e9e-827496b0d19e)
![Screenshot From 2024-11-11 16-35-15](https://github.com/user-attachments/assets/05b72607-23c9-46e8-8c8e-01e75879ddb3)


## Dependency installation

If you dont have the dependencies required you can install theme from here
### Linux
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
### Windows
See official websites
cmake - `https://cmake.org/download/`

### MacOS
See official websites
cmake - `https://cmake.org/download/`

## Direct script running 

Simply clone the github repository : 
1. Clone the repository:
```sh
git clone https://github.com/fedoralife/C---Project---Setup.git
```
2. Then Go To the directory
```sh
cd C---Project---Setup
cd script
```
2. Finally:
```sh
./script.sh
```


## Enjoy!!

