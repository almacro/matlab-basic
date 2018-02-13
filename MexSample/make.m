function finalCompiler = make(fileName,compilerName)

finalCompiler = [];
switch lower(compilerName)
    case 'intel'
        archstr = computer('arch');
        if ~strcmpi(archstr,'maci64')
            CXXstring = 'CXX="icpc"';
        else
            CXXstring = 'CXX="/usr/local/bin/icpc"';
        end
        mex(fileName,CXXstring, 'CXXOPTIMFLAGS="$CXXOPTIMFLAGS -O2"',...
            'CXXFLAGS="$CXXFLAGS -qopenmp -mkl "',...
            'LDOPTIMFLAGS="$LDOPTIMFLAGS -liomp5"');
        finalCompiler = 'intel';
    case 'gcc'
        mex(fileName,'CXX="g++"', 'CXXOPTIMFLAGS=$CXXOPTIMFLAGS -O2',...
            'CXXFLAGS=$CXXFLAGS -fPIC -fopenmp -std=c++0x -opt-report=2 -opt-report-stdout ',...
            'LDFLAGS=$LDFLAGS -fPIC -fopenmp');
        finalCompiler = 'gcc';
    case 'cuda'
        mexcuda(fileName,'CXX="/usr/local/cuda/bin/nvcc"', '-v', 'CXXOPTIMFLAGS="$CXXOPTIMFLAGS -gencode arch=compute_35,code=sm_35  -gencode arch=compute_20,code=sm_20"',...
            'CXXFLAGS="$CXXFLAGS -I/usr/local/cuda/include -L/usr/local/cuda/lib -lcutil -lcudpp -lcuda -lcudart -Xcompiler -fopenmp"',...
            'LDFLAGS="\$LDFLAGS -lgomp -Xlinker -fopenmp"');
        finalCompiler = 'cuda';
    case 'llvm'
    case 'llvm-clang'
        try
        mex(fileName,'CXX="/usr/local/opt/llvm/bin/clang++"', 'CXXOPTIMFLAGS="$CXXOPTIMFLAGS -O2"',...
            'CXXFLAGS="$CXXFLAGS -I/usr/local/opt/llvm/include -fopenmp=libiomp5 -std=c++11 -opt-report=2 -opt-report-stdout"',...
            'LDFLAGS="$LDFLAGS -lc++ -fopenmp=libiomp5 -L/Applications/MATLAB_R2017b.app/sys/os/maci64/ -Wl,-rpath,/Applications/MATLAB_R2017b.app/sys/os/maci64/"');
        finalCompiler = 'clang';
        catch
            mex(fileName);
            finalCompiler = 'default';
        end
    otherwise
        mex(fileName);
        finalCompiler = 'default';

end
