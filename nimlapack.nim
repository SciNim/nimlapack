when defined(windows):
  const
    libSuffix = ".dll"
    libPrefix = "(lib|)"
    lapack {.strdefine.} = "(lapack|openblas|mkl_intel_lp64)"
elif defined(macosx):
  const
    libSuffix = ".dylib"
    libPrefix = "lib"
    lapack {.strdefine.} = "(lapack|openblas)"
else:
  const
    libSuffix = ".so(|.3|.2|.1|.0)"
    libPrefix = "lib"
    lapack {.strdefine.} = "lapack"

const
  libName = libPrefix & lapack & libSuffix

{.hint:
  if '|' in libName:
    "Using LAPACK library matching pattern: " & libName
  else:
    "Using LAPACK library with name: " & libName
.}


type
  lapack_complex_float* = object
    re*, im*: cfloat
  lapack_complex_double* = object
    re*, im*: cdouble
##  LAPACK 3.3.0

##  LAPACK 3.4.0

##  LAPACK 3.X.X

## ****************************************************************************
##   Copyright (c) 2010, Intel Corp.
##   All rights reserved.
##
##   Redistribution and use in source and binary forms, with or without
##   modification, are permitted provided that the following conditions are met:
##
##  Redistributions of source code must retain the above copyright notice,
##       this list of conditions and the following disclaimer.
##  Redistributions in binary form must reproduce the above copyright
##       notice, this list of conditions and the following disclaimer in the
##       documentation and/or other materials provided with the distribution.
##  Neither the name of Intel Corporation nor the names of its contributors
##       may be used to endorse or promote products derived from this software
##       without specific prior written permission.
##
##   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
##   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
##   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
##   ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
##   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
##   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
##   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
##   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
##   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
##   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
##   THE POSSIBILITY OF SUCH DAMAGE.
## *****************************************************************************
##  Contents: Native C interface to LAPACK
##  Author: Intel Corporation
##  Generated November, 2011
## ***************************************************************************
##
##   Turn on HAVE_LAPACK_CONFIG_H to redefine C-LAPACK datatypes
##

##  Complex types are structures equivalent to the
##  Fortran complex types COMPLEX(4) and COMPLEX(8).
##
##  One can also redefine the types with his own types
##  for example by including in the code definitions like
##
##  #define lapack_complex_float std::complex<float>
##  #define lapack_complex_double std::complex<double>
##
##  or define these types in the command line:
##
##  -Dlapack_complex_float="std::complex<float>"
##  -Dlapack_complex_double="std::complex<double>"
##

template C2INT*(x: untyped): untyped =
  (int)((cast[ptr cfloat](addr(x)))[])

template Z2INT*(x: untyped): untyped =
  (int)((cast[ptr cdouble](addr(x)))[])

const
  ROW_MAJOR* = 101
  COL_MAJOR* = 102
  WORK_MEMORY_ERROR* = - 1010
  TRANSPOSE_MEMORY_ERROR* = - 1011

##  Callback logical functions of one, two, or three arguments are used
##   to select eigenvalues to sort to the top left of the Schur form.
##   The value is selected if function returns TRUE (non-zero).

type
  S_SELECT2* = proc (a2: ptr cfloat; a3: ptr cfloat): cint {.cdecl.}
  S_SELECT3* = proc (a2: ptr cfloat; a3: ptr cfloat; a4: ptr cfloat): cint {.cdecl.}
  D_SELECT2* = proc (a2: ptr cdouble; a3: ptr cdouble): cint {.cdecl.}
  D_SELECT3* = proc (a2: ptr cdouble; a3: ptr cdouble; a4: ptr cdouble): cint {.cdecl.}
  C_SELECT1* = proc (a2: ptr lapack_complex_float): cint {.cdecl.}
  C_SELECT2* = proc (a2: ptr lapack_complex_float; a3: ptr lapack_complex_float): cint {.
      cdecl.}
  Z_SELECT1* = proc (a2: ptr lapack_complex_double): cint {.cdecl.}
  Z_SELECT2* = proc (a2: ptr lapack_complex_double; a3: ptr lapack_complex_double): cint {.
      cdecl.}

proc sgetrf*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint;
            info: ptr cint) {.cdecl, importc: "sgetrf_", dynlib: libName.}
proc dgetrf*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint;
            info: ptr cint) {.cdecl, importc: "dgetrf_", dynlib: libName.}
proc cgetrf*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            ipiv: ptr cint; info: ptr cint) {.cdecl, importc: "cgetrf_", dynlib: libName.}
proc zgetrf*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            ipiv: ptr cint; info: ptr cint) {.cdecl, importc: "zgetrf_", dynlib: libName.}
proc sgbtrf*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cfloat;
            ldab: ptr cint; ipiv: ptr cint; info: ptr cint) {.cdecl, importc: "sgbtrf_",
    dynlib: libName.}
proc dgbtrf*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cdouble;
            ldab: ptr cint; ipiv: ptr cint; info: ptr cint) {.cdecl, importc: "dgbtrf_",
    dynlib: libName.}
proc cgbtrf*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint;
            ab: ptr lapack_complex_float; ldab: ptr cint; ipiv: ptr cint; info: ptr cint) {.
    cdecl, importc: "cgbtrf_", dynlib: libName.}
proc zgbtrf*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint;
            ab: ptr lapack_complex_double; ldab: ptr cint; ipiv: ptr cint; info: ptr cint) {.
    cdecl, importc: "zgbtrf_", dynlib: libName.}
proc sgttrf*(n: ptr cint; dl: ptr cfloat; d: ptr cfloat; du: ptr cfloat; du2: ptr cfloat;
            ipiv: ptr cint; info: ptr cint) {.cdecl, importc: "sgttrf_", dynlib: libName.}
proc dgttrf*(n: ptr cint; dl: ptr cdouble; d: ptr cdouble; du: ptr cdouble; du2: ptr cdouble;
            ipiv: ptr cint; info: ptr cint) {.cdecl, importc: "dgttrf_", dynlib: libName.}
proc cgttrf*(n: ptr cint; dl: ptr lapack_complex_float; d: ptr lapack_complex_float;
            du: ptr lapack_complex_float; du2: ptr lapack_complex_float;
            ipiv: ptr cint; info: ptr cint) {.cdecl, importc: "cgttrf_", dynlib: libName.}
proc zgttrf*(n: ptr cint; dl: ptr lapack_complex_double; d: ptr lapack_complex_double;
            du: ptr lapack_complex_double; du2: ptr lapack_complex_double;
            ipiv: ptr cint; info: ptr cint) {.cdecl, importc: "zgttrf_", dynlib: libName.}
proc spotrf*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; info: ptr cint) {.cdecl,
    importc: "spotrf_", dynlib: libName.}
proc dpotrf*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; info: ptr cint) {.
    cdecl, importc: "dpotrf_", dynlib: libName.}
proc cpotrf*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            info: ptr cint) {.cdecl, importc: "cpotrf_", dynlib: libName.}
proc zpotrf*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            info: ptr cint) {.cdecl, importc: "zpotrf_", dynlib: libName.}
proc dpstrf*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; piv: ptr cint;
            rank: ptr cint; tol: ptr cdouble; work: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dpstrf_", dynlib: libName.}
proc spstrf*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; piv: ptr cint;
            rank: ptr cint; tol: ptr cfloat; work: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "spstrf_", dynlib: libName.}
proc zpstrf*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            piv: ptr cint; rank: ptr cint; tol: ptr cdouble; work: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "zpstrf_", dynlib: libName.}
proc cpstrf*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            piv: ptr cint; rank: ptr cint; tol: ptr cfloat; work: ptr cfloat; info: ptr cint) {.
    cdecl, importc: "cpstrf_", dynlib: libName.}
proc dpftrf*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble; info: ptr cint) {.
    cdecl, importc: "dpftrf_", dynlib: libName.}
proc spftrf*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat; info: ptr cint) {.
    cdecl, importc: "spftrf_", dynlib: libName.}
proc zpftrf*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr lapack_complex_double;
            info: ptr cint) {.cdecl, importc: "zpftrf_", dynlib: libName.}
proc cpftrf*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr lapack_complex_float;
            info: ptr cint) {.cdecl, importc: "cpftrf_", dynlib: libName.}
proc spptrf*(uplo: cstring; n: ptr cint; ap: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "spptrf_", dynlib: libName.}
proc dpptrf*(uplo: cstring; n: ptr cint; ap: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dpptrf_", dynlib: libName.}
proc cpptrf*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_float; info: ptr cint) {.
    cdecl, importc: "cpptrf_", dynlib: libName.}
proc zpptrf*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_double; info: ptr cint) {.
    cdecl, importc: "zpptrf_", dynlib: libName.}
proc spbtrf*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cfloat; ldab: ptr cint;
            info: ptr cint) {.cdecl, importc: "spbtrf_", dynlib: libName.}
proc dpbtrf*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cdouble; ldab: ptr cint;
            info: ptr cint) {.cdecl, importc: "dpbtrf_", dynlib: libName.}
proc cpbtrf*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr lapack_complex_float;
            ldab: ptr cint; info: ptr cint) {.cdecl, importc: "cpbtrf_", dynlib: libName.}
proc zpbtrf*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr lapack_complex_double;
            ldab: ptr cint; info: ptr cint) {.cdecl, importc: "zpbtrf_", dynlib: libName.}
proc spttrf*(n: ptr cint; d: ptr cfloat; e: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "spttrf_", dynlib: libName.}
proc dpttrf*(n: ptr cint; d: ptr cdouble; e: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dpttrf_", dynlib: libName.}
proc cpttrf*(n: ptr cint; d: ptr cfloat; e: ptr lapack_complex_float; info: ptr cint) {.
    cdecl, importc: "cpttrf_", dynlib: libName.}
proc zpttrf*(n: ptr cint; d: ptr cdouble; e: ptr lapack_complex_double; info: ptr cint) {.
    cdecl, importc: "zpttrf_", dynlib: libName.}
proc ssytrf*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "ssytrf_", dynlib: libName.}
proc dsytrf*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dsytrf_", dynlib: libName.}
proc csytrf*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            ipiv: ptr cint; work: ptr lapack_complex_float; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "csytrf_", dynlib: libName.}
proc zsytrf*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            ipiv: ptr cint; work: ptr lapack_complex_double; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "zsytrf_", dynlib: libName.}
proc chetrf*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            ipiv: ptr cint; work: ptr lapack_complex_float; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "chetrf_", dynlib: libName.}
proc zhetrf*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            ipiv: ptr cint; work: ptr lapack_complex_double; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "zhetrf_", dynlib: libName.}
proc ssptrf*(uplo: cstring; n: ptr cint; ap: ptr cfloat; ipiv: ptr cint; info: ptr cint) {.
    cdecl, importc: "ssptrf_", dynlib: libName.}
proc dsptrf*(uplo: cstring; n: ptr cint; ap: ptr cdouble; ipiv: ptr cint; info: ptr cint) {.
    cdecl, importc: "dsptrf_", dynlib: libName.}
proc csptrf*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_float; ipiv: ptr cint;
            info: ptr cint) {.cdecl, importc: "csptrf_", dynlib: libName.}
proc zsptrf*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_double; ipiv: ptr cint;
            info: ptr cint) {.cdecl, importc: "zsptrf_", dynlib: libName.}
proc chptrf*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_float; ipiv: ptr cint;
            info: ptr cint) {.cdecl, importc: "chptrf_", dynlib: libName.}
proc zhptrf*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_double; ipiv: ptr cint;
            info: ptr cint) {.cdecl, importc: "zhptrf_", dynlib: libName.}
proc sgetrs*(trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgetrs_", dynlib: libName.}
proc dgetrs*(trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgetrs_", dynlib: libName.}
proc cgetrs*(trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; ipiv: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint;
            info: ptr cint) {.cdecl, importc: "cgetrs_", dynlib: libName.}
proc zgetrs*(trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; ipiv: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
            info: ptr cint) {.cdecl, importc: "zgetrs_", dynlib: libName.}
proc sgbtrs*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint;
            ab: ptr cfloat; ldab: ptr cint; ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint;
            info: ptr cint) {.cdecl, importc: "sgbtrs_", dynlib: libName.}
proc dgbtrs*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint;
            ab: ptr cdouble; ldab: ptr cint; ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint;
            info: ptr cint) {.cdecl, importc: "dgbtrs_", dynlib: libName.}
proc cgbtrs*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint;
            ab: ptr lapack_complex_float; ldab: ptr cint; ipiv: ptr cint;
            b: ptr lapack_complex_float; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "cgbtrs_", dynlib: libName.}
proc zgbtrs*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint;
            ab: ptr lapack_complex_double; ldab: ptr cint; ipiv: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "zgbtrs_", dynlib: libName.}
proc sgttrs*(trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr cfloat; d: ptr cfloat;
            du: ptr cfloat; du2: ptr cfloat; ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint;
            info: ptr cint) {.cdecl, importc: "sgttrs_", dynlib: libName.}
proc dgttrs*(trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr cdouble; d: ptr cdouble;
            du: ptr cdouble; du2: ptr cdouble; ipiv: ptr cint; b: ptr cdouble;
            ldb: ptr cint; info: ptr cint) {.cdecl, importc: "dgttrs_", dynlib: libName.}
proc cgttrs*(trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr lapack_complex_float;
            d: ptr lapack_complex_float; du: ptr lapack_complex_float;
            du2: ptr lapack_complex_float; ipiv: ptr cint;
            b: ptr lapack_complex_float; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "cgttrs_", dynlib: libName.}
proc zgttrs*(trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr lapack_complex_double;
            d: ptr lapack_complex_double; du: ptr lapack_complex_double;
            du2: ptr lapack_complex_double; ipiv: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "zgttrs_", dynlib: libName.}
proc spotrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            b: ptr cfloat; ldb: ptr cint; info: ptr cint) {.cdecl, importc: "spotrs_",
    dynlib: libName.}
proc dpotrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; info: ptr cint) {.cdecl, importc: "dpotrs_",
    dynlib: libName.}
proc cpotrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "cpotrs_", dynlib: libName.}
proc zpotrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "zpotrs_", dynlib: libName.}
proc dpftrs*(transr: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
            b: ptr cdouble; ldb: ptr cint; info: ptr cint) {.cdecl, importc: "dpftrs_",
    dynlib: libName.}
proc spftrs*(transr: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
            b: ptr cfloat; ldb: ptr cint; info: ptr cint) {.cdecl, importc: "spftrs_",
    dynlib: libName.}
proc zpftrs*(transr: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr lapack_complex_double; b: ptr lapack_complex_double; ldb: ptr cint;
            info: ptr cint) {.cdecl, importc: "zpftrs_", dynlib: libName.}
proc cpftrs*(transr: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr lapack_complex_float; b: ptr lapack_complex_float; ldb: ptr cint;
            info: ptr cint) {.cdecl, importc: "cpftrs_", dynlib: libName.}
proc spptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cfloat; b: ptr cfloat;
            ldb: ptr cint; info: ptr cint) {.cdecl, importc: "spptrs_", dynlib: libName.}
proc dpptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cdouble; b: ptr cdouble;
            ldb: ptr cint; info: ptr cint) {.cdecl, importc: "dpptrs_", dynlib: libName.}
proc cpptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr lapack_complex_float;
            b: ptr lapack_complex_float; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "cpptrs_", dynlib: libName.}
proc zpptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr lapack_complex_double;
            b: ptr lapack_complex_double; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "zpptrs_", dynlib: libName.}
proc spbtrs*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint; ab: ptr cfloat;
            ldab: ptr cint; b: ptr cfloat; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "spbtrs_", dynlib: libName.}
proc dpbtrs*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint; ab: ptr cdouble;
            ldab: ptr cint; b: ptr cdouble; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "dpbtrs_", dynlib: libName.}
proc cpbtrs*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint;
            ab: ptr lapack_complex_float; ldab: ptr cint; b: ptr lapack_complex_float;
            ldb: ptr cint; info: ptr cint) {.cdecl, importc: "cpbtrs_", dynlib: libName.}
proc zpbtrs*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint;
            ab: ptr lapack_complex_double; ldab: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "zpbtrs_", dynlib: libName.}
proc spttrs*(n: ptr cint; nrhs: ptr cint; d: ptr cfloat; e: ptr cfloat; b: ptr cfloat;
            ldb: ptr cint; info: ptr cint) {.cdecl, importc: "spttrs_", dynlib: libName.}
proc dpttrs*(n: ptr cint; nrhs: ptr cint; d: ptr cdouble; e: ptr cdouble; b: ptr cdouble;
            ldb: ptr cint; info: ptr cint) {.cdecl, importc: "dpttrs_", dynlib: libName.}
proc cpttrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; d: ptr cfloat;
            e: ptr lapack_complex_float; b: ptr lapack_complex_float; ldb: ptr cint;
            info: ptr cint) {.cdecl, importc: "cpttrs_", dynlib: libName.}
proc zpttrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; d: ptr cdouble;
            e: ptr lapack_complex_double; b: ptr lapack_complex_double; ldb: ptr cint;
            info: ptr cint) {.cdecl, importc: "zpttrs_", dynlib: libName.}
proc ssytrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "ssytrs_", dynlib: libName.}
proc dsytrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "dsytrs_", dynlib: libName.}
proc csytrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; ipiv: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint;
            info: ptr cint) {.cdecl, importc: "csytrs_", dynlib: libName.}
proc zsytrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; ipiv: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
            info: ptr cint) {.cdecl, importc: "zsytrs_", dynlib: libName.}
proc chetrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; ipiv: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint;
            info: ptr cint) {.cdecl, importc: "chetrs_", dynlib: libName.}
proc zhetrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; ipiv: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
            info: ptr cint) {.cdecl, importc: "zhetrs_", dynlib: libName.}
proc ssptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cfloat; ipiv: ptr cint;
            b: ptr cfloat; ldb: ptr cint; info: ptr cint) {.cdecl, importc: "ssptrs_",
    dynlib: libName.}
proc dsptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cdouble; ipiv: ptr cint;
            b: ptr cdouble; ldb: ptr cint; info: ptr cint) {.cdecl, importc: "dsptrs_",
    dynlib: libName.}
proc csptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr lapack_complex_float;
            ipiv: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "csptrs_", dynlib: libName.}
proc zsptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr lapack_complex_double;
            ipiv: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "zsptrs_", dynlib: libName.}
proc chptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr lapack_complex_float;
            ipiv: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "chptrs_", dynlib: libName.}
proc zhptrs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr lapack_complex_double;
            ipiv: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "zhptrs_", dynlib: libName.}
proc strtrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "strtrs_", dynlib: libName.}
proc dtrtrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "dtrtrs_", dynlib: libName.}
proc ctrtrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; b: ptr lapack_complex_float;
            ldb: ptr cint; info: ptr cint) {.cdecl, importc: "ctrtrs_", dynlib: libName.}
proc ztrtrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint; b: ptr lapack_complex_double;
            ldb: ptr cint; info: ptr cint) {.cdecl, importc: "ztrtrs_", dynlib: libName.}
proc stptrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr cfloat; b: ptr cfloat; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "stptrs_", dynlib: libName.}
proc dtptrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr cdouble; b: ptr cdouble; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "dtptrs_", dynlib: libName.}
proc ctptrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr lapack_complex_float; b: ptr lapack_complex_float; ldb: ptr cint;
            info: ptr cint) {.cdecl, importc: "ctptrs_", dynlib: libName.}
proc ztptrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr lapack_complex_double; b: ptr lapack_complex_double;
            ldb: ptr cint; info: ptr cint) {.cdecl, importc: "ztptrs_", dynlib: libName.}
proc stbtrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            nrhs: ptr cint; ab: ptr cfloat; ldab: ptr cint; b: ptr cfloat; ldb: ptr cint;
            info: ptr cint) {.cdecl, importc: "stbtrs_", dynlib: libName.}
proc dtbtrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            nrhs: ptr cint; ab: ptr cdouble; ldab: ptr cint; b: ptr cdouble; ldb: ptr cint;
            info: ptr cint) {.cdecl, importc: "dtbtrs_", dynlib: libName.}
proc ctbtrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            nrhs: ptr cint; ab: ptr lapack_complex_float; ldab: ptr cint;
            b: ptr lapack_complex_float; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "ctbtrs_", dynlib: libName.}
proc ztbtrs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            nrhs: ptr cint; ab: ptr lapack_complex_double; ldab: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "ztbtrs_", dynlib: libName.}
proc sgecon*(norm: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; anorm: ptr cfloat;
            rcond: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgecon_", dynlib: libName.}
proc dgecon*(norm: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; anorm: ptr cdouble;
            rcond: ptr cdouble; work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgecon_", dynlib: libName.}
proc cgecon*(norm: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            anorm: ptr cfloat; rcond: ptr cfloat; work: ptr lapack_complex_float;
            rwork: ptr cfloat; info: ptr cint) {.cdecl, importc: "cgecon_",
    dynlib: libName.}
proc zgecon*(norm: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr lapack_complex_double;
            rwork: ptr cdouble; info: ptr cint) {.cdecl, importc: "zgecon_",
    dynlib: libName.}
proc sgbcon*(norm: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cfloat;
            ldab: ptr cint; ipiv: ptr cint; anorm: ptr cfloat; rcond: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgbcon_", dynlib: libName.}
proc dgbcon*(norm: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cdouble;
            ldab: ptr cint; ipiv: ptr cint; anorm: ptr cdouble; rcond: ptr cdouble;
            work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgbcon_", dynlib: libName.}
proc cgbcon*(norm: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
            ab: ptr lapack_complex_float; ldab: ptr cint; ipiv: ptr cint;
            anorm: ptr cfloat; rcond: ptr cfloat; work: ptr lapack_complex_float;
            rwork: ptr cfloat; info: ptr cint) {.cdecl, importc: "cgbcon_",
    dynlib: libName.}
proc zgbcon*(norm: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
            ab: ptr lapack_complex_double; ldab: ptr cint; ipiv: ptr cint;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr lapack_complex_double;
            rwork: ptr cdouble; info: ptr cint) {.cdecl, importc: "zgbcon_",
    dynlib: libName.}
proc sgtcon*(norm: cstring; n: ptr cint; dl: ptr cfloat; d: ptr cfloat; du: ptr cfloat;
            du2: ptr cfloat; ipiv: ptr cint; anorm: ptr cfloat; rcond: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgtcon_", dynlib: libName.}
proc dgtcon*(norm: cstring; n: ptr cint; dl: ptr cdouble; d: ptr cdouble; du: ptr cdouble;
            du2: ptr cdouble; ipiv: ptr cint; anorm: ptr cdouble; rcond: ptr cdouble;
            work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgtcon_", dynlib: libName.}
proc cgtcon*(norm: cstring; n: ptr cint; dl: ptr lapack_complex_float;
            d: ptr lapack_complex_float; du: ptr lapack_complex_float;
            du2: ptr lapack_complex_float; ipiv: ptr cint; anorm: ptr cfloat;
            rcond: ptr cfloat; work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "cgtcon_", dynlib: libName.}
proc zgtcon*(norm: cstring; n: ptr cint; dl: ptr lapack_complex_double;
            d: ptr lapack_complex_double; du: ptr lapack_complex_double;
            du2: ptr lapack_complex_double; ipiv: ptr cint; anorm: ptr cdouble;
            rcond: ptr cdouble; work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zgtcon_", dynlib: libName.}
proc spocon*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; anorm: ptr cfloat;
            rcond: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "spocon_", dynlib: libName.}
proc dpocon*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; anorm: ptr cdouble;
            rcond: ptr cdouble; work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dpocon_", dynlib: libName.}
proc cpocon*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            anorm: ptr cfloat; rcond: ptr cfloat; work: ptr lapack_complex_float;
            rwork: ptr cfloat; info: ptr cint) {.cdecl, importc: "cpocon_",
    dynlib: libName.}
proc zpocon*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr lapack_complex_double;
            rwork: ptr cdouble; info: ptr cint) {.cdecl, importc: "zpocon_",
    dynlib: libName.}
proc sppcon*(uplo: cstring; n: ptr cint; ap: ptr cfloat; anorm: ptr cfloat;
            rcond: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sppcon_", dynlib: libName.}
proc dppcon*(uplo: cstring; n: ptr cint; ap: ptr cdouble; anorm: ptr cdouble;
            rcond: ptr cdouble; work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dppcon_", dynlib: libName.}
proc cppcon*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_float; anorm: ptr cfloat;
            rcond: ptr cfloat; work: ptr lapack_complex_float; rwork: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "cppcon_", dynlib: libName.}
proc zppcon*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_double;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr lapack_complex_double;
            rwork: ptr cdouble; info: ptr cint) {.cdecl, importc: "zppcon_",
    dynlib: libName.}
proc spbcon*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cfloat; ldab: ptr cint;
            anorm: ptr cfloat; rcond: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "spbcon_", dynlib: libName.}
proc dpbcon*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cdouble; ldab: ptr cint;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dpbcon_", dynlib: libName.}
proc cpbcon*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr lapack_complex_float;
            ldab: ptr cint; anorm: ptr cfloat; rcond: ptr cfloat;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cpbcon_", dynlib: libName.}
proc zpbcon*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr lapack_complex_double;
            ldab: ptr cint; anorm: ptr cdouble; rcond: ptr cdouble;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zpbcon_", dynlib: libName.}
proc sptcon*(n: ptr cint; d: ptr cfloat; e: ptr cfloat; anorm: ptr cfloat; rcond: ptr cfloat;
            work: ptr cfloat; info: ptr cint) {.cdecl, importc: "sptcon_",
    dynlib: libName.}
proc dptcon*(n: ptr cint; d: ptr cdouble; e: ptr cdouble; anorm: ptr cdouble;
            rcond: ptr cdouble; work: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dptcon_", dynlib: libName.}
proc cptcon*(n: ptr cint; d: ptr cfloat; e: ptr lapack_complex_float; anorm: ptr cfloat;
            rcond: ptr cfloat; work: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cptcon_", dynlib: libName.}
proc zptcon*(n: ptr cint; d: ptr cdouble; e: ptr lapack_complex_double;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr cdouble; info: ptr cint) {.
    cdecl, importc: "zptcon_", dynlib: libName.}
proc ssycon*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint;
            anorm: ptr cfloat; rcond: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "ssycon_", dynlib: libName.}
proc dsycon*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dsycon_", dynlib: libName.}
proc csycon*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            ipiv: ptr cint; anorm: ptr cfloat; rcond: ptr cfloat;
            work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "csycon_", dynlib: libName.}
proc zsycon*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            ipiv: ptr cint; anorm: ptr cdouble; rcond: ptr cdouble;
            work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zsycon_", dynlib: libName.}
proc checon*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            ipiv: ptr cint; anorm: ptr cfloat; rcond: ptr cfloat;
            work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "checon_", dynlib: libName.}
proc zhecon*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            ipiv: ptr cint; anorm: ptr cdouble; rcond: ptr cdouble;
            work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zhecon_", dynlib: libName.}
proc sspcon*(uplo: cstring; n: ptr cint; ap: ptr cfloat; ipiv: ptr cint; anorm: ptr cfloat;
            rcond: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sspcon_", dynlib: libName.}
proc dspcon*(uplo: cstring; n: ptr cint; ap: ptr cdouble; ipiv: ptr cint;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dspcon_", dynlib: libName.}
proc cspcon*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_float; ipiv: ptr cint;
            anorm: ptr cfloat; rcond: ptr cfloat; work: ptr lapack_complex_float;
            info: ptr cint) {.cdecl, importc: "cspcon_", dynlib: libName.}
proc zspcon*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_double; ipiv: ptr cint;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr lapack_complex_double;
            info: ptr cint) {.cdecl, importc: "zspcon_", dynlib: libName.}
proc chpcon*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_float; ipiv: ptr cint;
            anorm: ptr cfloat; rcond: ptr cfloat; work: ptr lapack_complex_float;
            info: ptr cint) {.cdecl, importc: "chpcon_", dynlib: libName.}
proc zhpcon*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_double; ipiv: ptr cint;
            anorm: ptr cdouble; rcond: ptr cdouble; work: ptr lapack_complex_double;
            info: ptr cint) {.cdecl, importc: "zhpcon_", dynlib: libName.}
proc strcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; a: ptr cfloat;
            lda: ptr cint; rcond: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "strcon_", dynlib: libName.}
proc dtrcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; a: ptr cdouble;
            lda: ptr cint; rcond: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dtrcon_", dynlib: libName.}
proc ctrcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; rcond: ptr cfloat;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "ctrcon_", dynlib: libName.}
proc ztrcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint; rcond: ptr cdouble;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "ztrcon_", dynlib: libName.}
proc stpcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; ap: ptr cfloat;
            rcond: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "stpcon_", dynlib: libName.}
proc dtpcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; ap: ptr cdouble;
            rcond: ptr cdouble; work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dtpcon_", dynlib: libName.}
proc ctpcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint;
            ap: ptr lapack_complex_float; rcond: ptr cfloat;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "ctpcon_", dynlib: libName.}
proc ztpcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint;
            ap: ptr lapack_complex_double; rcond: ptr cdouble;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "ztpcon_", dynlib: libName.}
proc stbcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr cfloat; ldab: ptr cint; rcond: ptr cfloat; work: ptr cfloat;
            iwork: ptr cint; info: ptr cint) {.cdecl, importc: "stbcon_", dynlib: libName.}
proc dtbcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr cdouble; ldab: ptr cint; rcond: ptr cdouble; work: ptr cdouble;
            iwork: ptr cint; info: ptr cint) {.cdecl, importc: "dtbcon_", dynlib: libName.}
