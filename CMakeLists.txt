cmake_minimum_required(VERSION 3.10)

# Set project name and version
project(MyApp VERSION 1.0)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add executable target
add_executable(MyApp ./src/main.cpp)
