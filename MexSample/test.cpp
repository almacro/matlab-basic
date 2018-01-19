#include "mex.h"
#include <omp.h>
#include <iostream>

void mexFunction(int nlhs, mxArray *plhs[],
                 int nrhs, const mxArray *prhs[])
{
    std::cout << "#procs   = " << omp_get_num_procs() << std::endl;

    std::cout << "#threads = " << omp_get_num_threads() << std::endl;
}