proc ctbcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr lapack_complex_float; ldab: ptr cint; rcond: ptr cfloat;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "ctbcon_", dynlib: libName.}
proc ztbcon*(norm: cstring; uplo: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr lapack_complex_double; ldab: ptr cint; rcond: ptr cdouble;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "ztbcon_", dynlib: libName.}
proc sgerfs*(trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            af: ptr cfloat; ldaf: ptr cint; ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint;
            x: ptr cfloat; ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgerfs_", dynlib: libName.}
proc dgerfs*(trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            af: ptr cdouble; ldaf: ptr cint; ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint;
            x: ptr cdouble; ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgerfs_", dynlib: libName.}
proc cgerfs*(trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; af: ptr lapack_complex_float; ldaf: ptr cint; ipiv: ptr cint;
            b: ptr lapack_complex_float; ldb: ptr cint; x: ptr lapack_complex_float;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cgerfs_", dynlib: libName.}
proc zgerfs*(trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; af: ptr lapack_complex_double; ldaf: ptr cint; ipiv: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; x: ptr lapack_complex_double;
            ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zgerfs_", dynlib: libName.}
proc dgerfsx*(trans: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
             lda: ptr cint; af: ptr cdouble; ldaf: ptr cint; ipiv: ptr cint; r: ptr cdouble;
             c: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
             rcond: ptr cdouble; berr: ptr cdouble; n_err_bnds: ptr cint;
             err_bnds_norm: ptr cdouble; err_bnds_comp: ptr cdouble;
             nparams: ptr cint; params: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
             info: ptr cint) {.cdecl, importc: "dgerfsx_", dynlib: libName.}
proc sgerfsx*(trans: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
             lda: ptr cint; af: ptr cfloat; ldaf: ptr cint; ipiv: ptr cint; r: ptr cfloat;
             c: ptr cfloat; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint;
             rcond: ptr cfloat; berr: ptr cfloat; n_err_bnds: ptr cint;
             err_bnds_norm: ptr cfloat; err_bnds_comp: ptr cfloat; nparams: ptr cint;
             params: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgerfsx_", dynlib: libName.}
proc zgerfsx*(trans: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint;
             a: ptr lapack_complex_double; lda: ptr cint;
             af: ptr lapack_complex_double; ldaf: ptr cint; ipiv: ptr cint;
             r: ptr cdouble; c: ptr cdouble; b: ptr lapack_complex_double; ldb: ptr cint;
             x: ptr lapack_complex_double; ldx: ptr cint; rcond: ptr cdouble;
             berr: ptr cdouble; n_err_bnds: ptr cint; err_bnds_norm: ptr cdouble;
             err_bnds_comp: ptr cdouble; nparams: ptr cint; params: ptr cdouble;
             work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.
    cdecl, importc: "zgerfsx_", dynlib: libName.}
proc cgerfsx*(trans: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint;
             a: ptr lapack_complex_float; lda: ptr cint; af: ptr lapack_complex_float;
             ldaf: ptr cint; ipiv: ptr cint; r: ptr cfloat; c: ptr cfloat;
             b: ptr lapack_complex_float; ldb: ptr cint; x: ptr lapack_complex_float;
             ldx: ptr cint; rcond: ptr cfloat; berr: ptr cfloat; n_err_bnds: ptr cint;
             err_bnds_norm: ptr cfloat; err_bnds_comp: ptr cfloat; nparams: ptr cint;
             params: ptr cfloat; work: ptr lapack_complex_float; rwork: ptr cfloat;
             info: ptr cint) {.cdecl, importc: "cgerfsx_", dynlib: libName.}
proc sgbrfs*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint;
            ab: ptr cfloat; ldab: ptr cint; afb: ptr cfloat; ldafb: ptr cint;
            ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "sgbrfs_", dynlib: libName.}
proc dgbrfs*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint;
            ab: ptr cdouble; ldab: ptr cint; afb: ptr cdouble; ldafb: ptr cint;
            ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dgbrfs_", dynlib: libName.}
proc cgbrfs*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint;
            ab: ptr lapack_complex_float; ldab: ptr cint;
            afb: ptr lapack_complex_float; ldafb: ptr cint; ipiv: ptr cint;
            b: ptr lapack_complex_float; ldb: ptr cint; x: ptr lapack_complex_float;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cgbrfs_", dynlib: libName.}
proc zgbrfs*(trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint;
            ab: ptr lapack_complex_double; ldab: ptr cint;
            afb: ptr lapack_complex_double; ldafb: ptr cint; ipiv: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; x: ptr lapack_complex_double;
            ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zgbrfs_", dynlib: libName.}
proc dgbrfsx*(trans: cstring; equed: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
             nrhs: ptr cint; ab: ptr cdouble; ldab: ptr cint; afb: ptr cdouble;
             ldafb: ptr cint; ipiv: ptr cint; r: ptr cdouble; c: ptr cdouble;
             b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
             rcond: ptr cdouble; berr: ptr cdouble; n_err_bnds: ptr cint;
             err_bnds_norm: ptr cdouble; err_bnds_comp: ptr cdouble;
             nparams: ptr cint; params: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
             info: ptr cint) {.cdecl, importc: "dgbrfsx_", dynlib: libName.}
proc sgbrfsx*(trans: cstring; equed: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
             nrhs: ptr cint; ab: ptr cfloat; ldab: ptr cint; afb: ptr cfloat;
             ldafb: ptr cint; ipiv: ptr cint; r: ptr cfloat; c: ptr cfloat; b: ptr cfloat;
             ldb: ptr cint; x: ptr cfloat; ldx: ptr cint; rcond: ptr cfloat;
             berr: ptr cfloat; n_err_bnds: ptr cint; err_bnds_norm: ptr cfloat;
             err_bnds_comp: ptr cfloat; nparams: ptr cint; params: ptr cfloat;
             work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgbrfsx_", dynlib: libName.}
proc zgbrfsx*(trans: cstring; equed: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
             nrhs: ptr cint; ab: ptr lapack_complex_double; ldab: ptr cint;
             afb: ptr lapack_complex_double; ldafb: ptr cint; ipiv: ptr cint;
             r: ptr cdouble; c: ptr cdouble; b: ptr lapack_complex_double; ldb: ptr cint;
             x: ptr lapack_complex_double; ldx: ptr cint; rcond: ptr cdouble;
             berr: ptr cdouble; n_err_bnds: ptr cint; err_bnds_norm: ptr cdouble;
             err_bnds_comp: ptr cdouble; nparams: ptr cint; params: ptr cdouble;
             work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.
    cdecl, importc: "zgbrfsx_", dynlib: libName.}
proc cgbrfsx*(trans: cstring; equed: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
             nrhs: ptr cint; ab: ptr lapack_complex_float; ldab: ptr cint;
             afb: ptr lapack_complex_float; ldafb: ptr cint; ipiv: ptr cint;
             r: ptr cfloat; c: ptr cfloat; b: ptr lapack_complex_float; ldb: ptr cint;
             x: ptr lapack_complex_float; ldx: ptr cint; rcond: ptr cfloat;
             berr: ptr cfloat; n_err_bnds: ptr cint; err_bnds_norm: ptr cfloat;
             err_bnds_comp: ptr cfloat; nparams: ptr cint; params: ptr cfloat;
             work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cgbrfsx_", dynlib: libName.}
proc sgtrfs*(trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr cfloat; d: ptr cfloat;
            du: ptr cfloat; dlf: ptr cfloat; df: ptr cfloat; duf: ptr cfloat;
            du2: ptr cfloat; ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat;
            iwork: ptr cint; info: ptr cint) {.cdecl, importc: "sgtrfs_", dynlib: libName.}
proc dgtrfs*(trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr cdouble; d: ptr cdouble;
            du: ptr cdouble; dlf: ptr cdouble; df: ptr cdouble; duf: ptr cdouble;
            du2: ptr cdouble; ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble;
            ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble;
            iwork: ptr cint; info: ptr cint) {.cdecl, importc: "dgtrfs_", dynlib: libName.}
proc cgtrfs*(trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr lapack_complex_float;
            d: ptr lapack_complex_float; du: ptr lapack_complex_float;
            dlf: ptr lapack_complex_float; df: ptr lapack_complex_float;
            duf: ptr lapack_complex_float; du2: ptr lapack_complex_float;
            ipiv: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint;
            x: ptr lapack_complex_float; ldx: ptr cint; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr lapack_complex_float; rwork: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "cgtrfs_", dynlib: libName.}
proc zgtrfs*(trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr lapack_complex_double;
            d: ptr lapack_complex_double; du: ptr lapack_complex_double;
            dlf: ptr lapack_complex_double; df: ptr lapack_complex_double;
            duf: ptr lapack_complex_double; du2: ptr lapack_complex_double;
            ipiv: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
            x: ptr lapack_complex_double; ldx: ptr cint; ferr: ptr cdouble;
            berr: ptr cdouble; work: ptr lapack_complex_double; rwork: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "zgtrfs_", dynlib: libName.}
proc sporfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            af: ptr cfloat; ldaf: ptr cint; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat;
            iwork: ptr cint; info: ptr cint) {.cdecl, importc: "sporfs_", dynlib: libName.}
proc dporfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            af: ptr cdouble; ldaf: ptr cint; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble;
            ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble;
            iwork: ptr cint; info: ptr cint) {.cdecl, importc: "dporfs_", dynlib: libName.}
proc cporfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; af: ptr lapack_complex_float; ldaf: ptr cint;
            b: ptr lapack_complex_float; ldb: ptr cint; x: ptr lapack_complex_float;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cporfs_", dynlib: libName.}
proc zporfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; af: ptr lapack_complex_double; ldaf: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; x: ptr lapack_complex_double;
            ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zporfs_", dynlib: libName.}
proc dporfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
             lda: ptr cint; af: ptr cdouble; ldaf: ptr cint; s: ptr cdouble; b: ptr cdouble;
             ldb: ptr cint; x: ptr cdouble; ldx: ptr cint; rcond: ptr cdouble;
             berr: ptr cdouble; n_err_bnds: ptr cint; err_bnds_norm: ptr cdouble;
             err_bnds_comp: ptr cdouble; nparams: ptr cint; params: ptr cdouble;
             work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dporfsx_", dynlib: libName.}
proc sporfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
             lda: ptr cint; af: ptr cfloat; ldaf: ptr cint; s: ptr cfloat; b: ptr cfloat;
             ldb: ptr cint; x: ptr cfloat; ldx: ptr cint; rcond: ptr cfloat;
             berr: ptr cfloat; n_err_bnds: ptr cint; err_bnds_norm: ptr cfloat;
             err_bnds_comp: ptr cfloat; nparams: ptr cint; params: ptr cfloat;
             work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sporfsx_", dynlib: libName.}
proc zporfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint;
             a: ptr lapack_complex_double; lda: ptr cint;
             af: ptr lapack_complex_double; ldaf: ptr cint; s: ptr cdouble;
             b: ptr lapack_complex_double; ldb: ptr cint;
             x: ptr lapack_complex_double; ldx: ptr cint; rcond: ptr cdouble;
             berr: ptr cdouble; n_err_bnds: ptr cint; err_bnds_norm: ptr cdouble;
             err_bnds_comp: ptr cdouble; nparams: ptr cint; params: ptr cdouble;
             work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.
    cdecl, importc: "zporfsx_", dynlib: libName.}
proc cporfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint;
             a: ptr lapack_complex_float; lda: ptr cint; af: ptr lapack_complex_float;
             ldaf: ptr cint; s: ptr cfloat; b: ptr lapack_complex_float; ldb: ptr cint;
             x: ptr lapack_complex_float; ldx: ptr cint; rcond: ptr cfloat;
             berr: ptr cfloat; n_err_bnds: ptr cint; err_bnds_norm: ptr cfloat;
             err_bnds_comp: ptr cfloat; nparams: ptr cint; params: ptr cfloat;
             work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cporfsx_", dynlib: libName.}
proc spprfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cfloat; afp: ptr cfloat;
            b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "spprfs_", dynlib: libName.}
proc dpprfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cdouble; afp: ptr cdouble;
            b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint; ferr: ptr cdouble;
            berr: ptr cdouble; work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dpprfs_", dynlib: libName.}
proc cpprfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr lapack_complex_float;
            afp: ptr lapack_complex_float; b: ptr lapack_complex_float; ldb: ptr cint;
            x: ptr lapack_complex_float; ldx: ptr cint; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr lapack_complex_float; rwork: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "cpprfs_", dynlib: libName.}
proc zpprfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr lapack_complex_double;
            afp: ptr lapack_complex_double; b: ptr lapack_complex_double;
            ldb: ptr cint; x: ptr lapack_complex_double; ldx: ptr cint;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr lapack_complex_double;
            rwork: ptr cdouble; info: ptr cint) {.cdecl, importc: "zpprfs_",
    dynlib: libName.}
proc spbrfs*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint; ab: ptr cfloat;
            ldab: ptr cint; afb: ptr cfloat; ldafb: ptr cint; b: ptr cfloat; ldb: ptr cint;
            x: ptr cfloat; ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "spbrfs_", dynlib: libName.}
proc dpbrfs*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint; ab: ptr cdouble;
            ldab: ptr cint; afb: ptr cdouble; ldafb: ptr cint; b: ptr cdouble;
            ldb: ptr cint; x: ptr cdouble; ldx: ptr cint; ferr: ptr cdouble;
            berr: ptr cdouble; work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dpbrfs_", dynlib: libName.}
proc cpbrfs*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint;
            ab: ptr lapack_complex_float; ldab: ptr cint;
            afb: ptr lapack_complex_float; ldafb: ptr cint;
            b: ptr lapack_complex_float; ldb: ptr cint; x: ptr lapack_complex_float;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cpbrfs_", dynlib: libName.}
proc zpbrfs*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint;
            ab: ptr lapack_complex_double; ldab: ptr cint;
            afb: ptr lapack_complex_double; ldafb: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; x: ptr lapack_complex_double;
            ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zpbrfs_", dynlib: libName.}
proc sptrfs*(n: ptr cint; nrhs: ptr cint; d: ptr cfloat; e: ptr cfloat; df: ptr cfloat;
            ef: ptr cfloat; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "sptrfs_", dynlib: libName.}
proc dptrfs*(n: ptr cint; nrhs: ptr cint; d: ptr cdouble; e: ptr cdouble; df: ptr cdouble;
            ef: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble; info: ptr cint) {.
    cdecl, importc: "dptrfs_", dynlib: libName.}
proc cptrfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; d: ptr cfloat;
            e: ptr lapack_complex_float; df: ptr cfloat; ef: ptr lapack_complex_float;
            b: ptr lapack_complex_float; ldb: ptr cint; x: ptr lapack_complex_float;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cptrfs_", dynlib: libName.}
proc zptrfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; d: ptr cdouble;
            e: ptr lapack_complex_double; df: ptr cdouble;
            ef: ptr lapack_complex_double; b: ptr lapack_complex_double;
            ldb: ptr cint; x: ptr lapack_complex_double; ldx: ptr cint;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr lapack_complex_double;
            rwork: ptr cdouble; info: ptr cint) {.cdecl, importc: "zptrfs_",
    dynlib: libName.}
proc ssyrfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            af: ptr cfloat; ldaf: ptr cint; ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint;
            x: ptr cfloat; ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "ssyrfs_", dynlib: libName.}
proc dsyrfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            af: ptr cdouble; ldaf: ptr cint; ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint;
            x: ptr cdouble; ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dsyrfs_", dynlib: libName.}
proc csyrfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; af: ptr lapack_complex_float; ldaf: ptr cint; ipiv: ptr cint;
            b: ptr lapack_complex_float; ldb: ptr cint; x: ptr lapack_complex_float;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "csyrfs_", dynlib: libName.}
proc zsyrfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; af: ptr lapack_complex_double; ldaf: ptr cint; ipiv: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; x: ptr lapack_complex_double;
            ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zsyrfs_", dynlib: libName.}
proc dsyrfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
             lda: ptr cint; af: ptr cdouble; ldaf: ptr cint; ipiv: ptr cint; s: ptr cdouble;
             b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
             rcond: ptr cdouble; berr: ptr cdouble; n_err_bnds: ptr cint;
             err_bnds_norm: ptr cdouble; err_bnds_comp: ptr cdouble;
             nparams: ptr cint; params: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
             info: ptr cint) {.cdecl, importc: "dsyrfsx_", dynlib: libName.}
proc ssyrfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
             lda: ptr cint; af: ptr cfloat; ldaf: ptr cint; ipiv: ptr cint; s: ptr cfloat;
             b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint; rcond: ptr cfloat;
             berr: ptr cfloat; n_err_bnds: ptr cint; err_bnds_norm: ptr cfloat;
             err_bnds_comp: ptr cfloat; nparams: ptr cint; params: ptr cfloat;
             work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "ssyrfsx_", dynlib: libName.}
proc zsyrfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint;
             a: ptr lapack_complex_double; lda: ptr cint;
             af: ptr lapack_complex_double; ldaf: ptr cint; ipiv: ptr cint;
             s: ptr cdouble; b: ptr lapack_complex_double; ldb: ptr cint;
             x: ptr lapack_complex_double; ldx: ptr cint; rcond: ptr cdouble;
             berr: ptr cdouble; n_err_bnds: ptr cint; err_bnds_norm: ptr cdouble;
             err_bnds_comp: ptr cdouble; nparams: ptr cint; params: ptr cdouble;
             work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.
    cdecl, importc: "zsyrfsx_", dynlib: libName.}
proc csyrfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint;
             a: ptr lapack_complex_float; lda: ptr cint; af: ptr lapack_complex_float;
             ldaf: ptr cint; ipiv: ptr cint; s: ptr cfloat; b: ptr lapack_complex_float;
             ldb: ptr cint; x: ptr lapack_complex_float; ldx: ptr cint;
             rcond: ptr cfloat; berr: ptr cfloat; n_err_bnds: ptr cint;
             err_bnds_norm: ptr cfloat; err_bnds_comp: ptr cfloat; nparams: ptr cint;
             params: ptr cfloat; work: ptr lapack_complex_float; rwork: ptr cfloat;
             info: ptr cint) {.cdecl, importc: "csyrfsx_", dynlib: libName.}
proc cherfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; af: ptr lapack_complex_float; ldaf: ptr cint; ipiv: ptr cint;
            b: ptr lapack_complex_float; ldb: ptr cint; x: ptr lapack_complex_float;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cherfs_", dynlib: libName.}
proc zherfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; af: ptr lapack_complex_double; ldaf: ptr cint; ipiv: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; x: ptr lapack_complex_double;
            ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zherfs_", dynlib: libName.}
proc zherfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint;
             a: ptr lapack_complex_double; lda: ptr cint;
             af: ptr lapack_complex_double; ldaf: ptr cint; ipiv: ptr cint;
             s: ptr cdouble; b: ptr lapack_complex_double; ldb: ptr cint;
             x: ptr lapack_complex_double; ldx: ptr cint; rcond: ptr cdouble;
             berr: ptr cdouble; n_err_bnds: ptr cint; err_bnds_norm: ptr cdouble;
             err_bnds_comp: ptr cdouble; nparams: ptr cint; params: ptr cdouble;
             work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.
    cdecl, importc: "zherfsx_", dynlib: libName.}
proc cherfsx*(uplo: cstring; equed: cstring; n: ptr cint; nrhs: ptr cint;
             a: ptr lapack_complex_float; lda: ptr cint; af: ptr lapack_complex_float;
             ldaf: ptr cint; ipiv: ptr cint; s: ptr cfloat; b: ptr lapack_complex_float;
             ldb: ptr cint; x: ptr lapack_complex_float; ldx: ptr cint;
             rcond: ptr cfloat; berr: ptr cfloat; n_err_bnds: ptr cint;
             err_bnds_norm: ptr cfloat; err_bnds_comp: ptr cfloat; nparams: ptr cint;
             params: ptr cfloat; work: ptr lapack_complex_float; rwork: ptr cfloat;
             info: ptr cint) {.cdecl, importc: "cherfsx_", dynlib: libName.}
proc ssprfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cfloat; afp: ptr cfloat;
            ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "ssprfs_", dynlib: libName.}
proc dsprfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cdouble; afp: ptr cdouble;
            ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dsprfs_", dynlib: libName.}
proc csprfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr lapack_complex_float;
            afp: ptr lapack_complex_float; ipiv: ptr cint;
            b: ptr lapack_complex_float; ldb: ptr cint; x: ptr lapack_complex_float;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "csprfs_", dynlib: libName.}
proc zsprfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr lapack_complex_double;
            afp: ptr lapack_complex_double; ipiv: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; x: ptr lapack_complex_double;
            ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zsprfs_", dynlib: libName.}
proc chprfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr lapack_complex_float;
            afp: ptr lapack_complex_float; ipiv: ptr cint;
            b: ptr lapack_complex_float; ldb: ptr cint; x: ptr lapack_complex_float;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "chprfs_", dynlib: libName.}
proc zhprfs*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr lapack_complex_double;
            afp: ptr lapack_complex_double; ipiv: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; x: ptr lapack_complex_double;
            ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zhprfs_", dynlib: libName.}
proc strrfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat;
            iwork: ptr cint; info: ptr cint) {.cdecl, importc: "strrfs_", dynlib: libName.}
proc dtrrfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble;
            ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble;
            iwork: ptr cint; info: ptr cint) {.cdecl, importc: "dtrrfs_", dynlib: libName.}
proc ctrrfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; b: ptr lapack_complex_float;
            ldb: ptr cint; x: ptr lapack_complex_float; ldx: ptr cint; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr lapack_complex_float; rwork: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "ctrrfs_", dynlib: libName.}
proc ztrrfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint; b: ptr lapack_complex_double;
            ldb: ptr cint; x: ptr lapack_complex_double; ldx: ptr cint;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr lapack_complex_double;
            rwork: ptr cdouble; info: ptr cint) {.cdecl, importc: "ztrrfs_",
    dynlib: libName.}
proc stprfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr cfloat; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "stprfs_", dynlib: libName.}
proc dtprfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dtprfs_", dynlib: libName.}
proc ctprfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr lapack_complex_float; b: ptr lapack_complex_float; ldb: ptr cint;
            x: ptr lapack_complex_float; ldx: ptr cint; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr lapack_complex_float; rwork: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "ctprfs_", dynlib: libName.}
proc ztprfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr lapack_complex_double; b: ptr lapack_complex_double;
            ldb: ptr cint; x: ptr lapack_complex_double; ldx: ptr cint;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr lapack_complex_double;
            rwork: ptr cdouble; info: ptr cint) {.cdecl, importc: "ztprfs_",
    dynlib: libName.}
proc stbrfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            nrhs: ptr cint; ab: ptr cfloat; ldab: ptr cint; b: ptr cfloat; ldb: ptr cint;
            x: ptr cfloat; ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "stbrfs_", dynlib: libName.}
proc dtbrfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            nrhs: ptr cint; ab: ptr cdouble; ldab: ptr cint; b: ptr cdouble; ldb: ptr cint;
            x: ptr cdouble; ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dtbrfs_", dynlib: libName.}
proc ctbrfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            nrhs: ptr cint; ab: ptr lapack_complex_float; ldab: ptr cint;
            b: ptr lapack_complex_float; ldb: ptr cint; x: ptr lapack_complex_float;
            ldx: ptr cint; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "ctbrfs_", dynlib: libName.}
proc ztbrfs*(uplo: cstring; trans: cstring; diag: cstring; n: ptr cint; kd: ptr cint;
            nrhs: ptr cint; ab: ptr lapack_complex_double; ldab: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; x: ptr lapack_complex_double;
            ldx: ptr cint; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "ztbrfs_", dynlib: libName.}
proc sgetri*(n: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint; work: ptr cfloat;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "sgetri_", dynlib: libName.}
proc dgetri*(n: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint; work: ptr cdouble;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "dgetri_", dynlib: libName.}
proc cgetri*(n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint; ipiv: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cgetri_", dynlib: libName.}
proc zgetri*(n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint; ipiv: ptr cint;
            work: ptr lapack_complex_double; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zgetri_", dynlib: libName.}
proc spotri*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; info: ptr cint) {.cdecl,
    importc: "spotri_", dynlib: libName.}
proc dpotri*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; info: ptr cint) {.
    cdecl, importc: "dpotri_", dynlib: libName.}
proc cpotri*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            info: ptr cint) {.cdecl, importc: "cpotri_", dynlib: libName.}
proc zpotri*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            info: ptr cint) {.cdecl, importc: "zpotri_", dynlib: libName.}
proc dpftri*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble; info: ptr cint) {.
    cdecl, importc: "dpftri_", dynlib: libName.}
proc spftri*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat; info: ptr cint) {.
    cdecl, importc: "spftri_", dynlib: libName.}
proc zpftri*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr lapack_complex_double;
            info: ptr cint) {.cdecl, importc: "zpftri_", dynlib: libName.}
proc cpftri*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr lapack_complex_float;
            info: ptr cint) {.cdecl, importc: "cpftri_", dynlib: libName.}
proc spptri*(uplo: cstring; n: ptr cint; ap: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "spptri_", dynlib: libName.}
proc dpptri*(uplo: cstring; n: ptr cint; ap: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dpptri_", dynlib: libName.}
proc cpptri*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_float; info: ptr cint) {.
    cdecl, importc: "cpptri_", dynlib: libName.}
proc zpptri*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_double; info: ptr cint) {.
    cdecl, importc: "zpptri_", dynlib: libName.}
proc ssytri*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint;
            work: ptr cfloat; info: ptr cint) {.cdecl, importc: "ssytri_",
    dynlib: libName.}
proc dsytri*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint;
            work: ptr cdouble; info: ptr cint) {.cdecl, importc: "dsytri_",
    dynlib: libName.}
proc csytri*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            ipiv: ptr cint; work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "csytri_", dynlib: libName.}
proc zsytri*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            ipiv: ptr cint; work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zsytri_", dynlib: libName.}
proc chetri*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            ipiv: ptr cint; work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "chetri_", dynlib: libName.}
proc zhetri*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            ipiv: ptr cint; work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zhetri_", dynlib: libName.}
proc ssptri*(uplo: cstring; n: ptr cint; ap: ptr cfloat; ipiv: ptr cint; work: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "ssptri_", dynlib: libName.}
proc dsptri*(uplo: cstring; n: ptr cint; ap: ptr cdouble; ipiv: ptr cint; work: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "dsptri_", dynlib: libName.}
proc csptri*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_float; ipiv: ptr cint;
            work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "csptri_", dynlib: libName.}
proc zsptri*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_double; ipiv: ptr cint;
            work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zsptri_", dynlib: libName.}
proc chptri*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_float; ipiv: ptr cint;
            work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "chptri_", dynlib: libName.}
proc zhptri*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_double; ipiv: ptr cint;
            work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zhptri_", dynlib: libName.}
proc strtri*(uplo: cstring; diag: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            info: ptr cint) {.cdecl, importc: "strtri_", dynlib: libName.}
proc dtrtri*(uplo: cstring; diag: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            info: ptr cint) {.cdecl, importc: "dtrtri_", dynlib: libName.}
proc ctrtri*(uplo: cstring; diag: cstring; n: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; info: ptr cint) {.cdecl, importc: "ctrtri_", dynlib: libName.}
proc ztrtri*(uplo: cstring; diag: cstring; n: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; info: ptr cint) {.cdecl, importc: "ztrtri_", dynlib: libName.}
proc dtftri*(transr: cstring; uplo: cstring; diag: cstring; n: ptr cint; a: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "dtftri_", dynlib: libName.}
proc stftri*(transr: cstring; uplo: cstring; diag: cstring; n: ptr cint; a: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "stftri_", dynlib: libName.}
proc ztftri*(transr: cstring; uplo: cstring; diag: cstring; n: ptr cint;
            a: ptr lapack_complex_double; info: ptr cint) {.cdecl, importc: "ztftri_",
    dynlib: libName.}
proc ctftri*(transr: cstring; uplo: cstring; diag: cstring; n: ptr cint;
            a: ptr lapack_complex_float; info: ptr cint) {.cdecl, importc: "ctftri_",
    dynlib: libName.}
proc stptri*(uplo: cstring; diag: cstring; n: ptr cint; ap: ptr cfloat; info: ptr cint) {.
    cdecl, importc: "stptri_", dynlib: libName.}
proc dtptri*(uplo: cstring; diag: cstring; n: ptr cint; ap: ptr cdouble; info: ptr cint) {.
    cdecl, importc: "dtptri_", dynlib: libName.}
proc ctptri*(uplo: cstring; diag: cstring; n: ptr cint; ap: ptr lapack_complex_float;
            info: ptr cint) {.cdecl, importc: "ctptri_", dynlib: libName.}
proc ztptri*(uplo: cstring; diag: cstring; n: ptr cint; ap: ptr lapack_complex_double;
            info: ptr cint) {.cdecl, importc: "ztptri_", dynlib: libName.}
proc sgeequ*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; r: ptr cfloat;
            c: ptr cfloat; rowcnd: ptr cfloat; colcnd: ptr cfloat; amax: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "sgeequ_", dynlib: libName.}
proc dgeequ*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; r: ptr cdouble;
            c: ptr cdouble; rowcnd: ptr cdouble; colcnd: ptr cdouble; amax: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "dgeequ_", dynlib: libName.}
proc cgeequ*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            r: ptr cfloat; c: ptr cfloat; rowcnd: ptr cfloat; colcnd: ptr cfloat;
            amax: ptr cfloat; info: ptr cint) {.cdecl, importc: "cgeequ_",
    dynlib: libName.}
proc zgeequ*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            r: ptr cdouble; c: ptr cdouble; rowcnd: ptr cdouble; colcnd: ptr cdouble;
            amax: ptr cdouble; info: ptr cint) {.cdecl, importc: "zgeequ_",
    dynlib: libName.}
proc dgeequb*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; r: ptr cdouble;
             c: ptr cdouble; rowcnd: ptr cdouble; colcnd: ptr cdouble; amax: ptr cdouble;
             info: ptr cint) {.cdecl, importc: "dgeequb_", dynlib: libName.}
proc sgeequb*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; r: ptr cfloat;
             c: ptr cfloat; rowcnd: ptr cfloat; colcnd: ptr cfloat; amax: ptr cfloat;
             info: ptr cint) {.cdecl, importc: "sgeequb_", dynlib: libName.}
proc zgeequb*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
             r: ptr cdouble; c: ptr cdouble; rowcnd: ptr cdouble; colcnd: ptr cdouble;
             amax: ptr cdouble; info: ptr cint) {.cdecl, importc: "zgeequb_",
    dynlib: libName.}
proc cgeequb*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
             r: ptr cfloat; c: ptr cfloat; rowcnd: ptr cfloat; colcnd: ptr cfloat;
             amax: ptr cfloat; info: ptr cint) {.cdecl, importc: "cgeequb_",
    dynlib: libName.}
proc sgbequ*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cfloat;
            ldab: ptr cint; r: ptr cfloat; c: ptr cfloat; rowcnd: ptr cfloat;
            colcnd: ptr cfloat; amax: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "sgbequ_", dynlib: libName.}
proc dgbequ*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cdouble;
            ldab: ptr cint; r: ptr cdouble; c: ptr cdouble; rowcnd: ptr cdouble;
            colcnd: ptr cdouble; amax: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dgbequ_", dynlib: libName.}
proc cgbequ*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint;
            ab: ptr lapack_complex_float; ldab: ptr cint; r: ptr cfloat; c: ptr cfloat;
            rowcnd: ptr cfloat; colcnd: ptr cfloat; amax: ptr cfloat; info: ptr cint) {.
    cdecl, importc: "cgbequ_", dynlib: libName.}
proc zgbequ*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint;
            ab: ptr lapack_complex_double; ldab: ptr cint; r: ptr cdouble;
            c: ptr cdouble; rowcnd: ptr cdouble; colcnd: ptr cdouble; amax: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "zgbequ_", dynlib: libName.}
proc dgbequb*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cdouble;
             ldab: ptr cint; r: ptr cdouble; c: ptr cdouble; rowcnd: ptr cdouble;
             colcnd: ptr cdouble; amax: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dgbequb_", dynlib: libName.}
proc sgbequb*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; ab: ptr cfloat;
             ldab: ptr cint; r: ptr cfloat; c: ptr cfloat; rowcnd: ptr cfloat;
             colcnd: ptr cfloat; amax: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "sgbequb_", dynlib: libName.}
proc zgbequb*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint;
             ab: ptr lapack_complex_double; ldab: ptr cint; r: ptr cdouble;
             c: ptr cdouble; rowcnd: ptr cdouble; colcnd: ptr cdouble; amax: ptr cdouble;
             info: ptr cint) {.cdecl, importc: "zgbequb_", dynlib: libName.}
proc cgbequb*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint;
             ab: ptr lapack_complex_float; ldab: ptr cint; r: ptr cfloat; c: ptr cfloat;
             rowcnd: ptr cfloat; colcnd: ptr cfloat; amax: ptr cfloat; info: ptr cint) {.
    cdecl, importc: "cgbequb_", dynlib: libName.}
proc spoequ*(n: ptr cint; a: ptr cfloat; lda: ptr cint; s: ptr cfloat; scond: ptr cfloat;
            amax: ptr cfloat; info: ptr cint) {.cdecl, importc: "spoequ_",
    dynlib: libName.}
proc dpoequ*(n: ptr cint; a: ptr cdouble; lda: ptr cint; s: ptr cdouble; scond: ptr cdouble;
            amax: ptr cdouble; info: ptr cint) {.cdecl, importc: "dpoequ_",
    dynlib: libName.}
proc cpoequ*(n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint; s: ptr cfloat;
            scond: ptr cfloat; amax: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cpoequ_", dynlib: libName.}
proc zpoequ*(n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint; s: ptr cdouble;
            scond: ptr cdouble; amax: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zpoequ_", dynlib: libName.}
proc dpoequb*(n: ptr cint; a: ptr cdouble; lda: ptr cint; s: ptr cdouble; scond: ptr cdouble;
             amax: ptr cdouble; info: ptr cint) {.cdecl, importc: "dpoequb_",
    dynlib: libName.}
proc spoequb*(n: ptr cint; a: ptr cfloat; lda: ptr cint; s: ptr cfloat; scond: ptr cfloat;
             amax: ptr cfloat; info: ptr cint) {.cdecl, importc: "spoequb_",
    dynlib: libName.}
proc zpoequb*(n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint; s: ptr cdouble;
             scond: ptr cdouble; amax: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zpoequb_", dynlib: libName.}
proc cpoequb*(n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint; s: ptr cfloat;
             scond: ptr cfloat; amax: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cpoequb_", dynlib: libName.}
proc sppequ*(uplo: cstring; n: ptr cint; ap: ptr cfloat; s: ptr cfloat; scond: ptr cfloat;
            amax: ptr cfloat; info: ptr cint) {.cdecl, importc: "sppequ_",
    dynlib: libName.}
proc dppequ*(uplo: cstring; n: ptr cint; ap: ptr cdouble; s: ptr cdouble;
            scond: ptr cdouble; amax: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dppequ_", dynlib: libName.}
proc cppequ*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_float; s: ptr cfloat;
            scond: ptr cfloat; amax: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cppequ_", dynlib: libName.}
proc zppequ*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_double; s: ptr cdouble;
            scond: ptr cdouble; amax: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zppequ_", dynlib: libName.}
proc spbequ*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cfloat; ldab: ptr cint;
            s: ptr cfloat; scond: ptr cfloat; amax: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "spbequ_", dynlib: libName.}
proc dpbequ*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cdouble; ldab: ptr cint;
            s: ptr cdouble; scond: ptr cdouble; amax: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dpbequ_", dynlib: libName.}
proc cpbequ*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr lapack_complex_float;
            ldab: ptr cint; s: ptr cfloat; scond: ptr cfloat; amax: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "cpbequ_", dynlib: libName.}
proc zpbequ*(uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr lapack_complex_double;
            ldab: ptr cint; s: ptr cdouble; scond: ptr cdouble; amax: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "zpbequ_", dynlib: libName.}
proc dsyequb*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; s: ptr cdouble;
             scond: ptr cdouble; amax: ptr cdouble; work: ptr cdouble; info: ptr cint) {.
    cdecl, importc: "dsyequb_", dynlib: libName.}
proc ssyequb*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; s: ptr cfloat;
             scond: ptr cfloat; amax: ptr cfloat; work: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "ssyequb_", dynlib: libName.}
proc zsyequb*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
             s: ptr cdouble; scond: ptr cdouble; amax: ptr cdouble;
             work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zsyequb_", dynlib: libName.}
proc csyequb*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
             s: ptr cfloat; scond: ptr cfloat; amax: ptr cfloat;
             work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "csyequb_", dynlib: libName.}
proc zheequb*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
             s: ptr cdouble; scond: ptr cdouble; amax: ptr cdouble;
             work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zheequb_", dynlib: libName.}
proc cheequb*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
             s: ptr cfloat; scond: ptr cfloat; amax: ptr cfloat;
             work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "cheequb_", dynlib: libName.}
proc sgesv*(n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint;
           b: ptr cfloat; ldb: ptr cint; info: ptr cint) {.cdecl, importc: "sgesv_",
    dynlib: libName.}
proc dgesv*(n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint;
           b: ptr cdouble; ldb: ptr cint; info: ptr cint) {.cdecl, importc: "dgesv_",
    dynlib: libName.}
proc cgesv*(n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
           ipiv: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "cgesv_", dynlib: libName.}
proc zgesv*(n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
           ipiv: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "zgesv_", dynlib: libName.}
proc dsgesv*(n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint;
            b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint; work: ptr cdouble;
            swork: ptr cfloat; iter: ptr cint; info: ptr cint) {.cdecl,
    importc: "dsgesv_", dynlib: libName.}
proc zcgesv*(n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            ipiv: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
            x: ptr lapack_complex_double; ldx: ptr cint;
            work: ptr lapack_complex_double; swork: ptr lapack_complex_float;
            rwork: ptr cdouble; iter: ptr cint; info: ptr cint) {.cdecl,
    importc: "zcgesv_", dynlib: libName.}
proc sgesvx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
            lda: ptr cint; af: ptr cfloat; ldaf: ptr cint; ipiv: ptr cint; equed: cstring;
            r: ptr cfloat; c: ptr cfloat; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat;
            ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgesvx_", dynlib: libName.}
proc dgesvx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
            lda: ptr cint; af: ptr cdouble; ldaf: ptr cint; ipiv: ptr cint; equed: cstring;
            r: ptr cdouble; c: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble;
            ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgesvx_", dynlib: libName.}
proc cgesvx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; af: ptr lapack_complex_float;
            ldaf: ptr cint; ipiv: ptr cint; equed: cstring; r: ptr cfloat; c: ptr cfloat;
            b: ptr lapack_complex_float; ldb: ptr cint; x: ptr lapack_complex_float;
            ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cgesvx_", dynlib: libName.}
proc zgesvx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint;
            af: ptr lapack_complex_double; ldaf: ptr cint; ipiv: ptr cint;
            equed: cstring; r: ptr cdouble; c: ptr cdouble;
            b: ptr lapack_complex_double; ldb: ptr cint; x: ptr lapack_complex_double;
            ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zgesvx_", dynlib: libName.}
proc dgesvxx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
             lda: ptr cint; af: ptr cdouble; ldaf: ptr cint; ipiv: ptr cint; equed: cstring;
             r: ptr cdouble; c: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble;
             ldx: ptr cint; rcond: ptr cdouble; rpvgrw: ptr cdouble; berr: ptr cdouble;
             n_err_bnds: ptr cint; err_bnds_norm: ptr cdouble;
             err_bnds_comp: ptr cdouble; nparams: ptr cint; params: ptr cdouble;
             work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgesvxx_", dynlib: libName.}
