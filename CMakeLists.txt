cmake_minimum_required(VERSION 2.8)
project(cfdtd)

add_definitions("-std=c++11 -O3 -ffast-math")

set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(
	a.out
	src/main.cpp
	)

add_library(cfdtd SHARED src/cfdtd.cpp)
target_link_libraries(a.out cfdtd)

add_library(cfdtd_wrapper SHARED src/cfdtd_wrapper.cpp)
target_link_libraries(cfdtd_wrapper cfdtd)
