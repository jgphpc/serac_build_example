cmake_minimum_required(VERSION 3.18)
project(core_project LANGUAGES CXX CUDA)

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CUDA_STANDARD 17)

set(sources "geometry.hpp" "geometry.cu") 

set(cppcu cpp_cuda)
add_library(${cppcu} STATIC ${sources})
target_include_directories(${cppcu} PUBLIC ${AXOM_PROJECT_DIR})
# target_link_libraries(${cppcu} PUBLIC core)
set_target_properties(${cppcu} PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