proc sgesvxx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
             lda: ptr cint; af: ptr cfloat; ldaf: ptr cint; ipiv: ptr cint; equed: cstring;
             r: ptr cfloat; c: ptr cfloat; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat;
             ldx: ptr cint; rcond: ptr cfloat; rpvgrw: ptr cfloat; berr: ptr cfloat;
             n_err_bnds: ptr cint; err_bnds_norm: ptr cfloat;
             err_bnds_comp: ptr cfloat; nparams: ptr cint; params: ptr cfloat;
             work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgesvxx_", dynlib: libName.}
proc zgesvxx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint;
             a: ptr lapack_complex_double; lda: ptr cint;
             af: ptr lapack_complex_double; ldaf: ptr cint; ipiv: ptr cint;
             equed: cstring; r: ptr cdouble; c: ptr cdouble;
             b: ptr lapack_complex_double; ldb: ptr cint;
             x: ptr lapack_complex_double; ldx: ptr cint; rcond: ptr cdouble;
             rpvgrw: ptr cdouble; berr: ptr cdouble; n_err_bnds: ptr cint;
             err_bnds_norm: ptr cdouble; err_bnds_comp: ptr cdouble;
             nparams: ptr cint; params: ptr cdouble; work: ptr lapack_complex_double;
             rwork: ptr cdouble; info: ptr cint) {.cdecl, importc: "zgesvxx_",
    dynlib: libName.}
proc cgesvxx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint;
             a: ptr lapack_complex_float; lda: ptr cint; af: ptr lapack_complex_float;
             ldaf: ptr cint; ipiv: ptr cint; equed: cstring; r: ptr cfloat; c: ptr cfloat;
             b: ptr lapack_complex_float; ldb: ptr cint; x: ptr lapack_complex_float;
             ldx: ptr cint; rcond: ptr cfloat; rpvgrw: ptr cfloat; berr: ptr cfloat;
             n_err_bnds: ptr cint; err_bnds_norm: ptr cfloat;
             err_bnds_comp: ptr cfloat; nparams: ptr cint; params: ptr cfloat;
             work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cgesvxx_", dynlib: libName.}
proc sgbsv*(n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint; ab: ptr cfloat;
           ldab: ptr cint; ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "sgbsv_", dynlib: libName.}
proc dgbsv*(n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint; ab: ptr cdouble;
           ldab: ptr cint; ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "dgbsv_", dynlib: libName.}
proc cgbsv*(n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint;
           ab: ptr lapack_complex_float; ldab: ptr cint; ipiv: ptr cint;
           b: ptr lapack_complex_float; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "cgbsv_", dynlib: libName.}
proc zgbsv*(n: ptr cint; kl: ptr cint; ku: ptr cint; nrhs: ptr cint;
           ab: ptr lapack_complex_double; ldab: ptr cint; ipiv: ptr cint;
           b: ptr lapack_complex_double; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "zgbsv_", dynlib: libName.}
proc sgbsvx*(fact: cstring; trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
            nrhs: ptr cint; ab: ptr cfloat; ldab: ptr cint; afb: ptr cfloat;
            ldafb: ptr cint; ipiv: ptr cint; equed: cstring; r: ptr cfloat; c: ptr cfloat;
            b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint; rcond: ptr cfloat;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "sgbsvx_", dynlib: libName.}
proc dgbsvx*(fact: cstring; trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
            nrhs: ptr cint; ab: ptr cdouble; ldab: ptr cint; afb: ptr cdouble;
            ldafb: ptr cint; ipiv: ptr cint; equed: cstring; r: ptr cdouble;
            c: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
            rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble;
            iwork: ptr cint; info: ptr cint) {.cdecl, importc: "dgbsvx_", dynlib: libName.}
proc cgbsvx*(fact: cstring; trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
            nrhs: ptr cint; ab: ptr lapack_complex_float; ldab: ptr cint;
            afb: ptr lapack_complex_float; ldafb: ptr cint; ipiv: ptr cint;
            equed: cstring; r: ptr cfloat; c: ptr cfloat; b: ptr lapack_complex_float;
            ldb: ptr cint; x: ptr lapack_complex_float; ldx: ptr cint; rcond: ptr cfloat;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr lapack_complex_float;
            rwork: ptr cfloat; info: ptr cint) {.cdecl, importc: "cgbsvx_",
    dynlib: libName.}
proc zgbsvx*(fact: cstring; trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
            nrhs: ptr cint; ab: ptr lapack_complex_double; ldab: ptr cint;
            afb: ptr lapack_complex_double; ldafb: ptr cint; ipiv: ptr cint;
            equed: cstring; r: ptr cdouble; c: ptr cdouble;
            b: ptr lapack_complex_double; ldb: ptr cint; x: ptr lapack_complex_double;
            ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zgbsvx_", dynlib: libName.}
proc dgbsvxx*(fact: cstring; trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
             nrhs: ptr cint; ab: ptr cdouble; ldab: ptr cint; afb: ptr cdouble;
             ldafb: ptr cint; ipiv: ptr cint; equed: cstring; r: ptr cdouble;
             c: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
             rcond: ptr cdouble; rpvgrw: ptr cdouble; berr: ptr cdouble;
             n_err_bnds: ptr cint; err_bnds_norm: ptr cdouble;
             err_bnds_comp: ptr cdouble; nparams: ptr cint; params: ptr cdouble;
             work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgbsvxx_", dynlib: libName.}
proc sgbsvxx*(fact: cstring; trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
             nrhs: ptr cint; ab: ptr cfloat; ldab: ptr cint; afb: ptr cfloat;
             ldafb: ptr cint; ipiv: ptr cint; equed: cstring; r: ptr cfloat; c: ptr cfloat;
             b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint; rcond: ptr cfloat;
             rpvgrw: ptr cfloat; berr: ptr cfloat; n_err_bnds: ptr cint;
             err_bnds_norm: ptr cfloat; err_bnds_comp: ptr cfloat; nparams: ptr cint;
             params: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgbsvxx_", dynlib: libName.}
proc zgbsvxx*(fact: cstring; trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
             nrhs: ptr cint; ab: ptr lapack_complex_double; ldab: ptr cint;
             afb: ptr lapack_complex_double; ldafb: ptr cint; ipiv: ptr cint;
             equed: cstring; r: ptr cdouble; c: ptr cdouble;
             b: ptr lapack_complex_double; ldb: ptr cint;
             x: ptr lapack_complex_double; ldx: ptr cint; rcond: ptr cdouble;
             rpvgrw: ptr cdouble; berr: ptr cdouble; n_err_bnds: ptr cint;
             err_bnds_norm: ptr cdouble; err_bnds_comp: ptr cdouble;
             nparams: ptr cint; params: ptr cdouble; work: ptr lapack_complex_double;
             rwork: ptr cdouble; info: ptr cint) {.cdecl, importc: "zgbsvxx_",
    dynlib: libName.}
proc cgbsvxx*(fact: cstring; trans: cstring; n: ptr cint; kl: ptr cint; ku: ptr cint;
             nrhs: ptr cint; ab: ptr lapack_complex_float; ldab: ptr cint;
             afb: ptr lapack_complex_float; ldafb: ptr cint; ipiv: ptr cint;
             equed: cstring; r: ptr cfloat; c: ptr cfloat; b: ptr lapack_complex_float;
             ldb: ptr cint; x: ptr lapack_complex_float; ldx: ptr cint;
             rcond: ptr cfloat; rpvgrw: ptr cfloat; berr: ptr cfloat;
             n_err_bnds: ptr cint; err_bnds_norm: ptr cfloat;
             err_bnds_comp: ptr cfloat; nparams: ptr cint; params: ptr cfloat;
             work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cgbsvxx_", dynlib: libName.}
proc sgtsv*(n: ptr cint; nrhs: ptr cint; dl: ptr cfloat; d: ptr cfloat; du: ptr cfloat;
           b: ptr cfloat; ldb: ptr cint; info: ptr cint) {.cdecl, importc: "sgtsv_",
    dynlib: libName.}
proc dgtsv*(n: ptr cint; nrhs: ptr cint; dl: ptr cdouble; d: ptr cdouble; du: ptr cdouble;
           b: ptr cdouble; ldb: ptr cint; info: ptr cint) {.cdecl, importc: "dgtsv_",
    dynlib: libName.}
proc cgtsv*(n: ptr cint; nrhs: ptr cint; dl: ptr lapack_complex_float;
           d: ptr lapack_complex_float; du: ptr lapack_complex_float;
           b: ptr lapack_complex_float; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "cgtsv_", dynlib: libName.}
proc zgtsv*(n: ptr cint; nrhs: ptr cint; dl: ptr lapack_complex_double;
           d: ptr lapack_complex_double; du: ptr lapack_complex_double;
           b: ptr lapack_complex_double; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "zgtsv_", dynlib: libName.}
proc sgtsvx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr cfloat;
            d: ptr cfloat; du: ptr cfloat; dlf: ptr cfloat; df: ptr cfloat; duf: ptr cfloat;
            du2: ptr cfloat; ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat;
            ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgtsvx_", dynlib: libName.}
proc dgtsvx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint; dl: ptr cdouble;
            d: ptr cdouble; du: ptr cdouble; dlf: ptr cdouble; df: ptr cdouble;
            duf: ptr cdouble; du2: ptr cdouble; ipiv: ptr cint; b: ptr cdouble;
            ldb: ptr cint; x: ptr cdouble; ldx: ptr cint; rcond: ptr cdouble;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dgtsvx_", dynlib: libName.}
proc cgtsvx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint;
            dl: ptr lapack_complex_float; d: ptr lapack_complex_float;
            du: ptr lapack_complex_float; dlf: ptr lapack_complex_float;
            df: ptr lapack_complex_float; duf: ptr lapack_complex_float;
            du2: ptr lapack_complex_float; ipiv: ptr cint;
            b: ptr lapack_complex_float; ldb: ptr cint; x: ptr lapack_complex_float;
            ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cgtsvx_", dynlib: libName.}
proc zgtsvx*(fact: cstring; trans: cstring; n: ptr cint; nrhs: ptr cint;
            dl: ptr lapack_complex_double; d: ptr lapack_complex_double;
            du: ptr lapack_complex_double; dlf: ptr lapack_complex_double;
            df: ptr lapack_complex_double; duf: ptr lapack_complex_double;
            du2: ptr lapack_complex_double; ipiv: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; x: ptr lapack_complex_double;
            ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zgtsvx_", dynlib: libName.}
proc sposv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
           b: ptr cfloat; ldb: ptr cint; info: ptr cint) {.cdecl, importc: "sposv_",
    dynlib: libName.}
proc dposv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
           b: ptr cdouble; ldb: ptr cint; info: ptr cint) {.cdecl, importc: "dposv_",
    dynlib: libName.}
proc cposv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_float;
           lda: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "cposv_", dynlib: libName.}
proc zposv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double;
           lda: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "zposv_", dynlib: libName.}
proc dsposv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint; work: ptr cdouble;
            swork: ptr cfloat; iter: ptr cint; info: ptr cint) {.cdecl,
    importc: "dsposv_", dynlib: libName.}
proc zcposv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
            x: ptr lapack_complex_double; ldx: ptr cint;
            work: ptr lapack_complex_double; swork: ptr lapack_complex_float;
            rwork: ptr cdouble; iter: ptr cint; info: ptr cint) {.cdecl,
    importc: "zcposv_", dynlib: libName.}
proc sposvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
            lda: ptr cint; af: ptr cfloat; ldaf: ptr cint; equed: cstring; s: ptr cfloat;
            b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint; rcond: ptr cfloat;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "sposvx_", dynlib: libName.}
proc dposvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
            lda: ptr cint; af: ptr cdouble; ldaf: ptr cint; equed: cstring; s: ptr cdouble;
            b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
            rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble;
            iwork: ptr cint; info: ptr cint) {.cdecl, importc: "dposvx_", dynlib: libName.}
proc cposvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; af: ptr lapack_complex_float;
            ldaf: ptr cint; equed: cstring; s: ptr cfloat; b: ptr lapack_complex_float;
            ldb: ptr cint; x: ptr lapack_complex_float; ldx: ptr cint; rcond: ptr cfloat;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr lapack_complex_float;
            rwork: ptr cfloat; info: ptr cint) {.cdecl, importc: "cposvx_",
    dynlib: libName.}
proc zposvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint;
            af: ptr lapack_complex_double; ldaf: ptr cint; equed: cstring;
            s: ptr cdouble; b: ptr lapack_complex_double; ldb: ptr cint;
            x: ptr lapack_complex_double; ldx: ptr cint; rcond: ptr cdouble;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr lapack_complex_double;
            rwork: ptr cdouble; info: ptr cint) {.cdecl, importc: "zposvx_",
    dynlib: libName.}
proc dposvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
             lda: ptr cint; af: ptr cdouble; ldaf: ptr cint; equed: cstring;
             s: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
             rcond: ptr cdouble; rpvgrw: ptr cdouble; berr: ptr cdouble;
             n_err_bnds: ptr cint; err_bnds_norm: ptr cdouble;
             err_bnds_comp: ptr cdouble; nparams: ptr cint; params: ptr cdouble;
             work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dposvxx_", dynlib: libName.}
proc sposvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
             lda: ptr cint; af: ptr cfloat; ldaf: ptr cint; equed: cstring; s: ptr cfloat;
             b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint; rcond: ptr cfloat;
             rpvgrw: ptr cfloat; berr: ptr cfloat; n_err_bnds: ptr cint;
             err_bnds_norm: ptr cfloat; err_bnds_comp: ptr cfloat; nparams: ptr cint;
             params: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sposvxx_", dynlib: libName.}
proc zposvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
             a: ptr lapack_complex_double; lda: ptr cint;
             af: ptr lapack_complex_double; ldaf: ptr cint; equed: cstring;
             s: ptr cdouble; b: ptr lapack_complex_double; ldb: ptr cint;
             x: ptr lapack_complex_double; ldx: ptr cint; rcond: ptr cdouble;
             rpvgrw: ptr cdouble; berr: ptr cdouble; n_err_bnds: ptr cint;
             err_bnds_norm: ptr cdouble; err_bnds_comp: ptr cdouble;
             nparams: ptr cint; params: ptr cdouble; work: ptr lapack_complex_double;
             rwork: ptr cdouble; info: ptr cint) {.cdecl, importc: "zposvxx_",
    dynlib: libName.}
proc cposvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
             a: ptr lapack_complex_float; lda: ptr cint; af: ptr lapack_complex_float;
             ldaf: ptr cint; equed: cstring; s: ptr cfloat; b: ptr lapack_complex_float;
             ldb: ptr cint; x: ptr lapack_complex_float; ldx: ptr cint;
             rcond: ptr cfloat; rpvgrw: ptr cfloat; berr: ptr cfloat;
             n_err_bnds: ptr cint; err_bnds_norm: ptr cfloat;
             err_bnds_comp: ptr cfloat; nparams: ptr cint; params: ptr cfloat;
             work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cposvxx_", dynlib: libName.}
proc sppsv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cfloat; b: ptr cfloat;
           ldb: ptr cint; info: ptr cint) {.cdecl, importc: "sppsv_", dynlib: libName.}
proc dppsv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cdouble; b: ptr cdouble;
           ldb: ptr cint; info: ptr cint) {.cdecl, importc: "dppsv_", dynlib: libName.}
proc cppsv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr lapack_complex_float;
           b: ptr lapack_complex_float; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "cppsv_", dynlib: libName.}
proc zppsv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr lapack_complex_double;
           b: ptr lapack_complex_double; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "zppsv_", dynlib: libName.}
proc sppsvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cfloat;
            afp: ptr cfloat; equed: cstring; s: ptr cfloat; b: ptr cfloat; ldb: ptr cint;
            x: ptr cfloat; ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat;
            berr: ptr cfloat; work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sppsvx_", dynlib: libName.}
proc dppsvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cdouble;
            afp: ptr cdouble; equed: cstring; s: ptr cdouble; b: ptr cdouble;
            ldb: ptr cint; x: ptr cdouble; ldx: ptr cint; rcond: ptr cdouble;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dppsvx_", dynlib: libName.}
proc cppsvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr lapack_complex_float; afp: ptr lapack_complex_float;
            equed: cstring; s: ptr cfloat; b: ptr lapack_complex_float; ldb: ptr cint;
            x: ptr lapack_complex_float; ldx: ptr cint; rcond: ptr cfloat;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr lapack_complex_float;
            rwork: ptr cfloat; info: ptr cint) {.cdecl, importc: "cppsvx_",
    dynlib: libName.}
proc zppsvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr lapack_complex_double; afp: ptr lapack_complex_double;
            equed: cstring; s: ptr cdouble; b: ptr lapack_complex_double; ldb: ptr cint;
            x: ptr lapack_complex_double; ldx: ptr cint; rcond: ptr cdouble;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr lapack_complex_double;
            rwork: ptr cdouble; info: ptr cint) {.cdecl, importc: "zppsvx_",
    dynlib: libName.}
proc spbsv*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint; ab: ptr cfloat;
           ldab: ptr cint; b: ptr cfloat; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "spbsv_", dynlib: libName.}
proc dpbsv*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint; ab: ptr cdouble;
           ldab: ptr cint; b: ptr cdouble; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "dpbsv_", dynlib: libName.}
proc cpbsv*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint;
           ab: ptr lapack_complex_float; ldab: ptr cint; b: ptr lapack_complex_float;
           ldb: ptr cint; info: ptr cint) {.cdecl, importc: "cpbsv_", dynlib: libName.}
proc zpbsv*(uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint;
           ab: ptr lapack_complex_double; ldab: ptr cint;
           b: ptr lapack_complex_double; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "zpbsv_", dynlib: libName.}
proc spbsvx*(fact: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint;
            ab: ptr cfloat; ldab: ptr cint; afb: ptr cfloat; ldafb: ptr cint;
            equed: cstring; s: ptr cfloat; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat;
            ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "spbsvx_", dynlib: libName.}
proc dpbsvx*(fact: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint;
            ab: ptr cdouble; ldab: ptr cint; afb: ptr cdouble; ldafb: ptr cint;
            equed: cstring; s: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble;
            ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dpbsvx_", dynlib: libName.}
proc cpbsvx*(fact: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint;
            ab: ptr lapack_complex_float; ldab: ptr cint;
            afb: ptr lapack_complex_float; ldafb: ptr cint; equed: cstring;
            s: ptr cfloat; b: ptr lapack_complex_float; ldb: ptr cint;
            x: ptr lapack_complex_float; ldx: ptr cint; rcond: ptr cfloat;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr lapack_complex_float;
            rwork: ptr cfloat; info: ptr cint) {.cdecl, importc: "cpbsvx_",
    dynlib: libName.}
proc zpbsvx*(fact: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; nrhs: ptr cint;
            ab: ptr lapack_complex_double; ldab: ptr cint;
            afb: ptr lapack_complex_double; ldafb: ptr cint; equed: cstring;
            s: ptr cdouble; b: ptr lapack_complex_double; ldb: ptr cint;
            x: ptr lapack_complex_double; ldx: ptr cint; rcond: ptr cdouble;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr lapack_complex_double;
            rwork: ptr cdouble; info: ptr cint) {.cdecl, importc: "zpbsvx_",
    dynlib: libName.}
proc sptsv*(n: ptr cint; nrhs: ptr cint; d: ptr cfloat; e: ptr cfloat; b: ptr cfloat;
           ldb: ptr cint; info: ptr cint) {.cdecl, importc: "sptsv_", dynlib: libName.}
proc dptsv*(n: ptr cint; nrhs: ptr cint; d: ptr cdouble; e: ptr cdouble; b: ptr cdouble;
           ldb: ptr cint; info: ptr cint) {.cdecl, importc: "dptsv_", dynlib: libName.}
proc cptsv*(n: ptr cint; nrhs: ptr cint; d: ptr cfloat; e: ptr lapack_complex_float;
           b: ptr lapack_complex_float; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "cptsv_", dynlib: libName.}
proc zptsv*(n: ptr cint; nrhs: ptr cint; d: ptr cdouble; e: ptr lapack_complex_double;
           b: ptr lapack_complex_double; ldb: ptr cint; info: ptr cint) {.cdecl,
    importc: "zptsv_", dynlib: libName.}
proc sptsvx*(fact: cstring; n: ptr cint; nrhs: ptr cint; d: ptr cfloat; e: ptr cfloat;
            df: ptr cfloat; ef: ptr cfloat; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat;
            ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr cfloat; info: ptr cint) {.cdecl, importc: "sptsvx_",
    dynlib: libName.}
proc dptsvx*(fact: cstring; n: ptr cint; nrhs: ptr cint; d: ptr cdouble; e: ptr cdouble;
            df: ptr cdouble; ef: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble;
            ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr cdouble; info: ptr cint) {.cdecl, importc: "dptsvx_",
    dynlib: libName.}
proc cptsvx*(fact: cstring; n: ptr cint; nrhs: ptr cint; d: ptr cfloat;
            e: ptr lapack_complex_float; df: ptr cfloat; ef: ptr lapack_complex_float;
            b: ptr lapack_complex_float; ldb: ptr cint; x: ptr lapack_complex_float;
            ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cptsvx_", dynlib: libName.}
proc zptsvx*(fact: cstring; n: ptr cint; nrhs: ptr cint; d: ptr cdouble;
            e: ptr lapack_complex_double; df: ptr cdouble;
            ef: ptr lapack_complex_double; b: ptr lapack_complex_double;
            ldb: ptr cint; x: ptr lapack_complex_double; ldx: ptr cint;
            rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zptsvx_", dynlib: libName.}
proc ssysv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
           ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; work: ptr cfloat; lwork: ptr cint;
           info: ptr cint) {.cdecl, importc: "ssysv_", dynlib: libName.}
proc dsysv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
           ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint; work: ptr cdouble;
           lwork: ptr cint; info: ptr cint) {.cdecl, importc: "dsysv_", dynlib: libName.}
proc csysv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_float;
           lda: ptr cint; ipiv: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint;
           work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "csysv_", dynlib: libName.}
proc zsysv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double;
           lda: ptr cint; ipiv: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
           work: ptr lapack_complex_double; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zsysv_", dynlib: libName.}
proc ssysvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
            lda: ptr cint; af: ptr cfloat; ldaf: ptr cint; ipiv: ptr cint; b: ptr cfloat;
            ldb: ptr cint; x: ptr cfloat; ldx: ptr cint; rcond: ptr cfloat;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr cfloat; lwork: ptr cint;
            iwork: ptr cint; info: ptr cint) {.cdecl, importc: "ssysvx_", dynlib: libName.}
proc dsysvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
            lda: ptr cint; af: ptr cdouble; ldaf: ptr cint; ipiv: ptr cint; b: ptr cdouble;
            ldb: ptr cint; x: ptr cdouble; ldx: ptr cint; rcond: ptr cdouble;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr cdouble; lwork: ptr cint;
            iwork: ptr cint; info: ptr cint) {.cdecl, importc: "dsysvx_", dynlib: libName.}
proc csysvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; af: ptr lapack_complex_float;
            ldaf: ptr cint; ipiv: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint;
            x: ptr lapack_complex_float; ldx: ptr cint; rcond: ptr cfloat;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr lapack_complex_float;
            lwork: ptr cint; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "csysvx_", dynlib: libName.}
proc zsysvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint;
            af: ptr lapack_complex_double; ldaf: ptr cint; ipiv: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; x: ptr lapack_complex_double;
            ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr lapack_complex_double; lwork: ptr cint; rwork: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "zsysvx_", dynlib: libName.}
proc dsysvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
             lda: ptr cint; af: ptr cdouble; ldaf: ptr cint; ipiv: ptr cint; equed: cstring;
             s: ptr cdouble; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble; ldx: ptr cint;
             rcond: ptr cdouble; rpvgrw: ptr cdouble; berr: ptr cdouble;
             n_err_bnds: ptr cint; err_bnds_norm: ptr cdouble;
             err_bnds_comp: ptr cdouble; nparams: ptr cint; params: ptr cdouble;
             work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dsysvxx_", dynlib: libName.}
proc ssysvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
             lda: ptr cint; af: ptr cfloat; ldaf: ptr cint; ipiv: ptr cint; equed: cstring;
             s: ptr cfloat; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat; ldx: ptr cint;
             rcond: ptr cfloat; rpvgrw: ptr cfloat; berr: ptr cfloat;
             n_err_bnds: ptr cint; err_bnds_norm: ptr cfloat;
             err_bnds_comp: ptr cfloat; nparams: ptr cint; params: ptr cfloat;
             work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "ssysvxx_", dynlib: libName.}
proc zsysvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
             a: ptr lapack_complex_double; lda: ptr cint;
             af: ptr lapack_complex_double; ldaf: ptr cint; ipiv: ptr cint;
             equed: cstring; s: ptr cdouble; b: ptr lapack_complex_double;
             ldb: ptr cint; x: ptr lapack_complex_double; ldx: ptr cint;
             rcond: ptr cdouble; rpvgrw: ptr cdouble; berr: ptr cdouble;
             n_err_bnds: ptr cint; err_bnds_norm: ptr cdouble;
             err_bnds_comp: ptr cdouble; nparams: ptr cint; params: ptr cdouble;
             work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.
    cdecl, importc: "zsysvxx_", dynlib: libName.}
proc csysvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
             a: ptr lapack_complex_float; lda: ptr cint; af: ptr lapack_complex_float;
             ldaf: ptr cint; ipiv: ptr cint; equed: cstring; s: ptr cfloat;
             b: ptr lapack_complex_float; ldb: ptr cint; x: ptr lapack_complex_float;
             ldx: ptr cint; rcond: ptr cfloat; rpvgrw: ptr cfloat; berr: ptr cfloat;
             n_err_bnds: ptr cint; err_bnds_norm: ptr cfloat;
             err_bnds_comp: ptr cfloat; nparams: ptr cint; params: ptr cfloat;
             work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "csysvxx_", dynlib: libName.}
proc chesv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_float;
           lda: ptr cint; ipiv: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint;
           work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "chesv_", dynlib: libName.}
proc zhesv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double;
           lda: ptr cint; ipiv: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
           work: ptr lapack_complex_double; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zhesv_", dynlib: libName.}
proc chesvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; af: ptr lapack_complex_float;
            ldaf: ptr cint; ipiv: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint;
            x: ptr lapack_complex_float; ldx: ptr cint; rcond: ptr cfloat;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr lapack_complex_float;
            lwork: ptr cint; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "chesvx_", dynlib: libName.}
proc zhesvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint;
            af: ptr lapack_complex_double; ldaf: ptr cint; ipiv: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; x: ptr lapack_complex_double;
            ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr lapack_complex_double; lwork: ptr cint; rwork: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "zhesvx_", dynlib: libName.}
proc zhesvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
             a: ptr lapack_complex_double; lda: ptr cint;
             af: ptr lapack_complex_double; ldaf: ptr cint; ipiv: ptr cint;
             equed: cstring; s: ptr cdouble; b: ptr lapack_complex_double;
             ldb: ptr cint; x: ptr lapack_complex_double; ldx: ptr cint;
             rcond: ptr cdouble; rpvgrw: ptr cdouble; berr: ptr cdouble;
             n_err_bnds: ptr cint; err_bnds_norm: ptr cdouble;
             err_bnds_comp: ptr cdouble; nparams: ptr cint; params: ptr cdouble;
             work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.
    cdecl, importc: "zhesvxx_", dynlib: libName.}
proc chesvxx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
             a: ptr lapack_complex_float; lda: ptr cint; af: ptr lapack_complex_float;
             ldaf: ptr cint; ipiv: ptr cint; equed: cstring; s: ptr cfloat;
             b: ptr lapack_complex_float; ldb: ptr cint; x: ptr lapack_complex_float;
             ldx: ptr cint; rcond: ptr cfloat; rpvgrw: ptr cfloat; berr: ptr cfloat;
             n_err_bnds: ptr cint; err_bnds_norm: ptr cfloat;
             err_bnds_comp: ptr cfloat; nparams: ptr cint; params: ptr cfloat;
             work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "chesvxx_", dynlib: libName.}
proc sspsv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cfloat; ipiv: ptr cint;
           b: ptr cfloat; ldb: ptr cint; info: ptr cint) {.cdecl, importc: "sspsv_",
    dynlib: libName.}
proc dspsv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cdouble; ipiv: ptr cint;
           b: ptr cdouble; ldb: ptr cint; info: ptr cint) {.cdecl, importc: "dspsv_",
    dynlib: libName.}
proc cspsv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr lapack_complex_float;
           ipiv: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "cspsv_", dynlib: libName.}
proc zspsv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr lapack_complex_double;
           ipiv: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "zspsv_", dynlib: libName.}
proc sspsvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cfloat;
            afp: ptr cfloat; ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; x: ptr cfloat;
            ldx: ptr cint; rcond: ptr cfloat; ferr: ptr cfloat; berr: ptr cfloat;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sspsvx_", dynlib: libName.}
proc dspsvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr cdouble;
            afp: ptr cdouble; ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint; x: ptr cdouble;
            ldx: ptr cint; rcond: ptr cdouble; ferr: ptr cdouble; berr: ptr cdouble;
            work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dspsvx_", dynlib: libName.}
proc cspsvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr lapack_complex_float; afp: ptr lapack_complex_float;
            ipiv: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint;
            x: ptr lapack_complex_float; ldx: ptr cint; rcond: ptr cfloat;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr lapack_complex_float;
            rwork: ptr cfloat; info: ptr cint) {.cdecl, importc: "cspsvx_",
    dynlib: libName.}
proc zspsvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr lapack_complex_double; afp: ptr lapack_complex_double;
            ipiv: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
            x: ptr lapack_complex_double; ldx: ptr cint; rcond: ptr cdouble;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr lapack_complex_double;
            rwork: ptr cdouble; info: ptr cint) {.cdecl, importc: "zspsvx_",
    dynlib: libName.}
proc chpsv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr lapack_complex_float;
           ipiv: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "chpsv_", dynlib: libName.}
proc zhpsv*(uplo: cstring; n: ptr cint; nrhs: ptr cint; ap: ptr lapack_complex_double;
           ipiv: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "zhpsv_", dynlib: libName.}
proc chpsvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr lapack_complex_float; afp: ptr lapack_complex_float;
            ipiv: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint;
            x: ptr lapack_complex_float; ldx: ptr cint; rcond: ptr cfloat;
            ferr: ptr cfloat; berr: ptr cfloat; work: ptr lapack_complex_float;
            rwork: ptr cfloat; info: ptr cint) {.cdecl, importc: "chpsvx_",
    dynlib: libName.}
proc zhpsvx*(fact: cstring; uplo: cstring; n: ptr cint; nrhs: ptr cint;
            ap: ptr lapack_complex_double; afp: ptr lapack_complex_double;
            ipiv: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
            x: ptr lapack_complex_double; ldx: ptr cint; rcond: ptr cdouble;
            ferr: ptr cdouble; berr: ptr cdouble; work: ptr lapack_complex_double;
            rwork: ptr cdouble; info: ptr cint) {.cdecl, importc: "zhpsvx_",
    dynlib: libName.}
proc sgeqrf*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgeqrf_", dynlib: libName.}
proc dgeqrf*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgeqrf_", dynlib: libName.}
proc cgeqrf*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            tau: ptr lapack_complex_float; work: ptr lapack_complex_float;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "cgeqrf_", dynlib: libName.}
proc zgeqrf*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            tau: ptr lapack_complex_double; work: ptr lapack_complex_double;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "zgeqrf_", dynlib: libName.}
proc sgeqpf*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; jpvt: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "sgeqpf_", dynlib: libName.}
proc dgeqpf*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; jpvt: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dgeqpf_", dynlib: libName.}
proc cgeqpf*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            jpvt: ptr cint; tau: ptr lapack_complex_float;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cgeqpf_", dynlib: libName.}
proc zgeqpf*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            jpvt: ptr cint; tau: ptr lapack_complex_double;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zgeqpf_", dynlib: libName.}
proc sgeqp3*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; jpvt: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgeqp3_", dynlib: libName.}
proc dgeqp3*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; jpvt: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgeqp3_", dynlib: libName.}
proc cgeqp3*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            jpvt: ptr cint; tau: ptr lapack_complex_float;
            work: ptr lapack_complex_float; lwork: ptr cint; rwork: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "cgeqp3_", dynlib: libName.}
proc zgeqp3*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            jpvt: ptr cint; tau: ptr lapack_complex_double;
            work: ptr lapack_complex_double; lwork: ptr cint; rwork: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "zgeqp3_", dynlib: libName.}
proc sorgqr*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sorgqr_", dynlib: libName.}
proc dorgqr*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dorgqr_", dynlib: libName.}
proc sormqr*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat; ldc: ptr cint;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sormqr_", dynlib: libName.}
proc dormqr*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble; ldc: ptr cint;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dormqr_", dynlib: libName.}
proc cungqr*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; tau: ptr lapack_complex_float;
            work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cungqr_", dynlib: libName.}
proc zungqr*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; tau: ptr lapack_complex_double;
            work: ptr lapack_complex_double; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zungqr_", dynlib: libName.}
proc cunmqr*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; tau: ptr lapack_complex_float;
            c: ptr lapack_complex_float; ldc: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cunmqr_", dynlib: libName.}
proc zunmqr*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint;
            tau: ptr lapack_complex_double; c: ptr lapack_complex_double;
            ldc: ptr cint; work: ptr lapack_complex_double; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "zunmqr_", dynlib: libName.}
proc sgelqf*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgelqf_", dynlib: libName.}
proc dgelqf*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgelqf_", dynlib: libName.}
proc cgelqf*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            tau: ptr lapack_complex_float; work: ptr lapack_complex_float;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "cgelqf_", dynlib: libName.}
proc zgelqf*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            tau: ptr lapack_complex_double; work: ptr lapack_complex_double;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "zgelqf_", dynlib: libName.}
proc sorglq*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sorglq_", dynlib: libName.}
proc dorglq*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dorglq_", dynlib: libName.}
proc sormlq*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat; ldc: ptr cint;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sormlq_", dynlib: libName.}
proc dormlq*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble; ldc: ptr cint;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dormlq_", dynlib: libName.}
proc cunglq*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; tau: ptr lapack_complex_float;
            work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cunglq_", dynlib: libName.}
proc zunglq*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; tau: ptr lapack_complex_double;
            work: ptr lapack_complex_double; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zunglq_", dynlib: libName.}
proc cunmlq*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; tau: ptr lapack_complex_float;
            c: ptr lapack_complex_float; ldc: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cunmlq_", dynlib: libName.}
proc zunmlq*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint;
            tau: ptr lapack_complex_double; c: ptr lapack_complex_double;
            ldc: ptr cint; work: ptr lapack_complex_double; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "zunmlq_", dynlib: libName.}
