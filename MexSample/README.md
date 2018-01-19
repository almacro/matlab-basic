# Basic Mex project

This directory defines perhaps the simplest possible MATLAB Mex project.
While the code is very simple, it can be used as a basic check for sanity of the MATLAB environment, compilers and Mex setup.

In one instance, I have on premise CentOS servers with MATLAB, GCC and Intel Composer C/C++ libraries with all the attendant MKL and OpenMP goodnesses.
On these hosts, a simple build and run of the sample has output like this:

```
[devx@localhost matlab-basic]$ matlab
MATLAB is selecting SOFTWARE OPENGL rendering.

                            < M A T L A B (R) >
                  Copyright 1984-2016 The MathWorks, Inc.
                   R2016b (9.1.0.441655) 64-bit (glnxa64)
                             September 7, 2016


To get started, type one of these: helpwin, helpdesk, or demo.
For product information, visit www.mathworks.com.

>> cd MexSample
cd MexSample
>> make('test.cpp','intel')
make('test.cpp','intel')
Building with 'g++'.
MEX completed successfully.

ans = 

intel

>> test
test
#procs   = 32
#threads = 1
>> exit
exit
```

On a newly installed cloud host, I get much different results. Using the same script I used for on-premises hosts to kick off the build,
I get a successful build but a run that fails:

```
[ec2-user@ip-10-1-1-101 MexSample]$ matlab
MATLAB is selecting SOFTWARE OPENGL rendering.

                            < M A T L A B (R) >
                  Copyright 1984-2017 The MathWorks, Inc.
                   R2017b (9.3.0.713579) 64-bit (glnxa64)
                             September 14, 2017


To get started, type one of these: helpwin, helpdesk, or demo.
For product information, visit www.mathworks.com.

>> make('test.cpp','intel')
make('test.cpp','intel')
Building with 'g++'.
Warning: You are using gcc version '6.4.1-1)'. The version of gcc is not
supported. The version currently supported with MEX is '4.9.x'. For a list of
currently supported compilers see:
http://www.mathworks.com/support/compilers/current_release. 
> In make (line 12)
MEX completed successfully.

ans =

    'intel'

>> test
test
Invalid MEX-file '/home/ec2-user/Developer/Workspace/MexSample/test.mexa64':
Missing symbol 'abort' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'calloc' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'catgets' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'catopen' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol '__errno_location' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'exit' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'fclose' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'feof' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'fgets' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'fopen' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol '__fprintf_chk' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'fread' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'free' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'fseek' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'ftell' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'getenv' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'getpid' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'malloc' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'memcmp' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'memcpy' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'memmove' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'memset' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol '__printf_chk' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'readlink' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'realloc' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'setenv' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'sigaction' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'siglongjmp' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol '__sigsetjmp' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'snprintf' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol '__snprintf_chk' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol '__sprintf_chk' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol '__stack_chk_fail' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'stderr' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'strchr' required by
glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol '__strncat_chk' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'strncpy' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'strpbrk' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'strrchr' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'strspn' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'strstr' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'strtok' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol '__vsprintf_chk' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol '__xpg_basename' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol '__intel_skx_avx512_memcpy' required by
'/home/ec2-user/Developer/Tools/intel/compilers_and_libraries_2018.1.163/linux/compiler/lib/intel64/libirng.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'.~
```

These dependencies look pretty basic (C library, dynamic loaded library, Intel malloc primitive, etc). I thought of turning off dynamic loading of shared objects together by building the code to be statically linked. To do this I inserted this line after line 13 in  [make.m](./make.m):

```
            'LDTYPE="-static"',...
```

This change caused the build to fail with:

```
[ec2-user@ip-10-1-1-101 MexSample]$ matlab
MATLAB is selecting SOFTWARE OPENGL rendering.

                            < M A T L A B (R) >
                  Copyright 1984-2017 The MathWorks, Inc.
                   R2017b (9.3.0.713579) 64-bit (glnxa64)
                             September 14, 2017


To get started, type one of these: helpwin, helpdesk, or demo.
For product information, visit www.mathworks.com.

>> make('test.cpp','intel')
make('test.cpp','intel')
Building with 'g++'.
Warning: You are using gcc version '6.4.1-1)'. The version of gcc is not
supported. The version currently supported with MEX is '4.9.x'. For a list of
currently supported compilers see:
http://www.mathworks.com/support/compilers/current_release. 
> In make (line 12)
Error using mex
ld: cannot find -lmx
ld: cannot find -lmex
ld: cannot find -lmat
ld: cannot find -lm
ld: cannot find -lm
ld: cannot find -lpthread
ld: cannot find -lc
ld: cannot find -ldl
ld: cannot find -lc


Error in make (line 12)
	mex(fileName,CXXstring, 'CXXOPTIMFLAGS="$CXXOPTIMFLAGS -O2"',...
```


I thought that perhaps I could fake this out by adding ```-L/lib64``` to ```LDFLAGS``` to try give a hint on the libraries location. 
With this edit, line 14 of [make.m](./make.m) added above changes to:

```
            'LDTYPE="-static"',	'LDFLAGS="$LDFLAGS -L/lib4"`,...  
````

But this gives the same build result:

```
> In make (line 12)
Error using mex
ld: cannot find -lmx
ld: cannot find -lmex
ld: cannot find -lmat
ld: cannot find -lm
ld: cannot find -lm
ld: cannot find -lpthread
ld: cannot find -lc
ld: cannot find -ldl
ld: cannot find -lc
```


I next removed LD_TYPE leaving only the LDFLAGS setting. After this change, line 14 reads as:

```
            'LDFLAGS="$LDFLAGS -L/lib64"',...
```

This lets the code compile again but gives a familiar error on the run attempt:

```
Invalid MEX-file '/home/ec2-user/Developer/Workspace/MexSample/test.mexa64':
Missing symbol 'abort' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'calloc' required by
'/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libintlc.so.5->/home/ec2-user/Developer/Tools/MATLAB/R2017b/sys/os/glnxa64/libimf.so->/home/ec2-user/Developer/Workspace/MexSample/test.mexa64'
Missing symbol 'catgets' required by
```

Still debugging...