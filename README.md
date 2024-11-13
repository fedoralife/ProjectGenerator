# C++ Project and Webpage Generator

This multiplatform application is designed to generate either a basic C++ project template or a simple webpage for documenting your project. The generator allows you to choose between setting up a C++ project or a webpage, automating the process for either option. It is written in both Bash and C, and the standalone executable is located in the `bin` directory.

## Project Structure

### For C++ Project:
The generator creates the following structure for a C++ project:

```
src/:          Source files for C++ code.
include/:      Header files.
build/:        Build files and output.
CMakeLists.txt: CMake configuration file for building the project.
```

### For Webpage:
The generator creates the following structure for a basic webpage:

```
js/:           js files for project documentation.
css/:          CSS files for styling the webpage.
scss/:         Sccs files
```

## Build

To build the project:

1. **Navigate to the project directory**:
   ```sh
   cd ProjectGenerator
   ```

2. **Create a build directory**:
   ```sh
   mkdir build
   ```

3. **Generate the project files using CMake**:
   ```sh
   cmake build
   ```

## C++ Project or Webpage Generator

This script generates a boilerplate structure for either a C++ project or a simple webpage, depending on your choice. It sets up the necessary folders and files, either for C++ development or for documenting your project with a webpage. The generator also creates a `CMakeLists.txt` for C++ projects and a `.gitignore` file for version control.

### Features

- **Automated Folder Creation**: Set up the required directories for either a C++ project (`src/`, `include/`, `build/`) or a webpage (`html/`, `css/`).
- **CMake Integration**: Initializes a `CMakeLists.txt` file for managing the build process (only for C++ projects).
- **Webpage Creation**: Creates a simple `index.html` page and a `style.css` for styling the webpage (only for webpages).

### Requirements

- **Bash**: Ensure Bash is installed.
- **CMake**: Required to use the generated `CMakeLists.txt` (only for C++ projects).
- **Zenity**: For the user interface.
- **A Web Browser**: To view the generated webpage (optional).

### Interface Screenshots

![Screenshot 1](https://github.com/user-attachments/assets/71cf47f9-1ad3-4fd2-be31-49a9b4b99310)  
![Screenshot 2](https://github.com/user-attachments/assets/4de70fd9-47db-45d7-9e9e-827496b0d19e)  
![Screenshot 3](https://github.com/user-attachments/assets/05b72607-23c9-46e8-8c8e-01e75879ddb3)

## Dependency Installation

If you don't have the required dependencies, you can install them as follows:

### Linux
- **Arch-based distro**:
   ```sh
   sudo pacman -S cmake zenity
   ```
- **Debian-based distro**:
   ```sh
   sudo apt install cmake zenity
   ```
- **Fedora-based distro**:
   ```sh
   sudo dnf install cmake zenity
   ```

### Windows
- **CMake**: [Download CMake](https://cmake.org/download/)

### macOS
- **CMake**: [Download CMake](https://cmake.org/download/)

## Direct Script Running

To directly run the script:

1. **Clone the repository**:
   ```sh
   git clone https://github.com/fedoralife/ProjectGenerator.git
   ```

2. **Navigate to the script directory**:
   ```sh
   cd ProjectGenerator
   cd script
   ```

3. **Run the script**:
   ```sh
   ./script.sh
   ```

## Enjoy!!
