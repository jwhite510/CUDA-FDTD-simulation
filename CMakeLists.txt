cmake_minimum_required(VERSION 3.0)
project(cfdtd)

add_definitions("-std=c++11 -O3 -ffast-math")

set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CUDA_HOST_COMPILER "g++-6")
find_package(CUDA REQUIRED)

cuda_add_library(cfdtd_wrapper SHARED src/cfdtd_wrapper.cu)
