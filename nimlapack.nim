 {.deadCodeElim: on.}
when defined(windows):
  const
    libName = "lapack.dll"
elif defined(macosx):
  const
    libName = "liblapack.dylib"
else:
  const
    libName = "liblapack.so.(|3|2|1|0)"
import
  nimblas/cblas

proc sgesv*(Order: CBLAS_ORDER; N: cint; NRHS: cint; A: ptr cfloat; lda: cint;
           ipiv: ptr cint; B: ptr cfloat; ldb: cint): cint {.cdecl,
    importc: "clapack_sgesv", dynlib: libName.}
proc sgetrf*(Order: CBLAS_ORDER; M: cint; N: cint; A: ptr cfloat; lda: cint; ipiv: ptr cint): cint {.
    cdecl, importc: "clapack_sgetrf", dynlib: libName.}
proc sgetrs*(Order: CBLAS_ORDER; Trans: CBLAS_TRANSPOSE; N: cint; NRHS: cint;
            A: ptr cfloat; lda: cint; ipiv: ptr cint; B: ptr cfloat; ldb: cint): cint {.cdecl,
    importc: "clapack_sgetrs", dynlib: libName.}
proc sgetri*(Order: CBLAS_ORDER; N: cint; A: ptr cfloat; lda: cint; ipiv: ptr cint): cint {.
    cdecl, importc: "clapack_sgetri", dynlib: libName.}
proc sposv*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; NRHS: cint; A: ptr cfloat;
           lda: cint; B: ptr cfloat; ldb: cint): cint {.cdecl, importc: "clapack_sposv",
    dynlib: libName.}
proc spotrf*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; A: ptr cfloat; lda: cint): cint {.
    cdecl, importc: "clapack_spotrf", dynlib: libName.}
proc spotrs*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; NRHS: cint; A: ptr cfloat;
            lda: cint; B: ptr cfloat; ldb: cint): cint {.cdecl,
    importc: "clapack_spotrs", dynlib: libName.}
proc spotri*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; A: ptr cfloat; lda: cint): cint {.
    cdecl, importc: "clapack_spotri", dynlib: libName.}
proc slauum*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; A: ptr cfloat; lda: cint): cint {.
    cdecl, importc: "clapack_slauum", dynlib: libName.}
proc strtri*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Diag: CBLAS_DIAG; N: cint;
            A: ptr cfloat; lda: cint): cint {.cdecl, importc: "clapack_strtri",
                                        dynlib: libName.}
proc sgels*(Order: CBLAS_ORDER; TA: CBLAS_TRANSPOSE; M: cint; N: cint; NRHS: cint;
           A: ptr cfloat; lda: cint; B: ptr cfloat; ldb: cint): cint {.cdecl,
    importc: "clapack_sgels", dynlib: libName.}
proc sgelqf*(Order: CBLAS_ORDER; M: cint; N: cint; A: ptr cfloat; lda: cint; TAU: ptr cfloat): cint {.
    cdecl, importc: "clapack_sgelqf", dynlib: libName.}
proc sgeqlf*(Order: CBLAS_ORDER; M: cint; N: cint; A: ptr cfloat; lda: cint; TAU: ptr cfloat): cint {.
    cdecl, importc: "clapack_sgeqlf", dynlib: libName.}
proc sgerqf*(Order: CBLAS_ORDER; M: cint; N: cint; A: ptr cfloat; lda: cint; TAU: ptr cfloat): cint {.
    cdecl, importc: "clapack_sgerqf", dynlib: libName.}
proc sgeqrf*(Order: CBLAS_ORDER; M: cint; N: cint; A: ptr cfloat; lda: cint; TAU: ptr cfloat): cint {.
    cdecl, importc: "clapack_sgeqrf", dynlib: libName.}
proc dgesv*(Order: CBLAS_ORDER; N: cint; NRHS: cint; A: ptr cdouble; lda: cint;
           ipiv: ptr cint; B: ptr cdouble; ldb: cint): cint {.cdecl,
    importc: "clapack_dgesv", dynlib: libName.}
proc dgetrf*(Order: CBLAS_ORDER; M: cint; N: cint; A: ptr cdouble; lda: cint; ipiv: ptr cint): cint {.
    cdecl, importc: "clapack_dgetrf", dynlib: libName.}
proc dgetrs*(Order: CBLAS_ORDER; Trans: CBLAS_TRANSPOSE; N: cint; NRHS: cint;
            A: ptr cdouble; lda: cint; ipiv: ptr cint; B: ptr cdouble; ldb: cint): cint {.
    cdecl, importc: "clapack_dgetrs", dynlib: libName.}
