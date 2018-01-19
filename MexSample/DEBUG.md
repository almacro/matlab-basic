# Debugging

This document has debugging output and system configuration infomation used to troubleshoot this issue.

1. Get the complete output of "ver" Command

```
>> ver
ver
-----------------------------------------------------------------------------------------------------
MATLAB Version: 9.3.0.713579 (R2017b)
MATLAB License Number: 40629527
Operating System: Linux 4.9.76-3.78.amzn1.x86_64 #1 SMP Fri Jan 12 19:51:35 UTC 2018 x86_64
Java Version: Java 1.8.0_121-b13 with Oracle Corporation Java HotSpot(TM) 64-Bit Server VM mixed mode
-----------------------------------------------------------------------------------------------------
MATLAB                                                Version 9.3         (R2017b)
Optimization Toolbox                                  Version 8.0         (R2017b)
Parallel Computing Toolbox                            Version 6.11        (R2017b)
Signal Processing Toolbox                             Version 7.5         (R2017b)
Statistics and Machine Learning Toolbox               Version 11.2        (R2017b)
```

2. Get complete output of following command: __getenv('LD_LIBRARY_PATH')__

```
>> getenv('LD_LIBRARY_PATH')
getenv('LD_LIBRARY_PATH')

ans =

    '/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/opengl/lib/glnxa64:/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64:/home/ec2-user/Developer/Tools/MATLAB/R2017b/bin/glnxa64:/home/ec2-user/Developer/Tools/MATLAB/\
R2017b/extern/lib/glnxa64:/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/java/jre/glnxa64/jre/lib/amd64/native_threads:/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/java/jre/glnxa64/jre/lib/amd64/server:/home/ec2-user/Devel\
oper/Tools/intel/compilers_and_libraries_2018.1.163/linux/compiler/lib/intel64:/home/ec2-user/Developer/Tools/intel/compilers_and_libraries_2018.1.163/linux/compiler/lib/intel64_lin:/home/ec2-user/Developer/Tools/intel/compilers\
_and_libraries_2018.1.163/linux/ipp/lib/intel64:/home/ec2-user/Developer/Tools/intel/compilers_and_libraries_2018.1.163/linux/compiler/lib/intel64_lin:/home/ec2-user/Developer/Tools/intel/compilers_and_libraries_2018.1.163/linux\
/mkl/lib/intel64_lin:/home/ec2-user/Developer/Tools/intel/compilers_and_libraries_2018.1.163/linux/tbb/lib/intel64/gcc4.7:/home/ec2-user/Developer/Tools/intel/compilers_and_libraries_2018.1.163/linux/tbb/lib/intel64/gcc4.7:/home\
/ec2-user/Developer/Tools/intel/debugger_2018/iga/lib:/home/ec2-user/Developer/Tools/intel/debugger_2018/libipt/intel64/lib:/home/ec2-user/Developer/Tools/intel/compilers_and_libraries_2018.1.163/linux/daal/lib/intel64_lin:/home\
/ec2-user/Developer/Tools/intel/compilers_and_libraries_2018.1.163/linux/compiler/lib/intel64:/home/ec2-user/Developer/Tools/intel/compilers_and_libraries_2018.1.163/linux/compiler/lib/intel64_lin:/home/ec2-user/Developer/Tools/\
intel/compilers_and_libraries_2018.1.163/linux/ipp/lib/intel64:/home/ec2-user/Developer/Tools/intel/compilers_and_libraries_2018.1.163/linux/compiler/lib/intel64_lin:/home/ec2-user/Developer/Tools/intel/compilers_and_libraries_2\
018.1.163/linux/mkl/lib/intel64_lin:/home/ec2-user/Developer/Tools/intel/compilers_and_libraries_2018.1.163/linux/tbb/lib/intel64/gcc4.7:/home/ec2-user/Developer/Tools/intel/compilers_and_libraries_2018.1.163/linux/tbb/lib/intel\
64/gcc4.7:/home/ec2-user/Developer/Tools/intel/debugger_2018/iga/lib:/home/ec2-user/Developer/Tools/intel/debugger_2018/libipt/intel64/lib:/home/ec2-user/Developer/Tools/intel/compilers_and_libraries_2018.1.163/linux/daal/lib/in\
tel64_lin:/home/ec2-user/Developer/Tools/intel/compilers_and_libraries_2018.1.163/linux/daal/../tbb/lib/intel64_lin/gcc4.4'

```
