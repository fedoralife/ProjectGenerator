cmake_minimum_required(VERSION 3.10)
project(MyCProgram VERSION 1.0)

# Specify C standard
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED True)

# Set output directory for binaries
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Detect platform and configure compiler
if (WIN32)
    message(STATUS "Configuring for Windows...")
    
    # Check if MSVC is available
    if (MSVC)
        message(STATUS "Using MSVC as the compiler.")
        set(CMAKE_GENERATOR_PLATFORM x64)  # Use x64 platform for the solution
    else()
        # If MSVC is not available, fallback to GCC or Clang
        find_program(GCC_BIN gcc)
        find_program(CLANG_BIN clang)

        if (GCC_BIN)
            set(CMAKE_C_COMPILER ${GCC_BIN})
            message(STATUS "Using GCC as the compiler.")
        elseif (CLANG_BIN)
            set(CMAKE_C_COMPILER ${CLANG_BIN})
            message(STATUS "Using Clang as the compiler.")
        else()
            message(FATAL_ERROR "Neither MSVC, GCC, nor Clang found! Please install a compiler.")
        endif()
    endif()

elseif (APPLE)
    message(STATUS "Configuring for macOS...")
    set(CMAKE_C_COMPILER clang)
    
elseif (UNIX)
    message(STATUS "Configuring for Linux/UNIX...")
    find_program(GCC_BIN gcc)
    find_program(CLANG_BIN clang)
    
    if (GCC_BIN)
        set(CMAKE_C_COMPILER ${GCC_BIN})
    elseif (CLANG_BIN)
        set(CMAKE_C_COMPILER ${CLANG_BIN})
    else()
        message(FATAL_ERROR "Neither GCC nor Clang found! Please install a compiler.")
    endif()
endif()

# Add source files
file(GLOB SOURCES "src/*.c")

# Add executable target
add_executable(my_program ${SOURCES})

# Platform-specific compiler options (optional)
if (MSVC)
    # Use MSVC-specific flags
    target_compile_options(my_program PRIVATE /W4 /permissive-)
elseif (WIN32 OR UNIX OR APPLE)
    target_compile_options(my_program PRIVATE -Wall -Wextra -Wpedantic)
endif()

# Link libraries if needed (example)
# target_link_libraries(my_program PRIVATE some_library)

# Installation (optional)
install(TARGETS my_program DESTINATION bin)
