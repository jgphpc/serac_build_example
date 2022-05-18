cmake_minimum_required(VERSION 3.18)
project(core_project LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CUDA_STANDARD 17)

set(sources "parse_input.hpp" "parse_input.cpp") 

set(cppo cpp_only)
add_library(${cppo} STATIC ${sources})
target_include_directories(${cppo} PUBLIC ${AXOM_PROJECT_DIR})
# target_link_libraries(${cppo} PUBLIC core)