proc dgetri*(Order: CBLAS_ORDER; N: cint; A: ptr cdouble; lda: cint; ipiv: ptr cint): cint {.
    cdecl, importc: "clapack_dgetri", dynlib: libName.}
proc dposv*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; NRHS: cint; A: ptr cdouble;
           lda: cint; B: ptr cdouble; ldb: cint): cint {.cdecl, importc: "clapack_dposv",
    dynlib: libName.}
proc dpotrf*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; A: ptr cdouble; lda: cint): cint {.
    cdecl, importc: "clapack_dpotrf", dynlib: libName.}
proc dpotrs*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; NRHS: cint; A: ptr cdouble;
            lda: cint; B: ptr cdouble; ldb: cint): cint {.cdecl,
    importc: "clapack_dpotrs", dynlib: libName.}
proc dpotri*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; A: ptr cdouble; lda: cint): cint {.
    cdecl, importc: "clapack_dpotri", dynlib: libName.}
proc dlauum*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; A: ptr cdouble; lda: cint): cint {.
    cdecl, importc: "clapack_dlauum", dynlib: libName.}
proc dtrtri*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Diag: CBLAS_DIAG; N: cint;
            A: ptr cdouble; lda: cint): cint {.cdecl, importc: "clapack_dtrtri",
    dynlib: libName.}
proc dgels*(Order: CBLAS_ORDER; TA: CBLAS_TRANSPOSE; M: cint; N: cint; NRHS: cint;
           A: ptr cdouble; lda: cint; B: ptr cdouble; ldb: cint): cint {.cdecl,
    importc: "clapack_dgels", dynlib: libName.}
proc dgelqf*(Order: CBLAS_ORDER; M: cint; N: cint; A: ptr cdouble; lda: cint;
            TAU: ptr cdouble): cint {.cdecl, importc: "clapack_dgelqf", dynlib: libName.}
proc dgeqlf*(Order: CBLAS_ORDER; M: cint; N: cint; A: ptr cdouble; lda: cint;
            TAU: ptr cdouble): cint {.cdecl, importc: "clapack_dgeqlf", dynlib: libName.}
proc dgerqf*(Order: CBLAS_ORDER; M: cint; N: cint; A: ptr cdouble; lda: cint;
            TAU: ptr cdouble): cint {.cdecl, importc: "clapack_dgerqf", dynlib: libName.}
proc dgeqrf*(Order: CBLAS_ORDER; M: cint; N: cint; A: ptr cdouble; lda: cint;
            TAU: ptr cdouble): cint {.cdecl, importc: "clapack_dgeqrf", dynlib: libName.}
proc cgesv*(Order: CBLAS_ORDER; N: cint; NRHS: cint; A: pointer; lda: cint; ipiv: ptr cint;
           B: pointer; ldb: cint): cint {.cdecl, importc: "clapack_cgesv",
                                     dynlib: libName.}
proc cgetrf*(Order: CBLAS_ORDER; M: cint; N: cint; A: pointer; lda: cint; ipiv: ptr cint): cint {.
    cdecl, importc: "clapack_cgetrf", dynlib: libName.}
proc cgetrs*(Order: CBLAS_ORDER; Trans: CBLAS_TRANSPOSE; N: cint; NRHS: cint; A: pointer;
            lda: cint; ipiv: ptr cint; B: pointer; ldb: cint): cint {.cdecl,
    importc: "clapack_cgetrs", dynlib: libName.}
proc cgetri*(Order: CBLAS_ORDER; N: cint; A: pointer; lda: cint; ipiv: ptr cint): cint {.
    cdecl, importc: "clapack_cgetri", dynlib: libName.}
proc cposv*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; NRHS: cint; A: pointer;
           lda: cint; B: pointer; ldb: cint): cint {.cdecl, importc: "clapack_cposv",
    dynlib: libName.}
proc cpotrf*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; A: pointer; lda: cint): cint {.
    cdecl, importc: "clapack_cpotrf", dynlib: libName.}
proc cpotrs*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; NRHS: cint; A: pointer;
            lda: cint; B: pointer; ldb: cint): cint {.cdecl, importc: "clapack_cpotrs",
    dynlib: libName.}
proc cpotri*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; A: pointer; lda: cint): cint {.
    cdecl, importc: "clapack_cpotri", dynlib: libName.}
proc clauum*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; A: pointer; lda: cint): cint {.
    cdecl, importc: "clapack_clauum", dynlib: libName.}