proc sgeqlf*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgeqlf_", dynlib: libName.}
proc dgeqlf*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgeqlf_", dynlib: libName.}
proc cgeqlf*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            tau: ptr lapack_complex_float; work: ptr lapack_complex_float;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "cgeqlf_", dynlib: libName.}
proc zgeqlf*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            tau: ptr lapack_complex_double; work: ptr lapack_complex_double;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "zgeqlf_", dynlib: libName.}
proc sorgql*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sorgql_", dynlib: libName.}
proc dorgql*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dorgql_", dynlib: libName.}
proc cungql*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; tau: ptr lapack_complex_float;
            work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cungql_", dynlib: libName.}
proc zungql*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; tau: ptr lapack_complex_double;
            work: ptr lapack_complex_double; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zungql_", dynlib: libName.}
proc sormql*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat; ldc: ptr cint;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sormql_", dynlib: libName.}
proc dormql*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble; ldc: ptr cint;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dormql_", dynlib: libName.}
proc cunmql*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; tau: ptr lapack_complex_float;
            c: ptr lapack_complex_float; ldc: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cunmql_", dynlib: libName.}
proc zunmql*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint;
            tau: ptr lapack_complex_double; c: ptr lapack_complex_double;
            ldc: ptr cint; work: ptr lapack_complex_double; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "zunmql_", dynlib: libName.}
proc sgerqf*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgerqf_", dynlib: libName.}
proc dgerqf*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgerqf_", dynlib: libName.}
proc cgerqf*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            tau: ptr lapack_complex_float; work: ptr lapack_complex_float;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "cgerqf_", dynlib: libName.}
proc zgerqf*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            tau: ptr lapack_complex_double; work: ptr lapack_complex_double;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "zgerqf_", dynlib: libName.}
proc sorgrq*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sorgrq_", dynlib: libName.}
proc dorgrq*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dorgrq_", dynlib: libName.}
proc cungrq*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; tau: ptr lapack_complex_float;
            work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cungrq_", dynlib: libName.}
proc zungrq*(m: ptr cint; n: ptr cint; k: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; tau: ptr lapack_complex_double;
            work: ptr lapack_complex_double; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zungrq_", dynlib: libName.}
proc sormrq*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat; ldc: ptr cint;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sormrq_", dynlib: libName.}
proc dormrq*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble; ldc: ptr cint;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dormrq_", dynlib: libName.}
proc cunmrq*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; tau: ptr lapack_complex_float;
            c: ptr lapack_complex_float; ldc: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cunmrq_", dynlib: libName.}
proc zunmrq*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint;
            tau: ptr lapack_complex_double; c: ptr lapack_complex_double;
            ldc: ptr cint; work: ptr lapack_complex_double; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "zunmrq_", dynlib: libName.}
proc stzrzf*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "stzrzf_", dynlib: libName.}
proc dtzrzf*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dtzrzf_", dynlib: libName.}
proc ctzrzf*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            tau: ptr lapack_complex_float; work: ptr lapack_complex_float;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "ctzrzf_", dynlib: libName.}
proc ztzrzf*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            tau: ptr lapack_complex_double; work: ptr lapack_complex_double;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "ztzrzf_", dynlib: libName.}
proc sormrz*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            l: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat;
            ldc: ptr cint; work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sormrz_", dynlib: libName.}
proc dormrz*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            l: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble;
            ldc: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dormrz_", dynlib: libName.}
proc cunmrz*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            l: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            tau: ptr lapack_complex_float; c: ptr lapack_complex_float; ldc: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cunmrz_", dynlib: libName.}
proc zunmrz*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            l: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            tau: ptr lapack_complex_double; c: ptr lapack_complex_double;
            ldc: ptr cint; work: ptr lapack_complex_double; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "zunmrz_", dynlib: libName.}
proc sggqrf*(n: ptr cint; m: ptr cint; p: ptr cint; a: ptr cfloat; lda: ptr cint;
            taua: ptr cfloat; b: ptr cfloat; ldb: ptr cint; taub: ptr cfloat;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sggqrf_", dynlib: libName.}
proc dggqrf*(n: ptr cint; m: ptr cint; p: ptr cint; a: ptr cdouble; lda: ptr cint;
            taua: ptr cdouble; b: ptr cdouble; ldb: ptr cint; taub: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dggqrf_", dynlib: libName.}
proc cggqrf*(n: ptr cint; m: ptr cint; p: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; taua: ptr lapack_complex_float;
            b: ptr lapack_complex_float; ldb: ptr cint;
            taub: ptr lapack_complex_float; work: ptr lapack_complex_float;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "cggqrf_", dynlib: libName.}
proc zggqrf*(n: ptr cint; m: ptr cint; p: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; taua: ptr lapack_complex_double;
            b: ptr lapack_complex_double; ldb: ptr cint;
            taub: ptr lapack_complex_double; work: ptr lapack_complex_double;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "zggqrf_", dynlib: libName.}
proc sggrqf*(m: ptr cint; p: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            taua: ptr cfloat; b: ptr cfloat; ldb: ptr cint; taub: ptr cfloat;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sggrqf_", dynlib: libName.}
proc dggrqf*(m: ptr cint; p: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            taua: ptr cdouble; b: ptr cdouble; ldb: ptr cint; taub: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dggrqf_", dynlib: libName.}
proc cggrqf*(m: ptr cint; p: ptr cint; n: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; taua: ptr lapack_complex_float;
            b: ptr lapack_complex_float; ldb: ptr cint;
            taub: ptr lapack_complex_float; work: ptr lapack_complex_float;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "cggrqf_", dynlib: libName.}
proc zggrqf*(m: ptr cint; p: ptr cint; n: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; taua: ptr lapack_complex_double;
            b: ptr lapack_complex_double; ldb: ptr cint;
            taub: ptr lapack_complex_double; work: ptr lapack_complex_double;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "zggrqf_", dynlib: libName.}
proc sgebrd*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; d: ptr cfloat;
            e: ptr cfloat; tauq: ptr cfloat; taup: ptr cfloat; work: ptr cfloat;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "sgebrd_", dynlib: libName.}
proc dgebrd*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; d: ptr cdouble;
            e: ptr cdouble; tauq: ptr cdouble; taup: ptr cdouble; work: ptr cdouble;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "dgebrd_", dynlib: libName.}
proc cgebrd*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            d: ptr cfloat; e: ptr cfloat; tauq: ptr lapack_complex_float;
            taup: ptr lapack_complex_float; work: ptr lapack_complex_float;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "cgebrd_", dynlib: libName.}
proc zgebrd*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            d: ptr cdouble; e: ptr cdouble; tauq: ptr lapack_complex_double;
            taup: ptr lapack_complex_double; work: ptr lapack_complex_double;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "zgebrd_", dynlib: libName.}
proc sgbbrd*(vect: cstring; m: ptr cint; n: ptr cint; ncc: ptr cint; kl: ptr cint;
            ku: ptr cint; ab: ptr cfloat; ldab: ptr cint; d: ptr cfloat; e: ptr cfloat;
            q: ptr cfloat; ldq: ptr cint; pt: ptr cfloat; ldpt: ptr cint; c: ptr cfloat;
            ldc: ptr cint; work: ptr cfloat; info: ptr cint) {.cdecl, importc: "sgbbrd_",
    dynlib: libName.}
proc dgbbrd*(vect: cstring; m: ptr cint; n: ptr cint; ncc: ptr cint; kl: ptr cint;
            ku: ptr cint; ab: ptr cdouble; ldab: ptr cint; d: ptr cdouble; e: ptr cdouble;
            q: ptr cdouble; ldq: ptr cint; pt: ptr cdouble; ldpt: ptr cint; c: ptr cdouble;
            ldc: ptr cint; work: ptr cdouble; info: ptr cint) {.cdecl, importc: "dgbbrd_",
    dynlib: libName.}
proc cgbbrd*(vect: cstring; m: ptr cint; n: ptr cint; ncc: ptr cint; kl: ptr cint;
            ku: ptr cint; ab: ptr lapack_complex_float; ldab: ptr cint; d: ptr cfloat;
            e: ptr cfloat; q: ptr lapack_complex_float; ldq: ptr cint;
            pt: ptr lapack_complex_float; ldpt: ptr cint; c: ptr lapack_complex_float;
            ldc: ptr cint; work: ptr lapack_complex_float; rwork: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "cgbbrd_", dynlib: libName.}
