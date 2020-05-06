cmake_minimum_required(VERSION 2.8)
project(zernikec2)

add_definitions("-std=c++11 -O3 -ffast-math")

# set numpy and python directories
set(numpydir "/home/zom/Projects/diffraction_net/venv/lib/python3.6/site-packages/numpy/core/include")
set(PYTHON_LIBRARIES "/usr/lib/x86_64-linux-gnu/libpython3.6m.so")
set(PYTHON_INCLUDE_DIRS "/usr/include/python3.6m")
find_package( GSL REQUIRED )
find_package(MPI REQUIRED)

include_directories(${PYTHON_INCLUDE_DIRS} ${numpydir})

set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(
	a.out
	src/main.cpp
	)
target_link_libraries(a.out fftw3 ${PYTHON_LIBRARIES} GSL::gsl ${MPI_LIBRARIES} MPI::MPI_CXX)

# PYTHON_CONFIGURE_OPTS="--enable-shared"
