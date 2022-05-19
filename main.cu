#if defined(SPH_HIP)
#include "hip/hip_runtime.h"
#endif
#include <cstdio>

#include "cpp_cuda_project/geometry.hpp"
#include "cpp_only_project/parse_input.hpp"

using axom::cpp_only_project::parse_vec3;
using axom::cpp_only_project::parse_float;

using axom::cpp_cuda_project::sphere;
using axom::cpp_cuda_project::separation;
using axom::cpp_cuda_project::intersecting;

__global__ void serac_kernel(sphere a, sphere b) {
  printf("inside serac's cuda kernel...\n");
  printf("%f\n", separation(a, b));
  printf("%d\n", intersecting(a, b));
}

int main() {
  sphere a{parse_vec3("0.0 0.0 0.0"), parse_float("1.0")};
  sphere b{{3.0f, 0.0f, 0.0f}, 1.0f};

#if defined(SPH_CUDA)
//#if defined(__CUDACC__)
  serac_kernel<<<1,1>>>(a, b);
  cudaDeviceSynchronize();
#elif defined(SPH_HIP)
//#elif defined(__HIPCC__)
  hipLaunchKernelGGL(serac_kernel, 1, 1, 0, 0, a, b);
  hipDeviceSynchronize();
#endif
}