proc zgbbrd*(vect: cstring; m: ptr cint; n: ptr cint; ncc: ptr cint; kl: ptr cint;
            ku: ptr cint; ab: ptr lapack_complex_double; ldab: ptr cint; d: ptr cdouble;
            e: ptr cdouble; q: ptr lapack_complex_double; ldq: ptr cint;
            pt: ptr lapack_complex_double; ldpt: ptr cint;
            c: ptr lapack_complex_double; ldc: ptr cint;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zgbbrd_", dynlib: libName.}
proc sorgbr*(vect: cstring; m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cfloat;
            lda: ptr cint; tau: ptr cfloat; work: ptr cfloat; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "sorgbr_", dynlib: libName.}
proc dorgbr*(vect: cstring; m: ptr cint; n: ptr cint; k: ptr cint; a: ptr cdouble;
            lda: ptr cint; tau: ptr cdouble; work: ptr cdouble; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dorgbr_", dynlib: libName.}
proc sormbr*(vect: cstring; side: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            k: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat;
            ldc: ptr cint; work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sormbr_", dynlib: libName.}
proc dormbr*(vect: cstring; side: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            k: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble;
            ldc: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dormbr_", dynlib: libName.}
proc cungbr*(vect: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; tau: ptr lapack_complex_float;
            work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cungbr_", dynlib: libName.}
proc zungbr*(vect: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint;
            tau: ptr lapack_complex_double; work: ptr lapack_complex_double;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "zungbr_", dynlib: libName.}
proc cunmbr*(vect: cstring; side: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            k: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            tau: ptr lapack_complex_float; c: ptr lapack_complex_float; ldc: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cunmbr_", dynlib: libName.}
proc zunmbr*(vect: cstring; side: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            k: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            tau: ptr lapack_complex_double; c: ptr lapack_complex_double;
            ldc: ptr cint; work: ptr lapack_complex_double; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "zunmbr_", dynlib: libName.}
proc sbdsqr*(uplo: cstring; n: ptr cint; ncvt: ptr cint; nru: ptr cint; ncc: ptr cint;
            d: ptr cfloat; e: ptr cfloat; vt: ptr cfloat; ldvt: ptr cint; u: ptr cfloat;
            ldu: ptr cint; c: ptr cfloat; ldc: ptr cint; work: ptr cfloat; info: ptr cint) {.
    cdecl, importc: "sbdsqr_", dynlib: libName.}
proc dbdsqr*(uplo: cstring; n: ptr cint; ncvt: ptr cint; nru: ptr cint; ncc: ptr cint;
            d: ptr cdouble; e: ptr cdouble; vt: ptr cdouble; ldvt: ptr cint; u: ptr cdouble;
            ldu: ptr cint; c: ptr cdouble; ldc: ptr cint; work: ptr cdouble; info: ptr cint) {.
    cdecl, importc: "dbdsqr_", dynlib: libName.}
proc cbdsqr*(uplo: cstring; n: ptr cint; ncvt: ptr cint; nru: ptr cint; ncc: ptr cint;
            d: ptr cfloat; e: ptr cfloat; vt: ptr lapack_complex_float; ldvt: ptr cint;
            u: ptr lapack_complex_float; ldu: ptr cint; c: ptr lapack_complex_float;
            ldc: ptr cint; work: ptr cfloat; info: ptr cint) {.cdecl, importc: "cbdsqr_",
    dynlib: libName.}
proc zbdsqr*(uplo: cstring; n: ptr cint; ncvt: ptr cint; nru: ptr cint; ncc: ptr cint;
            d: ptr cdouble; e: ptr cdouble; vt: ptr lapack_complex_double;
            ldvt: ptr cint; u: ptr lapack_complex_double; ldu: ptr cint;
            c: ptr lapack_complex_double; ldc: ptr cint; work: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "zbdsqr_", dynlib: libName.}
proc sbdsdc*(uplo: cstring; compq: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat;
            u: ptr cfloat; ldu: ptr cint; vt: ptr cfloat; ldvt: ptr cint; q: ptr cfloat;
            iq: ptr cint; work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sbdsdc_", dynlib: libName.}
proc dbdsdc*(uplo: cstring; compq: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble;
            u: ptr cdouble; ldu: ptr cint; vt: ptr cdouble; ldvt: ptr cint; q: ptr cdouble;
            iq: ptr cint; work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dbdsdc_", dynlib: libName.}
proc ssytrd*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; d: ptr cfloat;
            e: ptr cfloat; tau: ptr cfloat; work: ptr cfloat; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "ssytrd_", dynlib: libName.}
proc dsytrd*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; d: ptr cdouble;
            e: ptr cdouble; tau: ptr cdouble; work: ptr cdouble; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dsytrd_", dynlib: libName.}
proc sorgtr*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sorgtr_", dynlib: libName.}
proc dorgtr*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dorgtr_", dynlib: libName.}
proc sormtr*(side: cstring; uplo: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat; ldc: ptr cint;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sormtr_", dynlib: libName.}
proc dormtr*(side: cstring; uplo: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble; ldc: ptr cint;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dormtr_", dynlib: libName.}
proc chetrd*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            d: ptr cfloat; e: ptr cfloat; tau: ptr lapack_complex_float;
            work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "chetrd_", dynlib: libName.}
proc zhetrd*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            d: ptr cdouble; e: ptr cdouble; tau: ptr lapack_complex_double;
            work: ptr lapack_complex_double; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zhetrd_", dynlib: libName.}
proc cungtr*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            tau: ptr lapack_complex_float; work: ptr lapack_complex_float;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "cungtr_", dynlib: libName.}
proc zungtr*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            tau: ptr lapack_complex_double; work: ptr lapack_complex_double;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "zungtr_", dynlib: libName.}
proc cunmtr*(side: cstring; uplo: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; tau: ptr lapack_complex_float;
            c: ptr lapack_complex_float; ldc: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cunmtr_", dynlib: libName.}
proc zunmtr*(side: cstring; uplo: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint;
            tau: ptr lapack_complex_double; c: ptr lapack_complex_double;
            ldc: ptr cint; work: ptr lapack_complex_double; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "zunmtr_", dynlib: libName.}
proc ssptrd*(uplo: cstring; n: ptr cint; ap: ptr cfloat; d: ptr cfloat; e: ptr cfloat;
            tau: ptr cfloat; info: ptr cint) {.cdecl, importc: "ssptrd_", dynlib: libName.}
proc dsptrd*(uplo: cstring; n: ptr cint; ap: ptr cdouble; d: ptr cdouble; e: ptr cdouble;
            tau: ptr cdouble; info: ptr cint) {.cdecl, importc: "dsptrd_",
    dynlib: libName.}
proc sopgtr*(uplo: cstring; n: ptr cint; ap: ptr cfloat; tau: ptr cfloat; q: ptr cfloat;
            ldq: ptr cint; work: ptr cfloat; info: ptr cint) {.cdecl, importc: "sopgtr_",
    dynlib: libName.}
proc dopgtr*(uplo: cstring; n: ptr cint; ap: ptr cdouble; tau: ptr cdouble; q: ptr cdouble;
            ldq: ptr cint; work: ptr cdouble; info: ptr cint) {.cdecl, importc: "dopgtr_",
    dynlib: libName.}
proc sopmtr*(side: cstring; uplo: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            ap: ptr cfloat; tau: ptr cfloat; c: ptr cfloat; ldc: ptr cint; work: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "sopmtr_", dynlib: libName.}
proc dopmtr*(side: cstring; uplo: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            ap: ptr cdouble; tau: ptr cdouble; c: ptr cdouble; ldc: ptr cint;
            work: ptr cdouble; info: ptr cint) {.cdecl, importc: "dopmtr_",
    dynlib: libName.}
proc chptrd*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_float; d: ptr cfloat;
            e: ptr cfloat; tau: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "chptrd_", dynlib: libName.}
proc zhptrd*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_double; d: ptr cdouble;
            e: ptr cdouble; tau: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zhptrd_", dynlib: libName.}
proc cupgtr*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_float;
            tau: ptr lapack_complex_float; q: ptr lapack_complex_float; ldq: ptr cint;
            work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "cupgtr_", dynlib: libName.}
proc zupgtr*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_double;
            tau: ptr lapack_complex_double; q: ptr lapack_complex_double;
            ldq: ptr cint; work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zupgtr_", dynlib: libName.}
proc cupmtr*(side: cstring; uplo: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            ap: ptr lapack_complex_float; tau: ptr lapack_complex_float;
            c: ptr lapack_complex_float; ldc: ptr cint;
            work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "cupmtr_", dynlib: libName.}
proc zupmtr*(side: cstring; uplo: cstring; trans: cstring; m: ptr cint; n: ptr cint;
            ap: ptr lapack_complex_double; tau: ptr lapack_complex_double;
            c: ptr lapack_complex_double; ldc: ptr cint;
            work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zupmtr_", dynlib: libName.}
proc ssbtrd*(vect: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cfloat;
            ldab: ptr cint; d: ptr cfloat; e: ptr cfloat; q: ptr cfloat; ldq: ptr cint;
            work: ptr cfloat; info: ptr cint) {.cdecl, importc: "ssbtrd_",
    dynlib: libName.}
proc dsbtrd*(vect: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cdouble;
            ldab: ptr cint; d: ptr cdouble; e: ptr cdouble; q: ptr cdouble; ldq: ptr cint;
            work: ptr cdouble; info: ptr cint) {.cdecl, importc: "dsbtrd_",
    dynlib: libName.}
proc chbtrd*(vect: cstring; uplo: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr lapack_complex_float; ldab: ptr cint; d: ptr cfloat; e: ptr cfloat;
            q: ptr lapack_complex_float; ldq: ptr cint;
            work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "chbtrd_", dynlib: libName.}
proc zhbtrd*(vect: cstring; uplo: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr lapack_complex_double; ldab: ptr cint; d: ptr cdouble;
            e: ptr cdouble; q: ptr lapack_complex_double; ldq: ptr cint;
            work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zhbtrd_", dynlib: libName.}
proc ssterf*(n: ptr cint; d: ptr cfloat; e: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "ssterf_", dynlib: libName.}
proc dsterf*(n: ptr cint; d: ptr cdouble; e: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dsterf_", dynlib: libName.}
proc ssteqr*(compz: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat; z: ptr cfloat;
            ldz: ptr cint; work: ptr cfloat; info: ptr cint) {.cdecl, importc: "ssteqr_",
    dynlib: libName.}
proc dsteqr*(compz: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble; z: ptr cdouble;
            ldz: ptr cint; work: ptr cdouble; info: ptr cint) {.cdecl, importc: "dsteqr_",
    dynlib: libName.}
proc csteqr*(compz: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat;
            z: ptr lapack_complex_float; ldz: ptr cint; work: ptr cfloat; info: ptr cint) {.
    cdecl, importc: "csteqr_", dynlib: libName.}
proc zsteqr*(compz: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble;
            z: ptr lapack_complex_double; ldz: ptr cint; work: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "zsteqr_", dynlib: libName.}
proc sstemr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat;
            vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint; m: ptr cint;
            w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; nzc: ptr cint; isuppz: ptr cint;
            tryrac: ptr cint; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "sstemr_",
    dynlib: libName.}
proc dstemr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble;
            vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint; m: ptr cint;
            w: ptr cdouble; z: ptr cdouble; ldz: ptr cint; nzc: ptr cint; isuppz: ptr cint;
            tryrac: ptr cint; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "dstemr_",
    dynlib: libName.}
proc cstemr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat;
            vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint; m: ptr cint;
            w: ptr cfloat; z: ptr lapack_complex_float; ldz: ptr cint; nzc: ptr cint;
            isuppz: ptr cint; tryrac: ptr cint; work: ptr cfloat; lwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cstemr_", dynlib: libName.}
proc zstemr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble;
            vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint; m: ptr cint;
            w: ptr cdouble; z: ptr lapack_complex_double; ldz: ptr cint; nzc: ptr cint;
            isuppz: ptr cint; tryrac: ptr cint; work: ptr cdouble; lwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zstemr_", dynlib: libName.}
proc sstedc*(compz: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat; z: ptr cfloat;
            ldz: ptr cint; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "sstedc_",
    dynlib: libName.}
proc dstedc*(compz: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble; z: ptr cdouble;
            ldz: ptr cint; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "dstedc_",
    dynlib: libName.}
proc cstedc*(compz: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat;
            z: ptr lapack_complex_float; ldz: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; rwork: ptr cfloat;
            lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cstedc_", dynlib: libName.}
proc zstedc*(compz: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble;
            z: ptr lapack_complex_double; ldz: ptr cint;
            work: ptr lapack_complex_double; lwork: ptr cint; rwork: ptr cdouble;
            lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zstedc_", dynlib: libName.}
proc sstegr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat;
            vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint; abstol: ptr cfloat;
            m: ptr cint; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; isuppz: ptr cint;
            work: ptr cfloat; lwork: ptr cint; iwork: ptr cint; liwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "sstegr_", dynlib: libName.}
proc dstegr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble;
            vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
            isuppz: ptr cint; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "dstegr_",
    dynlib: libName.}
proc cstegr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat;
            vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint; abstol: ptr cfloat;
            m: ptr cint; w: ptr cfloat; z: ptr lapack_complex_float; ldz: ptr cint;
            isuppz: ptr cint; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "cstegr_",
    dynlib: libName.}
proc zstegr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble;
            vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble;
            z: ptr lapack_complex_double; ldz: ptr cint; isuppz: ptr cint;
            work: ptr cdouble; lwork: ptr cint; iwork: ptr cint; liwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "zstegr_", dynlib: libName.}
proc spteqr*(compz: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat; z: ptr cfloat;
            ldz: ptr cint; work: ptr cfloat; info: ptr cint) {.cdecl, importc: "spteqr_",
    dynlib: libName.}
proc dpteqr*(compz: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble; z: ptr cdouble;
            ldz: ptr cint; work: ptr cdouble; info: ptr cint) {.cdecl, importc: "dpteqr_",
    dynlib: libName.}
proc cpteqr*(compz: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat;
            z: ptr lapack_complex_float; ldz: ptr cint; work: ptr cfloat; info: ptr cint) {.
    cdecl, importc: "cpteqr_", dynlib: libName.}
proc zpteqr*(compz: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble;
            z: ptr lapack_complex_double; ldz: ptr cint; work: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "zpteqr_", dynlib: libName.}
proc sstebz*(range: cstring; order: cstring; n: ptr cint; vl: ptr cfloat; vu: ptr cfloat;
            il: ptr cint; iu: ptr cint; abstol: ptr cfloat; d: ptr cfloat; e: ptr cfloat;
            m: ptr cint; nsplit: ptr cint; w: ptr cfloat; iblock: ptr cint;
            isplit: ptr cint; work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sstebz_", dynlib: libName.}
proc dstebz*(range: cstring; order: cstring; n: ptr cint; vl: ptr cdouble; vu: ptr cdouble;
            il: ptr cint; iu: ptr cint; abstol: ptr cdouble; d: ptr cdouble; e: ptr cdouble;
            m: ptr cint; nsplit: ptr cint; w: ptr cdouble; iblock: ptr cint;
            isplit: ptr cint; work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dstebz_", dynlib: libName.}
proc sstein*(n: ptr cint; d: ptr cfloat; e: ptr cfloat; m: ptr cint; w: ptr cfloat;
            iblock: ptr cint; isplit: ptr cint; z: ptr cfloat; ldz: ptr cint;
            work: ptr cfloat; iwork: ptr cint; ifailv: ptr cint; info: ptr cint) {.cdecl,
    importc: "sstein_", dynlib: libName.}
proc dstein*(n: ptr cint; d: ptr cdouble; e: ptr cdouble; m: ptr cint; w: ptr cdouble;
            iblock: ptr cint; isplit: ptr cint; z: ptr cdouble; ldz: ptr cint;
            work: ptr cdouble; iwork: ptr cint; ifailv: ptr cint; info: ptr cint) {.cdecl,
    importc: "dstein_", dynlib: libName.}
proc cstein*(n: ptr cint; d: ptr cfloat; e: ptr cfloat; m: ptr cint; w: ptr cfloat;
            iblock: ptr cint; isplit: ptr cint; z: ptr lapack_complex_float;
            ldz: ptr cint; work: ptr cfloat; iwork: ptr cint; ifailv: ptr cint;
            info: ptr cint) {.cdecl, importc: "cstein_", dynlib: libName.}
proc zstein*(n: ptr cint; d: ptr cdouble; e: ptr cdouble; m: ptr cint; w: ptr cdouble;
            iblock: ptr cint; isplit: ptr cint; z: ptr lapack_complex_double;
            ldz: ptr cint; work: ptr cdouble; iwork: ptr cint; ifailv: ptr cint;
            info: ptr cint) {.cdecl, importc: "zstein_", dynlib: libName.}
proc sdisna*(job: cstring; m: ptr cint; n: ptr cint; d: ptr cfloat; sep: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "sdisna_", dynlib: libName.}
proc ddisna*(job: cstring; m: ptr cint; n: ptr cint; d: ptr cdouble; sep: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "ddisna_", dynlib: libName.}
proc ssygst*(itype: ptr cint; uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            b: ptr cfloat; ldb: ptr cint; info: ptr cint) {.cdecl, importc: "ssygst_",
    dynlib: libName.}
proc dsygst*(itype: ptr cint; uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; info: ptr cint) {.cdecl, importc: "dsygst_",
    dynlib: libName.}
proc chegst*(itype: ptr cint; uplo: cstring; n: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "chegst_", dynlib: libName.}
proc zhegst*(itype: ptr cint; uplo: cstring; n: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint; info: ptr cint) {.
    cdecl, importc: "zhegst_", dynlib: libName.}
proc sspgst*(itype: ptr cint; uplo: cstring; n: ptr cint; ap: ptr cfloat; bp: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "sspgst_", dynlib: libName.}
proc dspgst*(itype: ptr cint; uplo: cstring; n: ptr cint; ap: ptr cdouble; bp: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "dspgst_", dynlib: libName.}
proc chpgst*(itype: ptr cint; uplo: cstring; n: ptr cint; ap: ptr lapack_complex_float;
            bp: ptr lapack_complex_float; info: ptr cint) {.cdecl, importc: "chpgst_",
    dynlib: libName.}
proc zhpgst*(itype: ptr cint; uplo: cstring; n: ptr cint; ap: ptr lapack_complex_double;
            bp: ptr lapack_complex_double; info: ptr cint) {.cdecl, importc: "zhpgst_",
    dynlib: libName.}
proc ssbgst*(vect: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
            ab: ptr cfloat; ldab: ptr cint; bb: ptr cfloat; ldbb: ptr cint; x: ptr cfloat;
            ldx: ptr cint; work: ptr cfloat; info: ptr cint) {.cdecl, importc: "ssbgst_",
    dynlib: libName.}
proc dsbgst*(vect: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
            ab: ptr cdouble; ldab: ptr cint; bb: ptr cdouble; ldbb: ptr cint;
            x: ptr cdouble; ldx: ptr cint; work: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dsbgst_", dynlib: libName.}
proc chbgst*(vect: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
            ab: ptr lapack_complex_float; ldab: ptr cint;
            bb: ptr lapack_complex_float; ldbb: ptr cint; x: ptr lapack_complex_float;
            ldx: ptr cint; work: ptr lapack_complex_float; rwork: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "chbgst_", dynlib: libName.}
proc zhbgst*(vect: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
            ab: ptr lapack_complex_double; ldab: ptr cint;
            bb: ptr lapack_complex_double; ldbb: ptr cint;
            x: ptr lapack_complex_double; ldx: ptr cint;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zhbgst_", dynlib: libName.}
proc spbstf*(uplo: cstring; n: ptr cint; kb: ptr cint; bb: ptr cfloat; ldbb: ptr cint;
            info: ptr cint) {.cdecl, importc: "spbstf_", dynlib: libName.}
proc dpbstf*(uplo: cstring; n: ptr cint; kb: ptr cint; bb: ptr cdouble; ldbb: ptr cint;
            info: ptr cint) {.cdecl, importc: "dpbstf_", dynlib: libName.}
proc cpbstf*(uplo: cstring; n: ptr cint; kb: ptr cint; bb: ptr lapack_complex_float;
            ldbb: ptr cint; info: ptr cint) {.cdecl, importc: "cpbstf_", dynlib: libName.}
proc zpbstf*(uplo: cstring; n: ptr cint; kb: ptr cint; bb: ptr lapack_complex_double;
            ldbb: ptr cint; info: ptr cint) {.cdecl, importc: "zpbstf_", dynlib: libName.}
proc sgehrd*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgehrd_", dynlib: libName.}
proc dgehrd*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgehrd_", dynlib: libName.}
proc cgehrd*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; tau: ptr lapack_complex_float;
            work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cgehrd_", dynlib: libName.}
proc zgehrd*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; tau: ptr lapack_complex_double;
            work: ptr lapack_complex_double; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zgehrd_", dynlib: libName.}
proc sorghr*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr cfloat; lda: ptr cint;
            tau: ptr cfloat; work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sorghr_", dynlib: libName.}
proc dorghr*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr cdouble; lda: ptr cint;
            tau: ptr cdouble; work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dorghr_", dynlib: libName.}
proc sormhr*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat; c: ptr cfloat;
            ldc: ptr cint; work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sormhr_", dynlib: libName.}
proc dormhr*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble; c: ptr cdouble;
            ldc: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dormhr_", dynlib: libName.}
proc cunghr*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; tau: ptr lapack_complex_float;
            work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cunghr_", dynlib: libName.}
proc zunghr*(n: ptr cint; ilo: ptr cint; ihi: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; tau: ptr lapack_complex_double;
            work: ptr lapack_complex_double; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zunghr_", dynlib: libName.}
proc cunmhr*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            tau: ptr lapack_complex_float; c: ptr lapack_complex_float; ldc: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cunmhr_", dynlib: libName.}
proc zunmhr*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            tau: ptr lapack_complex_double; c: ptr lapack_complex_double;
            ldc: ptr cint; work: ptr lapack_complex_double; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "zunmhr_", dynlib: libName.}
proc sgebal*(job: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; ilo: ptr cint;
            ihi: ptr cint; scale: ptr cfloat; info: ptr cint) {.cdecl, importc: "sgebal_",
    dynlib: libName.}
proc dgebal*(job: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; ilo: ptr cint;
            ihi: ptr cint; scale: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dgebal_", dynlib: libName.}
proc cgebal*(job: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            ilo: ptr cint; ihi: ptr cint; scale: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cgebal_", dynlib: libName.}
proc zgebal*(job: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            ilo: ptr cint; ihi: ptr cint; scale: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zgebal_", dynlib: libName.}
proc sgebak*(job: cstring; side: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            scale: ptr cfloat; m: ptr cint; v: ptr cfloat; ldv: ptr cint; info: ptr cint) {.
    cdecl, importc: "sgebak_", dynlib: libName.}
proc dgebak*(job: cstring; side: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            scale: ptr cdouble; m: ptr cint; v: ptr cdouble; ldv: ptr cint; info: ptr cint) {.
    cdecl, importc: "dgebak_", dynlib: libName.}
proc cgebak*(job: cstring; side: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            scale: ptr cfloat; m: ptr cint; v: ptr lapack_complex_float; ldv: ptr cint;
            info: ptr cint) {.cdecl, importc: "cgebak_", dynlib: libName.}
proc zgebak*(job: cstring; side: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            scale: ptr cdouble; m: ptr cint; v: ptr lapack_complex_double; ldv: ptr cint;
            info: ptr cint) {.cdecl, importc: "zgebak_", dynlib: libName.}
proc shseqr*(job: cstring; compz: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            h: ptr cfloat; ldh: ptr cint; wr: ptr cfloat; wi: ptr cfloat; z: ptr cfloat;
            ldz: ptr cint; work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "shseqr_", dynlib: libName.}
proc dhseqr*(job: cstring; compz: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            h: ptr cdouble; ldh: ptr cint; wr: ptr cdouble; wi: ptr cdouble; z: ptr cdouble;
            ldz: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dhseqr_", dynlib: libName.}
proc chseqr*(job: cstring; compz: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            h: ptr lapack_complex_float; ldh: ptr cint; w: ptr lapack_complex_float;
            z: ptr lapack_complex_float; ldz: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "chseqr_", dynlib: libName.}
proc zhseqr*(job: cstring; compz: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            h: ptr lapack_complex_double; ldh: ptr cint; w: ptr lapack_complex_double;
            z: ptr lapack_complex_double; ldz: ptr cint;
            work: ptr lapack_complex_double; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zhseqr_", dynlib: libName.}
proc shsein*(job: cstring; eigsrc: cstring; initv: cstring; select: ptr cint; n: ptr cint;
            h: ptr cfloat; ldh: ptr cint; wr: ptr cfloat; wi: ptr cfloat; vl: ptr cfloat;
            ldvl: ptr cint; vr: ptr cfloat; ldvr: ptr cint; mm: ptr cint; m: ptr cint;
            work: ptr cfloat; ifaill: ptr cint; ifailr: ptr cint; info: ptr cint) {.cdecl,
    importc: "shsein_", dynlib: libName.}
proc dhsein*(job: cstring; eigsrc: cstring; initv: cstring; select: ptr cint; n: ptr cint;
            h: ptr cdouble; ldh: ptr cint; wr: ptr cdouble; wi: ptr cdouble;
            vl: ptr cdouble; ldvl: ptr cint; vr: ptr cdouble; ldvr: ptr cint; mm: ptr cint;
            m: ptr cint; work: ptr cdouble; ifaill: ptr cint; ifailr: ptr cint;
            info: ptr cint) {.cdecl, importc: "dhsein_", dynlib: libName.}
proc chsein*(job: cstring; eigsrc: cstring; initv: cstring; select: ptr cint; n: ptr cint;
            h: ptr lapack_complex_float; ldh: ptr cint; w: ptr lapack_complex_float;
            vl: ptr lapack_complex_float; ldvl: ptr cint;
            vr: ptr lapack_complex_float; ldvr: ptr cint; mm: ptr cint; m: ptr cint;
            work: ptr lapack_complex_float; rwork: ptr cfloat; ifaill: ptr cint;
            ifailr: ptr cint; info: ptr cint) {.cdecl, importc: "chsein_",
    dynlib: libName.}
proc zhsein*(job: cstring; eigsrc: cstring; initv: cstring; select: ptr cint; n: ptr cint;
            h: ptr lapack_complex_double; ldh: ptr cint; w: ptr lapack_complex_double;
            vl: ptr lapack_complex_double; ldvl: ptr cint;
            vr: ptr lapack_complex_double; ldvr: ptr cint; mm: ptr cint; m: ptr cint;
            work: ptr lapack_complex_double; rwork: ptr cdouble; ifaill: ptr cint;
            ifailr: ptr cint; info: ptr cint) {.cdecl, importc: "zhsein_",
    dynlib: libName.}
proc strevc*(side: cstring; howmny: cstring; select: ptr cint; n: ptr cint; t: ptr cfloat;
            ldt: ptr cint; vl: ptr cfloat; ldvl: ptr cint; vr: ptr cfloat; ldvr: ptr cint;
            mm: ptr cint; m: ptr cint; work: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "strevc_", dynlib: libName.}
proc dtrevc*(side: cstring; howmny: cstring; select: ptr cint; n: ptr cint; t: ptr cdouble;
            ldt: ptr cint; vl: ptr cdouble; ldvl: ptr cint; vr: ptr cdouble; ldvr: ptr cint;
            mm: ptr cint; m: ptr cint; work: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dtrevc_", dynlib: libName.}
proc ctrevc*(side: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            t: ptr lapack_complex_float; ldt: ptr cint; vl: ptr lapack_complex_float;
            ldvl: ptr cint; vr: ptr lapack_complex_float; ldvr: ptr cint; mm: ptr cint;
            m: ptr cint; work: ptr lapack_complex_float; rwork: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "ctrevc_", dynlib: libName.}
proc ztrevc*(side: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            t: ptr lapack_complex_double; ldt: ptr cint;
            vl: ptr lapack_complex_double; ldvl: ptr cint;
            vr: ptr lapack_complex_double; ldvr: ptr cint; mm: ptr cint; m: ptr cint;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "ztrevc_", dynlib: libName.}
proc strsna*(job: cstring; howmny: cstring; select: ptr cint; n: ptr cint; t: ptr cfloat;
            ldt: ptr cint; vl: ptr cfloat; ldvl: ptr cint; vr: ptr cfloat; ldvr: ptr cint;
            s: ptr cfloat; sep: ptr cfloat; mm: ptr cint; m: ptr cint; work: ptr cfloat;
            ldwork: ptr cint; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "strsna_", dynlib: libName.}
proc dtrsna*(job: cstring; howmny: cstring; select: ptr cint; n: ptr cint; t: ptr cdouble;
            ldt: ptr cint; vl: ptr cdouble; ldvl: ptr cint; vr: ptr cdouble; ldvr: ptr cint;
            s: ptr cdouble; sep: ptr cdouble; mm: ptr cint; m: ptr cint; work: ptr cdouble;
            ldwork: ptr cint; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dtrsna_", dynlib: libName.}
proc ctrsna*(job: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            t: ptr lapack_complex_float; ldt: ptr cint; vl: ptr lapack_complex_float;
            ldvl: ptr cint; vr: ptr lapack_complex_float; ldvr: ptr cint; s: ptr cfloat;
            sep: ptr cfloat; mm: ptr cint; m: ptr cint; work: ptr lapack_complex_float;
            ldwork: ptr cint; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "ctrsna_", dynlib: libName.}
proc ztrsna*(job: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            t: ptr lapack_complex_double; ldt: ptr cint;
            vl: ptr lapack_complex_double; ldvl: ptr cint;
            vr: ptr lapack_complex_double; ldvr: ptr cint; s: ptr cdouble;
            sep: ptr cdouble; mm: ptr cint; m: ptr cint; work: ptr lapack_complex_double;
            ldwork: ptr cint; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "ztrsna_", dynlib: libName.}
proc strexc*(compq: cstring; n: ptr cint; t: ptr cfloat; ldt: ptr cint; q: ptr cfloat;
            ldq: ptr cint; ifst: ptr cint; ilst: ptr cint; work: ptr cfloat; info: ptr cint) {.
    cdecl, importc: "strexc_", dynlib: libName.}
proc dtrexc*(compq: cstring; n: ptr cint; t: ptr cdouble; ldt: ptr cint; q: ptr cdouble;
            ldq: ptr cint; ifst: ptr cint; ilst: ptr cint; work: ptr cdouble; info: ptr cint) {.
    cdecl, importc: "dtrexc_", dynlib: libName.}
proc ctrexc*(compq: cstring; n: ptr cint; t: ptr lapack_complex_float; ldt: ptr cint;
            q: ptr lapack_complex_float; ldq: ptr cint; ifst: ptr cint; ilst: ptr cint;
            info: ptr cint) {.cdecl, importc: "ctrexc_", dynlib: libName.}
proc ztrexc*(compq: cstring; n: ptr cint; t: ptr lapack_complex_double; ldt: ptr cint;
            q: ptr lapack_complex_double; ldq: ptr cint; ifst: ptr cint; ilst: ptr cint;
            info: ptr cint) {.cdecl, importc: "ztrexc_", dynlib: libName.}
proc strsen*(job: cstring; compq: cstring; select: ptr cint; n: ptr cint; t: ptr cfloat;
            ldt: ptr cint; q: ptr cfloat; ldq: ptr cint; wr: ptr cfloat; wi: ptr cfloat;
            m: ptr cint; s: ptr cfloat; sep: ptr cfloat; work: ptr cfloat; lwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "strsen_", dynlib: libName.}
proc dtrsen*(job: cstring; compq: cstring; select: ptr cint; n: ptr cint; t: ptr cdouble;
            ldt: ptr cint; q: ptr cdouble; ldq: ptr cint; wr: ptr cdouble; wi: ptr cdouble;
            m: ptr cint; s: ptr cdouble; sep: ptr cdouble; work: ptr cdouble;
            lwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dtrsen_", dynlib: libName.}
proc ctrsen*(job: cstring; compq: cstring; select: ptr cint; n: ptr cint;
            t: ptr lapack_complex_float; ldt: ptr cint; q: ptr lapack_complex_float;
            ldq: ptr cint; w: ptr lapack_complex_float; m: ptr cint; s: ptr cfloat;
            sep: ptr cfloat; work: ptr lapack_complex_float; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "ctrsen_", dynlib: libName.}
proc ztrsen*(job: cstring; compq: cstring; select: ptr cint; n: ptr cint;
            t: ptr lapack_complex_double; ldt: ptr cint; q: ptr lapack_complex_double;
            ldq: ptr cint; w: ptr lapack_complex_double; m: ptr cint; s: ptr cdouble;
            sep: ptr cdouble; work: ptr lapack_complex_double; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "ztrsen_", dynlib: libName.}
proc strsyl*(trana: cstring; tranb: cstring; isgn: ptr cint; m: ptr cint; n: ptr cint;
            a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint; c: ptr cfloat;
            ldc: ptr cint; scale: ptr cfloat; info: ptr cint) {.cdecl, importc: "strsyl_",
    dynlib: libName.}
proc dtrsyl*(trana: cstring; tranb: cstring; isgn: ptr cint; m: ptr cint; n: ptr cint;
            a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint; c: ptr cdouble;
            ldc: ptr cint; scale: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dtrsyl_", dynlib: libName.}
proc ctrsyl*(trana: cstring; tranb: cstring; isgn: ptr cint; m: ptr cint; n: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; b: ptr lapack_complex_float;
            ldb: ptr cint; c: ptr lapack_complex_float; ldc: ptr cint; scale: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "ctrsyl_", dynlib: libName.}
proc ztrsyl*(trana: cstring; tranb: cstring; isgn: ptr cint; m: ptr cint; n: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint; b: ptr lapack_complex_double;
            ldb: ptr cint; c: ptr lapack_complex_double; ldc: ptr cint;
            scale: ptr cdouble; info: ptr cint) {.cdecl, importc: "ztrsyl_",
    dynlib: libName.}
proc sgghrd*(compq: cstring; compz: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint; q: ptr cfloat;
            ldq: ptr cint; z: ptr cfloat; ldz: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgghrd_", dynlib: libName.}
proc dgghrd*(compq: cstring; compz: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint; q: ptr cdouble;
            ldq: ptr cint; z: ptr cdouble; ldz: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgghrd_", dynlib: libName.}
proc cgghrd*(compq: cstring; compz: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; b: ptr lapack_complex_float;
            ldb: ptr cint; q: ptr lapack_complex_float; ldq: ptr cint;
            z: ptr lapack_complex_float; ldz: ptr cint; info: ptr cint) {.cdecl,
    importc: "cgghrd_", dynlib: libName.}
proc zgghrd*(compq: cstring; compz: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint; b: ptr lapack_complex_double;
            ldb: ptr cint; q: ptr lapack_complex_double; ldq: ptr cint;
            z: ptr lapack_complex_double; ldz: ptr cint; info: ptr cint) {.cdecl,
    importc: "zgghrd_", dynlib: libName.}
proc sggbal*(job: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat;
            ldb: ptr cint; ilo: ptr cint; ihi: ptr cint; lscale: ptr cfloat;
            rscale: ptr cfloat; work: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "sggbal_", dynlib: libName.}
proc dggbal*(job: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; b: ptr cdouble;
            ldb: ptr cint; ilo: ptr cint; ihi: ptr cint; lscale: ptr cdouble;
            rscale: ptr cdouble; work: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dggbal_", dynlib: libName.}
proc cggbal*(job: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            b: ptr lapack_complex_float; ldb: ptr cint; ilo: ptr cint; ihi: ptr cint;
            lscale: ptr cfloat; rscale: ptr cfloat; work: ptr cfloat; info: ptr cint) {.
    cdecl, importc: "cggbal_", dynlib: libName.}
proc zggbal*(job: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; ilo: ptr cint; ihi: ptr cint;
            lscale: ptr cdouble; rscale: ptr cdouble; work: ptr cdouble; info: ptr cint) {.
    cdecl, importc: "zggbal_", dynlib: libName.}
proc sggbak*(job: cstring; side: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            lscale: ptr cfloat; rscale: ptr cfloat; m: ptr cint; v: ptr cfloat;
            ldv: ptr cint; info: ptr cint) {.cdecl, importc: "sggbak_", dynlib: libName.}
proc dggbak*(job: cstring; side: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            lscale: ptr cdouble; rscale: ptr cdouble; m: ptr cint; v: ptr cdouble;
            ldv: ptr cint; info: ptr cint) {.cdecl, importc: "dggbak_", dynlib: libName.}
proc cggbak*(job: cstring; side: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            lscale: ptr cfloat; rscale: ptr cfloat; m: ptr cint;
            v: ptr lapack_complex_float; ldv: ptr cint; info: ptr cint) {.cdecl,
    importc: "cggbak_", dynlib: libName.}
proc zggbak*(job: cstring; side: cstring; n: ptr cint; ilo: ptr cint; ihi: ptr cint;
            lscale: ptr cdouble; rscale: ptr cdouble; m: ptr cint;
            v: ptr lapack_complex_double; ldv: ptr cint; info: ptr cint) {.cdecl,
    importc: "zggbak_", dynlib: libName.}
proc shgeqz*(job: cstring; compq: cstring; compz: cstring; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr cfloat; ldh: ptr cint; t: ptr cfloat; ldt: ptr cint;
            alphar: ptr cfloat; alphai: ptr cfloat; beta: ptr cfloat; q: ptr cfloat;
            ldq: ptr cint; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "shgeqz_", dynlib: libName.}
proc dhgeqz*(job: cstring; compq: cstring; compz: cstring; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr cdouble; ldh: ptr cint; t: ptr cdouble; ldt: ptr cint;
            alphar: ptr cdouble; alphai: ptr cdouble; beta: ptr cdouble; q: ptr cdouble;
            ldq: ptr cint; z: ptr cdouble; ldz: ptr cint; work: ptr cdouble;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "dhgeqz_", dynlib: libName.}
proc chgeqz*(job: cstring; compq: cstring; compz: cstring; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr lapack_complex_float; ldh: ptr cint;
            t: ptr lapack_complex_float; ldt: ptr cint;
            alpha: ptr lapack_complex_float; beta: ptr lapack_complex_float;
            q: ptr lapack_complex_float; ldq: ptr cint; z: ptr lapack_complex_float;
            ldz: ptr cint; work: ptr lapack_complex_float; lwork: ptr cint;
            rwork: ptr cfloat; info: ptr cint) {.cdecl, importc: "chgeqz_",
    dynlib: libName.}
proc zhgeqz*(job: cstring; compq: cstring; compz: cstring; n: ptr cint; ilo: ptr cint;
            ihi: ptr cint; h: ptr lapack_complex_double; ldh: ptr cint;
            t: ptr lapack_complex_double; ldt: ptr cint;
            alpha: ptr lapack_complex_double; beta: ptr lapack_complex_double;
            q: ptr lapack_complex_double; ldq: ptr cint; z: ptr lapack_complex_double;
            ldz: ptr cint; work: ptr lapack_complex_double; lwork: ptr cint;
            rwork: ptr cdouble; info: ptr cint) {.cdecl, importc: "zhgeqz_",
    dynlib: libName.}
proc stgevc*(side: cstring; howmny: cstring; select: ptr cint; n: ptr cint; s: ptr cfloat;
            lds: ptr cint; p: ptr cfloat; ldp: ptr cint; vl: ptr cfloat; ldvl: ptr cint;
            vr: ptr cfloat; ldvr: ptr cint; mm: ptr cint; m: ptr cint; work: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "stgevc_", dynlib: libName.}
proc dtgevc*(side: cstring; howmny: cstring; select: ptr cint; n: ptr cint; s: ptr cdouble;
            lds: ptr cint; p: ptr cdouble; ldp: ptr cint; vl: ptr cdouble; ldvl: ptr cint;
            vr: ptr cdouble; ldvr: ptr cint; mm: ptr cint; m: ptr cint; work: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "dtgevc_", dynlib: libName.}
proc ctgevc*(side: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            s: ptr lapack_complex_float; lds: ptr cint; p: ptr lapack_complex_float;
            ldp: ptr cint; vl: ptr lapack_complex_float; ldvl: ptr cint;
            vr: ptr lapack_complex_float; ldvr: ptr cint; mm: ptr cint; m: ptr cint;
            work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "ctgevc_", dynlib: libName.}
proc ztgevc*(side: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            s: ptr lapack_complex_double; lds: ptr cint; p: ptr lapack_complex_double;
            ldp: ptr cint; vl: ptr lapack_complex_double; ldvl: ptr cint;
            vr: ptr lapack_complex_double; ldvr: ptr cint; mm: ptr cint; m: ptr cint;
            work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "ztgevc_", dynlib: libName.}
proc stgexc*(wantq: ptr cint; wantz: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            b: ptr cfloat; ldb: ptr cint; q: ptr cfloat; ldq: ptr cint; z: ptr cfloat;
            ldz: ptr cint; ifst: ptr cint; ilst: ptr cint; work: ptr cfloat;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "stgexc_", dynlib: libName.}
proc dtgexc*(wantq: ptr cint; wantz: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; q: ptr cdouble; ldq: ptr cint; z: ptr cdouble;
            ldz: ptr cint; ifst: ptr cint; ilst: ptr cint; work: ptr cdouble;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "dtgexc_", dynlib: libName.}
proc ctgexc*(wantq: ptr cint; wantz: ptr cint; n: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint;
            q: ptr lapack_complex_float; ldq: ptr cint; z: ptr lapack_complex_float;
            ldz: ptr cint; ifst: ptr cint; ilst: ptr cint; info: ptr cint) {.cdecl,
    importc: "ctgexc_", dynlib: libName.}
proc ztgexc*(wantq: ptr cint; wantz: ptr cint; n: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
            q: ptr lapack_complex_double; ldq: ptr cint; z: ptr lapack_complex_double;
            ldz: ptr cint; ifst: ptr cint; ilst: ptr cint; info: ptr cint) {.cdecl,
    importc: "ztgexc_", dynlib: libName.}
proc stgsen*(ijob: ptr cint; wantq: ptr cint; wantz: ptr cint; select: ptr cint; n: ptr cint;
            a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint; alphar: ptr cfloat;
            alphai: ptr cfloat; beta: ptr cfloat; q: ptr cfloat; ldq: ptr cint;
            z: ptr cfloat; ldz: ptr cint; m: ptr cint; pl: ptr cfloat; pr: ptr cfloat;
            dif: ptr cfloat; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "stgsen_",
    dynlib: libName.}
proc dtgsen*(ijob: ptr cint; wantq: ptr cint; wantz: ptr cint; select: ptr cint; n: ptr cint;
            a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint;
            alphar: ptr cdouble; alphai: ptr cdouble; beta: ptr cdouble; q: ptr cdouble;
            ldq: ptr cint; z: ptr cdouble; ldz: ptr cint; m: ptr cint; pl: ptr cdouble;
            pr: ptr cdouble; dif: ptr cdouble; work: ptr cdouble; lwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dtgsen_", dynlib: libName.}
proc ctgsen*(ijob: ptr cint; wantq: ptr cint; wantz: ptr cint; select: ptr cint; n: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; b: ptr lapack_complex_float;
            ldb: ptr cint; alpha: ptr lapack_complex_float;
            beta: ptr lapack_complex_float; q: ptr lapack_complex_float;
            ldq: ptr cint; z: ptr lapack_complex_float; ldz: ptr cint; m: ptr cint;
            pl: ptr cfloat; pr: ptr cfloat; dif: ptr cfloat;
            work: ptr lapack_complex_float; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "ctgsen_",
    dynlib: libName.}
proc ztgsen*(ijob: ptr cint; wantq: ptr cint; wantz: ptr cint; select: ptr cint; n: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint; b: ptr lapack_complex_double;
            ldb: ptr cint; alpha: ptr lapack_complex_double;
            beta: ptr lapack_complex_double; q: ptr lapack_complex_double;
            ldq: ptr cint; z: ptr lapack_complex_double; ldz: ptr cint; m: ptr cint;
            pl: ptr cdouble; pr: ptr cdouble; dif: ptr cdouble;
            work: ptr lapack_complex_double; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "ztgsen_",
    dynlib: libName.}
proc stgsyl*(trans: cstring; ijob: ptr cint; m: ptr cint; n: ptr cint; a: ptr cfloat;
            lda: ptr cint; b: ptr cfloat; ldb: ptr cint; c: ptr cfloat; ldc: ptr cint;
            d: ptr cfloat; ldd: ptr cint; e: ptr cfloat; lde: ptr cint; f: ptr cfloat;
            ldf: ptr cint; scale: ptr cfloat; dif: ptr cfloat; work: ptr cfloat;
            lwork: ptr cint; iwork: ptr cint; info: ptr cint) {.cdecl, importc: "stgsyl_",
    dynlib: libName.}
proc dtgsyl*(trans: cstring; ijob: ptr cint; m: ptr cint; n: ptr cint; a: ptr cdouble;
            lda: ptr cint; b: ptr cdouble; ldb: ptr cint; c: ptr cdouble; ldc: ptr cint;
            d: ptr cdouble; ldd: ptr cint; e: ptr cdouble; lde: ptr cint; f: ptr cdouble;
            ldf: ptr cint; scale: ptr cdouble; dif: ptr cdouble; work: ptr cdouble;
            lwork: ptr cint; iwork: ptr cint; info: ptr cint) {.cdecl, importc: "dtgsyl_",
    dynlib: libName.}
proc ctgsyl*(trans: cstring; ijob: ptr cint; m: ptr cint; n: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; b: ptr lapack_complex_float;
            ldb: ptr cint; c: ptr lapack_complex_float; ldc: ptr cint;
            d: ptr lapack_complex_float; ldd: ptr cint; e: ptr lapack_complex_float;
            lde: ptr cint; f: ptr lapack_complex_float; ldf: ptr cint; scale: ptr cfloat;
            dif: ptr cfloat; work: ptr lapack_complex_float; lwork: ptr cint;
            iwork: ptr cint; info: ptr cint) {.cdecl, importc: "ctgsyl_", dynlib: libName.}
proc ztgsyl*(trans: cstring; ijob: ptr cint; m: ptr cint; n: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint; b: ptr lapack_complex_double;
            ldb: ptr cint; c: ptr lapack_complex_double; ldc: ptr cint;
            d: ptr lapack_complex_double; ldd: ptr cint; e: ptr lapack_complex_double;
            lde: ptr cint; f: ptr lapack_complex_double; ldf: ptr cint;
            scale: ptr cdouble; dif: ptr cdouble; work: ptr lapack_complex_double;
            lwork: ptr cint; iwork: ptr cint; info: ptr cint) {.cdecl, importc: "ztgsyl_",
    dynlib: libName.}
proc stgsna*(job: cstring; howmny: cstring; select: ptr cint; n: ptr cint; a: ptr cfloat;
            lda: ptr cint; b: ptr cfloat; ldb: ptr cint; vl: ptr cfloat; ldvl: ptr cint;
            vr: ptr cfloat; ldvr: ptr cint; s: ptr cfloat; dif: ptr cfloat; mm: ptr cint;
            m: ptr cint; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint; info: ptr cint) {.
    cdecl, importc: "stgsna_", dynlib: libName.}
proc dtgsna*(job: cstring; howmny: cstring; select: ptr cint; n: ptr cint; a: ptr cdouble;
            lda: ptr cint; b: ptr cdouble; ldb: ptr cint; vl: ptr cdouble; ldvl: ptr cint;
            vr: ptr cdouble; ldvr: ptr cint; s: ptr cdouble; dif: ptr cdouble; mm: ptr cint;
            m: ptr cint; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint; info: ptr cint) {.
    cdecl, importc: "dtgsna_", dynlib: libName.}
proc ctgsna*(job: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; b: ptr lapack_complex_float;
            ldb: ptr cint; vl: ptr lapack_complex_float; ldvl: ptr cint;
            vr: ptr lapack_complex_float; ldvr: ptr cint; s: ptr cfloat; dif: ptr cfloat;
            mm: ptr cint; m: ptr cint; work: ptr lapack_complex_float; lwork: ptr cint;
            iwork: ptr cint; info: ptr cint) {.cdecl, importc: "ctgsna_", dynlib: libName.}
proc ztgsna*(job: cstring; howmny: cstring; select: ptr cint; n: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint; b: ptr lapack_complex_double;
            ldb: ptr cint; vl: ptr lapack_complex_double; ldvl: ptr cint;
            vr: ptr lapack_complex_double; ldvr: ptr cint; s: ptr cdouble;
            dif: ptr cdouble; mm: ptr cint; m: ptr cint; work: ptr lapack_complex_double;
            lwork: ptr cint; iwork: ptr cint; info: ptr cint) {.cdecl, importc: "ztgsna_",
    dynlib: libName.}
proc sggsvp*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; p: ptr cint;
            n: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint;
            tola: ptr cfloat; tolb: ptr cfloat; k: ptr cint; l: ptr cint; u: ptr cfloat;
            ldu: ptr cint; v: ptr cfloat; ldv: ptr cint; q: ptr cfloat; ldq: ptr cint;
            iwork: ptr cint; tau: ptr cfloat; work: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "sggsvp_", dynlib: libName.}
proc dggsvp*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; p: ptr cint;
            n: ptr cint; a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint;
            tola: ptr cdouble; tolb: ptr cdouble; k: ptr cint; l: ptr cint; u: ptr cdouble;
            ldu: ptr cint; v: ptr cdouble; ldv: ptr cint; q: ptr cdouble; ldq: ptr cint;
            iwork: ptr cint; tau: ptr cdouble; work: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dggsvp_", dynlib: libName.}
proc cggsvp*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; p: ptr cint;
            n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            b: ptr lapack_complex_float; ldb: ptr cint; tola: ptr cfloat;
            tolb: ptr cfloat; k: ptr cint; l: ptr cint; u: ptr lapack_complex_float;
            ldu: ptr cint; v: ptr lapack_complex_float; ldv: ptr cint;
            q: ptr lapack_complex_float; ldq: ptr cint; iwork: ptr cint;
            rwork: ptr cfloat; tau: ptr lapack_complex_float;
            work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "cggsvp_", dynlib: libName.}
proc zggsvp*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; p: ptr cint;
            n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; tola: ptr cdouble;
            tolb: ptr cdouble; k: ptr cint; l: ptr cint; u: ptr lapack_complex_double;
            ldu: ptr cint; v: ptr lapack_complex_double; ldv: ptr cint;
            q: ptr lapack_complex_double; ldq: ptr cint; iwork: ptr cint;
            rwork: ptr cdouble; tau: ptr lapack_complex_double;
            work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zggsvp_", dynlib: libName.}
proc stgsja*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; p: ptr cint;
            n: ptr cint; k: ptr cint; l: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat;
            ldb: ptr cint; tola: ptr cfloat; tolb: ptr cfloat; alpha: ptr cfloat;
            beta: ptr cfloat; u: ptr cfloat; ldu: ptr cint; v: ptr cfloat; ldv: ptr cint;
            q: ptr cfloat; ldq: ptr cint; work: ptr cfloat; ncycle: ptr cint; info: ptr cint) {.
    cdecl, importc: "stgsja_", dynlib: libName.}
proc dtgsja*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; p: ptr cint;
            n: ptr cint; k: ptr cint; l: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; tola: ptr cdouble; tolb: ptr cdouble;
            alpha: ptr cdouble; beta: ptr cdouble; u: ptr cdouble; ldu: ptr cint;
            v: ptr cdouble; ldv: ptr cint; q: ptr cdouble; ldq: ptr cint; work: ptr cdouble;
            ncycle: ptr cint; info: ptr cint) {.cdecl, importc: "dtgsja_",
    dynlib: libName.}
proc ctgsja*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; p: ptr cint;
            n: ptr cint; k: ptr cint; l: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint; tola: ptr cfloat;
            tolb: ptr cfloat; alpha: ptr cfloat; beta: ptr cfloat;
            u: ptr lapack_complex_float; ldu: ptr cint; v: ptr lapack_complex_float;
            ldv: ptr cint; q: ptr lapack_complex_float; ldq: ptr cint;
            work: ptr lapack_complex_float; ncycle: ptr cint; info: ptr cint) {.cdecl,
    importc: "ctgsja_", dynlib: libName.}
proc ztgsja*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; p: ptr cint;
            n: ptr cint; k: ptr cint; l: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
            tola: ptr cdouble; tolb: ptr cdouble; alpha: ptr cdouble; beta: ptr cdouble;
            u: ptr lapack_complex_double; ldu: ptr cint; v: ptr lapack_complex_double;
            ldv: ptr cint; q: ptr lapack_complex_double; ldq: ptr cint;
            work: ptr lapack_complex_double; ncycle: ptr cint; info: ptr cint) {.cdecl,
    importc: "ztgsja_", dynlib: libName.}
proc sgels*(trans: cstring; m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr cfloat;
           lda: ptr cint; b: ptr cfloat; ldb: ptr cint; work: ptr cfloat; lwork: ptr cint;
           info: ptr cint) {.cdecl, importc: "sgels_", dynlib: libName.}
proc dgels*(trans: cstring; m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr cdouble;
           lda: ptr cint; b: ptr cdouble; ldb: ptr cint; work: ptr cdouble; lwork: ptr cint;
           info: ptr cint) {.cdecl, importc: "dgels_", dynlib: libName.}
proc cgels*(trans: cstring; m: ptr cint; n: ptr cint; nrhs: ptr cint;
           a: ptr lapack_complex_float; lda: ptr cint; b: ptr lapack_complex_float;
           ldb: ptr cint; work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.
    cdecl, importc: "cgels_", dynlib: libName.}
proc zgels*(trans: cstring; m: ptr cint; n: ptr cint; nrhs: ptr cint;
           a: ptr lapack_complex_double; lda: ptr cint; b: ptr lapack_complex_double;
           ldb: ptr cint; work: ptr lapack_complex_double; lwork: ptr cint;
           info: ptr cint) {.cdecl, importc: "zgels_", dynlib: libName.}
proc sgelsy*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            b: ptr cfloat; ldb: ptr cint; jpvt: ptr cint; rcond: ptr cfloat; rank: ptr cint;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgelsy_", dynlib: libName.}
proc dgelsy*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; jpvt: ptr cint; rcond: ptr cdouble;
            rank: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgelsy_", dynlib: libName.}
proc cgelsy*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint; jpvt: ptr cint;
            rcond: ptr cfloat; rank: ptr cint; work: ptr lapack_complex_float;
            lwork: ptr cint; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cgelsy_", dynlib: libName.}
proc zgelsy*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint; jpvt: ptr cint;
            rcond: ptr cdouble; rank: ptr cint; work: ptr lapack_complex_double;
            lwork: ptr cint; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zgelsy_", dynlib: libName.}
proc sgelss*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            b: ptr cfloat; ldb: ptr cint; s: ptr cfloat; rcond: ptr cfloat; rank: ptr cint;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgelss_", dynlib: libName.}
proc dgelss*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; s: ptr cdouble; rcond: ptr cdouble;
            rank: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgelss_", dynlib: libName.}
proc cgelss*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint; s: ptr cfloat;
            rcond: ptr cfloat; rank: ptr cint; work: ptr lapack_complex_float;
            lwork: ptr cint; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "cgelss_", dynlib: libName.}
proc zgelss*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint; s: ptr cdouble;
            rcond: ptr cdouble; rank: ptr cint; work: ptr lapack_complex_double;
            lwork: ptr cint; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zgelss_", dynlib: libName.}
proc sgelsd*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
            b: ptr cfloat; ldb: ptr cint; s: ptr cfloat; rcond: ptr cfloat; rank: ptr cint;
            work: ptr cfloat; lwork: ptr cint; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgelsd_", dynlib: libName.}
proc dgelsd*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; s: ptr cdouble; rcond: ptr cdouble;
            rank: ptr cint; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dgelsd_", dynlib: libName.}
proc cgelsd*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint; s: ptr cfloat;
            rcond: ptr cfloat; rank: ptr cint; work: ptr lapack_complex_float;
            lwork: ptr cint; rwork: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cgelsd_", dynlib: libName.}
proc zgelsd*(m: ptr cint; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint; s: ptr cdouble;
            rcond: ptr cdouble; rank: ptr cint; work: ptr lapack_complex_double;
            lwork: ptr cint; rwork: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zgelsd_", dynlib: libName.}
proc sgglse*(m: ptr cint; n: ptr cint; p: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat;
            ldb: ptr cint; c: ptr cfloat; d: ptr cfloat; x: ptr cfloat; work: ptr cfloat;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "sgglse_", dynlib: libName.}
proc dgglse*(m: ptr cint; n: ptr cint; p: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; c: ptr cdouble; d: ptr cdouble; x: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgglse_", dynlib: libName.}
proc cgglse*(m: ptr cint; n: ptr cint; p: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint;
            c: ptr lapack_complex_float; d: ptr lapack_complex_float;
            x: ptr lapack_complex_float; work: ptr lapack_complex_float;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "cgglse_", dynlib: libName.}
proc zgglse*(m: ptr cint; n: ptr cint; p: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
            c: ptr lapack_complex_double; d: ptr lapack_complex_double;
            x: ptr lapack_complex_double; work: ptr lapack_complex_double;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "zgglse_", dynlib: libName.}
proc sggglm*(n: ptr cint; m: ptr cint; p: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat;
            ldb: ptr cint; d: ptr cfloat; x: ptr cfloat; y: ptr cfloat; work: ptr cfloat;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "sggglm_", dynlib: libName.}
proc dggglm*(n: ptr cint; m: ptr cint; p: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; d: ptr cdouble; x: ptr cdouble; y: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dggglm_", dynlib: libName.}
proc cggglm*(n: ptr cint; m: ptr cint; p: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint;
            d: ptr lapack_complex_float; x: ptr lapack_complex_float;
            y: ptr lapack_complex_float; work: ptr lapack_complex_float;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "cggglm_", dynlib: libName.}
proc zggglm*(n: ptr cint; m: ptr cint; p: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
            d: ptr lapack_complex_double; x: ptr lapack_complex_double;
            y: ptr lapack_complex_double; work: ptr lapack_complex_double;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "zggglm_", dynlib: libName.}
proc ssyev*(jobz: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
           w: ptr cfloat; work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "ssyev_", dynlib: libName.}
proc dsyev*(jobz: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
           w: ptr cdouble; work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dsyev_", dynlib: libName.}
proc cheev*(jobz: cstring; uplo: cstring; n: ptr cint; a: ptr lapack_complex_float;
           lda: ptr cint; w: ptr cfloat; work: ptr lapack_complex_float; lwork: ptr cint;
           rwork: ptr cfloat; info: ptr cint) {.cdecl, importc: "cheev_", dynlib: libName.}
proc zheev*(jobz: cstring; uplo: cstring; n: ptr cint; a: ptr lapack_complex_double;
           lda: ptr cint; w: ptr cdouble; work: ptr lapack_complex_double;
           lwork: ptr cint; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zheev_", dynlib: libName.}
proc ssyevd*(jobz: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            w: ptr cfloat; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "ssyevd_",
    dynlib: libName.}
proc dsyevd*(jobz: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            w: ptr cdouble; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "dsyevd_",
    dynlib: libName.}
proc cheevd*(jobz: cstring; uplo: cstring; n: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; w: ptr cfloat; work: ptr lapack_complex_float;
            lwork: ptr cint; rwork: ptr cfloat; lrwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "cheevd_",
    dynlib: libName.}
proc zheevd*(jobz: cstring; uplo: cstring; n: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; w: ptr cdouble; work: ptr lapack_complex_double;
            lwork: ptr cint; rwork: ptr cdouble; lrwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "zheevd_",
    dynlib: libName.}
proc ssyevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat;
            lda: ptr cint; vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint;
            abstol: ptr cfloat; m: ptr cint; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint;
            work: ptr cfloat; lwork: ptr cint; iwork: ptr cint; ifail: ptr cint;
            info: ptr cint) {.cdecl, importc: "ssyevx_", dynlib: libName.}
proc dsyevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble;
            lda: ptr cint; vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
            work: ptr cdouble; lwork: ptr cint; iwork: ptr cint; ifail: ptr cint;
            info: ptr cint) {.cdecl, importc: "dsyevx_", dynlib: libName.}
proc cheevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; vl: ptr cfloat; vu: ptr cfloat;
            il: ptr cint; iu: ptr cint; abstol: ptr cfloat; m: ptr cint; w: ptr cfloat;
            z: ptr lapack_complex_float; ldz: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; rwork: ptr cfloat;
            iwork: ptr cint; ifail: ptr cint; info: ptr cint) {.cdecl, importc: "cheevx_",
    dynlib: libName.}
proc zheevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint; vl: ptr cdouble;
            vu: ptr cdouble; il: ptr cint; iu: ptr cint; abstol: ptr cdouble; m: ptr cint;
            w: ptr cdouble; z: ptr lapack_complex_double; ldz: ptr cint;
            work: ptr lapack_complex_double; lwork: ptr cint; rwork: ptr cdouble;
            iwork: ptr cint; ifail: ptr cint; info: ptr cint) {.cdecl, importc: "zheevx_",
    dynlib: libName.}
proc ssyevr*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat;
            lda: ptr cint; vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint;
            abstol: ptr cfloat; m: ptr cint; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint;
            isuppz: ptr cint; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "ssyevr_",
    dynlib: libName.}
proc dsyevr*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble;
            lda: ptr cint; vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
            isuppz: ptr cint; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "dsyevr_",
    dynlib: libName.}
proc cheevr*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; vl: ptr cfloat; vu: ptr cfloat;
            il: ptr cint; iu: ptr cint; abstol: ptr cfloat; m: ptr cint; w: ptr cfloat;
            z: ptr lapack_complex_float; ldz: ptr cint; isuppz: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; rwork: ptr cfloat;
            lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cheevr_", dynlib: libName.}
proc zheevr*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint; vl: ptr cdouble;
            vu: ptr cdouble; il: ptr cint; iu: ptr cint; abstol: ptr cdouble; m: ptr cint;
            w: ptr cdouble; z: ptr lapack_complex_double; ldz: ptr cint;
            isuppz: ptr cint; work: ptr lapack_complex_double; lwork: ptr cint;
            rwork: ptr cdouble; lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "zheevr_", dynlib: libName.}
proc sspev*(jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr cfloat; w: ptr cfloat;
           z: ptr cfloat; ldz: ptr cint; work: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "sspev_", dynlib: libName.}
proc dspev*(jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr cdouble; w: ptr cdouble;
           z: ptr cdouble; ldz: ptr cint; work: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dspev_", dynlib: libName.}
proc chpev*(jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr lapack_complex_float;
           w: ptr cfloat; z: ptr lapack_complex_float; ldz: ptr cint;
           work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "chpev_", dynlib: libName.}
proc zhpev*(jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr lapack_complex_double;
           w: ptr cdouble; z: ptr lapack_complex_double; ldz: ptr cint;
           work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zhpev_", dynlib: libName.}
proc sspevd*(jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr cfloat; w: ptr cfloat;
            z: ptr cfloat; ldz: ptr cint; work: ptr cfloat; lwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sspevd_", dynlib: libName.}
proc dspevd*(jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr cdouble; w: ptr cdouble;
            z: ptr cdouble; ldz: ptr cint; work: ptr cdouble; lwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dspevd_", dynlib: libName.}
proc chpevd*(jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr lapack_complex_float;
            w: ptr cfloat; z: ptr lapack_complex_float; ldz: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; rwork: ptr cfloat;
            lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "chpevd_", dynlib: libName.}
proc zhpevd*(jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr lapack_complex_double;
            w: ptr cdouble; z: ptr lapack_complex_double; ldz: ptr cint;
            work: ptr lapack_complex_double; lwork: ptr cint; rwork: ptr cdouble;
            lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zhpevd_", dynlib: libName.}
proc sspevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; ap: ptr cfloat;
            vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint; abstol: ptr cfloat;
            m: ptr cint; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat;
            iwork: ptr cint; ifail: ptr cint; info: ptr cint) {.cdecl, importc: "sspevx_",
    dynlib: libName.}
proc dspevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; ap: ptr cdouble;
            vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
            work: ptr cdouble; iwork: ptr cint; ifail: ptr cint; info: ptr cint) {.cdecl,
    importc: "dspevx_", dynlib: libName.}
proc chpevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            ap: ptr lapack_complex_float; vl: ptr cfloat; vu: ptr cfloat; il: ptr cint;
            iu: ptr cint; abstol: ptr cfloat; m: ptr cint; w: ptr cfloat;
            z: ptr lapack_complex_float; ldz: ptr cint;
            work: ptr lapack_complex_float; rwork: ptr cfloat; iwork: ptr cint;
            ifail: ptr cint; info: ptr cint) {.cdecl, importc: "chpevx_", dynlib: libName.}
proc zhpevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            ap: ptr lapack_complex_double; vl: ptr cdouble; vu: ptr cdouble;
            il: ptr cint; iu: ptr cint; abstol: ptr cdouble; m: ptr cint; w: ptr cdouble;
            z: ptr lapack_complex_double; ldz: ptr cint;
            work: ptr lapack_complex_double; rwork: ptr cdouble; iwork: ptr cint;
            ifail: ptr cint; info: ptr cint) {.cdecl, importc: "zhpevx_", dynlib: libName.}
proc ssbev*(jobz: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cfloat;
           ldab: ptr cint; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat;
           info: ptr cint) {.cdecl, importc: "ssbev_", dynlib: libName.}
proc dsbev*(jobz: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cdouble;
           ldab: ptr cint; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint; work: ptr cdouble;
           info: ptr cint) {.cdecl, importc: "dsbev_", dynlib: libName.}
proc chbev*(jobz: cstring; uplo: cstring; n: ptr cint; kd: ptr cint;
           ab: ptr lapack_complex_float; ldab: ptr cint; w: ptr cfloat;
           z: ptr lapack_complex_float; ldz: ptr cint; work: ptr lapack_complex_float;
           rwork: ptr cfloat; info: ptr cint) {.cdecl, importc: "chbev_", dynlib: libName.}
proc zhbev*(jobz: cstring; uplo: cstring; n: ptr cint; kd: ptr cint;
           ab: ptr lapack_complex_double; ldab: ptr cint; w: ptr cdouble;
           z: ptr lapack_complex_double; ldz: ptr cint;
           work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zhbev_", dynlib: libName.}
proc ssbevd*(jobz: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cfloat;
            ldab: ptr cint; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat;
            lwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "ssbevd_", dynlib: libName.}
proc dsbevd*(jobz: cstring; uplo: cstring; n: ptr cint; kd: ptr cint; ab: ptr cdouble;
            ldab: ptr cint; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
            work: ptr cdouble; lwork: ptr cint; iwork: ptr cint; liwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dsbevd_", dynlib: libName.}
proc chbevd*(jobz: cstring; uplo: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr lapack_complex_float; ldab: ptr cint; w: ptr cfloat;
            z: ptr lapack_complex_float; ldz: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; rwork: ptr cfloat;
            lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "chbevd_", dynlib: libName.}
proc zhbevd*(jobz: cstring; uplo: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr lapack_complex_double; ldab: ptr cint; w: ptr cdouble;
            z: ptr lapack_complex_double; ldz: ptr cint;
            work: ptr lapack_complex_double; lwork: ptr cint; rwork: ptr cdouble;
            lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zhbevd_", dynlib: libName.}
proc ssbevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr cfloat; ldab: ptr cint; q: ptr cfloat; ldq: ptr cint; vl: ptr cfloat;
            vu: ptr cfloat; il: ptr cint; iu: ptr cint; abstol: ptr cfloat; m: ptr cint;
            w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat; iwork: ptr cint;
            ifail: ptr cint; info: ptr cint) {.cdecl, importc: "ssbevx_", dynlib: libName.}
proc dsbevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr cdouble; ldab: ptr cint; q: ptr cdouble; ldq: ptr cint; vl: ptr cdouble;
            vu: ptr cdouble; il: ptr cint; iu: ptr cint; abstol: ptr cdouble; m: ptr cint;
            w: ptr cdouble; z: ptr cdouble; ldz: ptr cint; work: ptr cdouble;
            iwork: ptr cint; ifail: ptr cint; info: ptr cint) {.cdecl, importc: "dsbevx_",
    dynlib: libName.}
proc chbevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr lapack_complex_float; ldab: ptr cint; q: ptr lapack_complex_float;
            ldq: ptr cint; vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint;
            abstol: ptr cfloat; m: ptr cint; w: ptr cfloat; z: ptr lapack_complex_float;
            ldz: ptr cint; work: ptr lapack_complex_float; rwork: ptr cfloat;
            iwork: ptr cint; ifail: ptr cint; info: ptr cint) {.cdecl, importc: "chbevx_",
    dynlib: libName.}
proc zhbevx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; kd: ptr cint;
            ab: ptr lapack_complex_double; ldab: ptr cint;
            q: ptr lapack_complex_double; ldq: ptr cint; vl: ptr cdouble;
            vu: ptr cdouble; il: ptr cint; iu: ptr cint; abstol: ptr cdouble; m: ptr cint;
            w: ptr cdouble; z: ptr lapack_complex_double; ldz: ptr cint;
            work: ptr lapack_complex_double; rwork: ptr cdouble; iwork: ptr cint;
            ifail: ptr cint; info: ptr cint) {.cdecl, importc: "zhbevx_", dynlib: libName.}
proc sstev*(jobz: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat; z: ptr cfloat;
           ldz: ptr cint; work: ptr cfloat; info: ptr cint) {.cdecl, importc: "sstev_",
    dynlib: libName.}
proc dstev*(jobz: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble; z: ptr cdouble;
           ldz: ptr cint; work: ptr cdouble; info: ptr cint) {.cdecl, importc: "dstev_",
    dynlib: libName.}
proc sstevd*(jobz: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat; z: ptr cfloat;
            ldz: ptr cint; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "sstevd_",
    dynlib: libName.}
proc dstevd*(jobz: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble; z: ptr cdouble;
            ldz: ptr cint; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "dstevd_",
    dynlib: libName.}
proc sstevx*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat;
            vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint; abstol: ptr cfloat;
            m: ptr cint; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat;
            iwork: ptr cint; ifail: ptr cint; info: ptr cint) {.cdecl, importc: "sstevx_",
    dynlib: libName.}
proc dstevx*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble;
            vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
            work: ptr cdouble; iwork: ptr cint; ifail: ptr cint; info: ptr cint) {.cdecl,
    importc: "dstevx_", dynlib: libName.}
proc sstevr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cfloat; e: ptr cfloat;
            vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint; abstol: ptr cfloat;
            m: ptr cint; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; isuppz: ptr cint;
            work: ptr cfloat; lwork: ptr cint; iwork: ptr cint; liwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "sstevr_", dynlib: libName.}
proc dstevr*(jobz: cstring; range: cstring; n: ptr cint; d: ptr cdouble; e: ptr cdouble;
            vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
            isuppz: ptr cint; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "dstevr_",
    dynlib: libName.}
proc sgees*(jobvs: cstring; sort: cstring; select: S_SELECT2; n: ptr cint; a: ptr cfloat;
           lda: ptr cint; sdim: ptr cint; wr: ptr cfloat; wi: ptr cfloat; vs: ptr cfloat;
           ldvs: ptr cint; work: ptr cfloat; lwork: ptr cint; bwork: ptr cint;
           info: ptr cint) {.cdecl, importc: "sgees_", dynlib: libName.}
proc dgees*(jobvs: cstring; sort: cstring; select: D_SELECT2; n: ptr cint; a: ptr cdouble;
           lda: ptr cint; sdim: ptr cint; wr: ptr cdouble; wi: ptr cdouble; vs: ptr cdouble;
           ldvs: ptr cint; work: ptr cdouble; lwork: ptr cint; bwork: ptr cint;
           info: ptr cint) {.cdecl, importc: "dgees_", dynlib: libName.}
proc cgees*(jobvs: cstring; sort: cstring; select: C_SELECT1; n: ptr cint;
           a: ptr lapack_complex_float; lda: ptr cint; sdim: ptr cint;
           w: ptr lapack_complex_float; vs: ptr lapack_complex_float; ldvs: ptr cint;
           work: ptr lapack_complex_float; lwork: ptr cint; rwork: ptr cfloat;
           bwork: ptr cint; info: ptr cint) {.cdecl, importc: "cgees_", dynlib: libName.}
proc zgees*(jobvs: cstring; sort: cstring; select: Z_SELECT1; n: ptr cint;
           a: ptr lapack_complex_double; lda: ptr cint; sdim: ptr cint;
           w: ptr lapack_complex_double; vs: ptr lapack_complex_double;
           ldvs: ptr cint; work: ptr lapack_complex_double; lwork: ptr cint;
           rwork: ptr cdouble; bwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zgees_", dynlib: libName.}
proc sgeesx*(jobvs: cstring; sort: cstring; select: S_SELECT2; sense: cstring;
            n: ptr cint; a: ptr cfloat; lda: ptr cint; sdim: ptr cint; wr: ptr cfloat;
            wi: ptr cfloat; vs: ptr cfloat; ldvs: ptr cint; rconde: ptr cfloat;
            rcondv: ptr cfloat; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; bwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgeesx_", dynlib: libName.}
proc dgeesx*(jobvs: cstring; sort: cstring; select: D_SELECT2; sense: cstring;
            n: ptr cint; a: ptr cdouble; lda: ptr cint; sdim: ptr cint; wr: ptr cdouble;
            wi: ptr cdouble; vs: ptr cdouble; ldvs: ptr cint; rconde: ptr cdouble;
            rcondv: ptr cdouble; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; bwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgeesx_", dynlib: libName.}
proc cgeesx*(jobvs: cstring; sort: cstring; select: C_SELECT1; sense: cstring;
            n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint; sdim: ptr cint;
            w: ptr lapack_complex_float; vs: ptr lapack_complex_float; ldvs: ptr cint;
            rconde: ptr cfloat; rcondv: ptr cfloat; work: ptr lapack_complex_float;
            lwork: ptr cint; rwork: ptr cfloat; bwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cgeesx_", dynlib: libName.}
proc zgeesx*(jobvs: cstring; sort: cstring; select: Z_SELECT1; sense: cstring;
            n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint; sdim: ptr cint;
            w: ptr lapack_complex_double; vs: ptr lapack_complex_double;
            ldvs: ptr cint; rconde: ptr cdouble; rcondv: ptr cdouble;
            work: ptr lapack_complex_double; lwork: ptr cint; rwork: ptr cdouble;
            bwork: ptr cint; info: ptr cint) {.cdecl, importc: "zgeesx_", dynlib: libName.}
proc sgeev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
           wr: ptr cfloat; wi: ptr cfloat; vl: ptr cfloat; ldvl: ptr cint; vr: ptr cfloat;
           ldvr: ptr cint; work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgeev_", dynlib: libName.}
proc dgeev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
           wr: ptr cdouble; wi: ptr cdouble; vl: ptr cdouble; ldvl: ptr cint;
           vr: ptr cdouble; ldvr: ptr cint; work: ptr cdouble; lwork: ptr cint;
           info: ptr cint) {.cdecl, importc: "dgeev_", dynlib: libName.}
proc cgeev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr lapack_complex_float;
           lda: ptr cint; w: ptr lapack_complex_float; vl: ptr lapack_complex_float;
           ldvl: ptr cint; vr: ptr lapack_complex_float; ldvr: ptr cint;
           work: ptr lapack_complex_float; lwork: ptr cint; rwork: ptr cfloat;
           info: ptr cint) {.cdecl, importc: "cgeev_", dynlib: libName.}
proc zgeev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr lapack_complex_double;
           lda: ptr cint; w: ptr lapack_complex_double; vl: ptr lapack_complex_double;
           ldvl: ptr cint; vr: ptr lapack_complex_double; ldvr: ptr cint;
           work: ptr lapack_complex_double; lwork: ptr cint; rwork: ptr cdouble;
           info: ptr cint) {.cdecl, importc: "zgeev_", dynlib: libName.}
proc sgeevx*(balanc: cstring; jobvl: cstring; jobvr: cstring; sense: cstring;
            n: ptr cint; a: ptr cfloat; lda: ptr cint; wr: ptr cfloat; wi: ptr cfloat;
            vl: ptr cfloat; ldvl: ptr cint; vr: ptr cfloat; ldvr: ptr cint; ilo: ptr cint;
            ihi: ptr cint; scale: ptr cfloat; abnrm: ptr cfloat; rconde: ptr cfloat;
            rcondv: ptr cfloat; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "sgeevx_", dynlib: libName.}
proc dgeevx*(balanc: cstring; jobvl: cstring; jobvr: cstring; sense: cstring;
            n: ptr cint; a: ptr cdouble; lda: ptr cint; wr: ptr cdouble; wi: ptr cdouble;
            vl: ptr cdouble; ldvl: ptr cint; vr: ptr cdouble; ldvr: ptr cint; ilo: ptr cint;
            ihi: ptr cint; scale: ptr cdouble; abnrm: ptr cdouble; rconde: ptr cdouble;
            rcondv: ptr cdouble; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dgeevx_", dynlib: libName.}
proc cgeevx*(balanc: cstring; jobvl: cstring; jobvr: cstring; sense: cstring;
            n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            w: ptr lapack_complex_float; vl: ptr lapack_complex_float; ldvl: ptr cint;
            vr: ptr lapack_complex_float; ldvr: ptr cint; ilo: ptr cint; ihi: ptr cint;
            scale: ptr cfloat; abnrm: ptr cfloat; rconde: ptr cfloat; rcondv: ptr cfloat;
            work: ptr lapack_complex_float; lwork: ptr cint; rwork: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "cgeevx_", dynlib: libName.}
proc zgeevx*(balanc: cstring; jobvl: cstring; jobvr: cstring; sense: cstring;
            n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            w: ptr lapack_complex_double; vl: ptr lapack_complex_double;
            ldvl: ptr cint; vr: ptr lapack_complex_double; ldvr: ptr cint; ilo: ptr cint;
            ihi: ptr cint; scale: ptr cdouble; abnrm: ptr cdouble; rconde: ptr cdouble;
            rcondv: ptr cdouble; work: ptr lapack_complex_double; lwork: ptr cint;
            rwork: ptr cdouble; info: ptr cint) {.cdecl, importc: "zgeevx_",
    dynlib: libName.}
proc sgesvd*(jobu: cstring; jobvt: cstring; m: ptr cint; n: ptr cint; a: ptr cfloat;
            lda: ptr cint; s: ptr cfloat; u: ptr cfloat; ldu: ptr cint; vt: ptr cfloat;
            ldvt: ptr cint; work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgesvd_", dynlib: libName.}
proc dgesvd*(jobu: cstring; jobvt: cstring; m: ptr cint; n: ptr cint; a: ptr cdouble;
            lda: ptr cint; s: ptr cdouble; u: ptr cdouble; ldu: ptr cint; vt: ptr cdouble;
            ldvt: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgesvd_", dynlib: libName.}
proc cgesvd*(jobu: cstring; jobvt: cstring; m: ptr cint; n: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; s: ptr cfloat;
            u: ptr lapack_complex_float; ldu: ptr cint; vt: ptr lapack_complex_float;
            ldvt: ptr cint; work: ptr lapack_complex_float; lwork: ptr cint;
            rwork: ptr cfloat; info: ptr cint) {.cdecl, importc: "cgesvd_",
    dynlib: libName.}
proc zgesvd*(jobu: cstring; jobvt: cstring; m: ptr cint; n: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint; s: ptr cdouble;
            u: ptr lapack_complex_double; ldu: ptr cint;
            vt: ptr lapack_complex_double; ldvt: ptr cint;
            work: ptr lapack_complex_double; lwork: ptr cint; rwork: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "zgesvd_", dynlib: libName.}
proc sgesdd*(jobz: cstring; m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            s: ptr cfloat; u: ptr cfloat; ldu: ptr cint; vt: ptr cfloat; ldvt: ptr cint;
            work: ptr cfloat; lwork: ptr cint; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgesdd_", dynlib: libName.}
proc dgesdd*(jobz: cstring; m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            s: ptr cdouble; u: ptr cdouble; ldu: ptr cint; vt: ptr cdouble; ldvt: ptr cint;
            work: ptr cdouble; lwork: ptr cint; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgesdd_", dynlib: libName.}
proc cgesdd*(jobz: cstring; m: ptr cint; n: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; s: ptr cfloat; u: ptr lapack_complex_float; ldu: ptr cint;
            vt: ptr lapack_complex_float; ldvt: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; rwork: ptr cfloat;
            iwork: ptr cint; info: ptr cint) {.cdecl, importc: "cgesdd_", dynlib: libName.}
proc zgesdd*(jobz: cstring; m: ptr cint; n: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; s: ptr cdouble; u: ptr lapack_complex_double; ldu: ptr cint;
            vt: ptr lapack_complex_double; ldvt: ptr cint;
            work: ptr lapack_complex_double; lwork: ptr cint; rwork: ptr cdouble;
            iwork: ptr cint; info: ptr cint) {.cdecl, importc: "zgesdd_", dynlib: libName.}
proc dgejsv*(joba: cstring; jobu: cstring; jobv: cstring; jobr: cstring; jobt: cstring;
            jobp: cstring; m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            sva: ptr cdouble; u: ptr cdouble; ldu: ptr cint; v: ptr cdouble; ldv: ptr cint;
            work: ptr cdouble; lwork: ptr cint; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgejsv_", dynlib: libName.}
proc sgejsv*(joba: cstring; jobu: cstring; jobv: cstring; jobr: cstring; jobt: cstring;
            jobp: cstring; m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            sva: ptr cfloat; u: ptr cfloat; ldu: ptr cint; v: ptr cfloat; ldv: ptr cint;
            work: ptr cfloat; lwork: ptr cint; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgejsv_", dynlib: libName.}
proc dgesvj*(joba: cstring; jobu: cstring; jobv: cstring; m: ptr cint; n: ptr cint;
            a: ptr cdouble; lda: ptr cint; sva: ptr cdouble; mv: ptr cint; v: ptr cdouble;
            ldv: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgesvj_", dynlib: libName.}
proc sgesvj*(joba: cstring; jobu: cstring; jobv: cstring; m: ptr cint; n: ptr cint;
            a: ptr cfloat; lda: ptr cint; sva: ptr cfloat; mv: ptr cint; v: ptr cfloat;
            ldv: ptr cint; work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgesvj_", dynlib: libName.}
proc sggsvd*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; n: ptr cint;
            p: ptr cint; k: ptr cint; l: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat;
            ldb: ptr cint; alpha: ptr cfloat; beta: ptr cfloat; u: ptr cfloat;
            ldu: ptr cint; v: ptr cfloat; ldv: ptr cint; q: ptr cfloat; ldq: ptr cint;
            work: ptr cfloat; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sggsvd_", dynlib: libName.}
proc dggsvd*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; n: ptr cint;
            p: ptr cint; k: ptr cint; l: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; alpha: ptr cdouble; beta: ptr cdouble;
            u: ptr cdouble; ldu: ptr cint; v: ptr cdouble; ldv: ptr cint; q: ptr cdouble;
            ldq: ptr cint; work: ptr cdouble; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dggsvd_", dynlib: libName.}
proc cggsvd*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; n: ptr cint;
            p: ptr cint; k: ptr cint; l: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint; alpha: ptr cfloat;
            beta: ptr cfloat; u: ptr lapack_complex_float; ldu: ptr cint;
            v: ptr lapack_complex_float; ldv: ptr cint; q: ptr lapack_complex_float;
            ldq: ptr cint; work: ptr lapack_complex_float; rwork: ptr cfloat;
            iwork: ptr cint; info: ptr cint) {.cdecl, importc: "cggsvd_", dynlib: libName.}
proc zggsvd*(jobu: cstring; jobv: cstring; jobq: cstring; m: ptr cint; n: ptr cint;
            p: ptr cint; k: ptr cint; l: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
            alpha: ptr cdouble; beta: ptr cdouble; u: ptr lapack_complex_double;
            ldu: ptr cint; v: ptr lapack_complex_double; ldv: ptr cint;
            q: ptr lapack_complex_double; ldq: ptr cint;
            work: ptr lapack_complex_double; rwork: ptr cdouble; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "zggsvd_", dynlib: libName.}
proc ssygv*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat;
           lda: ptr cint; b: ptr cfloat; ldb: ptr cint; w: ptr cfloat; work: ptr cfloat;
           lwork: ptr cint; info: ptr cint) {.cdecl, importc: "ssygv_", dynlib: libName.}
proc dsygv*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble;
           lda: ptr cint; b: ptr cdouble; ldb: ptr cint; w: ptr cdouble; work: ptr cdouble;
           lwork: ptr cint; info: ptr cint) {.cdecl, importc: "dsygv_", dynlib: libName.}
proc chegv*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint;
           a: ptr lapack_complex_float; lda: ptr cint; b: ptr lapack_complex_float;
           ldb: ptr cint; w: ptr cfloat; work: ptr lapack_complex_float; lwork: ptr cint;
           rwork: ptr cfloat; info: ptr cint) {.cdecl, importc: "chegv_", dynlib: libName.}
proc zhegv*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint;
           a: ptr lapack_complex_double; lda: ptr cint; b: ptr lapack_complex_double;
           ldb: ptr cint; w: ptr cdouble; work: ptr lapack_complex_double;
           lwork: ptr cint; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zhegv_", dynlib: libName.}
proc ssygvd*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat;
            lda: ptr cint; b: ptr cfloat; ldb: ptr cint; w: ptr cfloat; work: ptr cfloat;
            lwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "ssygvd_", dynlib: libName.}
proc dsygvd*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble;
            lda: ptr cint; b: ptr cdouble; ldb: ptr cint; w: ptr cdouble; work: ptr cdouble;
            lwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dsygvd_", dynlib: libName.}
proc chegvd*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; b: ptr lapack_complex_float;
            ldb: ptr cint; w: ptr cfloat; work: ptr lapack_complex_float;
            lwork: ptr cint; rwork: ptr cfloat; lrwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "chegvd_",
    dynlib: libName.}
proc zhegvd*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint; b: ptr lapack_complex_double;
            ldb: ptr cint; w: ptr cdouble; work: ptr lapack_complex_double;
            lwork: ptr cint; rwork: ptr cdouble; lrwork: ptr cint; iwork: ptr cint;
            liwork: ptr cint; info: ptr cint) {.cdecl, importc: "zhegvd_",
    dynlib: libName.}
proc ssygvx*(itype: ptr cint; jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint; vl: ptr cfloat;
            vu: ptr cfloat; il: ptr cint; iu: ptr cint; abstol: ptr cfloat; m: ptr cint;
            w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat; lwork: ptr cint;
            iwork: ptr cint; ifail: ptr cint; info: ptr cint) {.cdecl, importc: "ssygvx_",
    dynlib: libName.}
proc dsygvx*(itype: ptr cint; jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint; vl: ptr cdouble;
            vu: ptr cdouble; il: ptr cint; iu: ptr cint; abstol: ptr cdouble; m: ptr cint;
            w: ptr cdouble; z: ptr cdouble; ldz: ptr cint; work: ptr cdouble;
            lwork: ptr cint; iwork: ptr cint; ifail: ptr cint; info: ptr cint) {.cdecl,
    importc: "dsygvx_", dynlib: libName.}
proc chegvx*(itype: ptr cint; jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; b: ptr lapack_complex_float;
            ldb: ptr cint; vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint;
            abstol: ptr cfloat; m: ptr cint; w: ptr cfloat; z: ptr lapack_complex_float;
            ldz: ptr cint; work: ptr lapack_complex_float; lwork: ptr cint;
            rwork: ptr cfloat; iwork: ptr cint; ifail: ptr cint; info: ptr cint) {.cdecl,
    importc: "chegvx_", dynlib: libName.}
proc zhegvx*(itype: ptr cint; jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint; b: ptr lapack_complex_double;
            ldb: ptr cint; vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble;
            z: ptr lapack_complex_double; ldz: ptr cint;
            work: ptr lapack_complex_double; lwork: ptr cint; rwork: ptr cdouble;
            iwork: ptr cint; ifail: ptr cint; info: ptr cint) {.cdecl, importc: "zhegvx_",
    dynlib: libName.}
proc sspgv*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr cfloat;
           bp: ptr cfloat; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat;
           info: ptr cint) {.cdecl, importc: "sspgv_", dynlib: libName.}
proc dspgv*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr cdouble;
           bp: ptr cdouble; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
           work: ptr cdouble; info: ptr cint) {.cdecl, importc: "dspgv_", dynlib: libName.}
proc chpgv*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint;
           ap: ptr lapack_complex_float; bp: ptr lapack_complex_float; w: ptr cfloat;
           z: ptr lapack_complex_float; ldz: ptr cint; work: ptr lapack_complex_float;
           rwork: ptr cfloat; info: ptr cint) {.cdecl, importc: "chpgv_", dynlib: libName.}
proc zhpgv*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint;
           ap: ptr lapack_complex_double; bp: ptr lapack_complex_double;
           w: ptr cdouble; z: ptr lapack_complex_double; ldz: ptr cint;
           work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zhpgv_", dynlib: libName.}
proc sspgvd*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr cfloat;
            bp: ptr cfloat; w: ptr cfloat; z: ptr cfloat; ldz: ptr cint; work: ptr cfloat;
            lwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sspgvd_", dynlib: libName.}
proc dspgvd*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint; ap: ptr cdouble;
            bp: ptr cdouble; w: ptr cdouble; z: ptr cdouble; ldz: ptr cint;
            work: ptr cdouble; lwork: ptr cint; iwork: ptr cint; liwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dspgvd_", dynlib: libName.}
proc chpgvd*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint;
            ap: ptr lapack_complex_float; bp: ptr lapack_complex_float; w: ptr cfloat;
            z: ptr lapack_complex_float; ldz: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; rwork: ptr cfloat;
            lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "chpgvd_", dynlib: libName.}
proc zhpgvd*(itype: ptr cint; jobz: cstring; uplo: cstring; n: ptr cint;
            ap: ptr lapack_complex_double; bp: ptr lapack_complex_double;
            w: ptr cdouble; z: ptr lapack_complex_double; ldz: ptr cint;
            work: ptr lapack_complex_double; lwork: ptr cint; rwork: ptr cdouble;
            lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zhpgvd_", dynlib: libName.}
proc sspgvx*(itype: ptr cint; jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            ap: ptr cfloat; bp: ptr cfloat; vl: ptr cfloat; vu: ptr cfloat; il: ptr cint;
            iu: ptr cint; abstol: ptr cfloat; m: ptr cint; w: ptr cfloat; z: ptr cfloat;
            ldz: ptr cint; work: ptr cfloat; iwork: ptr cint; ifail: ptr cint;
            info: ptr cint) {.cdecl, importc: "sspgvx_", dynlib: libName.}
proc dspgvx*(itype: ptr cint; jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            ap: ptr cdouble; bp: ptr cdouble; vl: ptr cdouble; vu: ptr cdouble;
            il: ptr cint; iu: ptr cint; abstol: ptr cdouble; m: ptr cint; w: ptr cdouble;
            z: ptr cdouble; ldz: ptr cint; work: ptr cdouble; iwork: ptr cint;
            ifail: ptr cint; info: ptr cint) {.cdecl, importc: "dspgvx_", dynlib: libName.}
proc chpgvx*(itype: ptr cint; jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            ap: ptr lapack_complex_float; bp: ptr lapack_complex_float;
            vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint; abstol: ptr cfloat;
            m: ptr cint; w: ptr cfloat; z: ptr lapack_complex_float; ldz: ptr cint;
            work: ptr lapack_complex_float; rwork: ptr cfloat; iwork: ptr cint;
            ifail: ptr cint; info: ptr cint) {.cdecl, importc: "chpgvx_", dynlib: libName.}
proc zhpgvx*(itype: ptr cint; jobz: cstring; range: cstring; uplo: cstring; n: ptr cint;
            ap: ptr lapack_complex_double; bp: ptr lapack_complex_double;
            vl: ptr cdouble; vu: ptr cdouble; il: ptr cint; iu: ptr cint;
            abstol: ptr cdouble; m: ptr cint; w: ptr cdouble;
            z: ptr lapack_complex_double; ldz: ptr cint;
            work: ptr lapack_complex_double; rwork: ptr cdouble; iwork: ptr cint;
            ifail: ptr cint; info: ptr cint) {.cdecl, importc: "zhpgvx_", dynlib: libName.}
proc ssbgv*(jobz: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
           ab: ptr cfloat; ldab: ptr cint; bb: ptr cfloat; ldbb: ptr cint; w: ptr cfloat;
           z: ptr cfloat; ldz: ptr cint; work: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "ssbgv_", dynlib: libName.}
proc dsbgv*(jobz: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
           ab: ptr cdouble; ldab: ptr cint; bb: ptr cdouble; ldbb: ptr cint; w: ptr cdouble;
           z: ptr cdouble; ldz: ptr cint; work: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dsbgv_", dynlib: libName.}
proc chbgv*(jobz: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
           ab: ptr lapack_complex_float; ldab: ptr cint; bb: ptr lapack_complex_float;
           ldbb: ptr cint; w: ptr cfloat; z: ptr lapack_complex_float; ldz: ptr cint;
           work: ptr lapack_complex_float; rwork: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "chbgv_", dynlib: libName.}
proc zhbgv*(jobz: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
           ab: ptr lapack_complex_double; ldab: ptr cint;
           bb: ptr lapack_complex_double; ldbb: ptr cint; w: ptr cdouble;
           z: ptr lapack_complex_double; ldz: ptr cint;
           work: ptr lapack_complex_double; rwork: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "zhbgv_", dynlib: libName.}
proc ssbgvd*(jobz: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
            ab: ptr cfloat; ldab: ptr cint; bb: ptr cfloat; ldbb: ptr cint; w: ptr cfloat;
            z: ptr cfloat; ldz: ptr cint; work: ptr cfloat; lwork: ptr cint;
            iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "ssbgvd_", dynlib: libName.}
proc dsbgvd*(jobz: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
            ab: ptr cdouble; ldab: ptr cint; bb: ptr cdouble; ldbb: ptr cint;
            w: ptr cdouble; z: ptr cdouble; ldz: ptr cint; work: ptr cdouble;
            lwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dsbgvd_", dynlib: libName.}
proc chbgvd*(jobz: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
            ab: ptr lapack_complex_float; ldab: ptr cint;
            bb: ptr lapack_complex_float; ldbb: ptr cint; w: ptr cfloat;
            z: ptr lapack_complex_float; ldz: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; rwork: ptr cfloat;
            lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "chbgvd_", dynlib: libName.}
proc zhbgvd*(jobz: cstring; uplo: cstring; n: ptr cint; ka: ptr cint; kb: ptr cint;
            ab: ptr lapack_complex_double; ldab: ptr cint;
            bb: ptr lapack_complex_double; ldbb: ptr cint; w: ptr cdouble;
            z: ptr lapack_complex_double; ldz: ptr cint;
            work: ptr lapack_complex_double; lwork: ptr cint; rwork: ptr cdouble;
            lrwork: ptr cint; iwork: ptr cint; liwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zhbgvd_", dynlib: libName.}
proc ssbgvx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; ka: ptr cint;
            kb: ptr cint; ab: ptr cfloat; ldab: ptr cint; bb: ptr cfloat; ldbb: ptr cint;
            q: ptr cfloat; ldq: ptr cint; vl: ptr cfloat; vu: ptr cfloat; il: ptr cint;
            iu: ptr cint; abstol: ptr cfloat; m: ptr cint; w: ptr cfloat; z: ptr cfloat;
            ldz: ptr cint; work: ptr cfloat; iwork: ptr cint; ifail: ptr cint;
            info: ptr cint) {.cdecl, importc: "ssbgvx_", dynlib: libName.}
proc dsbgvx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; ka: ptr cint;
            kb: ptr cint; ab: ptr cdouble; ldab: ptr cint; bb: ptr cdouble; ldbb: ptr cint;
            q: ptr cdouble; ldq: ptr cint; vl: ptr cdouble; vu: ptr cdouble; il: ptr cint;
            iu: ptr cint; abstol: ptr cdouble; m: ptr cint; w: ptr cdouble; z: ptr cdouble;
            ldz: ptr cint; work: ptr cdouble; iwork: ptr cint; ifail: ptr cint;
            info: ptr cint) {.cdecl, importc: "dsbgvx_", dynlib: libName.}
proc chbgvx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; ka: ptr cint;
            kb: ptr cint; ab: ptr lapack_complex_float; ldab: ptr cint;
            bb: ptr lapack_complex_float; ldbb: ptr cint; q: ptr lapack_complex_float;
            ldq: ptr cint; vl: ptr cfloat; vu: ptr cfloat; il: ptr cint; iu: ptr cint;
            abstol: ptr cfloat; m: ptr cint; w: ptr cfloat; z: ptr lapack_complex_float;
            ldz: ptr cint; work: ptr lapack_complex_float; rwork: ptr cfloat;
            iwork: ptr cint; ifail: ptr cint; info: ptr cint) {.cdecl, importc: "chbgvx_",
    dynlib: libName.}
proc zhbgvx*(jobz: cstring; range: cstring; uplo: cstring; n: ptr cint; ka: ptr cint;
            kb: ptr cint; ab: ptr lapack_complex_double; ldab: ptr cint;
            bb: ptr lapack_complex_double; ldbb: ptr cint;
            q: ptr lapack_complex_double; ldq: ptr cint; vl: ptr cdouble;
            vu: ptr cdouble; il: ptr cint; iu: ptr cint; abstol: ptr cdouble; m: ptr cint;
            w: ptr cdouble; z: ptr lapack_complex_double; ldz: ptr cint;
            work: ptr lapack_complex_double; rwork: ptr cdouble; iwork: ptr cint;
            ifail: ptr cint; info: ptr cint) {.cdecl, importc: "zhbgvx_", dynlib: libName.}
proc sgges*(jobvsl: cstring; jobvsr: cstring; sort: cstring; selctg: S_SELECT3;
           n: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint;
           sdim: ptr cint; alphar: ptr cfloat; alphai: ptr cfloat; beta: ptr cfloat;
           vsl: ptr cfloat; ldvsl: ptr cint; vsr: ptr cfloat; ldvsr: ptr cint;
           work: ptr cfloat; lwork: ptr cint; bwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgges_", dynlib: libName.}
proc dgges*(jobvsl: cstring; jobvsr: cstring; sort: cstring; selctg: D_SELECT3;
           n: ptr cint; a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint;
           sdim: ptr cint; alphar: ptr cdouble; alphai: ptr cdouble; beta: ptr cdouble;
           vsl: ptr cdouble; ldvsl: ptr cint; vsr: ptr cdouble; ldvsr: ptr cint;
           work: ptr cdouble; lwork: ptr cint; bwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgges_", dynlib: libName.}
proc cgges*(jobvsl: cstring; jobvsr: cstring; sort: cstring; selctg: C_SELECT2;
           n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
           b: ptr lapack_complex_float; ldb: ptr cint; sdim: ptr cint;
           alpha: ptr lapack_complex_float; beta: ptr lapack_complex_float;
           vsl: ptr lapack_complex_float; ldvsl: ptr cint;
           vsr: ptr lapack_complex_float; ldvsr: ptr cint;
           work: ptr lapack_complex_float; lwork: ptr cint; rwork: ptr cfloat;
           bwork: ptr cint; info: ptr cint) {.cdecl, importc: "cgges_", dynlib: libName.}
proc zgges*(jobvsl: cstring; jobvsr: cstring; sort: cstring; selctg: Z_SELECT2;
           n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
           b: ptr lapack_complex_double; ldb: ptr cint; sdim: ptr cint;
           alpha: ptr lapack_complex_double; beta: ptr lapack_complex_double;
           vsl: ptr lapack_complex_double; ldvsl: ptr cint;
           vsr: ptr lapack_complex_double; ldvsr: ptr cint;
           work: ptr lapack_complex_double; lwork: ptr cint; rwork: ptr cdouble;
           bwork: ptr cint; info: ptr cint) {.cdecl, importc: "zgges_", dynlib: libName.}
proc sggesx*(jobvsl: cstring; jobvsr: cstring; sort: cstring; selctg: S_SELECT3;
            sense: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat;
            ldb: ptr cint; sdim: ptr cint; alphar: ptr cfloat; alphai: ptr cfloat;
            beta: ptr cfloat; vsl: ptr cfloat; ldvsl: ptr cint; vsr: ptr cfloat;
            ldvsr: ptr cint; rconde: ptr cfloat; rcondv: ptr cfloat; work: ptr cfloat;
            lwork: ptr cint; iwork: ptr cint; liwork: ptr cint; bwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "sggesx_", dynlib: libName.}
proc dggesx*(jobvsl: cstring; jobvsr: cstring; sort: cstring; selctg: D_SELECT3;
            sense: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; b: ptr cdouble;
            ldb: ptr cint; sdim: ptr cint; alphar: ptr cdouble; alphai: ptr cdouble;
            beta: ptr cdouble; vsl: ptr cdouble; ldvsl: ptr cint; vsr: ptr cdouble;
            ldvsr: ptr cint; rconde: ptr cdouble; rcondv: ptr cdouble; work: ptr cdouble;
            lwork: ptr cint; iwork: ptr cint; liwork: ptr cint; bwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dggesx_", dynlib: libName.}
proc cggesx*(jobvsl: cstring; jobvsr: cstring; sort: cstring; selctg: C_SELECT2;
            sense: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            b: ptr lapack_complex_float; ldb: ptr cint; sdim: ptr cint;
            alpha: ptr lapack_complex_float; beta: ptr lapack_complex_float;
            vsl: ptr lapack_complex_float; ldvsl: ptr cint;
            vsr: ptr lapack_complex_float; ldvsr: ptr cint; rconde: ptr cfloat;
            rcondv: ptr cfloat; work: ptr lapack_complex_float; lwork: ptr cint;
            rwork: ptr cfloat; iwork: ptr cint; liwork: ptr cint; bwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "cggesx_", dynlib: libName.}
proc zggesx*(jobvsl: cstring; jobvsr: cstring; sort: cstring; selctg: Z_SELECT2;
            sense: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; sdim: ptr cint;
            alpha: ptr lapack_complex_double; beta: ptr lapack_complex_double;
            vsl: ptr lapack_complex_double; ldvsl: ptr cint;
            vsr: ptr lapack_complex_double; ldvsr: ptr cint; rconde: ptr cdouble;
            rcondv: ptr cdouble; work: ptr lapack_complex_double; lwork: ptr cint;
            rwork: ptr cdouble; iwork: ptr cint; liwork: ptr cint; bwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "zggesx_", dynlib: libName.}
proc sggev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
           b: ptr cfloat; ldb: ptr cint; alphar: ptr cfloat; alphai: ptr cfloat;
           beta: ptr cfloat; vl: ptr cfloat; ldvl: ptr cint; vr: ptr cfloat; ldvr: ptr cint;
           work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl, importc: "sggev_",
    dynlib: libName.}
proc dggev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
           b: ptr cdouble; ldb: ptr cint; alphar: ptr cdouble; alphai: ptr cdouble;
           beta: ptr cdouble; vl: ptr cdouble; ldvl: ptr cint; vr: ptr cdouble;
           ldvr: ptr cint; work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dggev_", dynlib: libName.}
proc cggev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr lapack_complex_float;
           lda: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint;
           alpha: ptr lapack_complex_float; beta: ptr lapack_complex_float;
           vl: ptr lapack_complex_float; ldvl: ptr cint; vr: ptr lapack_complex_float;
           ldvr: ptr cint; work: ptr lapack_complex_float; lwork: ptr cint;
           rwork: ptr cfloat; info: ptr cint) {.cdecl, importc: "cggev_", dynlib: libName.}
proc zggev*(jobvl: cstring; jobvr: cstring; n: ptr cint; a: ptr lapack_complex_double;
           lda: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
           alpha: ptr lapack_complex_double; beta: ptr lapack_complex_double;
           vl: ptr lapack_complex_double; ldvl: ptr cint;
           vr: ptr lapack_complex_double; ldvr: ptr cint;
           work: ptr lapack_complex_double; lwork: ptr cint; rwork: ptr cdouble;
           info: ptr cint) {.cdecl, importc: "zggev_", dynlib: libName.}
proc sggevx*(balanc: cstring; jobvl: cstring; jobvr: cstring; sense: cstring;
            n: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint;
            alphar: ptr cfloat; alphai: ptr cfloat; beta: ptr cfloat; vl: ptr cfloat;
            ldvl: ptr cint; vr: ptr cfloat; ldvr: ptr cint; ilo: ptr cint; ihi: ptr cint;
            lscale: ptr cfloat; rscale: ptr cfloat; abnrm: ptr cfloat; bbnrm: ptr cfloat;
            rconde: ptr cfloat; rcondv: ptr cfloat; work: ptr cfloat; lwork: ptr cint;
            iwork: ptr cint; bwork: ptr cint; info: ptr cint) {.cdecl, importc: "sggevx_",
    dynlib: libName.}
proc dggevx*(balanc: cstring; jobvl: cstring; jobvr: cstring; sense: cstring;
            n: ptr cint; a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint;
            alphar: ptr cdouble; alphai: ptr cdouble; beta: ptr cdouble; vl: ptr cdouble;
            ldvl: ptr cint; vr: ptr cdouble; ldvr: ptr cint; ilo: ptr cint; ihi: ptr cint;
            lscale: ptr cdouble; rscale: ptr cdouble; abnrm: ptr cdouble;
            bbnrm: ptr cdouble; rconde: ptr cdouble; rcondv: ptr cdouble;
            work: ptr cdouble; lwork: ptr cint; iwork: ptr cint; bwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dggevx_", dynlib: libName.}
proc cggevx*(balanc: cstring; jobvl: cstring; jobvr: cstring; sense: cstring;
            n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            b: ptr lapack_complex_float; ldb: ptr cint;
            alpha: ptr lapack_complex_float; beta: ptr lapack_complex_float;
            vl: ptr lapack_complex_float; ldvl: ptr cint;
            vr: ptr lapack_complex_float; ldvr: ptr cint; ilo: ptr cint; ihi: ptr cint;
            lscale: ptr cfloat; rscale: ptr cfloat; abnrm: ptr cfloat; bbnrm: ptr cfloat;
            rconde: ptr cfloat; rcondv: ptr cfloat; work: ptr lapack_complex_float;
            lwork: ptr cint; rwork: ptr cfloat; iwork: ptr cint; bwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "cggevx_", dynlib: libName.}
proc zggevx*(balanc: cstring; jobvl: cstring; jobvr: cstring; sense: cstring;
            n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint;
            alpha: ptr lapack_complex_double; beta: ptr lapack_complex_double;
            vl: ptr lapack_complex_double; ldvl: ptr cint;
            vr: ptr lapack_complex_double; ldvr: ptr cint; ilo: ptr cint; ihi: ptr cint;
            lscale: ptr cdouble; rscale: ptr cdouble; abnrm: ptr cdouble;
            bbnrm: ptr cdouble; rconde: ptr cdouble; rcondv: ptr cdouble;
            work: ptr lapack_complex_double; lwork: ptr cint; rwork: ptr cdouble;
            iwork: ptr cint; bwork: ptr cint; info: ptr cint) {.cdecl, importc: "zggevx_",
    dynlib: libName.}
proc dsfrk*(transr: cstring; uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint;
           alpha: ptr cdouble; a: ptr cdouble; lda: ptr cint; beta: ptr cdouble;
           c: ptr cdouble) {.cdecl, importc: "dsfrk_", dynlib: libName.}
proc ssfrk*(transr: cstring; uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint;
           alpha: ptr cfloat; a: ptr cfloat; lda: ptr cint; beta: ptr cfloat; c: ptr cfloat) {.
    cdecl, importc: "ssfrk_", dynlib: libName.}
proc zhfrk*(transr: cstring; uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint;
           alpha: ptr cdouble; a: ptr lapack_complex_double; lda: ptr cint;
           beta: ptr cdouble; c: ptr lapack_complex_double) {.cdecl, importc: "zhfrk_",
    dynlib: libName.}
proc chfrk*(transr: cstring; uplo: cstring; trans: cstring; n: ptr cint; k: ptr cint;
           alpha: ptr cfloat; a: ptr lapack_complex_float; lda: ptr cint;
           beta: ptr cfloat; c: ptr lapack_complex_float) {.cdecl, importc: "chfrk_",
    dynlib: libName.}
proc dtfsm*(transr: cstring; side: cstring; uplo: cstring; trans: cstring; diag: cstring;
           m: ptr cint; n: ptr cint; alpha: ptr cdouble; a: ptr cdouble; b: ptr cdouble;
           ldb: ptr cint) {.cdecl, importc: "dtfsm_", dynlib: libName.}
proc stfsm*(transr: cstring; side: cstring; uplo: cstring; trans: cstring; diag: cstring;
           m: ptr cint; n: ptr cint; alpha: ptr cfloat; a: ptr cfloat; b: ptr cfloat;
           ldb: ptr cint) {.cdecl, importc: "stfsm_", dynlib: libName.}
proc ztfsm*(transr: cstring; side: cstring; uplo: cstring; trans: cstring; diag: cstring;
           m: ptr cint; n: ptr cint; alpha: ptr lapack_complex_double;
           a: ptr lapack_complex_double; b: ptr lapack_complex_double; ldb: ptr cint) {.
    cdecl, importc: "ztfsm_", dynlib: libName.}
proc ctfsm*(transr: cstring; side: cstring; uplo: cstring; trans: cstring; diag: cstring;
           m: ptr cint; n: ptr cint; alpha: ptr lapack_complex_float;
           a: ptr lapack_complex_float; b: ptr lapack_complex_float; ldb: ptr cint) {.
    cdecl, importc: "ctfsm_", dynlib: libName.}
proc dtfttp*(transr: cstring; uplo: cstring; n: ptr cint; arf: ptr cdouble;
            ap: ptr cdouble; info: ptr cint) {.cdecl, importc: "dtfttp_", dynlib: libName.}
proc stfttp*(transr: cstring; uplo: cstring; n: ptr cint; arf: ptr cfloat; ap: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "stfttp_", dynlib: libName.}
proc ztfttp*(transr: cstring; uplo: cstring; n: ptr cint;
            arf: ptr lapack_complex_double; ap: ptr lapack_complex_double;
            info: ptr cint) {.cdecl, importc: "ztfttp_", dynlib: libName.}
proc ctfttp*(transr: cstring; uplo: cstring; n: ptr cint; arf: ptr lapack_complex_float;
            ap: ptr lapack_complex_float; info: ptr cint) {.cdecl, importc: "ctfttp_",
    dynlib: libName.}
proc dtfttr*(transr: cstring; uplo: cstring; n: ptr cint; arf: ptr cdouble; a: ptr cdouble;
            lda: ptr cint; info: ptr cint) {.cdecl, importc: "dtfttr_", dynlib: libName.}
proc stfttr*(transr: cstring; uplo: cstring; n: ptr cint; arf: ptr cfloat; a: ptr cfloat;
            lda: ptr cint; info: ptr cint) {.cdecl, importc: "stfttr_", dynlib: libName.}
proc ztfttr*(transr: cstring; uplo: cstring; n: ptr cint;
            arf: ptr lapack_complex_double; a: ptr lapack_complex_double;
            lda: ptr cint; info: ptr cint) {.cdecl, importc: "ztfttr_", dynlib: libName.}
proc ctfttr*(transr: cstring; uplo: cstring; n: ptr cint; arf: ptr lapack_complex_float;
            a: ptr lapack_complex_float; lda: ptr cint; info: ptr cint) {.cdecl,
    importc: "ctfttr_", dynlib: libName.}
proc dtpttf*(transr: cstring; uplo: cstring; n: ptr cint; ap: ptr cdouble;
            arf: ptr cdouble; info: ptr cint) {.cdecl, importc: "dtpttf_",
    dynlib: libName.}
proc stpttf*(transr: cstring; uplo: cstring; n: ptr cint; ap: ptr cfloat; arf: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "stpttf_", dynlib: libName.}
proc ztpttf*(transr: cstring; uplo: cstring; n: ptr cint; ap: ptr lapack_complex_double;
            arf: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "ztpttf_", dynlib: libName.}
proc ctpttf*(transr: cstring; uplo: cstring; n: ptr cint; ap: ptr lapack_complex_float;
            arf: ptr lapack_complex_float; info: ptr cint) {.cdecl, importc: "ctpttf_",
    dynlib: libName.}
proc dtpttr*(uplo: cstring; n: ptr cint; ap: ptr cdouble; a: ptr cdouble; lda: ptr cint;
            info: ptr cint) {.cdecl, importc: "dtpttr_", dynlib: libName.}
proc stpttr*(uplo: cstring; n: ptr cint; ap: ptr cfloat; a: ptr cfloat; lda: ptr cint;
            info: ptr cint) {.cdecl, importc: "stpttr_", dynlib: libName.}
proc ztpttr*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_double;
            a: ptr lapack_complex_double; lda: ptr cint; info: ptr cint) {.cdecl,
    importc: "ztpttr_", dynlib: libName.}
proc ctpttr*(uplo: cstring; n: ptr cint; ap: ptr lapack_complex_float;
            a: ptr lapack_complex_float; lda: ptr cint; info: ptr cint) {.cdecl,
    importc: "ctpttr_", dynlib: libName.}
proc dtrttf*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            arf: ptr cdouble; info: ptr cint) {.cdecl, importc: "dtrttf_",
    dynlib: libName.}
proc strttf*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            arf: ptr cfloat; info: ptr cint) {.cdecl, importc: "strttf_", dynlib: libName.}
proc ztrttf*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; arf: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "ztrttf_", dynlib: libName.}
proc ctrttf*(transr: cstring; uplo: cstring; n: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; arf: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "ctrttf_", dynlib: libName.}
proc dtrttp*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; ap: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "dtrttp_", dynlib: libName.}
proc strttp*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; ap: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "strttp_", dynlib: libName.}
proc ztrttp*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            ap: ptr lapack_complex_double; info: ptr cint) {.cdecl, importc: "ztrttp_",
    dynlib: libName.}
proc ctrttp*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            ap: ptr lapack_complex_float; info: ptr cint) {.cdecl, importc: "ctrttp_",
    dynlib: libName.}
proc sgeqrfp*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
             work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sgeqrfp_", dynlib: libName.}
proc dgeqrfp*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
             work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dgeqrfp_", dynlib: libName.}
proc cgeqrfp*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
             tau: ptr lapack_complex_float; work: ptr lapack_complex_float;
             lwork: ptr cint; info: ptr cint) {.cdecl, importc: "cgeqrfp_",
    dynlib: libName.}
proc zgeqrfp*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
             tau: ptr lapack_complex_double; work: ptr lapack_complex_double;
             lwork: ptr cint; info: ptr cint) {.cdecl, importc: "zgeqrfp_",
    dynlib: libName.}
proc clacgv*(n: ptr cint; x: ptr lapack_complex_float; incx: ptr cint) {.cdecl,
    importc: "clacgv_", dynlib: libName.}
proc zlacgv*(n: ptr cint; x: ptr lapack_complex_double; incx: ptr cint) {.cdecl,
    importc: "zlacgv_", dynlib: libName.}
proc slarnv*(idist: ptr cint; iseed: ptr cint; n: ptr cint; x: ptr cfloat) {.cdecl,
    importc: "slarnv_", dynlib: libName.}
proc dlarnv*(idist: ptr cint; iseed: ptr cint; n: ptr cint; x: ptr cdouble) {.cdecl,
    importc: "dlarnv_", dynlib: libName.}
proc clarnv*(idist: ptr cint; iseed: ptr cint; n: ptr cint; x: ptr lapack_complex_float) {.
    cdecl, importc: "clarnv_", dynlib: libName.}
proc zlarnv*(idist: ptr cint; iseed: ptr cint; n: ptr cint; x: ptr lapack_complex_double) {.
    cdecl, importc: "zlarnv_", dynlib: libName.}
proc sgeqr2*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            work: ptr cfloat; info: ptr cint) {.cdecl, importc: "sgeqr2_",
    dynlib: libName.}
