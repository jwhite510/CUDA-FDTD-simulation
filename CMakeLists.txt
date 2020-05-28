cmake_minimum_required(VERSION 2.8)
project(zernikec2)

add_definitions("-std=c++11 -g -ffast-math")

set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(
	a.out
	src/main.cpp
	)

add_library(cfdtd SHARED src/cfdtd.cpp)
target_link_libraries(a.out cfdtd)
# add_library(cfdtdwrapper SHARED src/cfdtdwrapper.cpp)
# PYTHON_CONFIGURE_OPTS="--enable-shared"