proc ctrtri*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Diag: CBLAS_DIAG; N: cint; A: pointer;
            lda: cint): cint {.cdecl, importc: "clapack_ctrtri", dynlib: libName.}
proc cgels*(Order: CBLAS_ORDER; TA: CBLAS_TRANSPOSE; M: cint; N: cint; NRHS: cint;
           A: pointer; lda: cint; B: pointer; ldb: cint): cint {.cdecl,
    importc: "clapack_cgels", dynlib: libName.}
proc cgelqf*(Order: CBLAS_ORDER; M: cint; N: cint; A: pointer; lda: cint; TAU: pointer): cint {.
    cdecl, importc: "clapack_cgelqf", dynlib: libName.}
proc cgeqlf*(Order: CBLAS_ORDER; M: cint; N: cint; A: pointer; lda: cint; TAU: pointer): cint {.
    cdecl, importc: "clapack_cgeqlf", dynlib: libName.}
proc cgerqf*(Order: CBLAS_ORDER; M: cint; N: cint; A: pointer; lda: cint; TAU: pointer): cint {.
    cdecl, importc: "clapack_cgerqf", dynlib: libName.}
proc cgeqrf*(Order: CBLAS_ORDER; M: cint; N: cint; A: pointer; lda: cint; TAU: pointer): cint {.
    cdecl, importc: "clapack_cgeqrf", dynlib: libName.}
proc zgesv*(Order: CBLAS_ORDER; N: cint; NRHS: cint; A: pointer; lda: cint; ipiv: ptr cint;
           B: pointer; ldb: cint): cint {.cdecl, importc: "clapack_zgesv",
                                     dynlib: libName.}
proc zgetrf*(Order: CBLAS_ORDER; M: cint; N: cint; A: pointer; lda: cint; ipiv: ptr cint): cint {.
    cdecl, importc: "clapack_zgetrf", dynlib: libName.}
proc zgetrs*(Order: CBLAS_ORDER; Trans: CBLAS_TRANSPOSE; N: cint; NRHS: cint; A: pointer;
            lda: cint; ipiv: ptr cint; B: pointer; ldb: cint): cint {.cdecl,
    importc: "clapack_zgetrs", dynlib: libName.}
proc zgetri*(Order: CBLAS_ORDER; N: cint; A: pointer; lda: cint; ipiv: ptr cint): cint {.
    cdecl, importc: "clapack_zgetri", dynlib: libName.}
proc zposv*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; NRHS: cint; A: pointer;
           lda: cint; B: pointer; ldb: cint): cint {.cdecl, importc: "clapack_zposv",
    dynlib: libName.}
proc zpotrf*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; A: pointer; lda: cint): cint {.
    cdecl, importc: "clapack_zpotrf", dynlib: libName.}
proc zpotrs*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; NRHS: cint; A: pointer;
            lda: cint; B: pointer; ldb: cint): cint {.cdecl, importc: "clapack_zpotrs",
    dynlib: libName.}
proc zpotri*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; A: pointer; lda: cint): cint {.
    cdecl, importc: "clapack_zpotri", dynlib: libName.}
proc zlauum*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; A: pointer; lda: cint): cint {.
    cdecl, importc: "clapack_zlauum", dynlib: libName.}
proc ztrtri*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Diag: CBLAS_DIAG; N: cint; A: pointer;
            lda: cint): cint {.cdecl, importc: "clapack_ztrtri", dynlib: libName.}
proc zgels*(Order: CBLAS_ORDER; TA: CBLAS_TRANSPOSE; M: cint; N: cint; NRHS: cint;
           A: pointer; lda: cint; B: pointer; ldb: cint): cint {.cdecl,
    importc: "clapack_zgels", dynlib: libName.}
proc zgelqf*(Order: CBLAS_ORDER; M: cint; N: cint; A: pointer; lda: cint; TAU: pointer): cint {.
    cdecl, importc: "clapack_zgelqf", dynlib: libName.}
proc zgeqlf*(Order: CBLAS_ORDER; M: cint; N: cint; A: pointer; lda: cint; TAU: pointer): cint {.
    cdecl, importc: "clapack_zgeqlf", dynlib: libName.}
proc zgerqf*(Order: CBLAS_ORDER; M: cint; N: cint; A: pointer; lda: cint; TAU: pointer): cint {.
    cdecl, importc: "clapack_zgerqf", dynlib: libName.}
proc zgeqrf*(Order: CBLAS_ORDER; M: cint; N: cint; A: pointer; lda: cint; TAU: pointer): cint {.
    cdecl, importc: "clapack_zgeqrf", dynlib: libName.}