proc dgeqr2*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            work: ptr cdouble; info: ptr cint) {.cdecl, importc: "dgeqr2_",
    dynlib: libName.}
proc cgeqr2*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            tau: ptr lapack_complex_float; work: ptr lapack_complex_float;
            info: ptr cint) {.cdecl, importc: "cgeqr2_", dynlib: libName.}
proc zgeqr2*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            tau: ptr lapack_complex_double; work: ptr lapack_complex_double;
            info: ptr cint) {.cdecl, importc: "zgeqr2_", dynlib: libName.}
proc slacn2*(n: ptr cint; v: ptr cfloat; x: ptr cfloat; isgn: ptr cint; est: ptr cfloat;
            kase: ptr cint; isave: ptr cint) {.cdecl, importc: "slacn2_", dynlib: libName.}
proc dlacn2*(n: ptr cint; v: ptr cdouble; x: ptr cdouble; isgn: ptr cint; est: ptr cdouble;
            kase: ptr cint; isave: ptr cint) {.cdecl, importc: "dlacn2_", dynlib: libName.}
proc clacn2*(n: ptr cint; v: ptr lapack_complex_float; x: ptr lapack_complex_float;
            est: ptr cfloat; kase: ptr cint; isave: ptr cint) {.cdecl, importc: "clacn2_",
    dynlib: libName.}
