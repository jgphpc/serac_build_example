cmake_minimum_required(VERSION 3.18)
project(axom_project LANGUAGES CXX CUDA)

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CUDA_STANDARD 17)

set(AXOM_PROJECT_DIR ${PROJECT_SOURCE_DIR})

add_subdirectory(cpp_only_project) 
add_subdirectory(cpp_cuda_project) 

add_library(axom INTERFACE)
target_link_libraries(axom INTERFACE cpp_only cpp_cuda)