proc zlacn2*(n: ptr cint; v: ptr lapack_complex_double; x: ptr lapack_complex_double;
            est: ptr cdouble; kase: ptr cint; isave: ptr cint) {.cdecl,
    importc: "zlacn2_", dynlib: libName.}
proc slacpy*(uplo: cstring; m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            b: ptr cfloat; ldb: ptr cint) {.cdecl, importc: "slacpy_", dynlib: libName.}
proc dlacpy*(uplo: cstring; m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint) {.cdecl, importc: "dlacpy_", dynlib: libName.}
proc clacpy*(uplo: cstring; m: ptr cint; n: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint) {.cdecl,
    importc: "clacpy_", dynlib: libName.}
proc zlacpy*(uplo: cstring; m: ptr cint; n: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint) {.cdecl,
    importc: "zlacpy_", dynlib: libName.}
proc clacp2*(uplo: cstring; m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            b: ptr lapack_complex_float; ldb: ptr cint) {.cdecl, importc: "clacp2_",
    dynlib: libName.}
proc zlacp2*(uplo: cstring; m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint) {.cdecl, importc: "zlacp2_",
    dynlib: libName.}
proc sgetf2*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint;
            info: ptr cint) {.cdecl, importc: "sgetf2_", dynlib: libName.}
proc dgetf2*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint;
            info: ptr cint) {.cdecl, importc: "dgetf2_", dynlib: libName.}
proc cgetf2*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            ipiv: ptr cint; info: ptr cint) {.cdecl, importc: "cgetf2_", dynlib: libName.}
proc zgetf2*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            ipiv: ptr cint; info: ptr cint) {.cdecl, importc: "zgetf2_", dynlib: libName.}
proc slaswp*(n: ptr cint; a: ptr cfloat; lda: ptr cint; k1: ptr cint; k2: ptr cint;
            ipiv: ptr cint; incx: ptr cint) {.cdecl, importc: "slaswp_", dynlib: libName.}
proc dlaswp*(n: ptr cint; a: ptr cdouble; lda: ptr cint; k1: ptr cint; k2: ptr cint;
            ipiv: ptr cint; incx: ptr cint) {.cdecl, importc: "dlaswp_", dynlib: libName.}
proc claswp*(n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint; k1: ptr cint;
            k2: ptr cint; ipiv: ptr cint; incx: ptr cint) {.cdecl, importc: "claswp_",
    dynlib: libName.}
proc zlaswp*(n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint; k1: ptr cint;
            k2: ptr cint; ipiv: ptr cint; incx: ptr cint) {.cdecl, importc: "zlaswp_",
    dynlib: libName.}
proc slange*(norm: cstring; m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            work: ptr cfloat): cfloat {.cdecl, importc: "slange_", dynlib: libName.}
proc dlange*(norm: cstring; m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            work: ptr cdouble): cdouble {.cdecl, importc: "dlange_", dynlib: libName.}
proc clange*(norm: cstring; m: ptr cint; n: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; work: ptr cfloat): cfloat {.cdecl, importc: "clange_",
    dynlib: libName.}
proc zlange*(norm: cstring; m: ptr cint; n: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; work: ptr cdouble): cdouble {.cdecl, importc: "zlange_",
    dynlib: libName.}
proc clanhe*(norm: cstring; uplo: cstring; n: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; work: ptr cfloat): cfloat {.cdecl, importc: "clanhe_",
    dynlib: libName.}
proc zlanhe*(norm: cstring; uplo: cstring; n: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; work: ptr cdouble): cdouble {.cdecl, importc: "zlanhe_",
    dynlib: libName.}
proc slansy*(norm: cstring; uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
            work: ptr cfloat): cfloat {.cdecl, importc: "slansy_", dynlib: libName.}
proc dlansy*(norm: cstring; uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
            work: ptr cdouble): cdouble {.cdecl, importc: "dlansy_", dynlib: libName.}
proc clansy*(norm: cstring; uplo: cstring; n: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; work: ptr cfloat): cfloat {.cdecl, importc: "clansy_",
    dynlib: libName.}
proc zlansy*(norm: cstring; uplo: cstring; n: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; work: ptr cdouble): cdouble {.cdecl, importc: "zlansy_",
    dynlib: libName.}
proc slantr*(norm: cstring; uplo: cstring; diag: cstring; m: ptr cint; n: ptr cint;
            a: ptr cfloat; lda: ptr cint; work: ptr cfloat): cfloat {.cdecl,
    importc: "slantr_", dynlib: libName.}
proc dlantr*(norm: cstring; uplo: cstring; diag: cstring; m: ptr cint; n: ptr cint;
            a: ptr cdouble; lda: ptr cint; work: ptr cdouble): cdouble {.cdecl,
    importc: "dlantr_", dynlib: libName.}
proc clantr*(norm: cstring; uplo: cstring; diag: cstring; m: ptr cint; n: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; work: ptr cfloat): cfloat {.cdecl,
    importc: "clantr_", dynlib: libName.}
proc zlantr*(norm: cstring; uplo: cstring; diag: cstring; m: ptr cint; n: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint; work: ptr cdouble): cdouble {.
    cdecl, importc: "zlantr_", dynlib: libName.}
proc slamch*(cmach: cstring): cfloat {.cdecl, importc: "slamch_", dynlib: libName.}
proc dlamch*(cmach: cstring): cdouble {.cdecl, importc: "dlamch_", dynlib: libName.}
proc sgelq2*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; tau: ptr cfloat;
            work: ptr cfloat; info: ptr cint) {.cdecl, importc: "sgelq2_",
    dynlib: libName.}
proc dgelq2*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; tau: ptr cdouble;
            work: ptr cdouble; info: ptr cint) {.cdecl, importc: "dgelq2_",
    dynlib: libName.}
proc cgelq2*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            tau: ptr lapack_complex_float; work: ptr lapack_complex_float;
            info: ptr cint) {.cdecl, importc: "cgelq2_", dynlib: libName.}
proc zgelq2*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            tau: ptr lapack_complex_double; work: ptr lapack_complex_double;
            info: ptr cint) {.cdecl, importc: "zgelq2_", dynlib: libName.}
proc slarfb*(side: cstring; trans: cstring; direct: cstring; storev: cstring;
            m: ptr cint; n: ptr cint; k: ptr cint; v: ptr cfloat; ldv: ptr cint; t: ptr cfloat;
            ldt: ptr cint; c: ptr cfloat; ldc: ptr cint; work: ptr cfloat; ldwork: ptr cint) {.
    cdecl, importc: "slarfb_", dynlib: libName.}
proc dlarfb*(side: cstring; trans: cstring; direct: cstring; storev: cstring;
            m: ptr cint; n: ptr cint; k: ptr cint; v: ptr cdouble; ldv: ptr cint;
            t: ptr cdouble; ldt: ptr cint; c: ptr cdouble; ldc: ptr cint; work: ptr cdouble;
            ldwork: ptr cint) {.cdecl, importc: "dlarfb_", dynlib: libName.}
proc clarfb*(side: cstring; trans: cstring; direct: cstring; storev: cstring;
            m: ptr cint; n: ptr cint; k: ptr cint; v: ptr lapack_complex_float;
            ldv: ptr cint; t: ptr lapack_complex_float; ldt: ptr cint;
            c: ptr lapack_complex_float; ldc: ptr cint;
            work: ptr lapack_complex_float; ldwork: ptr cint) {.cdecl,
    importc: "clarfb_", dynlib: libName.}
proc zlarfb*(side: cstring; trans: cstring; direct: cstring; storev: cstring;
            m: ptr cint; n: ptr cint; k: ptr cint; v: ptr lapack_complex_double;
            ldv: ptr cint; t: ptr lapack_complex_double; ldt: ptr cint;
            c: ptr lapack_complex_double; ldc: ptr cint;
            work: ptr lapack_complex_double; ldwork: ptr cint) {.cdecl,
    importc: "zlarfb_", dynlib: libName.}
proc slarfg*(n: ptr cint; alpha: ptr cfloat; x: ptr cfloat; incx: ptr cint; tau: ptr cfloat) {.
    cdecl, importc: "slarfg_", dynlib: libName.}
proc dlarfg*(n: ptr cint; alpha: ptr cdouble; x: ptr cdouble; incx: ptr cint;
            tau: ptr cdouble) {.cdecl, importc: "dlarfg_", dynlib: libName.}
proc clarfg*(n: ptr cint; alpha: ptr lapack_complex_float; x: ptr lapack_complex_float;
            incx: ptr cint; tau: ptr lapack_complex_float) {.cdecl, importc: "clarfg_",
    dynlib: libName.}
proc zlarfg*(n: ptr cint; alpha: ptr lapack_complex_double;
            x: ptr lapack_complex_double; incx: ptr cint;
            tau: ptr lapack_complex_double) {.cdecl, importc: "zlarfg_",
    dynlib: libName.}
proc slarft*(direct: cstring; storev: cstring; n: ptr cint; k: ptr cint; v: ptr cfloat;
            ldv: ptr cint; tau: ptr cfloat; t: ptr cfloat; ldt: ptr cint) {.cdecl,
    importc: "slarft_", dynlib: libName.}
proc dlarft*(direct: cstring; storev: cstring; n: ptr cint; k: ptr cint; v: ptr cdouble;
            ldv: ptr cint; tau: ptr cdouble; t: ptr cdouble; ldt: ptr cint) {.cdecl,
    importc: "dlarft_", dynlib: libName.}
proc clarft*(direct: cstring; storev: cstring; n: ptr cint; k: ptr cint;
            v: ptr lapack_complex_float; ldv: ptr cint; tau: ptr lapack_complex_float;
            t: ptr lapack_complex_float; ldt: ptr cint) {.cdecl, importc: "clarft_",
    dynlib: libName.}
proc zlarft*(direct: cstring; storev: cstring; n: ptr cint; k: ptr cint;
            v: ptr lapack_complex_double; ldv: ptr cint;
            tau: ptr lapack_complex_double; t: ptr lapack_complex_double;
            ldt: ptr cint) {.cdecl, importc: "zlarft_", dynlib: libName.}
proc slarfx*(side: cstring; m: ptr cint; n: ptr cint; v: ptr cfloat; tau: ptr cfloat;
            c: ptr cfloat; ldc: ptr cint; work: ptr cfloat) {.cdecl, importc: "slarfx_",
    dynlib: libName.}
proc dlarfx*(side: cstring; m: ptr cint; n: ptr cint; v: ptr cdouble; tau: ptr cdouble;
            c: ptr cdouble; ldc: ptr cint; work: ptr cdouble) {.cdecl, importc: "dlarfx_",
    dynlib: libName.}
proc clarfx*(side: cstring; m: ptr cint; n: ptr cint; v: ptr lapack_complex_float;
            tau: ptr lapack_complex_float; c: ptr lapack_complex_float; ldc: ptr cint;
            work: ptr lapack_complex_float) {.cdecl, importc: "clarfx_",
    dynlib: libName.}
proc zlarfx*(side: cstring; m: ptr cint; n: ptr cint; v: ptr lapack_complex_double;
            tau: ptr lapack_complex_double; c: ptr lapack_complex_double;
            ldc: ptr cint; work: ptr lapack_complex_double) {.cdecl,
    importc: "zlarfx_", dynlib: libName.}
proc slatms*(m: ptr cint; n: ptr cint; dist: cstring; iseed: ptr cint; sym: cstring;
            d: ptr cfloat; mode: ptr cint; cond: ptr cfloat; dmax: ptr cfloat; kl: ptr cint;
            ku: ptr cint; pack: cstring; a: ptr cfloat; lda: ptr cint; work: ptr cfloat;
            info: ptr cint) {.cdecl, importc: "slatms_", dynlib: libName.}
proc dlatms*(m: ptr cint; n: ptr cint; dist: cstring; iseed: ptr cint; sym: cstring;
            d: ptr cdouble; mode: ptr cint; cond: ptr cdouble; dmax: ptr cdouble;
            kl: ptr cint; ku: ptr cint; pack: cstring; a: ptr cdouble; lda: ptr cint;
            work: ptr cdouble; info: ptr cint) {.cdecl, importc: "dlatms_",
    dynlib: libName.}
proc clatms*(m: ptr cint; n: ptr cint; dist: cstring; iseed: ptr cint; sym: cstring;
            d: ptr cfloat; mode: ptr cint; cond: ptr cfloat; dmax: ptr cfloat; kl: ptr cint;
            ku: ptr cint; pack: cstring; a: ptr lapack_complex_float; lda: ptr cint;
            work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "clatms_", dynlib: libName.}
proc zlatms*(m: ptr cint; n: ptr cint; dist: cstring; iseed: ptr cint; sym: cstring;
            d: ptr cdouble; mode: ptr cint; cond: ptr cdouble; dmax: ptr cdouble;
            kl: ptr cint; ku: ptr cint; pack: cstring; a: ptr lapack_complex_double;
            lda: ptr cint; work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zlatms_", dynlib: libName.}
proc slag2d*(m: ptr cint; n: ptr cint; sa: ptr cfloat; ldsa: ptr cint; a: ptr cdouble;
            lda: ptr cint; info: ptr cint) {.cdecl, importc: "slag2d_", dynlib: libName.}
proc dlag2s*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; sa: ptr cfloat;
            ldsa: ptr cint; info: ptr cint) {.cdecl, importc: "dlag2s_", dynlib: libName.}
proc clag2z*(m: ptr cint; n: ptr cint; sa: ptr lapack_complex_float; ldsa: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint; info: ptr cint) {.cdecl,
    importc: "clag2z_", dynlib: libName.}
proc zlag2c*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            sa: ptr lapack_complex_float; ldsa: ptr cint; info: ptr cint) {.cdecl,
    importc: "zlag2c_", dynlib: libName.}
proc slauum*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; info: ptr cint) {.cdecl,
    importc: "slauum_", dynlib: libName.}
proc dlauum*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; info: ptr cint) {.
    cdecl, importc: "dlauum_", dynlib: libName.}
proc clauum*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
            info: ptr cint) {.cdecl, importc: "clauum_", dynlib: libName.}
proc zlauum*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            info: ptr cint) {.cdecl, importc: "zlauum_", dynlib: libName.}
proc slagge*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; d: ptr cfloat; a: ptr cfloat;
            lda: ptr cint; iseed: ptr cint; work: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "slagge_", dynlib: libName.}
proc dlagge*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; d: ptr cdouble;
            a: ptr cdouble; lda: ptr cint; iseed: ptr cint; work: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "dlagge_", dynlib: libName.}
proc clagge*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; d: ptr cfloat;
            a: ptr lapack_complex_float; lda: ptr cint; iseed: ptr cint;
            work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "clagge_", dynlib: libName.}
proc zlagge*(m: ptr cint; n: ptr cint; kl: ptr cint; ku: ptr cint; d: ptr cdouble;
            a: ptr lapack_complex_double; lda: ptr cint; iseed: ptr cint;
            work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zlagge_", dynlib: libName.}
proc slaset*(uplo: cstring; m: ptr cint; n: ptr cint; alpha: ptr cfloat; beta: ptr cfloat;
            a: ptr cfloat; lda: ptr cint) {.cdecl, importc: "slaset_", dynlib: libName.}
proc dlaset*(uplo: cstring; m: ptr cint; n: ptr cint; alpha: ptr cdouble; beta: ptr cdouble;
            a: ptr cdouble; lda: ptr cint) {.cdecl, importc: "dlaset_", dynlib: libName.}
proc claset*(uplo: cstring; m: ptr cint; n: ptr cint; alpha: ptr lapack_complex_float;
            beta: ptr lapack_complex_float; a: ptr lapack_complex_float; lda: ptr cint) {.
    cdecl, importc: "claset_", dynlib: libName.}
proc zlaset*(uplo: cstring; m: ptr cint; n: ptr cint; alpha: ptr lapack_complex_double;
            beta: ptr lapack_complex_double; a: ptr lapack_complex_double;
            lda: ptr cint) {.cdecl, importc: "zlaset_", dynlib: libName.}
proc slasrt*(id: cstring; n: ptr cint; d: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "slasrt_", dynlib: libName.}
proc dlasrt*(id: cstring; n: ptr cint; d: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dlasrt_", dynlib: libName.}
proc claghe*(n: ptr cint; k: ptr cint; d: ptr cfloat; a: ptr lapack_complex_float;
            lda: ptr cint; iseed: ptr cint; work: ptr lapack_complex_float;
            info: ptr cint) {.cdecl, importc: "claghe_", dynlib: libName.}
proc zlaghe*(n: ptr cint; k: ptr cint; d: ptr cdouble; a: ptr lapack_complex_double;
            lda: ptr cint; iseed: ptr cint; work: ptr lapack_complex_double;
            info: ptr cint) {.cdecl, importc: "zlaghe_", dynlib: libName.}
proc slagsy*(n: ptr cint; k: ptr cint; d: ptr cfloat; a: ptr cfloat; lda: ptr cint;
            iseed: ptr cint; work: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "slagsy_", dynlib: libName.}
proc dlagsy*(n: ptr cint; k: ptr cint; d: ptr cdouble; a: ptr cdouble; lda: ptr cint;
            iseed: ptr cint; work: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dlagsy_", dynlib: libName.}
proc clagsy*(n: ptr cint; k: ptr cint; d: ptr cfloat; a: ptr lapack_complex_float;
            lda: ptr cint; iseed: ptr cint; work: ptr lapack_complex_float;
            info: ptr cint) {.cdecl, importc: "clagsy_", dynlib: libName.}
proc zlagsy*(n: ptr cint; k: ptr cint; d: ptr cdouble; a: ptr lapack_complex_double;
            lda: ptr cint; iseed: ptr cint; work: ptr lapack_complex_double;
            info: ptr cint) {.cdecl, importc: "zlagsy_", dynlib: libName.}
proc slapmr*(forwrd: ptr cint; m: ptr cint; n: ptr cint; x: ptr cfloat; ldx: ptr cint;
            k: ptr cint) {.cdecl, importc: "slapmr_", dynlib: libName.}
proc dlapmr*(forwrd: ptr cint; m: ptr cint; n: ptr cint; x: ptr cdouble; ldx: ptr cint;
            k: ptr cint) {.cdecl, importc: "dlapmr_", dynlib: libName.}
proc clapmr*(forwrd: ptr cint; m: ptr cint; n: ptr cint; x: ptr lapack_complex_float;
            ldx: ptr cint; k: ptr cint) {.cdecl, importc: "clapmr_", dynlib: libName.}
proc zlapmr*(forwrd: ptr cint; m: ptr cint; n: ptr cint; x: ptr lapack_complex_double;
            ldx: ptr cint; k: ptr cint) {.cdecl, importc: "zlapmr_", dynlib: libName.}
proc slapy2*(x: ptr cfloat; y: ptr cfloat): cfloat {.cdecl, importc: "slapy2_",
    dynlib: libName.}
proc dlapy2*(x: ptr cdouble; y: ptr cdouble): cdouble {.cdecl, importc: "dlapy2_",
    dynlib: libName.}
proc slapy3*(x: ptr cfloat; y: ptr cfloat; z: ptr cfloat): cfloat {.cdecl,
    importc: "slapy3_", dynlib: libName.}
proc dlapy3*(x: ptr cdouble; y: ptr cdouble; z: ptr cdouble): cdouble {.cdecl,
    importc: "dlapy3_", dynlib: libName.}
proc slartgp*(f: ptr cfloat; g: ptr cfloat; cs: ptr cfloat; sn: ptr cfloat; r: ptr cfloat) {.
    cdecl, importc: "slartgp_", dynlib: libName.}
proc dlartgp*(f: ptr cdouble; g: ptr cdouble; cs: ptr cdouble; sn: ptr cdouble;
             r: ptr cdouble) {.cdecl, importc: "dlartgp_", dynlib: libName.}
proc slartgs*(x: ptr cfloat; y: ptr cfloat; sigma: ptr cfloat; cs: ptr cfloat; sn: ptr cfloat) {.
    cdecl, importc: "slartgs_", dynlib: libName.}
proc dlartgs*(x: ptr cdouble; y: ptr cdouble; sigma: ptr cdouble; cs: ptr cdouble;
             sn: ptr cdouble) {.cdecl, importc: "dlartgs_", dynlib: libName.}
##  LAPACK 3.3.0

proc cbbcsd*(jobu1: cstring; jobu2: cstring; jobv1t: cstring; jobv2t: cstring;
            trans: cstring; m: ptr cint; p: ptr cint; q: ptr cint; theta: ptr cfloat;
            phi: ptr cfloat; u1: ptr lapack_complex_float; ldu1: ptr cint;
            u2: ptr lapack_complex_float; ldu2: ptr cint;
            v1t: ptr lapack_complex_float; ldv1t: ptr cint;
            v2t: ptr lapack_complex_float; ldv2t: ptr cint; b11d: ptr cfloat;
            b11e: ptr cfloat; b12d: ptr cfloat; b12e: ptr cfloat; b21d: ptr cfloat;
            b21e: ptr cfloat; b22d: ptr cfloat; b22e: ptr cfloat; rwork: ptr cfloat;
            lrwork: ptr cint; info: ptr cint) {.cdecl, importc: "cbbcsd_",
    dynlib: libName.}
proc cheswapr*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; i1: ptr cint;
              i2: ptr cint) {.cdecl, importc: "cheswapr_", dynlib: libName.}
proc chetri2*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
             ipiv: ptr cint; work: ptr lapack_complex_float; lwork: ptr cint;
             info: ptr cint) {.cdecl, importc: "chetri2_", dynlib: libName.}
proc chetri2x*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
              ipiv: ptr cint; work: ptr lapack_complex_float; nb: ptr cint;
              info: ptr cint) {.cdecl, importc: "chetri2x_", dynlib: libName.}
proc chetrs2*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_float;
             lda: ptr cint; ipiv: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint;
             work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "chetrs2_", dynlib: libName.}
proc csyconv*(uplo: cstring; way: cstring; n: ptr cint; a: ptr lapack_complex_float;
             lda: ptr cint; ipiv: ptr cint; work: ptr lapack_complex_float;
             info: ptr cint) {.cdecl, importc: "csyconv_", dynlib: libName.}
proc csyswapr*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; i1: ptr cint;
              i2: ptr cint) {.cdecl, importc: "csyswapr_", dynlib: libName.}
proc csytri2*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
             ipiv: ptr cint; work: ptr lapack_complex_float; lwork: ptr cint;
             info: ptr cint) {.cdecl, importc: "csytri2_", dynlib: libName.}
proc csytri2x*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
              ipiv: ptr cint; work: ptr lapack_complex_float; nb: ptr cint;
              info: ptr cint) {.cdecl, importc: "csytri2x_", dynlib: libName.}
proc csytrs2*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_float;
             lda: ptr cint; ipiv: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint;
             work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "csytrs2_", dynlib: libName.}
proc cunbdb*(trans: cstring; signs: cstring; m: ptr cint; p: ptr cint; q: ptr cint;
            x11: ptr lapack_complex_float; ldx11: ptr cint;
            x12: ptr lapack_complex_float; ldx12: ptr cint;
            x21: ptr lapack_complex_float; ldx21: ptr cint;
            x22: ptr lapack_complex_float; ldx22: ptr cint; theta: ptr cfloat;
            phi: ptr cfloat; taup1: ptr lapack_complex_float;
            taup2: ptr lapack_complex_float; tauq1: ptr lapack_complex_float;
            tauq2: ptr lapack_complex_float; work: ptr lapack_complex_float;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "cunbdb_", dynlib: libName.}
proc cuncsd*(jobu1: cstring; jobu2: cstring; jobv1t: cstring; jobv2t: cstring;
            trans: cstring; signs: cstring; m: ptr cint; p: ptr cint; q: ptr cint;
            x11: ptr lapack_complex_float; ldx11: ptr cint;
            x12: ptr lapack_complex_float; ldx12: ptr cint;
            x21: ptr lapack_complex_float; ldx21: ptr cint;
            x22: ptr lapack_complex_float; ldx22: ptr cint; theta: ptr cfloat;
            u1: ptr lapack_complex_float; ldu1: ptr cint;
            u2: ptr lapack_complex_float; ldu2: ptr cint;
            v1t: ptr lapack_complex_float; ldv1t: ptr cint;
            v2t: ptr lapack_complex_float; ldv2t: ptr cint;
            work: ptr lapack_complex_float; lwork: ptr cint; rwork: ptr cfloat;
            lrwork: ptr cint; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "cuncsd_", dynlib: libName.}
proc dbbcsd*(jobu1: cstring; jobu2: cstring; jobv1t: cstring; jobv2t: cstring;
            trans: cstring; m: ptr cint; p: ptr cint; q: ptr cint; theta: ptr cdouble;
            phi: ptr cdouble; u1: ptr cdouble; ldu1: ptr cint; u2: ptr cdouble;
            ldu2: ptr cint; v1t: ptr cdouble; ldv1t: ptr cint; v2t: ptr cdouble;
            ldv2t: ptr cint; b11d: ptr cdouble; b11e: ptr cdouble; b12d: ptr cdouble;
            b12e: ptr cdouble; b21d: ptr cdouble; b21e: ptr cdouble; b22d: ptr cdouble;
            b22e: ptr cdouble; work: ptr cdouble; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dbbcsd_", dynlib: libName.}
proc dorbdb*(trans: cstring; signs: cstring; m: ptr cint; p: ptr cint; q: ptr cint;
            x11: ptr cdouble; ldx11: ptr cint; x12: ptr cdouble; ldx12: ptr cint;
            x21: ptr cdouble; ldx21: ptr cint; x22: ptr cdouble; ldx22: ptr cint;
            theta: ptr cdouble; phi: ptr cdouble; taup1: ptr cdouble; taup2: ptr cdouble;
            tauq1: ptr cdouble; tauq2: ptr cdouble; work: ptr cdouble; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dorbdb_", dynlib: libName.}
proc dorcsd*(jobu1: cstring; jobu2: cstring; jobv1t: cstring; jobv2t: cstring;
            trans: cstring; signs: cstring; m: ptr cint; p: ptr cint; q: ptr cint;
            x11: ptr cdouble; ldx11: ptr cint; x12: ptr cdouble; ldx12: ptr cint;
            x21: ptr cdouble; ldx21: ptr cint; x22: ptr cdouble; ldx22: ptr cint;
            theta: ptr cdouble; u1: ptr cdouble; ldu1: ptr cint; u2: ptr cdouble;
            ldu2: ptr cint; v1t: ptr cdouble; ldv1t: ptr cint; v2t: ptr cdouble;
            ldv2t: ptr cint; work: ptr cdouble; lwork: ptr cint; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "dorcsd_", dynlib: libName.}
proc dsyconv*(uplo: cstring; way: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint;
             ipiv: ptr cint; work: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dsyconv_", dynlib: libName.}
proc dsyswapr*(uplo: cstring; n: ptr cint; a: ptr cdouble; i1: ptr cint; i2: ptr cint) {.cdecl,
    importc: "dsyswapr_", dynlib: libName.}
proc dsytri2*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint;
             work: ptr lapack_complex_double; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "dsytri2_", dynlib: libName.}
proc dsytri2x*(uplo: cstring; n: ptr cint; a: ptr cdouble; lda: ptr cint; ipiv: ptr cint;
              work: ptr cdouble; nb: ptr cint; info: ptr cint) {.cdecl,
    importc: "dsytri2x_", dynlib: libName.}
proc dsytrs2*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
             ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint; work: ptr cdouble;
             info: ptr cint) {.cdecl, importc: "dsytrs2_", dynlib: libName.}
proc sbbcsd*(jobu1: cstring; jobu2: cstring; jobv1t: cstring; jobv2t: cstring;
            trans: cstring; m: ptr cint; p: ptr cint; q: ptr cint; theta: ptr cfloat;
            phi: ptr cfloat; u1: ptr cfloat; ldu1: ptr cint; u2: ptr cfloat; ldu2: ptr cint;
            v1t: ptr cfloat; ldv1t: ptr cint; v2t: ptr cfloat; ldv2t: ptr cint;
            b11d: ptr cfloat; b11e: ptr cfloat; b12d: ptr cfloat; b12e: ptr cfloat;
            b21d: ptr cfloat; b21e: ptr cfloat; b22d: ptr cfloat; b22e: ptr cfloat;
            work: ptr cfloat; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "sbbcsd_", dynlib: libName.}
proc sorbdb*(trans: cstring; signs: cstring; m: ptr cint; p: ptr cint; q: ptr cint;
            x11: ptr cfloat; ldx11: ptr cint; x12: ptr cfloat; ldx12: ptr cint;
            x21: ptr cfloat; ldx21: ptr cint; x22: ptr cfloat; ldx22: ptr cint;
            theta: ptr cfloat; phi: ptr cfloat; taup1: ptr cfloat; taup2: ptr cfloat;
            tauq1: ptr cfloat; tauq2: ptr cfloat; work: ptr cfloat; lwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "sorbdb_", dynlib: libName.}
proc sorcsd*(jobu1: cstring; jobu2: cstring; jobv1t: cstring; jobv2t: cstring;
            trans: cstring; signs: cstring; m: ptr cint; p: ptr cint; q: ptr cint;
            x11: ptr cfloat; ldx11: ptr cint; x12: ptr cfloat; ldx12: ptr cint;
            x21: ptr cfloat; ldx21: ptr cint; x22: ptr cfloat; ldx22: ptr cint;
            theta: ptr cfloat; u1: ptr cfloat; ldu1: ptr cint; u2: ptr cfloat;
            ldu2: ptr cint; v1t: ptr cfloat; ldv1t: ptr cint; v2t: ptr cfloat;
            ldv2t: ptr cint; work: ptr cfloat; lwork: ptr cint; iwork: ptr cint;
            info: ptr cint) {.cdecl, importc: "sorcsd_", dynlib: libName.}
proc ssyconv*(uplo: cstring; way: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint;
             ipiv: ptr cint; work: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "ssyconv_", dynlib: libName.}
proc ssyswapr*(uplo: cstring; n: ptr cint; a: ptr cfloat; i1: ptr cint; i2: ptr cint) {.cdecl,
    importc: "ssyswapr_", dynlib: libName.}
proc ssytri2*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint;
             work: ptr lapack_complex_float; lwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "ssytri2_", dynlib: libName.}
proc ssytri2x*(uplo: cstring; n: ptr cint; a: ptr cfloat; lda: ptr cint; ipiv: ptr cint;
              work: ptr cfloat; nb: ptr cint; info: ptr cint) {.cdecl,
    importc: "ssytri2x_", dynlib: libName.}
proc ssytrs2*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
             ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; work: ptr cfloat; info: ptr cint) {.
    cdecl, importc: "ssytrs2_", dynlib: libName.}
proc zbbcsd*(jobu1: cstring; jobu2: cstring; jobv1t: cstring; jobv2t: cstring;
            trans: cstring; m: ptr cint; p: ptr cint; q: ptr cint; theta: ptr cdouble;
            phi: ptr cdouble; u1: ptr lapack_complex_double; ldu1: ptr cint;
            u2: ptr lapack_complex_double; ldu2: ptr cint;
            v1t: ptr lapack_complex_double; ldv1t: ptr cint;
            v2t: ptr lapack_complex_double; ldv2t: ptr cint; b11d: ptr cdouble;
            b11e: ptr cdouble; b12d: ptr cdouble; b12e: ptr cdouble; b21d: ptr cdouble;
            b21e: ptr cdouble; b22d: ptr cdouble; b22e: ptr cdouble; rwork: ptr cdouble;
            lrwork: ptr cint; info: ptr cint) {.cdecl, importc: "zbbcsd_",
    dynlib: libName.}
proc zheswapr*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; i1: ptr cint;
              i2: ptr cint) {.cdecl, importc: "zheswapr_", dynlib: libName.}
proc zhetri2*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
             ipiv: ptr cint; work: ptr lapack_complex_double; lwork: ptr cint;
             info: ptr cint) {.cdecl, importc: "zhetri2_", dynlib: libName.}
proc zhetri2x*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
              ipiv: ptr cint; work: ptr lapack_complex_double; nb: ptr cint;
              info: ptr cint) {.cdecl, importc: "zhetri2x_", dynlib: libName.}
proc zhetrs2*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double;
             lda: ptr cint; ipiv: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
             work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zhetrs2_", dynlib: libName.}
proc zsyconv*(uplo: cstring; way: cstring; n: ptr cint; a: ptr lapack_complex_double;
             lda: ptr cint; ipiv: ptr cint; work: ptr lapack_complex_double;
             info: ptr cint) {.cdecl, importc: "zsyconv_", dynlib: libName.}
proc zsyswapr*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; i1: ptr cint;
              i2: ptr cint) {.cdecl, importc: "zsyswapr_", dynlib: libName.}
proc zsytri2*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
             ipiv: ptr cint; work: ptr lapack_complex_double; lwork: ptr cint;
             info: ptr cint) {.cdecl, importc: "zsytri2_", dynlib: libName.}
proc zsytri2x*(uplo: cstring; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
              ipiv: ptr cint; work: ptr lapack_complex_double; nb: ptr cint;
              info: ptr cint) {.cdecl, importc: "zsytri2x_", dynlib: libName.}
proc zsytrs2*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_double;
             lda: ptr cint; ipiv: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
             work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zsytrs2_", dynlib: libName.}
proc zunbdb*(trans: cstring; signs: cstring; m: ptr cint; p: ptr cint; q: ptr cint;
            x11: ptr lapack_complex_double; ldx11: ptr cint;
            x12: ptr lapack_complex_double; ldx12: ptr cint;
            x21: ptr lapack_complex_double; ldx21: ptr cint;
            x22: ptr lapack_complex_double; ldx22: ptr cint; theta: ptr cdouble;
            phi: ptr cdouble; taup1: ptr lapack_complex_double;
            taup2: ptr lapack_complex_double; tauq1: ptr lapack_complex_double;
            tauq2: ptr lapack_complex_double; work: ptr lapack_complex_double;
            lwork: ptr cint; info: ptr cint) {.cdecl, importc: "zunbdb_", dynlib: libName.}
proc zuncsd*(jobu1: cstring; jobu2: cstring; jobv1t: cstring; jobv2t: cstring;
            trans: cstring; signs: cstring; m: ptr cint; p: ptr cint; q: ptr cint;
            x11: ptr lapack_complex_double; ldx11: ptr cint;
            x12: ptr lapack_complex_double; ldx12: ptr cint;
            x21: ptr lapack_complex_double; ldx21: ptr cint;
            x22: ptr lapack_complex_double; ldx22: ptr cint; theta: ptr cdouble;
            u1: ptr lapack_complex_double; ldu1: ptr cint;
            u2: ptr lapack_complex_double; ldu2: ptr cint;
            v1t: ptr lapack_complex_double; ldv1t: ptr cint;
            v2t: ptr lapack_complex_double; ldv2t: ptr cint;
            work: ptr lapack_complex_double; lwork: ptr cint; rwork: ptr cdouble;
            lrwork: ptr cint; iwork: ptr cint; info: ptr cint) {.cdecl,
    importc: "zuncsd_", dynlib: libName.}
##  LAPACK 3.4.0

proc sgemqrt*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
             nb: ptr cint; v: ptr cfloat; ldv: ptr cint; t: ptr cfloat; ldt: ptr cint;
             c: ptr cfloat; ldc: ptr cint; work: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "sgemqrt_", dynlib: libName.}
proc dgemqrt*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
             nb: ptr cint; v: ptr cdouble; ldv: ptr cint; t: ptr cdouble; ldt: ptr cint;
             c: ptr cdouble; ldc: ptr cint; work: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dgemqrt_", dynlib: libName.}
proc cgemqrt*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
             nb: ptr cint; v: ptr lapack_complex_float; ldv: ptr cint;
             t: ptr lapack_complex_float; ldt: ptr cint; c: ptr lapack_complex_float;
             ldc: ptr cint; work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "cgemqrt_", dynlib: libName.}
proc zgemqrt*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
             nb: ptr cint; v: ptr lapack_complex_double; ldv: ptr cint;
             t: ptr lapack_complex_double; ldt: ptr cint;
             c: ptr lapack_complex_double; ldc: ptr cint;
             work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zgemqrt_", dynlib: libName.}
proc sgeqrt*(m: ptr cint; n: ptr cint; nb: ptr cint; a: ptr cfloat; lda: ptr cint;
            t: ptr cfloat; ldt: ptr cint; work: ptr cfloat; info: ptr cint) {.cdecl,
    importc: "sgeqrt_", dynlib: libName.}
proc dgeqrt*(m: ptr cint; n: ptr cint; nb: ptr cint; a: ptr cdouble; lda: ptr cint;
            t: ptr cdouble; ldt: ptr cint; work: ptr cdouble; info: ptr cint) {.cdecl,
    importc: "dgeqrt_", dynlib: libName.}
proc cgeqrt*(m: ptr cint; n: ptr cint; nb: ptr cint; a: ptr lapack_complex_float;
            lda: ptr cint; t: ptr lapack_complex_float; ldt: ptr cint;
            work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "cgeqrt_", dynlib: libName.}
proc zgeqrt*(m: ptr cint; n: ptr cint; nb: ptr cint; a: ptr lapack_complex_double;
            lda: ptr cint; t: ptr lapack_complex_double; ldt: ptr cint;
            work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "zgeqrt_", dynlib: libName.}
proc sgeqrt2*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; t: ptr cfloat;
             ldt: ptr cint; info: ptr cint) {.cdecl, importc: "sgeqrt2_", dynlib: libName.}
proc dgeqrt2*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; t: ptr cdouble;
             ldt: ptr cint; info: ptr cint) {.cdecl, importc: "dgeqrt2_", dynlib: libName.}
proc cgeqrt2*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
             t: ptr lapack_complex_float; ldt: ptr cint; info: ptr cint) {.cdecl,
    importc: "cgeqrt2_", dynlib: libName.}
proc zgeqrt2*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
             t: ptr lapack_complex_double; ldt: ptr cint; info: ptr cint) {.cdecl,
    importc: "zgeqrt2_", dynlib: libName.}
proc sgeqrt3*(m: ptr cint; n: ptr cint; a: ptr cfloat; lda: ptr cint; t: ptr cfloat;
             ldt: ptr cint; info: ptr cint) {.cdecl, importc: "sgeqrt3_", dynlib: libName.}
proc dgeqrt3*(m: ptr cint; n: ptr cint; a: ptr cdouble; lda: ptr cint; t: ptr cdouble;
             ldt: ptr cint; info: ptr cint) {.cdecl, importc: "dgeqrt3_", dynlib: libName.}
proc cgeqrt3*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_float; lda: ptr cint;
             t: ptr lapack_complex_float; ldt: ptr cint; info: ptr cint) {.cdecl,
    importc: "cgeqrt3_", dynlib: libName.}
proc zgeqrt3*(m: ptr cint; n: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
             t: ptr lapack_complex_double; ldt: ptr cint; info: ptr cint) {.cdecl,
    importc: "zgeqrt3_", dynlib: libName.}
proc stpmqrt*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
             l: ptr cint; nb: ptr cint; v: ptr cfloat; ldv: ptr cint; t: ptr cfloat;
             ldt: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat; ldb: ptr cint;
             work: ptr cfloat; info: ptr cint) {.cdecl, importc: "stpmqrt_",
    dynlib: libName.}
proc dtpmqrt*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
             l: ptr cint; nb: ptr cint; v: ptr cdouble; ldv: ptr cint; t: ptr cdouble;
             ldt: ptr cint; a: ptr cdouble; lda: ptr cint; b: ptr cdouble; ldb: ptr cint;
             work: ptr cdouble; info: ptr cint) {.cdecl, importc: "dtpmqrt_",
    dynlib: libName.}
proc ctpmqrt*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
             l: ptr cint; nb: ptr cint; v: ptr lapack_complex_float; ldv: ptr cint;
             t: ptr lapack_complex_float; ldt: ptr cint; a: ptr lapack_complex_float;
             lda: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint;
             work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "ctpmqrt_", dynlib: libName.}
proc ztpmqrt*(side: cstring; trans: cstring; m: ptr cint; n: ptr cint; k: ptr cint;
             l: ptr cint; nb: ptr cint; v: ptr lapack_complex_double; ldv: ptr cint;
             t: ptr lapack_complex_double; ldt: ptr cint;
             a: ptr lapack_complex_double; lda: ptr cint;
             b: ptr lapack_complex_double; ldb: ptr cint;
             work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "ztpmqrt_", dynlib: libName.}
proc dtpqrt*(m: ptr cint; n: ptr cint; l: ptr cint; nb: ptr cint; a: ptr cdouble; lda: ptr cint;
            b: ptr cdouble; ldb: ptr cint; t: ptr cdouble; ldt: ptr cint; work: ptr cdouble;
            info: ptr cint) {.cdecl, importc: "dtpqrt_", dynlib: libName.}
proc ctpqrt*(m: ptr cint; n: ptr cint; l: ptr cint; nb: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; b: ptr lapack_complex_float;
            ldb: ptr cint; t: ptr lapack_complex_float; ldt: ptr cint;
            work: ptr lapack_complex_float; info: ptr cint) {.cdecl,
    importc: "ctpqrt_", dynlib: libName.}
proc ztpqrt*(m: ptr cint; n: ptr cint; l: ptr cint; nb: ptr cint;
            a: ptr lapack_complex_double; lda: ptr cint; b: ptr lapack_complex_double;
            ldb: ptr cint; t: ptr lapack_complex_double; ldt: ptr cint;
            work: ptr lapack_complex_double; info: ptr cint) {.cdecl,
    importc: "ztpqrt_", dynlib: libName.}
proc stpqrt2*(m: ptr cint; n: ptr cint; l: ptr cint; a: ptr cfloat; lda: ptr cint;
             b: ptr cfloat; ldb: ptr cint; t: ptr cfloat; ldt: ptr cint; info: ptr cint) {.
    cdecl, importc: "stpqrt2_", dynlib: libName.}
proc dtpqrt2*(m: ptr cint; n: ptr cint; l: ptr cint; a: ptr cdouble; lda: ptr cint;
             b: ptr cdouble; ldb: ptr cint; t: ptr cdouble; ldt: ptr cint; info: ptr cint) {.
    cdecl, importc: "dtpqrt2_", dynlib: libName.}
proc ctpqrt2*(m: ptr cint; n: ptr cint; l: ptr cint; a: ptr lapack_complex_float;
             lda: ptr cint; b: ptr lapack_complex_float; ldb: ptr cint;
             t: ptr lapack_complex_float; ldt: ptr cint; info: ptr cint) {.cdecl,
    importc: "ctpqrt2_", dynlib: libName.}
proc ztpqrt2*(m: ptr cint; n: ptr cint; l: ptr cint; a: ptr lapack_complex_double;
             lda: ptr cint; b: ptr lapack_complex_double; ldb: ptr cint;
             t: ptr lapack_complex_double; ldt: ptr cint; info: ptr cint) {.cdecl,
    importc: "ztpqrt2_", dynlib: libName.}
proc stprfb*(side: cstring; trans: cstring; direct: cstring; storev: cstring;
            m: ptr cint; n: ptr cint; k: ptr cint; l: ptr cint; v: ptr cfloat; ldv: ptr cint;
            t: ptr cfloat; ldt: ptr cint; a: ptr cfloat; lda: ptr cint; b: ptr cfloat;
            ldb: ptr cint; work: ptr cfloat; ldwork: ptr cint) {.cdecl,
    importc: "stprfb_", dynlib: libName.}
proc dtprfb*(side: cstring; trans: cstring; direct: cstring; storev: cstring;
            m: ptr cint; n: ptr cint; k: ptr cint; l: ptr cint; v: ptr cdouble; ldv: ptr cint;
            t: ptr cdouble; ldt: ptr cint; a: ptr cdouble; lda: ptr cint; b: ptr cdouble;
            ldb: ptr cint; work: ptr cdouble; ldwork: ptr cint) {.cdecl,
    importc: "dtprfb_", dynlib: libName.}
proc ctprfb*(side: cstring; trans: cstring; direct: cstring; storev: cstring;
            m: ptr cint; n: ptr cint; k: ptr cint; l: ptr cint; v: ptr lapack_complex_float;
            ldv: ptr cint; t: ptr lapack_complex_float; ldt: ptr cint;
            a: ptr lapack_complex_float; lda: ptr cint; b: ptr lapack_complex_float;
            ldb: ptr cint; work: ptr cfloat; ldwork: ptr cint) {.cdecl,
    importc: "ctprfb_", dynlib: libName.}
proc ztprfb*(side: cstring; trans: cstring; direct: cstring; storev: cstring;
            m: ptr cint; n: ptr cint; k: ptr cint; l: ptr cint;
            v: ptr lapack_complex_double; ldv: ptr cint; t: ptr lapack_complex_double;
            ldt: ptr cint; a: ptr lapack_complex_double; lda: ptr cint;
            b: ptr lapack_complex_double; ldb: ptr cint; work: ptr cdouble;
            ldwork: ptr cint) {.cdecl, importc: "ztprfb_", dynlib: libName.}
##  LAPACK 3.5.0

proc ssysv_rook*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cfloat; lda: ptr cint;
                ipiv: ptr cint; b: ptr cfloat; ldb: ptr cint; work: ptr cfloat;
                lwork: ptr cint; info: ptr cint) {.cdecl, importc: "ssysv_rook_",
    dynlib: libName.}
proc dsysv_rook*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr cdouble; lda: ptr cint;
                ipiv: ptr cint; b: ptr cdouble; ldb: ptr cint; work: ptr cdouble;
                lwork: ptr cint; info: ptr cint) {.cdecl, importc: "dsysv_rook_",
    dynlib: libName.}
proc csysv_rook*(uplo: cstring; n: ptr cint; nrhs: ptr cint; a: ptr lapack_complex_float;
                lda: ptr cint; ipiv: ptr cint; b: ptr lapack_complex_float;
                ldb: ptr cint; work: ptr lapack_complex_float; lwork: ptr cint;
                info: ptr cint) {.cdecl, importc: "csysv_rook_", dynlib: libName.}
proc zsysv_rook*(uplo: cstring; n: ptr cint; nrhs: ptr cint;
                a: ptr lapack_complex_double; lda: ptr cint; ipiv: ptr cint;
                b: ptr lapack_complex_double; ldb: ptr cint;
                work: ptr lapack_complex_double; lwork: ptr cint; info: ptr cint) {.
    cdecl, importc: "zsysv_rook_", dynlib: libName.}
proc csyr*(uplo: cstring; n: ptr cint; alpha: ptr lapack_complex_float;
          x: ptr lapack_complex_float; incx: ptr cint; a: ptr lapack_complex_float;
          lda: ptr cint) {.cdecl, importc: "csyr_", dynlib: libName.}
proc zsyr*(uplo: cstring; n: ptr cint; alpha: ptr lapack_complex_double;
          x: ptr lapack_complex_double; incx: ptr cint; a: ptr lapack_complex_double;
          lda: ptr cint) {.cdecl, importc: "zsyr_", dynlib: libName.}
proc ilaver*(vers_major: ptr cint; vers_minor: ptr cint; vers_patch: ptr cint) {.cdecl,
    importc: "ilaver_", dynlib: libName.}
