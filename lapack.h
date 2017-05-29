/*****************************************************************************
  Copyright (c) 2010, Intel Corp.
  All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice,
      this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Intel Corporation nor the names of its contributors
      may be used to endorse or promote products derived from this software
      without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
  THE POSSIBILITY OF SUCH DAMAGE.
******************************************************************************
* Contents: Native C interface to LAPACK
* Author: Intel Corporation
* Generated November, 2011
*****************************************************************************/

/*
*  Turn on HAVE_LAPACK_CONFIG_H to redefine C-LAPACK datatypes
*/
#ifdef HAVE_LAPACK_CONFIG_H
#include "lapacke_config.h"
#endif

#include <stdlib.h>

#ifndef lapack_int
#define lapack_int     int
#endif

#ifndef lapack_logical
#define lapack_logical lapack_int
#endif

/* Complex types are structures equivalent to the
* Fortran complex types COMPLEX(4) and COMPLEX(8).
*
* One can also redefine the types with his own types
* for example by including in the code definitions like
*
* #define lapack_complex_float std::complex<float>
* #define lapack_complex_double std::complex<double>
*
* or define these types in the command line:
*
* -Dlapack_complex_float="std::complex<float>"
* -Dlapack_complex_double="std::complex<double>"
*/

#ifndef LAPACK_COMPLEX_CUSTOM

/* Complex type (single precision) */
#ifndef lapack_complex_float
#include <complex.h>
#define lapack_complex_float    float _Complex
#endif

#ifndef lapack_complex_float_real
#define lapack_complex_float_real(z)       (creal(z))
#endif

#ifndef lapack_complex_float_imag
#define lapack_complex_float_imag(z)       (cimag(z))
#endif

lapack_complex_float lapack_make_complex_float( float re, float im );

/* Complex type (double precision) */
#ifndef lapack_complex_double
#include <complex.h>
#define lapack_complex_double   double _Complex
#endif

#ifndef lapack_complex_double_real
#define lapack_complex_double_real(z)      (creal(z))
#endif

#ifndef lapack_complex_double_imag
#define lapack_complex_double_imag(z)       (cimag(z))
#endif

lapack_complex_double lapack_make_complex_double( double re, double im );

#endif


#ifndef LAPACKE_malloc
#define LAPACKE_malloc( size ) malloc( size )
#endif
#ifndef LAPACKE_free
#define LAPACKE_free( p )      free( p )
#endif

#define LAPACK_C2INT( x ) (lapack_int)(*((float*)&x ))
#define LAPACK_Z2INT( x ) (lapack_int)(*((double*)&x ))

#define LAPACK_ROW_MAJOR               101
#define LAPACK_COL_MAJOR               102

#define LAPACK_WORK_MEMORY_ERROR       -1010
#define LAPACK_TRANSPOSE_MEMORY_ERROR  -1011

/* Callback logical functions of one, two, or three arguments are used
*  to select eigenvalues to sort to the top left of the Schur form.
*  The value is selected if function returns TRUE (non-zero). */

typedef lapack_logical (*LAPACK_S_SELECT2) ( const float*, const float* );
typedef lapack_logical (*LAPACK_S_SELECT3)
    ( const float*, const float*, const float* );
typedef lapack_logical (*LAPACK_D_SELECT2) ( const double*, const double* );
typedef lapack_logical (*LAPACK_D_SELECT3)
    ( const double*, const double*, const double* );

typedef lapack_logical (*LAPACK_C_SELECT1) ( const lapack_complex_float* );
typedef lapack_logical (*LAPACK_C_SELECT2)
    ( const lapack_complex_float*, const lapack_complex_float* );
typedef lapack_logical (*LAPACK_Z_SELECT1) ( const lapack_complex_double* );
typedef lapack_logical (*LAPACK_Z_SELECT2)
    ( const lapack_complex_double*, const lapack_complex_double* );


void LAPACK_sgetrf( lapack_int* m, lapack_int* n, float* a, lapack_int* lda,
                    lapack_int* ipiv, lapack_int *info );
void LAPACK_dgetrf( lapack_int* m, lapack_int* n, double* a, lapack_int* lda,
                    lapack_int* ipiv, lapack_int *info );
void LAPACK_cgetrf( lapack_int* m, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_int* ipiv, lapack_int *info );
void LAPACK_zgetrf( lapack_int* m, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_int* ipiv, lapack_int *info );
void LAPACK_sgbtrf( lapack_int* m, lapack_int* n, lapack_int* kl,
                    lapack_int* ku, float* ab, lapack_int* ldab,
                    lapack_int* ipiv, lapack_int *info );
void LAPACK_dgbtrf( lapack_int* m, lapack_int* n, lapack_int* kl,
                    lapack_int* ku, double* ab, lapack_int* ldab,
                    lapack_int* ipiv, lapack_int *info );
void LAPACK_cgbtrf( lapack_int* m, lapack_int* n, lapack_int* kl,
                    lapack_int* ku, lapack_complex_float* ab, lapack_int* ldab,
                    lapack_int* ipiv, lapack_int *info );
void LAPACK_zgbtrf( lapack_int* m, lapack_int* n, lapack_int* kl,
                    lapack_int* ku, lapack_complex_double* ab, lapack_int* ldab,
                    lapack_int* ipiv, lapack_int *info );
void LAPACK_sgttrf( lapack_int* n, float* dl, float* d, float* du, float* du2,
                    lapack_int* ipiv, lapack_int *info );
void LAPACK_dgttrf( lapack_int* n, double* dl, double* d, double* du,
                    double* du2, lapack_int* ipiv, lapack_int *info );
void LAPACK_cgttrf( lapack_int* n, lapack_complex_float* dl,
                    lapack_complex_float* d, lapack_complex_float* du,
                    lapack_complex_float* du2, lapack_int* ipiv,
                    lapack_int *info );
void LAPACK_zgttrf( lapack_int* n, lapack_complex_double* dl,
                    lapack_complex_double* d, lapack_complex_double* du,
                    lapack_complex_double* du2, lapack_int* ipiv,
                    lapack_int *info );
void LAPACK_spotrf( char* uplo, lapack_int* n, float* a, lapack_int* lda,
                    lapack_int *info );
void LAPACK_dpotrf( char* uplo, lapack_int* n, double* a, lapack_int* lda,
                    lapack_int *info );
void LAPACK_cpotrf( char* uplo, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_int *info );
void LAPACK_zpotrf( char* uplo, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_int *info );
void LAPACK_dpstrf( char* uplo, lapack_int* n, double* a, lapack_int* lda,
                    lapack_int* piv, lapack_int* rank, double* tol,
                    double* work, lapack_int *info );
void LAPACK_spstrf( char* uplo, lapack_int* n, float* a, lapack_int* lda,
                    lapack_int* piv, lapack_int* rank, float* tol, float* work,
                    lapack_int *info );
void LAPACK_zpstrf( char* uplo, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_int* piv, lapack_int* rank,
                    double* tol, double* work, lapack_int *info );
void LAPACK_cpstrf( char* uplo, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_int* piv, lapack_int* rank,
                    float* tol, float* work, lapack_int *info );
void LAPACK_dpftrf( char* transr, char* uplo, lapack_int* n, double* a,
                    lapack_int *info );
void LAPACK_spftrf( char* transr, char* uplo, lapack_int* n, float* a,
                    lapack_int *info );
void LAPACK_zpftrf( char* transr, char* uplo, lapack_int* n,
                    lapack_complex_double* a, lapack_int *info );
void LAPACK_cpftrf( char* transr, char* uplo, lapack_int* n,
                    lapack_complex_float* a, lapack_int *info );
void LAPACK_spptrf( char* uplo, lapack_int* n, float* ap, lapack_int *info );
void LAPACK_dpptrf( char* uplo, lapack_int* n, double* ap, lapack_int *info );
void LAPACK_cpptrf( char* uplo, lapack_int* n, lapack_complex_float* ap,
                    lapack_int *info );
void LAPACK_zpptrf( char* uplo, lapack_int* n, lapack_complex_double* ap,
                    lapack_int *info );
void LAPACK_spbtrf( char* uplo, lapack_int* n, lapack_int* kd, float* ab,
                    lapack_int* ldab, lapack_int *info );
void LAPACK_dpbtrf( char* uplo, lapack_int* n, lapack_int* kd, double* ab,
                    lapack_int* ldab, lapack_int *info );
void LAPACK_cpbtrf( char* uplo, lapack_int* n, lapack_int* kd,
                    lapack_complex_float* ab, lapack_int* ldab,
                    lapack_int *info );
void LAPACK_zpbtrf( char* uplo, lapack_int* n, lapack_int* kd,
                    lapack_complex_double* ab, lapack_int* ldab,
                    lapack_int *info );
void LAPACK_spttrf( lapack_int* n, float* d, float* e, lapack_int *info );
void LAPACK_dpttrf( lapack_int* n, double* d, double* e, lapack_int *info );
void LAPACK_cpttrf( lapack_int* n, float* d, lapack_complex_float* e,
                    lapack_int *info );
void LAPACK_zpttrf( lapack_int* n, double* d, lapack_complex_double* e,
                    lapack_int *info );
void LAPACK_ssytrf( char* uplo, lapack_int* n, float* a, lapack_int* lda,
                    lapack_int* ipiv, float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_dsytrf( char* uplo, lapack_int* n, double* a, lapack_int* lda,
                    lapack_int* ipiv, double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_csytrf( char* uplo, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_int* ipiv,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_zsytrf( char* uplo, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_int* ipiv,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_chetrf( char* uplo, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_int* ipiv,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_zhetrf( char* uplo, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_int* ipiv,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_ssptrf( char* uplo, lapack_int* n, float* ap, lapack_int* ipiv,
                    lapack_int *info );
void LAPACK_dsptrf( char* uplo, lapack_int* n, double* ap, lapack_int* ipiv,
                    lapack_int *info );
void LAPACK_csptrf( char* uplo, lapack_int* n, lapack_complex_float* ap,
                    lapack_int* ipiv, lapack_int *info );
void LAPACK_zsptrf( char* uplo, lapack_int* n, lapack_complex_double* ap,
                    lapack_int* ipiv, lapack_int *info );
void LAPACK_chptrf( char* uplo, lapack_int* n, lapack_complex_float* ap,
                    lapack_int* ipiv, lapack_int *info );
void LAPACK_zhptrf( char* uplo, lapack_int* n, lapack_complex_double* ap,
                    lapack_int* ipiv, lapack_int *info );
void LAPACK_sgetrs( char* trans, lapack_int* n, lapack_int* nrhs,
                    const float* a, lapack_int* lda, const lapack_int* ipiv,
                    float* b, lapack_int* ldb, lapack_int *info );
void LAPACK_dgetrs( char* trans, lapack_int* n, lapack_int* nrhs,
                    const double* a, lapack_int* lda, const lapack_int* ipiv,
                    double* b, lapack_int* ldb, lapack_int *info );
void LAPACK_cgetrs( char* trans, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* a, lapack_int* lda,
                    const lapack_int* ipiv, lapack_complex_float* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_zgetrs( char* trans, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* a, lapack_int* lda,
                    const lapack_int* ipiv, lapack_complex_double* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_sgbtrs( char* trans, lapack_int* n, lapack_int* kl, lapack_int* ku,
                    lapack_int* nrhs, const float* ab, lapack_int* ldab,
                    const lapack_int* ipiv, float* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_dgbtrs( char* trans, lapack_int* n, lapack_int* kl, lapack_int* ku,
                    lapack_int* nrhs, const double* ab, lapack_int* ldab,
                    const lapack_int* ipiv, double* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_cgbtrs( char* trans, lapack_int* n, lapack_int* kl, lapack_int* ku,
                    lapack_int* nrhs, const lapack_complex_float* ab,
                    lapack_int* ldab, const lapack_int* ipiv,
                    lapack_complex_float* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_zgbtrs( char* trans, lapack_int* n, lapack_int* kl, lapack_int* ku,
                    lapack_int* nrhs, const lapack_complex_double* ab,
                    lapack_int* ldab, const lapack_int* ipiv,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_sgttrs( char* trans, lapack_int* n, lapack_int* nrhs,
                    const float* dl, const float* d, const float* du,
                    const float* du2, const lapack_int* ipiv, float* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_dgttrs( char* trans, lapack_int* n, lapack_int* nrhs,
                    const double* dl, const double* d, const double* du,
                    const double* du2, const lapack_int* ipiv, double* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_cgttrs( char* trans, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* dl,
                    const lapack_complex_float* d,
                    const lapack_complex_float* du,
                    const lapack_complex_float* du2, const lapack_int* ipiv,
                    lapack_complex_float* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_zgttrs( char* trans, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* dl,
                    const lapack_complex_double* d,
                    const lapack_complex_double* du,
                    const lapack_complex_double* du2, const lapack_int* ipiv,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_spotrs( char* uplo, lapack_int* n, lapack_int* nrhs, const float* a,
                    lapack_int* lda, float* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_dpotrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const double* a, lapack_int* lda, double* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_cpotrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_zpotrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_dpftrs( char* transr, char* uplo, lapack_int* n, lapack_int* nrhs,
                    const double* a, double* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_spftrs( char* transr, char* uplo, lapack_int* n, lapack_int* nrhs,
                    const float* a, float* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_zpftrs( char* transr, char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* a, lapack_complex_double* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_cpftrs( char* transr, char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* a, lapack_complex_float* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_spptrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const float* ap, float* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_dpptrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const double* ap, double* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_cpptrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* ap, lapack_complex_float* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_zpptrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* ap, lapack_complex_double* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_spbtrs( char* uplo, lapack_int* n, lapack_int* kd, lapack_int* nrhs,
                    const float* ab, lapack_int* ldab, float* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_dpbtrs( char* uplo, lapack_int* n, lapack_int* kd, lapack_int* nrhs,
                    const double* ab, lapack_int* ldab, double* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_cpbtrs( char* uplo, lapack_int* n, lapack_int* kd, lapack_int* nrhs,
                    const lapack_complex_float* ab, lapack_int* ldab,
                    lapack_complex_float* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_zpbtrs( char* uplo, lapack_int* n, lapack_int* kd, lapack_int* nrhs,
                    const lapack_complex_double* ab, lapack_int* ldab,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_spttrs( lapack_int* n, lapack_int* nrhs, const float* d,
                    const float* e, float* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_dpttrs( lapack_int* n, lapack_int* nrhs, const double* d,
                    const double* e, double* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_cpttrs( char* uplo, lapack_int* n, lapack_int* nrhs, const float* d,
                    const lapack_complex_float* e, lapack_complex_float* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_zpttrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const double* d, const lapack_complex_double* e,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_ssytrs( char* uplo, lapack_int* n, lapack_int* nrhs, const float* a,
                    lapack_int* lda, const lapack_int* ipiv, float* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_dsytrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const double* a, lapack_int* lda, const lapack_int* ipiv,
                    double* b, lapack_int* ldb, lapack_int *info );
void LAPACK_csytrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* a, lapack_int* lda,
                    const lapack_int* ipiv, lapack_complex_float* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_zsytrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* a, lapack_int* lda,
                    const lapack_int* ipiv, lapack_complex_double* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_chetrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* a, lapack_int* lda,
                    const lapack_int* ipiv, lapack_complex_float* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_zhetrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* a, lapack_int* lda,
                    const lapack_int* ipiv, lapack_complex_double* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_ssptrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const float* ap, const lapack_int* ipiv, float* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_dsptrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const double* ap, const lapack_int* ipiv, double* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_csptrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* ap, const lapack_int* ipiv,
                    lapack_complex_float* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_zsptrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* ap, const lapack_int* ipiv,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_chptrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* ap, const lapack_int* ipiv,
                    lapack_complex_float* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_zhptrs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* ap, const lapack_int* ipiv,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_strtrs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* nrhs, const float* a, lapack_int* lda, float* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_dtrtrs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* nrhs, const double* a, lapack_int* lda,
                    double* b, lapack_int* ldb, lapack_int *info );
void LAPACK_ctrtrs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* nrhs, const lapack_complex_float* a,
                    lapack_int* lda, lapack_complex_float* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_ztrtrs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* nrhs, const lapack_complex_double* a,
                    lapack_int* lda, lapack_complex_double* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_stptrs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* nrhs, const float* ap, float* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_dtptrs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* nrhs, const double* ap, double* b,
                    lapack_int* ldb, lapack_int *info );
void LAPACK_ctptrs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* nrhs, const lapack_complex_float* ap,
                    lapack_complex_float* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_ztptrs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* nrhs, const lapack_complex_double* ap,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_stbtrs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* kd, lapack_int* nrhs, const float* ab,
                    lapack_int* ldab, float* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_dtbtrs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* kd, lapack_int* nrhs, const double* ab,
                    lapack_int* ldab, double* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_ctbtrs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* kd, lapack_int* nrhs,
                    const lapack_complex_float* ab, lapack_int* ldab,
                    lapack_complex_float* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_ztbtrs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* kd, lapack_int* nrhs,
                    const lapack_complex_double* ab, lapack_int* ldab,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_sgecon( char* norm, lapack_int* n, const float* a, lapack_int* lda,
                    float* anorm, float* rcond, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dgecon( char* norm, lapack_int* n, const double* a, lapack_int* lda,
                    double* anorm, double* rcond, double* work,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_cgecon( char* norm, lapack_int* n, const lapack_complex_float* a,
                    lapack_int* lda, float* anorm, float* rcond,
                    lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_zgecon( char* norm, lapack_int* n, const lapack_complex_double* a,
                    lapack_int* lda, double* anorm, double* rcond,
                    lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_sgbcon( char* norm, lapack_int* n, lapack_int* kl, lapack_int* ku,
                    const float* ab, lapack_int* ldab, const lapack_int* ipiv,
                    float* anorm, float* rcond, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dgbcon( char* norm, lapack_int* n, lapack_int* kl, lapack_int* ku,
                    const double* ab, lapack_int* ldab, const lapack_int* ipiv,
                    double* anorm, double* rcond, double* work,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_cgbcon( char* norm, lapack_int* n, lapack_int* kl, lapack_int* ku,
                    const lapack_complex_float* ab, lapack_int* ldab,
                    const lapack_int* ipiv, float* anorm, float* rcond,
                    lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_zgbcon( char* norm, lapack_int* n, lapack_int* kl, lapack_int* ku,
                    const lapack_complex_double* ab, lapack_int* ldab,
                    const lapack_int* ipiv, double* anorm, double* rcond,
                    lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_sgtcon( char* norm, lapack_int* n, const float* dl, const float* d,
                    const float* du, const float* du2, const lapack_int* ipiv,
                    float* anorm, float* rcond, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dgtcon( char* norm, lapack_int* n, const double* dl,
                    const double* d, const double* du, const double* du2,
                    const lapack_int* ipiv, double* anorm, double* rcond,
                    double* work, lapack_int* iwork, lapack_int *info );
void LAPACK_cgtcon( char* norm, lapack_int* n, const lapack_complex_float* dl,
                    const lapack_complex_float* d,
                    const lapack_complex_float* du,
                    const lapack_complex_float* du2, const lapack_int* ipiv,
                    float* anorm, float* rcond, lapack_complex_float* work,
                    lapack_int *info );
void LAPACK_zgtcon( char* norm, lapack_int* n, const lapack_complex_double* dl,
                    const lapack_complex_double* d,
                    const lapack_complex_double* du,
                    const lapack_complex_double* du2, const lapack_int* ipiv,
                    double* anorm, double* rcond, lapack_complex_double* work,
                    lapack_int *info );
void LAPACK_spocon( char* uplo, lapack_int* n, const float* a, lapack_int* lda,
                    float* anorm, float* rcond, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dpocon( char* uplo, lapack_int* n, const double* a, lapack_int* lda,
                    double* anorm, double* rcond, double* work,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_cpocon( char* uplo, lapack_int* n, const lapack_complex_float* a,
                    lapack_int* lda, float* anorm, float* rcond,
                    lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_zpocon( char* uplo, lapack_int* n, const lapack_complex_double* a,
                    lapack_int* lda, double* anorm, double* rcond,
                    lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_sppcon( char* uplo, lapack_int* n, const float* ap, float* anorm,
                    float* rcond, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dppcon( char* uplo, lapack_int* n, const double* ap, double* anorm,
                    double* rcond, double* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_cppcon( char* uplo, lapack_int* n, const lapack_complex_float* ap,
                    float* anorm, float* rcond, lapack_complex_float* work,
                    float* rwork, lapack_int *info );
void LAPACK_zppcon( char* uplo, lapack_int* n, const lapack_complex_double* ap,
                    double* anorm, double* rcond, lapack_complex_double* work,
                    double* rwork, lapack_int *info );
void LAPACK_spbcon( char* uplo, lapack_int* n, lapack_int* kd, const float* ab,
                    lapack_int* ldab, float* anorm, float* rcond, float* work,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_dpbcon( char* uplo, lapack_int* n, lapack_int* kd, const double* ab,
                    lapack_int* ldab, double* anorm, double* rcond,
                    double* work, lapack_int* iwork, lapack_int *info );
void LAPACK_cpbcon( char* uplo, lapack_int* n, lapack_int* kd,
                    const lapack_complex_float* ab, lapack_int* ldab,
                    float* anorm, float* rcond, lapack_complex_float* work,
                    float* rwork, lapack_int *info );
void LAPACK_zpbcon( char* uplo, lapack_int* n, lapack_int* kd,
                    const lapack_complex_double* ab, lapack_int* ldab,
                    double* anorm, double* rcond, lapack_complex_double* work,
                    double* rwork, lapack_int *info );
void LAPACK_sptcon( lapack_int* n, const float* d, const float* e, float* anorm,
                    float* rcond, float* work, lapack_int *info );
void LAPACK_dptcon( lapack_int* n, const double* d, const double* e,
                    double* anorm, double* rcond, double* work,
                    lapack_int *info );
void LAPACK_cptcon( lapack_int* n, const float* d,
                    const lapack_complex_float* e, float* anorm, float* rcond,
                    float* work, lapack_int *info );
void LAPACK_zptcon( lapack_int* n, const double* d,
                    const lapack_complex_double* e, double* anorm,
                    double* rcond, double* work, lapack_int *info );
void LAPACK_ssycon( char* uplo, lapack_int* n, const float* a, lapack_int* lda,
                    const lapack_int* ipiv, float* anorm, float* rcond,
                    float* work, lapack_int* iwork, lapack_int *info );
void LAPACK_dsycon( char* uplo, lapack_int* n, const double* a, lapack_int* lda,
                    const lapack_int* ipiv, double* anorm, double* rcond,
                    double* work, lapack_int* iwork, lapack_int *info );
void LAPACK_csycon( char* uplo, lapack_int* n, const lapack_complex_float* a,
                    lapack_int* lda, const lapack_int* ipiv, float* anorm,
                    float* rcond, lapack_complex_float* work,
                    lapack_int *info );
void LAPACK_zsycon( char* uplo, lapack_int* n, const lapack_complex_double* a,
                    lapack_int* lda, const lapack_int* ipiv, double* anorm,
                    double* rcond, lapack_complex_double* work,
                    lapack_int *info );
void LAPACK_checon( char* uplo, lapack_int* n, const lapack_complex_float* a,
                    lapack_int* lda, const lapack_int* ipiv, float* anorm,
                    float* rcond, lapack_complex_float* work,
                    lapack_int *info );
void LAPACK_zhecon( char* uplo, lapack_int* n, const lapack_complex_double* a,
                    lapack_int* lda, const lapack_int* ipiv, double* anorm,
                    double* rcond, lapack_complex_double* work,
                    lapack_int *info );
void LAPACK_sspcon( char* uplo, lapack_int* n, const float* ap,
                    const lapack_int* ipiv, float* anorm, float* rcond,
                    float* work, lapack_int* iwork, lapack_int *info );
void LAPACK_dspcon( char* uplo, lapack_int* n, const double* ap,
                    const lapack_int* ipiv, double* anorm, double* rcond,
                    double* work, lapack_int* iwork, lapack_int *info );
void LAPACK_cspcon( char* uplo, lapack_int* n, const lapack_complex_float* ap,
                    const lapack_int* ipiv, float* anorm, float* rcond,
                    lapack_complex_float* work, lapack_int *info );
void LAPACK_zspcon( char* uplo, lapack_int* n, const lapack_complex_double* ap,
                    const lapack_int* ipiv, double* anorm, double* rcond,
                    lapack_complex_double* work, lapack_int *info );
void LAPACK_chpcon( char* uplo, lapack_int* n, const lapack_complex_float* ap,
                    const lapack_int* ipiv, float* anorm, float* rcond,
                    lapack_complex_float* work, lapack_int *info );
void LAPACK_zhpcon( char* uplo, lapack_int* n, const lapack_complex_double* ap,
                    const lapack_int* ipiv, double* anorm, double* rcond,
                    lapack_complex_double* work, lapack_int *info );
void LAPACK_strcon( char* norm, char* uplo, char* diag, lapack_int* n,
                    const float* a, lapack_int* lda, float* rcond, float* work,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_dtrcon( char* norm, char* uplo, char* diag, lapack_int* n,
                    const double* a, lapack_int* lda, double* rcond,
                    double* work, lapack_int* iwork, lapack_int *info );
void LAPACK_ctrcon( char* norm, char* uplo, char* diag, lapack_int* n,
                    const lapack_complex_float* a, lapack_int* lda,
                    float* rcond, lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_ztrcon( char* norm, char* uplo, char* diag, lapack_int* n,
                    const lapack_complex_double* a, lapack_int* lda,
                    double* rcond, lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_stpcon( char* norm, char* uplo, char* diag, lapack_int* n,
                    const float* ap, float* rcond, float* work,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_dtpcon( char* norm, char* uplo, char* diag, lapack_int* n,
                    const double* ap, double* rcond, double* work,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_ctpcon( char* norm, char* uplo, char* diag, lapack_int* n,
                    const lapack_complex_float* ap, float* rcond,
                    lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_ztpcon( char* norm, char* uplo, char* diag, lapack_int* n,
                    const lapack_complex_double* ap, double* rcond,
                    lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_stbcon( char* norm, char* uplo, char* diag, lapack_int* n,
                    lapack_int* kd, const float* ab, lapack_int* ldab,
                    float* rcond, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dtbcon( char* norm, char* uplo, char* diag, lapack_int* n,
                    lapack_int* kd, const double* ab, lapack_int* ldab,
                    double* rcond, double* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_ctbcon( char* norm, char* uplo, char* diag, lapack_int* n,
                    lapack_int* kd, const lapack_complex_float* ab,
                    lapack_int* ldab, float* rcond, lapack_complex_float* work,
                    float* rwork, lapack_int *info );
void LAPACK_ztbcon( char* norm, char* uplo, char* diag, lapack_int* n,
                    lapack_int* kd, const lapack_complex_double* ab,
                    lapack_int* ldab, double* rcond,
                    lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_sgerfs( char* trans, lapack_int* n, lapack_int* nrhs,
                    const float* a, lapack_int* lda, const float* af,
                    lapack_int* ldaf, const lapack_int* ipiv, const float* b,
                    lapack_int* ldb, float* x, lapack_int* ldx, float* ferr,
                    float* berr, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dgerfs( char* trans, lapack_int* n, lapack_int* nrhs,
                    const double* a, lapack_int* lda, const double* af,
                    lapack_int* ldaf, const lapack_int* ipiv, const double* b,
                    lapack_int* ldb, double* x, lapack_int* ldx, double* ferr,
                    double* berr, double* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_cgerfs( char* trans, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* a, lapack_int* lda,
                    const lapack_complex_float* af, lapack_int* ldaf,
                    const lapack_int* ipiv, const lapack_complex_float* b,
                    lapack_int* ldb, lapack_complex_float* x, lapack_int* ldx,
                    float* ferr, float* berr, lapack_complex_float* work,
                    float* rwork, lapack_int *info );
void LAPACK_zgerfs( char* trans, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* a, lapack_int* lda,
                    const lapack_complex_double* af, lapack_int* ldaf,
                    const lapack_int* ipiv, const lapack_complex_double* b,
                    lapack_int* ldb, lapack_complex_double* x, lapack_int* ldx,
                    double* ferr, double* berr, lapack_complex_double* work,
                    double* rwork, lapack_int *info );
void LAPACK_dgerfsx( char* trans, char* equed, lapack_int* n, lapack_int* nrhs,
                     const double* a, lapack_int* lda, const double* af,
                     lapack_int* ldaf, const lapack_int* ipiv, const double* r,
                     const double* c, const double* b, lapack_int* ldb,
                     double* x, lapack_int* ldx, double* rcond, double* berr,
                     lapack_int* n_err_bnds, double* err_bnds_norm,
                     double* err_bnds_comp, lapack_int* nparams, double* params,
                     double* work, lapack_int* iwork, lapack_int *info );
void LAPACK_sgerfsx( char* trans, char* equed, lapack_int* n, lapack_int* nrhs,
                     const float* a, lapack_int* lda, const float* af,
                     lapack_int* ldaf, const lapack_int* ipiv, const float* r,
                     const float* c, const float* b, lapack_int* ldb, float* x,
                     lapack_int* ldx, float* rcond, float* berr,
                     lapack_int* n_err_bnds, float* err_bnds_norm,
                     float* err_bnds_comp, lapack_int* nparams, float* params,
                     float* work, lapack_int* iwork, lapack_int *info );
void LAPACK_zgerfsx( char* trans, char* equed, lapack_int* n, lapack_int* nrhs,
                     const lapack_complex_double* a, lapack_int* lda,
                     const lapack_complex_double* af, lapack_int* ldaf,
                     const lapack_int* ipiv, const double* r, const double* c,
                     const lapack_complex_double* b, lapack_int* ldb,
                     lapack_complex_double* x, lapack_int* ldx, double* rcond,
                     double* berr, lapack_int* n_err_bnds,
                     double* err_bnds_norm, double* err_bnds_comp,
                     lapack_int* nparams, double* params,
                     lapack_complex_double* work, double* rwork,
                     lapack_int *info );
void LAPACK_cgerfsx( char* trans, char* equed, lapack_int* n, lapack_int* nrhs,
                     const lapack_complex_float* a, lapack_int* lda,
                     const lapack_complex_float* af, lapack_int* ldaf,
                     const lapack_int* ipiv, const float* r, const float* c,
                     const lapack_complex_float* b, lapack_int* ldb,
                     lapack_complex_float* x, lapack_int* ldx, float* rcond,
                     float* berr, lapack_int* n_err_bnds, float* err_bnds_norm,
                     float* err_bnds_comp, lapack_int* nparams, float* params,
                     lapack_complex_float* work, float* rwork,
                     lapack_int *info );
void LAPACK_sgbrfs( char* trans, lapack_int* n, lapack_int* kl, lapack_int* ku,
                    lapack_int* nrhs, const float* ab, lapack_int* ldab,
                    const float* afb, lapack_int* ldafb, const lapack_int* ipiv,
                    const float* b, lapack_int* ldb, float* x, lapack_int* ldx,
                    float* ferr, float* berr, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dgbrfs( char* trans, lapack_int* n, lapack_int* kl, lapack_int* ku,
                    lapack_int* nrhs, const double* ab, lapack_int* ldab,
                    const double* afb, lapack_int* ldafb,
                    const lapack_int* ipiv, const double* b, lapack_int* ldb,
                    double* x, lapack_int* ldx, double* ferr, double* berr,
                    double* work, lapack_int* iwork, lapack_int *info );
void LAPACK_cgbrfs( char* trans, lapack_int* n, lapack_int* kl, lapack_int* ku,
                    lapack_int* nrhs, const lapack_complex_float* ab,
                    lapack_int* ldab, const lapack_complex_float* afb,
                    lapack_int* ldafb, const lapack_int* ipiv,
                    const lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* x, lapack_int* ldx, float* ferr,
                    float* berr, lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_zgbrfs( char* trans, lapack_int* n, lapack_int* kl, lapack_int* ku,
                    lapack_int* nrhs, const lapack_complex_double* ab,
                    lapack_int* ldab, const lapack_complex_double* afb,
                    lapack_int* ldafb, const lapack_int* ipiv,
                    const lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* x, lapack_int* ldx, double* ferr,
                    double* berr, lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_dgbrfsx( char* trans, char* equed, lapack_int* n, lapack_int* kl,
                     lapack_int* ku, lapack_int* nrhs, const double* ab,
                     lapack_int* ldab, const double* afb, lapack_int* ldafb,
                     const lapack_int* ipiv, const double* r, const double* c,
                     const double* b, lapack_int* ldb, double* x,
                     lapack_int* ldx, double* rcond, double* berr,
                     lapack_int* n_err_bnds, double* err_bnds_norm,
                     double* err_bnds_comp, lapack_int* nparams, double* params,
                     double* work, lapack_int* iwork, lapack_int *info );
void LAPACK_sgbrfsx( char* trans, char* equed, lapack_int* n, lapack_int* kl,
                     lapack_int* ku, lapack_int* nrhs, const float* ab,
                     lapack_int* ldab, const float* afb, lapack_int* ldafb,
                     const lapack_int* ipiv, const float* r, const float* c,
                     const float* b, lapack_int* ldb, float* x, lapack_int* ldx,
                     float* rcond, float* berr, lapack_int* n_err_bnds,
                     float* err_bnds_norm, float* err_bnds_comp,
                     lapack_int* nparams, float* params, float* work,
                     lapack_int* iwork, lapack_int *info );
void LAPACK_zgbrfsx( char* trans, char* equed, lapack_int* n, lapack_int* kl,
                     lapack_int* ku, lapack_int* nrhs,
                     const lapack_complex_double* ab, lapack_int* ldab,
                     const lapack_complex_double* afb, lapack_int* ldafb,
                     const lapack_int* ipiv, const double* r, const double* c,
                     const lapack_complex_double* b, lapack_int* ldb,
                     lapack_complex_double* x, lapack_int* ldx, double* rcond,
                     double* berr, lapack_int* n_err_bnds,
                     double* err_bnds_norm, double* err_bnds_comp,
                     lapack_int* nparams, double* params,
                     lapack_complex_double* work, double* rwork,
                     lapack_int *info );
void LAPACK_cgbrfsx( char* trans, char* equed, lapack_int* n, lapack_int* kl,
                     lapack_int* ku, lapack_int* nrhs,
                     const lapack_complex_float* ab, lapack_int* ldab,
                     const lapack_complex_float* afb, lapack_int* ldafb,
                     const lapack_int* ipiv, const float* r, const float* c,
                     const lapack_complex_float* b, lapack_int* ldb,
                     lapack_complex_float* x, lapack_int* ldx, float* rcond,
                     float* berr, lapack_int* n_err_bnds, float* err_bnds_norm,
                     float* err_bnds_comp, lapack_int* nparams, float* params,
                     lapack_complex_float* work, float* rwork,
                     lapack_int *info );
void LAPACK_sgtrfs( char* trans, lapack_int* n, lapack_int* nrhs,
                    const float* dl, const float* d, const float* du,
                    const float* dlf, const float* df, const float* duf,
                    const float* du2, const lapack_int* ipiv, const float* b,
                    lapack_int* ldb, float* x, lapack_int* ldx, float* ferr,
                    float* berr, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dgtrfs( char* trans, lapack_int* n, lapack_int* nrhs,
                    const double* dl, const double* d, const double* du,
                    const double* dlf, const double* df, const double* duf,
                    const double* du2, const lapack_int* ipiv, const double* b,
                    lapack_int* ldb, double* x, lapack_int* ldx, double* ferr,
                    double* berr, double* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_cgtrfs( char* trans, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* dl,
                    const lapack_complex_float* d,
                    const lapack_complex_float* du,
                    const lapack_complex_float* dlf,
                    const lapack_complex_float* df,
                    const lapack_complex_float* duf,
                    const lapack_complex_float* du2, const lapack_int* ipiv,
                    const lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* x, lapack_int* ldx, float* ferr,
                    float* berr, lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_zgtrfs( char* trans, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* dl,
                    const lapack_complex_double* d,
                    const lapack_complex_double* du,
                    const lapack_complex_double* dlf,
                    const lapack_complex_double* df,
                    const lapack_complex_double* duf,
                    const lapack_complex_double* du2, const lapack_int* ipiv,
                    const lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* x, lapack_int* ldx, double* ferr,
                    double* berr, lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_sporfs( char* uplo, lapack_int* n, lapack_int* nrhs, const float* a,
                    lapack_int* lda, const float* af, lapack_int* ldaf,
                    const float* b, lapack_int* ldb, float* x, lapack_int* ldx,
                    float* ferr, float* berr, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dporfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const double* a, lapack_int* lda, const double* af,
                    lapack_int* ldaf, const double* b, lapack_int* ldb,
                    double* x, lapack_int* ldx, double* ferr, double* berr,
                    double* work, lapack_int* iwork, lapack_int *info );
void LAPACK_cporfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* a, lapack_int* lda,
                    const lapack_complex_float* af, lapack_int* ldaf,
                    const lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* x, lapack_int* ldx, float* ferr,
                    float* berr, lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_zporfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* a, lapack_int* lda,
                    const lapack_complex_double* af, lapack_int* ldaf,
                    const lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* x, lapack_int* ldx, double* ferr,
                    double* berr, lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_dporfsx( char* uplo, char* equed, lapack_int* n, lapack_int* nrhs,
                     const double* a, lapack_int* lda, const double* af,
                     lapack_int* ldaf, const double* s, const double* b,
                     lapack_int* ldb, double* x, lapack_int* ldx, double* rcond,
                     double* berr, lapack_int* n_err_bnds,
                     double* err_bnds_norm, double* err_bnds_comp,
                     lapack_int* nparams, double* params, double* work,
                     lapack_int* iwork, lapack_int *info );
void LAPACK_sporfsx( char* uplo, char* equed, lapack_int* n, lapack_int* nrhs,
                     const float* a, lapack_int* lda, const float* af,
                     lapack_int* ldaf, const float* s, const float* b,
                     lapack_int* ldb, float* x, lapack_int* ldx, float* rcond,
                     float* berr, lapack_int* n_err_bnds, float* err_bnds_norm,
                     float* err_bnds_comp, lapack_int* nparams, float* params,
                     float* work, lapack_int* iwork, lapack_int *info );
void LAPACK_zporfsx( char* uplo, char* equed, lapack_int* n, lapack_int* nrhs,
                     const lapack_complex_double* a, lapack_int* lda,
                     const lapack_complex_double* af, lapack_int* ldaf,
                     const double* s, const lapack_complex_double* b,
                     lapack_int* ldb, lapack_complex_double* x, lapack_int* ldx,
                     double* rcond, double* berr, lapack_int* n_err_bnds,
                     double* err_bnds_norm, double* err_bnds_comp,
                     lapack_int* nparams, double* params,
                     lapack_complex_double* work, double* rwork,
                     lapack_int *info );
void LAPACK_cporfsx( char* uplo, char* equed, lapack_int* n, lapack_int* nrhs,
                     const lapack_complex_float* a, lapack_int* lda,
                     const lapack_complex_float* af, lapack_int* ldaf,
                     const float* s, const lapack_complex_float* b,
                     lapack_int* ldb, lapack_complex_float* x, lapack_int* ldx,
                     float* rcond, float* berr, lapack_int* n_err_bnds,
                     float* err_bnds_norm, float* err_bnds_comp,
                     lapack_int* nparams, float* params,
                     lapack_complex_float* work, float* rwork,
                     lapack_int *info );
void LAPACK_spprfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const float* ap, const float* afp, const float* b,
                    lapack_int* ldb, float* x, lapack_int* ldx, float* ferr,
                    float* berr, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dpprfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const double* ap, const double* afp, const double* b,
                    lapack_int* ldb, double* x, lapack_int* ldx, double* ferr,
                    double* berr, double* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_cpprfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* ap,
                    const lapack_complex_float* afp,
                    const lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* x, lapack_int* ldx, float* ferr,
                    float* berr, lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_zpprfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* ap,
                    const lapack_complex_double* afp,
                    const lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* x, lapack_int* ldx, double* ferr,
                    double* berr, lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_spbrfs( char* uplo, lapack_int* n, lapack_int* kd, lapack_int* nrhs,
                    const float* ab, lapack_int* ldab, const float* afb,
                    lapack_int* ldafb, const float* b, lapack_int* ldb,
                    float* x, lapack_int* ldx, float* ferr, float* berr,
                    float* work, lapack_int* iwork, lapack_int *info );
void LAPACK_dpbrfs( char* uplo, lapack_int* n, lapack_int* kd, lapack_int* nrhs,
                    const double* ab, lapack_int* ldab, const double* afb,
                    lapack_int* ldafb, const double* b, lapack_int* ldb,
                    double* x, lapack_int* ldx, double* ferr, double* berr,
                    double* work, lapack_int* iwork, lapack_int *info );
void LAPACK_cpbrfs( char* uplo, lapack_int* n, lapack_int* kd, lapack_int* nrhs,
                    const lapack_complex_float* ab, lapack_int* ldab,
                    const lapack_complex_float* afb, lapack_int* ldafb,
                    const lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* x, lapack_int* ldx, float* ferr,
                    float* berr, lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_zpbrfs( char* uplo, lapack_int* n, lapack_int* kd, lapack_int* nrhs,
                    const lapack_complex_double* ab, lapack_int* ldab,
                    const lapack_complex_double* afb, lapack_int* ldafb,
                    const lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* x, lapack_int* ldx, double* ferr,
                    double* berr, lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_sptrfs( lapack_int* n, lapack_int* nrhs, const float* d,
                    const float* e, const float* df, const float* ef,
                    const float* b, lapack_int* ldb, float* x, lapack_int* ldx,
                    float* ferr, float* berr, float* work, lapack_int *info );
void LAPACK_dptrfs( lapack_int* n, lapack_int* nrhs, const double* d,
                    const double* e, const double* df, const double* ef,
                    const double* b, lapack_int* ldb, double* x,
                    lapack_int* ldx, double* ferr, double* berr, double* work,
                    lapack_int *info );
void LAPACK_cptrfs( char* uplo, lapack_int* n, lapack_int* nrhs, const float* d,
                    const lapack_complex_float* e, const float* df,
                    const lapack_complex_float* ef,
                    const lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* x, lapack_int* ldx, float* ferr,
                    float* berr, lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_zptrfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const double* d, const lapack_complex_double* e,
                    const double* df, const lapack_complex_double* ef,
                    const lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* x, lapack_int* ldx, double* ferr,
                    double* berr, lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_ssyrfs( char* uplo, lapack_int* n, lapack_int* nrhs, const float* a,
                    lapack_int* lda, const float* af, lapack_int* ldaf,
                    const lapack_int* ipiv, const float* b, lapack_int* ldb,
                    float* x, lapack_int* ldx, float* ferr, float* berr,
                    float* work, lapack_int* iwork, lapack_int *info );
void LAPACK_dsyrfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const double* a, lapack_int* lda, const double* af,
                    lapack_int* ldaf, const lapack_int* ipiv, const double* b,
                    lapack_int* ldb, double* x, lapack_int* ldx, double* ferr,
                    double* berr, double* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_csyrfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* a, lapack_int* lda,
                    const lapack_complex_float* af, lapack_int* ldaf,
                    const lapack_int* ipiv, const lapack_complex_float* b,
                    lapack_int* ldb, lapack_complex_float* x, lapack_int* ldx,
                    float* ferr, float* berr, lapack_complex_float* work,
                    float* rwork, lapack_int *info );
void LAPACK_zsyrfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* a, lapack_int* lda,
                    const lapack_complex_double* af, lapack_int* ldaf,
                    const lapack_int* ipiv, const lapack_complex_double* b,
                    lapack_int* ldb, lapack_complex_double* x, lapack_int* ldx,
                    double* ferr, double* berr, lapack_complex_double* work,
                    double* rwork, lapack_int *info );
void LAPACK_dsyrfsx( char* uplo, char* equed, lapack_int* n, lapack_int* nrhs,
                     const double* a, lapack_int* lda, const double* af,
                     lapack_int* ldaf, const lapack_int* ipiv, const double* s,
                     const double* b, lapack_int* ldb, double* x,
                     lapack_int* ldx, double* rcond, double* berr,
                     lapack_int* n_err_bnds, double* err_bnds_norm,
                     double* err_bnds_comp, lapack_int* nparams, double* params,
                     double* work, lapack_int* iwork, lapack_int *info );
void LAPACK_ssyrfsx( char* uplo, char* equed, lapack_int* n, lapack_int* nrhs,
                     const float* a, lapack_int* lda, const float* af,
                     lapack_int* ldaf, const lapack_int* ipiv, const float* s,
                     const float* b, lapack_int* ldb, float* x, lapack_int* ldx,
                     float* rcond, float* berr, lapack_int* n_err_bnds,
                     float* err_bnds_norm, float* err_bnds_comp,
                     lapack_int* nparams, float* params, float* work,
                     lapack_int* iwork, lapack_int *info );
void LAPACK_zsyrfsx( char* uplo, char* equed, lapack_int* n, lapack_int* nrhs,
                     const lapack_complex_double* a, lapack_int* lda,
                     const lapack_complex_double* af, lapack_int* ldaf,
                     const lapack_int* ipiv, const double* s,
                     const lapack_complex_double* b, lapack_int* ldb,
                     lapack_complex_double* x, lapack_int* ldx, double* rcond,
                     double* berr, lapack_int* n_err_bnds,
                     double* err_bnds_norm, double* err_bnds_comp,
                     lapack_int* nparams, double* params,
                     lapack_complex_double* work, double* rwork,
                     lapack_int *info );
void LAPACK_csyrfsx( char* uplo, char* equed, lapack_int* n, lapack_int* nrhs,
                     const lapack_complex_float* a, lapack_int* lda,
                     const lapack_complex_float* af, lapack_int* ldaf,
                     const lapack_int* ipiv, const float* s,
                     const lapack_complex_float* b, lapack_int* ldb,
                     lapack_complex_float* x, lapack_int* ldx, float* rcond,
                     float* berr, lapack_int* n_err_bnds, float* err_bnds_norm,
                     float* err_bnds_comp, lapack_int* nparams, float* params,
                     lapack_complex_float* work, float* rwork,
                     lapack_int *info );
void LAPACK_cherfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* a, lapack_int* lda,
                    const lapack_complex_float* af, lapack_int* ldaf,
                    const lapack_int* ipiv, const lapack_complex_float* b,
                    lapack_int* ldb, lapack_complex_float* x, lapack_int* ldx,
                    float* ferr, float* berr, lapack_complex_float* work,
                    float* rwork, lapack_int *info );
void LAPACK_zherfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* a, lapack_int* lda,
                    const lapack_complex_double* af, lapack_int* ldaf,
                    const lapack_int* ipiv, const lapack_complex_double* b,
                    lapack_int* ldb, lapack_complex_double* x, lapack_int* ldx,
                    double* ferr, double* berr, lapack_complex_double* work,
                    double* rwork, lapack_int *info );
void LAPACK_zherfsx( char* uplo, char* equed, lapack_int* n, lapack_int* nrhs,
                     const lapack_complex_double* a, lapack_int* lda,
                     const lapack_complex_double* af, lapack_int* ldaf,
                     const lapack_int* ipiv, const double* s,
                     const lapack_complex_double* b, lapack_int* ldb,
                     lapack_complex_double* x, lapack_int* ldx, double* rcond,
                     double* berr, lapack_int* n_err_bnds,
                     double* err_bnds_norm, double* err_bnds_comp,
                     lapack_int* nparams, double* params,
                     lapack_complex_double* work, double* rwork,
                     lapack_int *info );
void LAPACK_cherfsx( char* uplo, char* equed, lapack_int* n, lapack_int* nrhs,
                     const lapack_complex_float* a, lapack_int* lda,
                     const lapack_complex_float* af, lapack_int* ldaf,
                     const lapack_int* ipiv, const float* s,
                     const lapack_complex_float* b, lapack_int* ldb,
                     lapack_complex_float* x, lapack_int* ldx, float* rcond,
                     float* berr, lapack_int* n_err_bnds, float* err_bnds_norm,
                     float* err_bnds_comp, lapack_int* nparams, float* params,
                     lapack_complex_float* work, float* rwork,
                     lapack_int *info );
void LAPACK_ssprfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const float* ap, const float* afp, const lapack_int* ipiv,
                    const float* b, lapack_int* ldb, float* x, lapack_int* ldx,
                    float* ferr, float* berr, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dsprfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const double* ap, const double* afp, const lapack_int* ipiv,
                    const double* b, lapack_int* ldb, double* x,
                    lapack_int* ldx, double* ferr, double* berr, double* work,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_csprfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* ap,
                    const lapack_complex_float* afp, const lapack_int* ipiv,
                    const lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* x, lapack_int* ldx, float* ferr,
                    float* berr, lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_zsprfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* ap,
                    const lapack_complex_double* afp, const lapack_int* ipiv,
                    const lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* x, lapack_int* ldx, double* ferr,
                    double* berr, lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_chprfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* ap,
                    const lapack_complex_float* afp, const lapack_int* ipiv,
                    const lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* x, lapack_int* ldx, float* ferr,
                    float* berr, lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_zhprfs( char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* ap,
                    const lapack_complex_double* afp, const lapack_int* ipiv,
                    const lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* x, lapack_int* ldx, double* ferr,
                    double* berr, lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_strrfs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* nrhs, const float* a, lapack_int* lda,
                    const float* b, lapack_int* ldb, const float* x,
                    lapack_int* ldx, float* ferr, float* berr, float* work,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_dtrrfs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* nrhs, const double* a, lapack_int* lda,
                    const double* b, lapack_int* ldb, const double* x,
                    lapack_int* ldx, double* ferr, double* berr, double* work,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_ctrrfs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* nrhs, const lapack_complex_float* a,
                    lapack_int* lda, const lapack_complex_float* b,
                    lapack_int* ldb, const lapack_complex_float* x,
                    lapack_int* ldx, float* ferr, float* berr,
                    lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_ztrrfs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* nrhs, const lapack_complex_double* a,
                    lapack_int* lda, const lapack_complex_double* b,
                    lapack_int* ldb, const lapack_complex_double* x,
                    lapack_int* ldx, double* ferr, double* berr,
                    lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_stprfs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* nrhs, const float* ap, const float* b,
                    lapack_int* ldb, const float* x, lapack_int* ldx,
                    float* ferr, float* berr, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dtprfs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* nrhs, const double* ap, const double* b,
                    lapack_int* ldb, const double* x, lapack_int* ldx,
                    double* ferr, double* berr, double* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_ctprfs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* nrhs, const lapack_complex_float* ap,
                    const lapack_complex_float* b, lapack_int* ldb,
                    const lapack_complex_float* x, lapack_int* ldx, float* ferr,
                    float* berr, lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_ztprfs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* nrhs, const lapack_complex_double* ap,
                    const lapack_complex_double* b, lapack_int* ldb,
                    const lapack_complex_double* x, lapack_int* ldx,
                    double* ferr, double* berr, lapack_complex_double* work,
                    double* rwork, lapack_int *info );
void LAPACK_stbrfs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* kd, lapack_int* nrhs, const float* ab,
                    lapack_int* ldab, const float* b, lapack_int* ldb,
                    const float* x, lapack_int* ldx, float* ferr, float* berr,
                    float* work, lapack_int* iwork, lapack_int *info );
void LAPACK_dtbrfs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* kd, lapack_int* nrhs, const double* ab,
                    lapack_int* ldab, const double* b, lapack_int* ldb,
                    const double* x, lapack_int* ldx, double* ferr,
                    double* berr, double* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_ctbrfs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* kd, lapack_int* nrhs,
                    const lapack_complex_float* ab, lapack_int* ldab,
                    const lapack_complex_float* b, lapack_int* ldb,
                    const lapack_complex_float* x, lapack_int* ldx, float* ferr,
                    float* berr, lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_ztbrfs( char* uplo, char* trans, char* diag, lapack_int* n,
                    lapack_int* kd, lapack_int* nrhs,
                    const lapack_complex_double* ab, lapack_int* ldab,
                    const lapack_complex_double* b, lapack_int* ldb,
                    const lapack_complex_double* x, lapack_int* ldx,
                    double* ferr, double* berr, lapack_complex_double* work,
                    double* rwork, lapack_int *info );
void LAPACK_sgetri( lapack_int* n, float* a, lapack_int* lda,
                    const lapack_int* ipiv, float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_dgetri( lapack_int* n, double* a, lapack_int* lda,
                    const lapack_int* ipiv, double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_cgetri( lapack_int* n, lapack_complex_float* a, lapack_int* lda,
                    const lapack_int* ipiv, lapack_complex_float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_zgetri( lapack_int* n, lapack_complex_double* a, lapack_int* lda,
                    const lapack_int* ipiv, lapack_complex_double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_spotri( char* uplo, lapack_int* n, float* a, lapack_int* lda,
                    lapack_int *info );
void LAPACK_dpotri( char* uplo, lapack_int* n, double* a, lapack_int* lda,
                    lapack_int *info );
void LAPACK_cpotri( char* uplo, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_int *info );
void LAPACK_zpotri( char* uplo, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_int *info );
void LAPACK_dpftri( char* transr, char* uplo, lapack_int* n, double* a,
                    lapack_int *info );
void LAPACK_spftri( char* transr, char* uplo, lapack_int* n, float* a,
                    lapack_int *info );
void LAPACK_zpftri( char* transr, char* uplo, lapack_int* n,
                    lapack_complex_double* a, lapack_int *info );
void LAPACK_cpftri( char* transr, char* uplo, lapack_int* n,
                    lapack_complex_float* a, lapack_int *info );
void LAPACK_spptri( char* uplo, lapack_int* n, float* ap, lapack_int *info );
void LAPACK_dpptri( char* uplo, lapack_int* n, double* ap, lapack_int *info );
void LAPACK_cpptri( char* uplo, lapack_int* n, lapack_complex_float* ap,
                    lapack_int *info );
void LAPACK_zpptri( char* uplo, lapack_int* n, lapack_complex_double* ap,
                    lapack_int *info );
void LAPACK_ssytri( char* uplo, lapack_int* n, float* a, lapack_int* lda,
                    const lapack_int* ipiv, float* work, lapack_int *info );
void LAPACK_dsytri( char* uplo, lapack_int* n, double* a, lapack_int* lda,
                    const lapack_int* ipiv, double* work, lapack_int *info );
void LAPACK_csytri( char* uplo, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, const lapack_int* ipiv,
                    lapack_complex_float* work, lapack_int *info );
void LAPACK_zsytri( char* uplo, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, const lapack_int* ipiv,
                    lapack_complex_double* work, lapack_int *info );
void LAPACK_chetri( char* uplo, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, const lapack_int* ipiv,
                    lapack_complex_float* work, lapack_int *info );
void LAPACK_zhetri( char* uplo, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, const lapack_int* ipiv,
                    lapack_complex_double* work, lapack_int *info );
void LAPACK_ssptri( char* uplo, lapack_int* n, float* ap,
                    const lapack_int* ipiv, float* work, lapack_int *info );
void LAPACK_dsptri( char* uplo, lapack_int* n, double* ap,
                    const lapack_int* ipiv, double* work, lapack_int *info );
void LAPACK_csptri( char* uplo, lapack_int* n, lapack_complex_float* ap,
                    const lapack_int* ipiv, lapack_complex_float* work,
                    lapack_int *info );
void LAPACK_zsptri( char* uplo, lapack_int* n, lapack_complex_double* ap,
                    const lapack_int* ipiv, lapack_complex_double* work,
                    lapack_int *info );
void LAPACK_chptri( char* uplo, lapack_int* n, lapack_complex_float* ap,
                    const lapack_int* ipiv, lapack_complex_float* work,
                    lapack_int *info );
void LAPACK_zhptri( char* uplo, lapack_int* n, lapack_complex_double* ap,
                    const lapack_int* ipiv, lapack_complex_double* work,
                    lapack_int *info );
void LAPACK_strtri( char* uplo, char* diag, lapack_int* n, float* a,
                    lapack_int* lda, lapack_int *info );
void LAPACK_dtrtri( char* uplo, char* diag, lapack_int* n, double* a,
                    lapack_int* lda, lapack_int *info );
void LAPACK_ctrtri( char* uplo, char* diag, lapack_int* n,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_int *info );
void LAPACK_ztrtri( char* uplo, char* diag, lapack_int* n,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_int *info );
void LAPACK_dtftri( char* transr, char* uplo, char* diag, lapack_int* n,
                    double* a, lapack_int *info );
void LAPACK_stftri( char* transr, char* uplo, char* diag, lapack_int* n,
                    float* a, lapack_int *info );
void LAPACK_ztftri( char* transr, char* uplo, char* diag, lapack_int* n,
                    lapack_complex_double* a, lapack_int *info );
void LAPACK_ctftri( char* transr, char* uplo, char* diag, lapack_int* n,
                    lapack_complex_float* a, lapack_int *info );
void LAPACK_stptri( char* uplo, char* diag, lapack_int* n, float* ap,
                    lapack_int *info );
void LAPACK_dtptri( char* uplo, char* diag, lapack_int* n, double* ap,
                    lapack_int *info );
void LAPACK_ctptri( char* uplo, char* diag, lapack_int* n,
                    lapack_complex_float* ap, lapack_int *info );
void LAPACK_ztptri( char* uplo, char* diag, lapack_int* n,
                    lapack_complex_double* ap, lapack_int *info );
void LAPACK_sgeequ( lapack_int* m, lapack_int* n, const float* a,
                    lapack_int* lda, float* r, float* c, float* rowcnd,
                    float* colcnd, float* amax, lapack_int *info );
void LAPACK_dgeequ( lapack_int* m, lapack_int* n, const double* a,
                    lapack_int* lda, double* r, double* c, double* rowcnd,
                    double* colcnd, double* amax, lapack_int *info );
void LAPACK_cgeequ( lapack_int* m, lapack_int* n, const lapack_complex_float* a,
                    lapack_int* lda, float* r, float* c, float* rowcnd,
                    float* colcnd, float* amax, lapack_int *info );
void LAPACK_zgeequ( lapack_int* m, lapack_int* n,
                    const lapack_complex_double* a, lapack_int* lda, double* r,
                    double* c, double* rowcnd, double* colcnd, double* amax,
                    lapack_int *info );
void LAPACK_dgeequb( lapack_int* m, lapack_int* n, const double* a,
                     lapack_int* lda, double* r, double* c, double* rowcnd,
                     double* colcnd, double* amax, lapack_int *info );
void LAPACK_sgeequb( lapack_int* m, lapack_int* n, const float* a,
                     lapack_int* lda, float* r, float* c, float* rowcnd,
                     float* colcnd, float* amax, lapack_int *info );
void LAPACK_zgeequb( lapack_int* m, lapack_int* n,
                     const lapack_complex_double* a, lapack_int* lda, double* r,
                     double* c, double* rowcnd, double* colcnd, double* amax,
                     lapack_int *info );
void LAPACK_cgeequb( lapack_int* m, lapack_int* n,
                     const lapack_complex_float* a, lapack_int* lda, float* r,
                     float* c, float* rowcnd, float* colcnd, float* amax,
                     lapack_int *info );
void LAPACK_sgbequ( lapack_int* m, lapack_int* n, lapack_int* kl,
                    lapack_int* ku, const float* ab, lapack_int* ldab, float* r,
                    float* c, float* rowcnd, float* colcnd, float* amax,
                    lapack_int *info );
void LAPACK_dgbequ( lapack_int* m, lapack_int* n, lapack_int* kl,
                    lapack_int* ku, const double* ab, lapack_int* ldab,
                    double* r, double* c, double* rowcnd, double* colcnd,
                    double* amax, lapack_int *info );
void LAPACK_cgbequ( lapack_int* m, lapack_int* n, lapack_int* kl,
                    lapack_int* ku, const lapack_complex_float* ab,
                    lapack_int* ldab, float* r, float* c, float* rowcnd,
                    float* colcnd, float* amax, lapack_int *info );
void LAPACK_zgbequ( lapack_int* m, lapack_int* n, lapack_int* kl,
                    lapack_int* ku, const lapack_complex_double* ab,
                    lapack_int* ldab, double* r, double* c, double* rowcnd,
                    double* colcnd, double* amax, lapack_int *info );
void LAPACK_dgbequb( lapack_int* m, lapack_int* n, lapack_int* kl,
                     lapack_int* ku, const double* ab, lapack_int* ldab,
                     double* r, double* c, double* rowcnd, double* colcnd,
                     double* amax, lapack_int *info );
void LAPACK_sgbequb( lapack_int* m, lapack_int* n, lapack_int* kl,
                     lapack_int* ku, const float* ab, lapack_int* ldab,
                     float* r, float* c, float* rowcnd, float* colcnd,
                     float* amax, lapack_int *info );
void LAPACK_zgbequb( lapack_int* m, lapack_int* n, lapack_int* kl,
                     lapack_int* ku, const lapack_complex_double* ab,
                     lapack_int* ldab, double* r, double* c, double* rowcnd,
                     double* colcnd, double* amax, lapack_int *info );
void LAPACK_cgbequb( lapack_int* m, lapack_int* n, lapack_int* kl,
                     lapack_int* ku, const lapack_complex_float* ab,
                     lapack_int* ldab, float* r, float* c, float* rowcnd,
                     float* colcnd, float* amax, lapack_int *info );
void LAPACK_spoequ( lapack_int* n, const float* a, lapack_int* lda, float* s,
                    float* scond, float* amax, lapack_int *info );
void LAPACK_dpoequ( lapack_int* n, const double* a, lapack_int* lda, double* s,
                    double* scond, double* amax, lapack_int *info );
void LAPACK_cpoequ( lapack_int* n, const lapack_complex_float* a,
                    lapack_int* lda, float* s, float* scond, float* amax,
                    lapack_int *info );
void LAPACK_zpoequ( lapack_int* n, const lapack_complex_double* a,
                    lapack_int* lda, double* s, double* scond, double* amax,
                    lapack_int *info );
void LAPACK_dpoequb( lapack_int* n, const double* a, lapack_int* lda, double* s,
                     double* scond, double* amax, lapack_int *info );
void LAPACK_spoequb( lapack_int* n, const float* a, lapack_int* lda, float* s,
                     float* scond, float* amax, lapack_int *info );
void LAPACK_zpoequb( lapack_int* n, const lapack_complex_double* a,
                     lapack_int* lda, double* s, double* scond, double* amax,
                     lapack_int *info );
void LAPACK_cpoequb( lapack_int* n, const lapack_complex_float* a,
                     lapack_int* lda, float* s, float* scond, float* amax,
                     lapack_int *info );
void LAPACK_sppequ( char* uplo, lapack_int* n, const float* ap, float* s,
                    float* scond, float* amax, lapack_int *info );
void LAPACK_dppequ( char* uplo, lapack_int* n, const double* ap, double* s,
                    double* scond, double* amax, lapack_int *info );
void LAPACK_cppequ( char* uplo, lapack_int* n, const lapack_complex_float* ap,
                    float* s, float* scond, float* amax, lapack_int *info );
void LAPACK_zppequ( char* uplo, lapack_int* n, const lapack_complex_double* ap,
                    double* s, double* scond, double* amax, lapack_int *info );
void LAPACK_spbequ( char* uplo, lapack_int* n, lapack_int* kd, const float* ab,
                    lapack_int* ldab, float* s, float* scond, float* amax,
                    lapack_int *info );
void LAPACK_dpbequ( char* uplo, lapack_int* n, lapack_int* kd, const double* ab,
                    lapack_int* ldab, double* s, double* scond, double* amax,
                    lapack_int *info );
void LAPACK_cpbequ( char* uplo, lapack_int* n, lapack_int* kd,
                    const lapack_complex_float* ab, lapack_int* ldab, float* s,
                    float* scond, float* amax, lapack_int *info );
void LAPACK_zpbequ( char* uplo, lapack_int* n, lapack_int* kd,
                    const lapack_complex_double* ab, lapack_int* ldab,
                    double* s, double* scond, double* amax, lapack_int *info );
void LAPACK_dsyequb( char* uplo, lapack_int* n, const double* a,
                     lapack_int* lda, double* s, double* scond, double* amax,
                     double* work, lapack_int *info );
void LAPACK_ssyequb( char* uplo, lapack_int* n, const float* a, lapack_int* lda,
                     float* s, float* scond, float* amax, float* work,
                     lapack_int *info );
void LAPACK_zsyequb( char* uplo, lapack_int* n, const lapack_complex_double* a,
                     lapack_int* lda, double* s, double* scond, double* amax,
                     lapack_complex_double* work, lapack_int *info );
void LAPACK_csyequb( char* uplo, lapack_int* n, const lapack_complex_float* a,
                     lapack_int* lda, float* s, float* scond, float* amax,
                     lapack_complex_float* work, lapack_int *info );
void LAPACK_zheequb( char* uplo, lapack_int* n, const lapack_complex_double* a,
                     lapack_int* lda, double* s, double* scond, double* amax,
                     lapack_complex_double* work, lapack_int *info );
void LAPACK_cheequb( char* uplo, lapack_int* n, const lapack_complex_float* a,
                     lapack_int* lda, float* s, float* scond, float* amax,
                     lapack_complex_float* work, lapack_int *info );
void LAPACK_sgesv( lapack_int* n, lapack_int* nrhs, float* a, lapack_int* lda,
                   lapack_int* ipiv, float* b, lapack_int* ldb,
                   lapack_int *info );
void LAPACK_dgesv( lapack_int* n, lapack_int* nrhs, double* a, lapack_int* lda,
                   lapack_int* ipiv, double* b, lapack_int* ldb,
                   lapack_int *info );
void LAPACK_cgesv( lapack_int* n, lapack_int* nrhs, lapack_complex_float* a,
                   lapack_int* lda, lapack_int* ipiv, lapack_complex_float* b,
                   lapack_int* ldb, lapack_int *info );
void LAPACK_zgesv( lapack_int* n, lapack_int* nrhs, lapack_complex_double* a,
                   lapack_int* lda, lapack_int* ipiv, lapack_complex_double* b,
                   lapack_int* ldb, lapack_int *info );
void LAPACK_dsgesv( lapack_int* n, lapack_int* nrhs, double* a, lapack_int* lda,
                    lapack_int* ipiv, double* b, lapack_int* ldb, double* x,
                    lapack_int* ldx, double* work, float* swork,
                    lapack_int* iter, lapack_int *info );
void LAPACK_zcgesv( lapack_int* n, lapack_int* nrhs, lapack_complex_double* a,
                    lapack_int* lda, lapack_int* ipiv, lapack_complex_double* b,
                    lapack_int* ldb, lapack_complex_double* x, lapack_int* ldx,
                    lapack_complex_double* work, lapack_complex_float* swork,
                    double* rwork, lapack_int* iter, lapack_int *info );
void LAPACK_sgesvx( char* fact, char* trans, lapack_int* n, lapack_int* nrhs,
                    float* a, lapack_int* lda, float* af, lapack_int* ldaf,
                    lapack_int* ipiv, char* equed, float* r, float* c, float* b,
                    lapack_int* ldb, float* x, lapack_int* ldx, float* rcond,
                    float* ferr, float* berr, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dgesvx( char* fact, char* trans, lapack_int* n, lapack_int* nrhs,
                    double* a, lapack_int* lda, double* af, lapack_int* ldaf,
                    lapack_int* ipiv, char* equed, double* r, double* c,
                    double* b, lapack_int* ldb, double* x, lapack_int* ldx,
                    double* rcond, double* ferr, double* berr, double* work,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_cgesvx( char* fact, char* trans, lapack_int* n, lapack_int* nrhs,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* af, lapack_int* ldaf,
                    lapack_int* ipiv, char* equed, float* r, float* c,
                    lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* x, lapack_int* ldx, float* rcond,
                    float* ferr, float* berr, lapack_complex_float* work,
                    float* rwork, lapack_int *info );
void LAPACK_zgesvx( char* fact, char* trans, lapack_int* n, lapack_int* nrhs,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* af, lapack_int* ldaf,
                    lapack_int* ipiv, char* equed, double* r, double* c,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* x, lapack_int* ldx, double* rcond,
                    double* ferr, double* berr, lapack_complex_double* work,
                    double* rwork, lapack_int *info );
void LAPACK_dgesvxx( char* fact, char* trans, lapack_int* n, lapack_int* nrhs,
                     double* a, lapack_int* lda, double* af, lapack_int* ldaf,
                     lapack_int* ipiv, char* equed, double* r, double* c,
                     double* b, lapack_int* ldb, double* x, lapack_int* ldx,
                     double* rcond, double* rpvgrw, double* berr,
                     lapack_int* n_err_bnds, double* err_bnds_norm,
                     double* err_bnds_comp, lapack_int* nparams, double* params,
                     double* work, lapack_int* iwork, lapack_int *info );
void LAPACK_sgesvxx( char* fact, char* trans, lapack_int* n, lapack_int* nrhs,
                     float* a, lapack_int* lda, float* af, lapack_int* ldaf,
                     lapack_int* ipiv, char* equed, float* r, float* c,
                     float* b, lapack_int* ldb, float* x, lapack_int* ldx,
                     float* rcond, float* rpvgrw, float* berr,
                     lapack_int* n_err_bnds, float* err_bnds_norm,
                     float* err_bnds_comp, lapack_int* nparams, float* params,
                     float* work, lapack_int* iwork, lapack_int *info );
void LAPACK_zgesvxx( char* fact, char* trans, lapack_int* n, lapack_int* nrhs,
                     lapack_complex_double* a, lapack_int* lda,
                     lapack_complex_double* af, lapack_int* ldaf,
                     lapack_int* ipiv, char* equed, double* r, double* c,
                     lapack_complex_double* b, lapack_int* ldb,
                     lapack_complex_double* x, lapack_int* ldx, double* rcond,
                     double* rpvgrw, double* berr, lapack_int* n_err_bnds,
                     double* err_bnds_norm, double* err_bnds_comp,
                     lapack_int* nparams, double* params,
                     lapack_complex_double* work, double* rwork,
                     lapack_int *info );
void LAPACK_cgesvxx( char* fact, char* trans, lapack_int* n, lapack_int* nrhs,
                     lapack_complex_float* a, lapack_int* lda,
                     lapack_complex_float* af, lapack_int* ldaf,
                     lapack_int* ipiv, char* equed, float* r, float* c,
                     lapack_complex_float* b, lapack_int* ldb,
                     lapack_complex_float* x, lapack_int* ldx, float* rcond,
                     float* rpvgrw, float* berr, lapack_int* n_err_bnds,
                     float* err_bnds_norm, float* err_bnds_comp,
                     lapack_int* nparams, float* params,
                     lapack_complex_float* work, float* rwork,
                     lapack_int *info );
void LAPACK_sgbsv( lapack_int* n, lapack_int* kl, lapack_int* ku,
                   lapack_int* nrhs, float* ab, lapack_int* ldab,
                   lapack_int* ipiv, float* b, lapack_int* ldb,
                   lapack_int *info );
void LAPACK_dgbsv( lapack_int* n, lapack_int* kl, lapack_int* ku,
                   lapack_int* nrhs, double* ab, lapack_int* ldab,
                   lapack_int* ipiv, double* b, lapack_int* ldb,
                   lapack_int *info );
void LAPACK_cgbsv( lapack_int* n, lapack_int* kl, lapack_int* ku,
                   lapack_int* nrhs, lapack_complex_float* ab, lapack_int* ldab,
                   lapack_int* ipiv, lapack_complex_float* b, lapack_int* ldb,
                   lapack_int *info );
void LAPACK_zgbsv( lapack_int* n, lapack_int* kl, lapack_int* ku,
                   lapack_int* nrhs, lapack_complex_double* ab,
                   lapack_int* ldab, lapack_int* ipiv, lapack_complex_double* b,
                   lapack_int* ldb, lapack_int *info );
void LAPACK_sgbsvx( char* fact, char* trans, lapack_int* n, lapack_int* kl,
                    lapack_int* ku, lapack_int* nrhs, float* ab,
                    lapack_int* ldab, float* afb, lapack_int* ldafb,
                    lapack_int* ipiv, char* equed, float* r, float* c, float* b,
                    lapack_int* ldb, float* x, lapack_int* ldx, float* rcond,
                    float* ferr, float* berr, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dgbsvx( char* fact, char* trans, lapack_int* n, lapack_int* kl,
                    lapack_int* ku, lapack_int* nrhs, double* ab,
                    lapack_int* ldab, double* afb, lapack_int* ldafb,
                    lapack_int* ipiv, char* equed, double* r, double* c,
                    double* b, lapack_int* ldb, double* x, lapack_int* ldx,
                    double* rcond, double* ferr, double* berr, double* work,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_cgbsvx( char* fact, char* trans, lapack_int* n, lapack_int* kl,
                    lapack_int* ku, lapack_int* nrhs, lapack_complex_float* ab,
                    lapack_int* ldab, lapack_complex_float* afb,
                    lapack_int* ldafb, lapack_int* ipiv, char* equed, float* r,
                    float* c, lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* x, lapack_int* ldx, float* rcond,
                    float* ferr, float* berr, lapack_complex_float* work,
                    float* rwork, lapack_int *info );
void LAPACK_zgbsvx( char* fact, char* trans, lapack_int* n, lapack_int* kl,
                    lapack_int* ku, lapack_int* nrhs, lapack_complex_double* ab,
                    lapack_int* ldab, lapack_complex_double* afb,
                    lapack_int* ldafb, lapack_int* ipiv, char* equed, double* r,
                    double* c, lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* x, lapack_int* ldx, double* rcond,
                    double* ferr, double* berr, lapack_complex_double* work,
                    double* rwork, lapack_int *info );
void LAPACK_dgbsvxx( char* fact, char* trans, lapack_int* n, lapack_int* kl,
                     lapack_int* ku, lapack_int* nrhs, double* ab,
                     lapack_int* ldab, double* afb, lapack_int* ldafb,
                     lapack_int* ipiv, char* equed, double* r, double* c,
                     double* b, lapack_int* ldb, double* x, lapack_int* ldx,
                     double* rcond, double* rpvgrw, double* berr,
                     lapack_int* n_err_bnds, double* err_bnds_norm,
                     double* err_bnds_comp, lapack_int* nparams, double* params,
                     double* work, lapack_int* iwork, lapack_int *info );
void LAPACK_sgbsvxx( char* fact, char* trans, lapack_int* n, lapack_int* kl,
                     lapack_int* ku, lapack_int* nrhs, float* ab,
                     lapack_int* ldab, float* afb, lapack_int* ldafb,
                     lapack_int* ipiv, char* equed, float* r, float* c,
                     float* b, lapack_int* ldb, float* x, lapack_int* ldx,
                     float* rcond, float* rpvgrw, float* berr,
                     lapack_int* n_err_bnds, float* err_bnds_norm,
                     float* err_bnds_comp, lapack_int* nparams, float* params,
                     float* work, lapack_int* iwork, lapack_int *info );
void LAPACK_zgbsvxx( char* fact, char* trans, lapack_int* n, lapack_int* kl,
                     lapack_int* ku, lapack_int* nrhs,
                     lapack_complex_double* ab, lapack_int* ldab,
                     lapack_complex_double* afb, lapack_int* ldafb,
                     lapack_int* ipiv, char* equed, double* r, double* c,
                     lapack_complex_double* b, lapack_int* ldb,
                     lapack_complex_double* x, lapack_int* ldx, double* rcond,
                     double* rpvgrw, double* berr, lapack_int* n_err_bnds,
                     double* err_bnds_norm, double* err_bnds_comp,
                     lapack_int* nparams, double* params,
                     lapack_complex_double* work, double* rwork,
                     lapack_int *info );
void LAPACK_cgbsvxx( char* fact, char* trans, lapack_int* n, lapack_int* kl,
                     lapack_int* ku, lapack_int* nrhs, lapack_complex_float* ab,
                     lapack_int* ldab, lapack_complex_float* afb,
                     lapack_int* ldafb, lapack_int* ipiv, char* equed, float* r,
                     float* c, lapack_complex_float* b, lapack_int* ldb,
                     lapack_complex_float* x, lapack_int* ldx, float* rcond,
                     float* rpvgrw, float* berr, lapack_int* n_err_bnds,
                     float* err_bnds_norm, float* err_bnds_comp,
                     lapack_int* nparams, float* params,
                     lapack_complex_float* work, float* rwork,
                     lapack_int *info );
void LAPACK_sgtsv( lapack_int* n, lapack_int* nrhs, float* dl, float* d,
                   float* du, float* b, lapack_int* ldb, lapack_int *info );
void LAPACK_dgtsv( lapack_int* n, lapack_int* nrhs, double* dl, double* d,
                   double* du, double* b, lapack_int* ldb, lapack_int *info );
void LAPACK_cgtsv( lapack_int* n, lapack_int* nrhs, lapack_complex_float* dl,
                   lapack_complex_float* d, lapack_complex_float* du,
                   lapack_complex_float* b, lapack_int* ldb, lapack_int *info );
void LAPACK_zgtsv( lapack_int* n, lapack_int* nrhs, lapack_complex_double* dl,
                   lapack_complex_double* d, lapack_complex_double* du,
                   lapack_complex_double* b, lapack_int* ldb,
                   lapack_int *info );
void LAPACK_sgtsvx( char* fact, char* trans, lapack_int* n, lapack_int* nrhs,
                    const float* dl, const float* d, const float* du,
                    float* dlf, float* df, float* duf, float* du2,
                    lapack_int* ipiv, const float* b, lapack_int* ldb, float* x,
                    lapack_int* ldx, float* rcond, float* ferr, float* berr,
                    float* work, lapack_int* iwork, lapack_int *info );
void LAPACK_dgtsvx( char* fact, char* trans, lapack_int* n, lapack_int* nrhs,
                    const double* dl, const double* d, const double* du,
                    double* dlf, double* df, double* duf, double* du2,
                    lapack_int* ipiv, const double* b, lapack_int* ldb,
                    double* x, lapack_int* ldx, double* rcond, double* ferr,
                    double* berr, double* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_cgtsvx( char* fact, char* trans, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* dl,
                    const lapack_complex_float* d,
                    const lapack_complex_float* du, lapack_complex_float* dlf,
                    lapack_complex_float* df, lapack_complex_float* duf,
                    lapack_complex_float* du2, lapack_int* ipiv,
                    const lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* x, lapack_int* ldx, float* rcond,
                    float* ferr, float* berr, lapack_complex_float* work,
                    float* rwork, lapack_int *info );
void LAPACK_zgtsvx( char* fact, char* trans, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* dl,
                    const lapack_complex_double* d,
                    const lapack_complex_double* du, lapack_complex_double* dlf,
                    lapack_complex_double* df, lapack_complex_double* duf,
                    lapack_complex_double* du2, lapack_int* ipiv,
                    const lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* x, lapack_int* ldx, double* rcond,
                    double* ferr, double* berr, lapack_complex_double* work,
                    double* rwork, lapack_int *info );
void LAPACK_sposv( char* uplo, lapack_int* n, lapack_int* nrhs, float* a,
                   lapack_int* lda, float* b, lapack_int* ldb,
                   lapack_int *info );
void LAPACK_dposv( char* uplo, lapack_int* n, lapack_int* nrhs, double* a,
                   lapack_int* lda, double* b, lapack_int* ldb,
                   lapack_int *info );
void LAPACK_cposv( char* uplo, lapack_int* n, lapack_int* nrhs,
                   lapack_complex_float* a, lapack_int* lda,
                   lapack_complex_float* b, lapack_int* ldb, lapack_int *info );
void LAPACK_zposv( char* uplo, lapack_int* n, lapack_int* nrhs,
                   lapack_complex_double* a, lapack_int* lda,
                   lapack_complex_double* b, lapack_int* ldb,
                   lapack_int *info );
void LAPACK_dsposv( char* uplo, lapack_int* n, lapack_int* nrhs, double* a,
                    lapack_int* lda, double* b, lapack_int* ldb, double* x,
                    lapack_int* ldx, double* work, float* swork,
                    lapack_int* iter, lapack_int *info );
void LAPACK_zcposv( char* uplo, lapack_int* n, lapack_int* nrhs,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* x, lapack_int* ldx,
                    lapack_complex_double* work, lapack_complex_float* swork,
                    double* rwork, lapack_int* iter, lapack_int *info );
void LAPACK_sposvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    float* a, lapack_int* lda, float* af, lapack_int* ldaf,
                    char* equed, float* s, float* b, lapack_int* ldb, float* x,
                    lapack_int* ldx, float* rcond, float* ferr, float* berr,
                    float* work, lapack_int* iwork, lapack_int *info );
void LAPACK_dposvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    double* a, lapack_int* lda, double* af, lapack_int* ldaf,
                    char* equed, double* s, double* b, lapack_int* ldb,
                    double* x, lapack_int* ldx, double* rcond, double* ferr,
                    double* berr, double* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_cposvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* af, lapack_int* ldaf, char* equed,
                    float* s, lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* x, lapack_int* ldx, float* rcond,
                    float* ferr, float* berr, lapack_complex_float* work,
                    float* rwork, lapack_int *info );
void LAPACK_zposvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* af, lapack_int* ldaf, char* equed,
                    double* s, lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* x, lapack_int* ldx, double* rcond,
                    double* ferr, double* berr, lapack_complex_double* work,
                    double* rwork, lapack_int *info );
void LAPACK_dposvxx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                     double* a, lapack_int* lda, double* af, lapack_int* ldaf,
                     char* equed, double* s, double* b, lapack_int* ldb,
                     double* x, lapack_int* ldx, double* rcond, double* rpvgrw,
                     double* berr, lapack_int* n_err_bnds,
                     double* err_bnds_norm, double* err_bnds_comp,
                     lapack_int* nparams, double* params, double* work,
                     lapack_int* iwork, lapack_int *info );
void LAPACK_sposvxx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                     float* a, lapack_int* lda, float* af, lapack_int* ldaf,
                     char* equed, float* s, float* b, lapack_int* ldb, float* x,
                     lapack_int* ldx, float* rcond, float* rpvgrw, float* berr,
                     lapack_int* n_err_bnds, float* err_bnds_norm,
                     float* err_bnds_comp, lapack_int* nparams, float* params,
                     float* work, lapack_int* iwork, lapack_int *info );
void LAPACK_zposvxx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                     lapack_complex_double* a, lapack_int* lda,
                     lapack_complex_double* af, lapack_int* ldaf, char* equed,
                     double* s, lapack_complex_double* b, lapack_int* ldb,
                     lapack_complex_double* x, lapack_int* ldx, double* rcond,
                     double* rpvgrw, double* berr, lapack_int* n_err_bnds,
                     double* err_bnds_norm, double* err_bnds_comp,
                     lapack_int* nparams, double* params,
                     lapack_complex_double* work, double* rwork,
                     lapack_int *info );
void LAPACK_cposvxx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                     lapack_complex_float* a, lapack_int* lda,
                     lapack_complex_float* af, lapack_int* ldaf, char* equed,
                     float* s, lapack_complex_float* b, lapack_int* ldb,
                     lapack_complex_float* x, lapack_int* ldx, float* rcond,
                     float* rpvgrw, float* berr, lapack_int* n_err_bnds,
                     float* err_bnds_norm, float* err_bnds_comp,
                     lapack_int* nparams, float* params,
                     lapack_complex_float* work, float* rwork,
                     lapack_int *info );
void LAPACK_sppsv( char* uplo, lapack_int* n, lapack_int* nrhs, float* ap,
                   float* b, lapack_int* ldb, lapack_int *info );
void LAPACK_dppsv( char* uplo, lapack_int* n, lapack_int* nrhs, double* ap,
                   double* b, lapack_int* ldb, lapack_int *info );
void LAPACK_cppsv( char* uplo, lapack_int* n, lapack_int* nrhs,
                   lapack_complex_float* ap, lapack_complex_float* b,
                   lapack_int* ldb, lapack_int *info );
void LAPACK_zppsv( char* uplo, lapack_int* n, lapack_int* nrhs,
                   lapack_complex_double* ap, lapack_complex_double* b,
                   lapack_int* ldb, lapack_int *info );
void LAPACK_sppsvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    float* ap, float* afp, char* equed, float* s, float* b,
                    lapack_int* ldb, float* x, lapack_int* ldx, float* rcond,
                    float* ferr, float* berr, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dppsvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    double* ap, double* afp, char* equed, double* s, double* b,
                    lapack_int* ldb, double* x, lapack_int* ldx, double* rcond,
                    double* ferr, double* berr, double* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_cppsvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    lapack_complex_float* ap, lapack_complex_float* afp,
                    char* equed, float* s, lapack_complex_float* b,
                    lapack_int* ldb, lapack_complex_float* x, lapack_int* ldx,
                    float* rcond, float* ferr, float* berr,
                    lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_zppsvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    lapack_complex_double* ap, lapack_complex_double* afp,
                    char* equed, double* s, lapack_complex_double* b,
                    lapack_int* ldb, lapack_complex_double* x, lapack_int* ldx,
                    double* rcond, double* ferr, double* berr,
                    lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_spbsv( char* uplo, lapack_int* n, lapack_int* kd, lapack_int* nrhs,
                   float* ab, lapack_int* ldab, float* b, lapack_int* ldb,
                   lapack_int *info );
void LAPACK_dpbsv( char* uplo, lapack_int* n, lapack_int* kd, lapack_int* nrhs,
                   double* ab, lapack_int* ldab, double* b, lapack_int* ldb,
                   lapack_int *info );
void LAPACK_cpbsv( char* uplo, lapack_int* n, lapack_int* kd, lapack_int* nrhs,
                   lapack_complex_float* ab, lapack_int* ldab,
                   lapack_complex_float* b, lapack_int* ldb, lapack_int *info );
void LAPACK_zpbsv( char* uplo, lapack_int* n, lapack_int* kd, lapack_int* nrhs,
                   lapack_complex_double* ab, lapack_int* ldab,
                   lapack_complex_double* b, lapack_int* ldb,
                   lapack_int *info );
void LAPACK_spbsvx( char* fact, char* uplo, lapack_int* n, lapack_int* kd,
                    lapack_int* nrhs, float* ab, lapack_int* ldab, float* afb,
                    lapack_int* ldafb, char* equed, float* s, float* b,
                    lapack_int* ldb, float* x, lapack_int* ldx, float* rcond,
                    float* ferr, float* berr, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dpbsvx( char* fact, char* uplo, lapack_int* n, lapack_int* kd,
                    lapack_int* nrhs, double* ab, lapack_int* ldab, double* afb,
                    lapack_int* ldafb, char* equed, double* s, double* b,
                    lapack_int* ldb, double* x, lapack_int* ldx, double* rcond,
                    double* ferr, double* berr, double* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_cpbsvx( char* fact, char* uplo, lapack_int* n, lapack_int* kd,
                    lapack_int* nrhs, lapack_complex_float* ab,
                    lapack_int* ldab, lapack_complex_float* afb,
                    lapack_int* ldafb, char* equed, float* s,
                    lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* x, lapack_int* ldx, float* rcond,
                    float* ferr, float* berr, lapack_complex_float* work,
                    float* rwork, lapack_int *info );
void LAPACK_zpbsvx( char* fact, char* uplo, lapack_int* n, lapack_int* kd,
                    lapack_int* nrhs, lapack_complex_double* ab,
                    lapack_int* ldab, lapack_complex_double* afb,
                    lapack_int* ldafb, char* equed, double* s,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* x, lapack_int* ldx, double* rcond,
                    double* ferr, double* berr, lapack_complex_double* work,
                    double* rwork, lapack_int *info );
void LAPACK_sptsv( lapack_int* n, lapack_int* nrhs, float* d, float* e,
                   float* b, lapack_int* ldb, lapack_int *info );
void LAPACK_dptsv( lapack_int* n, lapack_int* nrhs, double* d, double* e,
                   double* b, lapack_int* ldb, lapack_int *info );
void LAPACK_cptsv( lapack_int* n, lapack_int* nrhs, float* d,
                   lapack_complex_float* e, lapack_complex_float* b,
                   lapack_int* ldb, lapack_int *info );
void LAPACK_zptsv( lapack_int* n, lapack_int* nrhs, double* d,
                   lapack_complex_double* e, lapack_complex_double* b,
                   lapack_int* ldb, lapack_int *info );
void LAPACK_sptsvx( char* fact, lapack_int* n, lapack_int* nrhs, const float* d,
                    const float* e, float* df, float* ef, const float* b,
                    lapack_int* ldb, float* x, lapack_int* ldx, float* rcond,
                    float* ferr, float* berr, float* work, lapack_int *info );
void LAPACK_dptsvx( char* fact, lapack_int* n, lapack_int* nrhs,
                    const double* d, const double* e, double* df, double* ef,
                    const double* b, lapack_int* ldb, double* x,
                    lapack_int* ldx, double* rcond, double* ferr, double* berr,
                    double* work, lapack_int *info );
void LAPACK_cptsvx( char* fact, lapack_int* n, lapack_int* nrhs, const float* d,
                    const lapack_complex_float* e, float* df,
                    lapack_complex_float* ef, const lapack_complex_float* b,
                    lapack_int* ldb, lapack_complex_float* x, lapack_int* ldx,
                    float* rcond, float* ferr, float* berr,
                    lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_zptsvx( char* fact, lapack_int* n, lapack_int* nrhs,
                    const double* d, const lapack_complex_double* e, double* df,
                    lapack_complex_double* ef, const lapack_complex_double* b,
                    lapack_int* ldb, lapack_complex_double* x, lapack_int* ldx,
                    double* rcond, double* ferr, double* berr,
                    lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_ssysv( char* uplo, lapack_int* n, lapack_int* nrhs, float* a,
                   lapack_int* lda, lapack_int* ipiv, float* b, lapack_int* ldb,
                   float* work, lapack_int* lwork, lapack_int *info );
void LAPACK_dsysv( char* uplo, lapack_int* n, lapack_int* nrhs, double* a,
                   lapack_int* lda, lapack_int* ipiv, double* b,
                   lapack_int* ldb, double* work, lapack_int* lwork,
                   lapack_int *info );
void LAPACK_csysv( char* uplo, lapack_int* n, lapack_int* nrhs,
                   lapack_complex_float* a, lapack_int* lda, lapack_int* ipiv,
                   lapack_complex_float* b, lapack_int* ldb,
                   lapack_complex_float* work, lapack_int* lwork,
                   lapack_int *info );
void LAPACK_zsysv( char* uplo, lapack_int* n, lapack_int* nrhs,
                   lapack_complex_double* a, lapack_int* lda, lapack_int* ipiv,
                   lapack_complex_double* b, lapack_int* ldb,
                   lapack_complex_double* work, lapack_int* lwork,
                   lapack_int *info );
void LAPACK_ssysvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    const float* a, lapack_int* lda, float* af,
                    lapack_int* ldaf, lapack_int* ipiv, const float* b,
                    lapack_int* ldb, float* x, lapack_int* ldx, float* rcond,
                    float* ferr, float* berr, float* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_dsysvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    const double* a, lapack_int* lda, double* af,
                    lapack_int* ldaf, lapack_int* ipiv, const double* b,
                    lapack_int* ldb, double* x, lapack_int* ldx, double* rcond,
                    double* ferr, double* berr, double* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_csysvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* af, lapack_int* ldaf,
                    lapack_int* ipiv, const lapack_complex_float* b,
                    lapack_int* ldb, lapack_complex_float* x, lapack_int* ldx,
                    float* rcond, float* ferr, float* berr,
                    lapack_complex_float* work, lapack_int* lwork, float* rwork,
                    lapack_int *info );
void LAPACK_zsysvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* af, lapack_int* ldaf,
                    lapack_int* ipiv, const lapack_complex_double* b,
                    lapack_int* ldb, lapack_complex_double* x, lapack_int* ldx,
                    double* rcond, double* ferr, double* berr,
                    lapack_complex_double* work, lapack_int* lwork,
                    double* rwork, lapack_int *info );
void LAPACK_dsysvxx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                     double* a, lapack_int* lda, double* af, lapack_int* ldaf,
                     lapack_int* ipiv, char* equed, double* s, double* b,
                     lapack_int* ldb, double* x, lapack_int* ldx, double* rcond,
                     double* rpvgrw, double* berr, lapack_int* n_err_bnds,
                     double* err_bnds_norm, double* err_bnds_comp,
                     lapack_int* nparams, double* params, double* work,
                     lapack_int* iwork, lapack_int *info );
void LAPACK_ssysvxx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                     float* a, lapack_int* lda, float* af, lapack_int* ldaf,
                     lapack_int* ipiv, char* equed, float* s, float* b,
                     lapack_int* ldb, float* x, lapack_int* ldx, float* rcond,
                     float* rpvgrw, float* berr, lapack_int* n_err_bnds,
                     float* err_bnds_norm, float* err_bnds_comp,
                     lapack_int* nparams, float* params, float* work,
                     lapack_int* iwork, lapack_int *info );
void LAPACK_zsysvxx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                     lapack_complex_double* a, lapack_int* lda,
                     lapack_complex_double* af, lapack_int* ldaf,
                     lapack_int* ipiv, char* equed, double* s,
                     lapack_complex_double* b, lapack_int* ldb,
                     lapack_complex_double* x, lapack_int* ldx, double* rcond,
                     double* rpvgrw, double* berr, lapack_int* n_err_bnds,
                     double* err_bnds_norm, double* err_bnds_comp,
                     lapack_int* nparams, double* params,
                     lapack_complex_double* work, double* rwork,
                     lapack_int *info );
void LAPACK_csysvxx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                     lapack_complex_float* a, lapack_int* lda,
                     lapack_complex_float* af, lapack_int* ldaf,
                     lapack_int* ipiv, char* equed, float* s,
                     lapack_complex_float* b, lapack_int* ldb,
                     lapack_complex_float* x, lapack_int* ldx, float* rcond,
                     float* rpvgrw, float* berr, lapack_int* n_err_bnds,
                     float* err_bnds_norm, float* err_bnds_comp,
                     lapack_int* nparams, float* params,
                     lapack_complex_float* work, float* rwork,
                     lapack_int *info );
void LAPACK_chesv( char* uplo, lapack_int* n, lapack_int* nrhs,
                   lapack_complex_float* a, lapack_int* lda, lapack_int* ipiv,
                   lapack_complex_float* b, lapack_int* ldb,
                   lapack_complex_float* work, lapack_int* lwork,
                   lapack_int *info );
void LAPACK_zhesv( char* uplo, lapack_int* n, lapack_int* nrhs,
                   lapack_complex_double* a, lapack_int* lda, lapack_int* ipiv,
                   lapack_complex_double* b, lapack_int* ldb,
                   lapack_complex_double* work, lapack_int* lwork,
                   lapack_int *info );
void LAPACK_chesvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* af, lapack_int* ldaf,
                    lapack_int* ipiv, const lapack_complex_float* b,
                    lapack_int* ldb, lapack_complex_float* x, lapack_int* ldx,
                    float* rcond, float* ferr, float* berr,
                    lapack_complex_float* work, lapack_int* lwork, float* rwork,
                    lapack_int *info );
void LAPACK_zhesvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* af, lapack_int* ldaf,
                    lapack_int* ipiv, const lapack_complex_double* b,
                    lapack_int* ldb, lapack_complex_double* x, lapack_int* ldx,
                    double* rcond, double* ferr, double* berr,
                    lapack_complex_double* work, lapack_int* lwork,
                    double* rwork, lapack_int *info );
void LAPACK_zhesvxx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                     lapack_complex_double* a, lapack_int* lda,
                     lapack_complex_double* af, lapack_int* ldaf,
                     lapack_int* ipiv, char* equed, double* s,
                     lapack_complex_double* b, lapack_int* ldb,
                     lapack_complex_double* x, lapack_int* ldx, double* rcond,
                     double* rpvgrw, double* berr, lapack_int* n_err_bnds,
                     double* err_bnds_norm, double* err_bnds_comp,
                     lapack_int* nparams, double* params,
                     lapack_complex_double* work, double* rwork,
                     lapack_int *info );
void LAPACK_chesvxx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                     lapack_complex_float* a, lapack_int* lda,
                     lapack_complex_float* af, lapack_int* ldaf,
                     lapack_int* ipiv, char* equed, float* s,
                     lapack_complex_float* b, lapack_int* ldb,
                     lapack_complex_float* x, lapack_int* ldx, float* rcond,
                     float* rpvgrw, float* berr, lapack_int* n_err_bnds,
                     float* err_bnds_norm, float* err_bnds_comp,
                     lapack_int* nparams, float* params,
                     lapack_complex_float* work, float* rwork,
                     lapack_int *info );
void LAPACK_sspsv( char* uplo, lapack_int* n, lapack_int* nrhs, float* ap,
                   lapack_int* ipiv, float* b, lapack_int* ldb,
                   lapack_int *info );
void LAPACK_dspsv( char* uplo, lapack_int* n, lapack_int* nrhs, double* ap,
                   lapack_int* ipiv, double* b, lapack_int* ldb,
                   lapack_int *info );
void LAPACK_cspsv( char* uplo, lapack_int* n, lapack_int* nrhs,
                   lapack_complex_float* ap, lapack_int* ipiv,
                   lapack_complex_float* b, lapack_int* ldb, lapack_int *info );
void LAPACK_zspsv( char* uplo, lapack_int* n, lapack_int* nrhs,
                   lapack_complex_double* ap, lapack_int* ipiv,
                   lapack_complex_double* b, lapack_int* ldb,
                   lapack_int *info );
void LAPACK_sspsvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    const float* ap, float* afp, lapack_int* ipiv,
                    const float* b, lapack_int* ldb, float* x, lapack_int* ldx,
                    float* rcond, float* ferr, float* berr, float* work,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_dspsvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    const double* ap, double* afp, lapack_int* ipiv,
                    const double* b, lapack_int* ldb, double* x,
                    lapack_int* ldx, double* rcond, double* ferr, double* berr,
                    double* work, lapack_int* iwork, lapack_int *info );
void LAPACK_cspsvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* ap, lapack_complex_float* afp,
                    lapack_int* ipiv, const lapack_complex_float* b,
                    lapack_int* ldb, lapack_complex_float* x, lapack_int* ldx,
                    float* rcond, float* ferr, float* berr,
                    lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_zspsvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* ap, lapack_complex_double* afp,
                    lapack_int* ipiv, const lapack_complex_double* b,
                    lapack_int* ldb, lapack_complex_double* x, lapack_int* ldx,
                    double* rcond, double* ferr, double* berr,
                    lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_chpsv( char* uplo, lapack_int* n, lapack_int* nrhs,
                   lapack_complex_float* ap, lapack_int* ipiv,
                   lapack_complex_float* b, lapack_int* ldb, lapack_int *info );
void LAPACK_zhpsv( char* uplo, lapack_int* n, lapack_int* nrhs,
                   lapack_complex_double* ap, lapack_int* ipiv,
                   lapack_complex_double* b, lapack_int* ldb,
                   lapack_int *info );
void LAPACK_chpsvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_float* ap, lapack_complex_float* afp,
                    lapack_int* ipiv, const lapack_complex_float* b,
                    lapack_int* ldb, lapack_complex_float* x, lapack_int* ldx,
                    float* rcond, float* ferr, float* berr,
                    lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_zhpsvx( char* fact, char* uplo, lapack_int* n, lapack_int* nrhs,
                    const lapack_complex_double* ap, lapack_complex_double* afp,
                    lapack_int* ipiv, const lapack_complex_double* b,
                    lapack_int* ldb, lapack_complex_double* x, lapack_int* ldx,
                    double* rcond, double* ferr, double* berr,
                    lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_sgeqrf( lapack_int* m, lapack_int* n, float* a, lapack_int* lda,
                    float* tau, float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_dgeqrf( lapack_int* m, lapack_int* n, double* a, lapack_int* lda,
                    double* tau, double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_cgeqrf( lapack_int* m, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_complex_float* tau,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_zgeqrf( lapack_int* m, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_complex_double* tau,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_sgeqpf( lapack_int* m, lapack_int* n, float* a, lapack_int* lda,
                    lapack_int* jpvt, float* tau, float* work,
                    lapack_int *info );
void LAPACK_dgeqpf( lapack_int* m, lapack_int* n, double* a, lapack_int* lda,
                    lapack_int* jpvt, double* tau, double* work,
                    lapack_int *info );
void LAPACK_cgeqpf( lapack_int* m, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_int* jpvt,
                    lapack_complex_float* tau, lapack_complex_float* work,
                    float* rwork, lapack_int *info );
void LAPACK_zgeqpf( lapack_int* m, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_int* jpvt,
                    lapack_complex_double* tau, lapack_complex_double* work,
                    double* rwork, lapack_int *info );
void LAPACK_sgeqp3( lapack_int* m, lapack_int* n, float* a, lapack_int* lda,
                    lapack_int* jpvt, float* tau, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_dgeqp3( lapack_int* m, lapack_int* n, double* a, lapack_int* lda,
                    lapack_int* jpvt, double* tau, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_cgeqp3( lapack_int* m, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_int* jpvt,
                    lapack_complex_float* tau, lapack_complex_float* work,
                    lapack_int* lwork, float* rwork, lapack_int *info );
void LAPACK_zgeqp3( lapack_int* m, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_int* jpvt,
                    lapack_complex_double* tau, lapack_complex_double* work,
                    lapack_int* lwork, double* rwork, lapack_int *info );
void LAPACK_sorgqr( lapack_int* m, lapack_int* n, lapack_int* k, float* a,
                    lapack_int* lda, const float* tau, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_dorgqr( lapack_int* m, lapack_int* n, lapack_int* k, double* a,
                    lapack_int* lda, const double* tau, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_sormqr( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, const float* a, lapack_int* lda,
                    const float* tau, float* c, lapack_int* ldc, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_dormqr( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, const double* a, lapack_int* lda,
                    const double* tau, double* c, lapack_int* ldc, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_cungqr( lapack_int* m, lapack_int* n, lapack_int* k,
                    lapack_complex_float* a, lapack_int* lda,
                    const lapack_complex_float* tau, lapack_complex_float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_zungqr( lapack_int* m, lapack_int* n, lapack_int* k,
                    lapack_complex_double* a, lapack_int* lda,
                    const lapack_complex_double* tau,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_cunmqr( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, const lapack_complex_float* a,
                    lapack_int* lda, const lapack_complex_float* tau,
                    lapack_complex_float* c, lapack_int* ldc,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_zunmqr( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, const lapack_complex_double* a,
                    lapack_int* lda, const lapack_complex_double* tau,
                    lapack_complex_double* c, lapack_int* ldc,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_sgelqf( lapack_int* m, lapack_int* n, float* a, lapack_int* lda,
                    float* tau, float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_dgelqf( lapack_int* m, lapack_int* n, double* a, lapack_int* lda,
                    double* tau, double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_cgelqf( lapack_int* m, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_complex_float* tau,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_zgelqf( lapack_int* m, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_complex_double* tau,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_sorglq( lapack_int* m, lapack_int* n, lapack_int* k, float* a,
                    lapack_int* lda, const float* tau, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_dorglq( lapack_int* m, lapack_int* n, lapack_int* k, double* a,
                    lapack_int* lda, const double* tau, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_sormlq( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, const float* a, lapack_int* lda,
                    const float* tau, float* c, lapack_int* ldc, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_dormlq( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, const double* a, lapack_int* lda,
                    const double* tau, double* c, lapack_int* ldc, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_cunglq( lapack_int* m, lapack_int* n, lapack_int* k,
                    lapack_complex_float* a, lapack_int* lda,
                    const lapack_complex_float* tau, lapack_complex_float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_zunglq( lapack_int* m, lapack_int* n, lapack_int* k,
                    lapack_complex_double* a, lapack_int* lda,
                    const lapack_complex_double* tau,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_cunmlq( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, const lapack_complex_float* a,
                    lapack_int* lda, const lapack_complex_float* tau,
                    lapack_complex_float* c, lapack_int* ldc,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_zunmlq( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, const lapack_complex_double* a,
                    lapack_int* lda, const lapack_complex_double* tau,
                    lapack_complex_double* c, lapack_int* ldc,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_sgeqlf( lapack_int* m, lapack_int* n, float* a, lapack_int* lda,
                    float* tau, float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_dgeqlf( lapack_int* m, lapack_int* n, double* a, lapack_int* lda,
                    double* tau, double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_cgeqlf( lapack_int* m, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_complex_float* tau,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_zgeqlf( lapack_int* m, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_complex_double* tau,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_sorgql( lapack_int* m, lapack_int* n, lapack_int* k, float* a,
                    lapack_int* lda, const float* tau, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_dorgql( lapack_int* m, lapack_int* n, lapack_int* k, double* a,
                    lapack_int* lda, const double* tau, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_cungql( lapack_int* m, lapack_int* n, lapack_int* k,
                    lapack_complex_float* a, lapack_int* lda,
                    const lapack_complex_float* tau, lapack_complex_float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_zungql( lapack_int* m, lapack_int* n, lapack_int* k,
                    lapack_complex_double* a, lapack_int* lda,
                    const lapack_complex_double* tau,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_sormql( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, const float* a, lapack_int* lda,
                    const float* tau, float* c, lapack_int* ldc, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_dormql( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, const double* a, lapack_int* lda,
                    const double* tau, double* c, lapack_int* ldc, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_cunmql( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, const lapack_complex_float* a,
                    lapack_int* lda, const lapack_complex_float* tau,
                    lapack_complex_float* c, lapack_int* ldc,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_zunmql( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, const lapack_complex_double* a,
                    lapack_int* lda, const lapack_complex_double* tau,
                    lapack_complex_double* c, lapack_int* ldc,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_sgerqf( lapack_int* m, lapack_int* n, float* a, lapack_int* lda,
                    float* tau, float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_dgerqf( lapack_int* m, lapack_int* n, double* a, lapack_int* lda,
                    double* tau, double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_cgerqf( lapack_int* m, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_complex_float* tau,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_zgerqf( lapack_int* m, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_complex_double* tau,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_sorgrq( lapack_int* m, lapack_int* n, lapack_int* k, float* a,
                    lapack_int* lda, const float* tau, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_dorgrq( lapack_int* m, lapack_int* n, lapack_int* k, double* a,
                    lapack_int* lda, const double* tau, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_cungrq( lapack_int* m, lapack_int* n, lapack_int* k,
                    lapack_complex_float* a, lapack_int* lda,
                    const lapack_complex_float* tau, lapack_complex_float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_zungrq( lapack_int* m, lapack_int* n, lapack_int* k,
                    lapack_complex_double* a, lapack_int* lda,
                    const lapack_complex_double* tau,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_sormrq( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, const float* a, lapack_int* lda,
                    const float* tau, float* c, lapack_int* ldc, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_dormrq( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, const double* a, lapack_int* lda,
                    const double* tau, double* c, lapack_int* ldc, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_cunmrq( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, const lapack_complex_float* a,
                    lapack_int* lda, const lapack_complex_float* tau,
                    lapack_complex_float* c, lapack_int* ldc,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_zunmrq( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, const lapack_complex_double* a,
                    lapack_int* lda, const lapack_complex_double* tau,
                    lapack_complex_double* c, lapack_int* ldc,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_stzrzf( lapack_int* m, lapack_int* n, float* a, lapack_int* lda,
                    float* tau, float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_dtzrzf( lapack_int* m, lapack_int* n, double* a, lapack_int* lda,
                    double* tau, double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_ctzrzf( lapack_int* m, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_complex_float* tau,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_ztzrzf( lapack_int* m, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_complex_double* tau,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_sormrz( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, lapack_int* l, const float* a,
                    lapack_int* lda, const float* tau, float* c,
                    lapack_int* ldc, float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_dormrz( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, lapack_int* l, const double* a,
                    lapack_int* lda, const double* tau, double* c,
                    lapack_int* ldc, double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_cunmrz( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, lapack_int* l, const lapack_complex_float* a,
                    lapack_int* lda, const lapack_complex_float* tau,
                    lapack_complex_float* c, lapack_int* ldc,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_zunmrz( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* k, lapack_int* l,
                    const lapack_complex_double* a, lapack_int* lda,
                    const lapack_complex_double* tau, lapack_complex_double* c,
                    lapack_int* ldc, lapack_complex_double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_sggqrf( lapack_int* n, lapack_int* m, lapack_int* p, float* a,
                    lapack_int* lda, float* taua, float* b, lapack_int* ldb,
                    float* taub, float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_dggqrf( lapack_int* n, lapack_int* m, lapack_int* p, double* a,
                    lapack_int* lda, double* taua, double* b, lapack_int* ldb,
                    double* taub, double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_cggqrf( lapack_int* n, lapack_int* m, lapack_int* p,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* taua, lapack_complex_float* b,
                    lapack_int* ldb, lapack_complex_float* taub,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_zggqrf( lapack_int* n, lapack_int* m, lapack_int* p,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* taua, lapack_complex_double* b,
                    lapack_int* ldb, lapack_complex_double* taub,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_sggrqf( lapack_int* m, lapack_int* p, lapack_int* n, float* a,
                    lapack_int* lda, float* taua, float* b, lapack_int* ldb,
                    float* taub, float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_dggrqf( lapack_int* m, lapack_int* p, lapack_int* n, double* a,
                    lapack_int* lda, double* taua, double* b, lapack_int* ldb,
                    double* taub, double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_cggrqf( lapack_int* m, lapack_int* p, lapack_int* n,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* taua, lapack_complex_float* b,
                    lapack_int* ldb, lapack_complex_float* taub,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_zggrqf( lapack_int* m, lapack_int* p, lapack_int* n,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* taua, lapack_complex_double* b,
                    lapack_int* ldb, lapack_complex_double* taub,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_sgebrd( lapack_int* m, lapack_int* n, float* a, lapack_int* lda,
                    float* d, float* e, float* tauq, float* taup, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_dgebrd( lapack_int* m, lapack_int* n, double* a, lapack_int* lda,
                    double* d, double* e, double* tauq, double* taup,
                    double* work, lapack_int* lwork, lapack_int *info );
void LAPACK_cgebrd( lapack_int* m, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, float* d, float* e,
                    lapack_complex_float* tauq, lapack_complex_float* taup,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_zgebrd( lapack_int* m, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, double* d, double* e,
                    lapack_complex_double* tauq, lapack_complex_double* taup,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_sgbbrd( char* vect, lapack_int* m, lapack_int* n, lapack_int* ncc,
                    lapack_int* kl, lapack_int* ku, float* ab, lapack_int* ldab,
                    float* d, float* e, float* q, lapack_int* ldq, float* pt,
                    lapack_int* ldpt, float* c, lapack_int* ldc, float* work,
                    lapack_int *info );
void LAPACK_dgbbrd( char* vect, lapack_int* m, lapack_int* n, lapack_int* ncc,
                    lapack_int* kl, lapack_int* ku, double* ab,
                    lapack_int* ldab, double* d, double* e, double* q,
                    lapack_int* ldq, double* pt, lapack_int* ldpt, double* c,
                    lapack_int* ldc, double* work, lapack_int *info );
void LAPACK_cgbbrd( char* vect, lapack_int* m, lapack_int* n, lapack_int* ncc,
                    lapack_int* kl, lapack_int* ku, lapack_complex_float* ab,
                    lapack_int* ldab, float* d, float* e,
                    lapack_complex_float* q, lapack_int* ldq,
                    lapack_complex_float* pt, lapack_int* ldpt,
                    lapack_complex_float* c, lapack_int* ldc,
                    lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_zgbbrd( char* vect, lapack_int* m, lapack_int* n, lapack_int* ncc,
                    lapack_int* kl, lapack_int* ku, lapack_complex_double* ab,
                    lapack_int* ldab, double* d, double* e,
                    lapack_complex_double* q, lapack_int* ldq,
                    lapack_complex_double* pt, lapack_int* ldpt,
                    lapack_complex_double* c, lapack_int* ldc,
                    lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_sorgbr( char* vect, lapack_int* m, lapack_int* n, lapack_int* k,
                    float* a, lapack_int* lda, const float* tau, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_dorgbr( char* vect, lapack_int* m, lapack_int* n, lapack_int* k,
                    double* a, lapack_int* lda, const double* tau, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_sormbr( char* vect, char* side, char* trans, lapack_int* m,
                    lapack_int* n, lapack_int* k, const float* a,
                    lapack_int* lda, const float* tau, float* c,
                    lapack_int* ldc, float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_dormbr( char* vect, char* side, char* trans, lapack_int* m,
                    lapack_int* n, lapack_int* k, const double* a,
                    lapack_int* lda, const double* tau, double* c,
                    lapack_int* ldc, double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_cungbr( char* vect, lapack_int* m, lapack_int* n, lapack_int* k,
                    lapack_complex_float* a, lapack_int* lda,
                    const lapack_complex_float* tau, lapack_complex_float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_zungbr( char* vect, lapack_int* m, lapack_int* n, lapack_int* k,
                    lapack_complex_double* a, lapack_int* lda,
                    const lapack_complex_double* tau,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_cunmbr( char* vect, char* side, char* trans, lapack_int* m,
                    lapack_int* n, lapack_int* k, const lapack_complex_float* a,
                    lapack_int* lda, const lapack_complex_float* tau,
                    lapack_complex_float* c, lapack_int* ldc,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_zunmbr( char* vect, char* side, char* trans, lapack_int* m,
                    lapack_int* n, lapack_int* k,
                    const lapack_complex_double* a, lapack_int* lda,
                    const lapack_complex_double* tau, lapack_complex_double* c,
                    lapack_int* ldc, lapack_complex_double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_sbdsqr( char* uplo, lapack_int* n, lapack_int* ncvt,
                    lapack_int* nru, lapack_int* ncc, float* d, float* e,
                    float* vt, lapack_int* ldvt, float* u, lapack_int* ldu,
                    float* c, lapack_int* ldc, float* work, lapack_int *info );
void LAPACK_dbdsqr( char* uplo, lapack_int* n, lapack_int* ncvt,
                    lapack_int* nru, lapack_int* ncc, double* d, double* e,
                    double* vt, lapack_int* ldvt, double* u, lapack_int* ldu,
                    double* c, lapack_int* ldc, double* work,
                    lapack_int *info );
void LAPACK_cbdsqr( char* uplo, lapack_int* n, lapack_int* ncvt,
                    lapack_int* nru, lapack_int* ncc, float* d, float* e,
                    lapack_complex_float* vt, lapack_int* ldvt,
                    lapack_complex_float* u, lapack_int* ldu,
                    lapack_complex_float* c, lapack_int* ldc, float* work,
                    lapack_int *info );
void LAPACK_zbdsqr( char* uplo, lapack_int* n, lapack_int* ncvt,
                    lapack_int* nru, lapack_int* ncc, double* d, double* e,
                    lapack_complex_double* vt, lapack_int* ldvt,
                    lapack_complex_double* u, lapack_int* ldu,
                    lapack_complex_double* c, lapack_int* ldc, double* work,
                    lapack_int *info );
void LAPACK_sbdsdc( char* uplo, char* compq, lapack_int* n, float* d, float* e,
                    float* u, lapack_int* ldu, float* vt, lapack_int* ldvt,
                    float* q, lapack_int* iq, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dbdsdc( char* uplo, char* compq, lapack_int* n, double* d,
                    double* e, double* u, lapack_int* ldu, double* vt,
                    lapack_int* ldvt, double* q, lapack_int* iq, double* work,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_ssytrd( char* uplo, lapack_int* n, float* a, lapack_int* lda,
                    float* d, float* e, float* tau, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_dsytrd( char* uplo, lapack_int* n, double* a, lapack_int* lda,
                    double* d, double* e, double* tau, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_sorgtr( char* uplo, lapack_int* n, float* a, lapack_int* lda,
                    const float* tau, float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_dorgtr( char* uplo, lapack_int* n, double* a, lapack_int* lda,
                    const double* tau, double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_sormtr( char* side, char* uplo, char* trans, lapack_int* m,
                    lapack_int* n, const float* a, lapack_int* lda,
                    const float* tau, float* c, lapack_int* ldc, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_dormtr( char* side, char* uplo, char* trans, lapack_int* m,
                    lapack_int* n, const double* a, lapack_int* lda,
                    const double* tau, double* c, lapack_int* ldc, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_chetrd( char* uplo, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, float* d, float* e,
                    lapack_complex_float* tau, lapack_complex_float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_zhetrd( char* uplo, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, double* d, double* e,
                    lapack_complex_double* tau, lapack_complex_double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_cungtr( char* uplo, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, const lapack_complex_float* tau,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_zungtr( char* uplo, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, const lapack_complex_double* tau,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_cunmtr( char* side, char* uplo, char* trans, lapack_int* m,
                    lapack_int* n, const lapack_complex_float* a,
                    lapack_int* lda, const lapack_complex_float* tau,
                    lapack_complex_float* c, lapack_int* ldc,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_zunmtr( char* side, char* uplo, char* trans, lapack_int* m,
                    lapack_int* n, const lapack_complex_double* a,
                    lapack_int* lda, const lapack_complex_double* tau,
                    lapack_complex_double* c, lapack_int* ldc,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_ssptrd( char* uplo, lapack_int* n, float* ap, float* d, float* e,
                    float* tau, lapack_int *info );
void LAPACK_dsptrd( char* uplo, lapack_int* n, double* ap, double* d, double* e,
                    double* tau, lapack_int *info );
void LAPACK_sopgtr( char* uplo, lapack_int* n, const float* ap,
                    const float* tau, float* q, lapack_int* ldq, float* work,
                    lapack_int *info );
void LAPACK_dopgtr( char* uplo, lapack_int* n, const double* ap,
                    const double* tau, double* q, lapack_int* ldq, double* work,
                    lapack_int *info );
void LAPACK_sopmtr( char* side, char* uplo, char* trans, lapack_int* m,
                    lapack_int* n, const float* ap, const float* tau, float* c,
                    lapack_int* ldc, float* work, lapack_int *info );
void LAPACK_dopmtr( char* side, char* uplo, char* trans, lapack_int* m,
                    lapack_int* n, const double* ap, const double* tau,
                    double* c, lapack_int* ldc, double* work,
                    lapack_int *info );
void LAPACK_chptrd( char* uplo, lapack_int* n, lapack_complex_float* ap,
                    float* d, float* e, lapack_complex_float* tau,
                    lapack_int *info );
void LAPACK_zhptrd( char* uplo, lapack_int* n, lapack_complex_double* ap,
                    double* d, double* e, lapack_complex_double* tau,
                    lapack_int *info );
void LAPACK_cupgtr( char* uplo, lapack_int* n, const lapack_complex_float* ap,
                    const lapack_complex_float* tau, lapack_complex_float* q,
                    lapack_int* ldq, lapack_complex_float* work,
                    lapack_int *info );
void LAPACK_zupgtr( char* uplo, lapack_int* n, const lapack_complex_double* ap,
                    const lapack_complex_double* tau, lapack_complex_double* q,
                    lapack_int* ldq, lapack_complex_double* work,
                    lapack_int *info );
void LAPACK_cupmtr( char* side, char* uplo, char* trans, lapack_int* m,
                    lapack_int* n, const lapack_complex_float* ap,
                    const lapack_complex_float* tau, lapack_complex_float* c,
                    lapack_int* ldc, lapack_complex_float* work,
                    lapack_int *info );
void LAPACK_zupmtr( char* side, char* uplo, char* trans, lapack_int* m,
                    lapack_int* n, const lapack_complex_double* ap,
                    const lapack_complex_double* tau, lapack_complex_double* c,
                    lapack_int* ldc, lapack_complex_double* work,
                    lapack_int *info );
void LAPACK_ssbtrd( char* vect, char* uplo, lapack_int* n, lapack_int* kd,
                    float* ab, lapack_int* ldab, float* d, float* e, float* q,
                    lapack_int* ldq, float* work, lapack_int *info );
void LAPACK_dsbtrd( char* vect, char* uplo, lapack_int* n, lapack_int* kd,
                    double* ab, lapack_int* ldab, double* d, double* e,
                    double* q, lapack_int* ldq, double* work,
                    lapack_int *info );
void LAPACK_chbtrd( char* vect, char* uplo, lapack_int* n, lapack_int* kd,
                    lapack_complex_float* ab, lapack_int* ldab, float* d,
                    float* e, lapack_complex_float* q, lapack_int* ldq,
                    lapack_complex_float* work, lapack_int *info );
void LAPACK_zhbtrd( char* vect, char* uplo, lapack_int* n, lapack_int* kd,
                    lapack_complex_double* ab, lapack_int* ldab, double* d,
                    double* e, lapack_complex_double* q, lapack_int* ldq,
                    lapack_complex_double* work, lapack_int *info );
void LAPACK_ssterf( lapack_int* n, float* d, float* e, lapack_int *info );
void LAPACK_dsterf( lapack_int* n, double* d, double* e, lapack_int *info );
void LAPACK_ssteqr( char* compz, lapack_int* n, float* d, float* e, float* z,
                    lapack_int* ldz, float* work, lapack_int *info );
void LAPACK_dsteqr( char* compz, lapack_int* n, double* d, double* e, double* z,
                    lapack_int* ldz, double* work, lapack_int *info );
void LAPACK_csteqr( char* compz, lapack_int* n, float* d, float* e,
                    lapack_complex_float* z, lapack_int* ldz, float* work,
                    lapack_int *info );
void LAPACK_zsteqr( char* compz, lapack_int* n, double* d, double* e,
                    lapack_complex_double* z, lapack_int* ldz, double* work,
                    lapack_int *info );
void LAPACK_sstemr( char* jobz, char* range, lapack_int* n, float* d, float* e,
                    float* vl, float* vu, lapack_int* il, lapack_int* iu,
                    lapack_int* m, float* w, float* z, lapack_int* ldz,
                    lapack_int* nzc, lapack_int* isuppz, lapack_logical* tryrac,
                    float* work, lapack_int* lwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_int *info );
void LAPACK_dstemr( char* jobz, char* range, lapack_int* n, double* d,
                    double* e, double* vl, double* vu, lapack_int* il,
                    lapack_int* iu, lapack_int* m, double* w, double* z,
                    lapack_int* ldz, lapack_int* nzc, lapack_int* isuppz,
                    lapack_logical* tryrac, double* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_cstemr( char* jobz, char* range, lapack_int* n, float* d, float* e,
                    float* vl, float* vu, lapack_int* il, lapack_int* iu,
                    lapack_int* m, float* w, lapack_complex_float* z,
                    lapack_int* ldz, lapack_int* nzc, lapack_int* isuppz,
                    lapack_logical* tryrac, float* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_zstemr( char* jobz, char* range, lapack_int* n, double* d,
                    double* e, double* vl, double* vu, lapack_int* il,
                    lapack_int* iu, lapack_int* m, double* w,
                    lapack_complex_double* z, lapack_int* ldz, lapack_int* nzc,
                    lapack_int* isuppz, lapack_logical* tryrac, double* work,
                    lapack_int* lwork, lapack_int* iwork, lapack_int* liwork,
                    lapack_int *info );
void LAPACK_sstedc( char* compz, lapack_int* n, float* d, float* e, float* z,
                    lapack_int* ldz, float* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_dstedc( char* compz, lapack_int* n, double* d, double* e, double* z,
                    lapack_int* ldz, double* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_cstedc( char* compz, lapack_int* n, float* d, float* e,
                    lapack_complex_float* z, lapack_int* ldz,
                    lapack_complex_float* work, lapack_int* lwork, float* rwork,
                    lapack_int* lrwork, lapack_int* iwork, lapack_int* liwork,
                    lapack_int *info );
void LAPACK_zstedc( char* compz, lapack_int* n, double* d, double* e,
                    lapack_complex_double* z, lapack_int* ldz,
                    lapack_complex_double* work, lapack_int* lwork,
                    double* rwork, lapack_int* lrwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_int *info );
void LAPACK_sstegr( char* jobz, char* range, lapack_int* n, float* d, float* e,
                    float* vl, float* vu, lapack_int* il, lapack_int* iu,
                    float* abstol, lapack_int* m, float* w, float* z,
                    lapack_int* ldz, lapack_int* isuppz, float* work,
                    lapack_int* lwork, lapack_int* iwork, lapack_int* liwork,
                    lapack_int *info );
void LAPACK_dstegr( char* jobz, char* range, lapack_int* n, double* d,
                    double* e, double* vl, double* vu, lapack_int* il,
                    lapack_int* iu, double* abstol, lapack_int* m, double* w,
                    double* z, lapack_int* ldz, lapack_int* isuppz,
                    double* work, lapack_int* lwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_int *info );
void LAPACK_cstegr( char* jobz, char* range, lapack_int* n, float* d, float* e,
                    float* vl, float* vu, lapack_int* il, lapack_int* iu,
                    float* abstol, lapack_int* m, float* w,
                    lapack_complex_float* z, lapack_int* ldz,
                    lapack_int* isuppz, float* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_zstegr( char* jobz, char* range, lapack_int* n, double* d,
                    double* e, double* vl, double* vu, lapack_int* il,
                    lapack_int* iu, double* abstol, lapack_int* m, double* w,
                    lapack_complex_double* z, lapack_int* ldz,
                    lapack_int* isuppz, double* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_spteqr( char* compz, lapack_int* n, float* d, float* e, float* z,
                    lapack_int* ldz, float* work, lapack_int *info );
void LAPACK_dpteqr( char* compz, lapack_int* n, double* d, double* e, double* z,
                    lapack_int* ldz, double* work, lapack_int *info );
void LAPACK_cpteqr( char* compz, lapack_int* n, float* d, float* e,
                    lapack_complex_float* z, lapack_int* ldz, float* work,
                    lapack_int *info );
void LAPACK_zpteqr( char* compz, lapack_int* n, double* d, double* e,
                    lapack_complex_double* z, lapack_int* ldz, double* work,
                    lapack_int *info );
void LAPACK_sstebz( char* range, char* order, lapack_int* n, float* vl,
                    float* vu, lapack_int* il, lapack_int* iu, float* abstol,
                    const float* d, const float* e, lapack_int* m,
                    lapack_int* nsplit, float* w, lapack_int* iblock,
                    lapack_int* isplit, float* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dstebz( char* range, char* order, lapack_int* n, double* vl,
                    double* vu, lapack_int* il, lapack_int* iu, double* abstol,
                    const double* d, const double* e, lapack_int* m,
                    lapack_int* nsplit, double* w, lapack_int* iblock,
                    lapack_int* isplit, double* work, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_sstein( lapack_int* n, const float* d, const float* e,
                    lapack_int* m, const float* w, const lapack_int* iblock,
                    const lapack_int* isplit, float* z, lapack_int* ldz,
                    float* work, lapack_int* iwork, lapack_int* ifailv,
                    lapack_int *info );
void LAPACK_dstein( lapack_int* n, const double* d, const double* e,
                    lapack_int* m, const double* w, const lapack_int* iblock,
                    const lapack_int* isplit, double* z, lapack_int* ldz,
                    double* work, lapack_int* iwork, lapack_int* ifailv,
                    lapack_int *info );
void LAPACK_cstein( lapack_int* n, const float* d, const float* e,
                    lapack_int* m, const float* w, const lapack_int* iblock,
                    const lapack_int* isplit, lapack_complex_float* z,
                    lapack_int* ldz, float* work, lapack_int* iwork,
                    lapack_int* ifailv, lapack_int *info );
void LAPACK_zstein( lapack_int* n, const double* d, const double* e,
                    lapack_int* m, const double* w, const lapack_int* iblock,
                    const lapack_int* isplit, lapack_complex_double* z,
                    lapack_int* ldz, double* work, lapack_int* iwork,
                    lapack_int* ifailv, lapack_int *info );
void LAPACK_sdisna( char* job, lapack_int* m, lapack_int* n, const float* d,
                    float* sep, lapack_int *info );
void LAPACK_ddisna( char* job, lapack_int* m, lapack_int* n, const double* d,
                    double* sep, lapack_int *info );
void LAPACK_ssygst( lapack_int* itype, char* uplo, lapack_int* n, float* a,
                    lapack_int* lda, const float* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_dsygst( lapack_int* itype, char* uplo, lapack_int* n, double* a,
                    lapack_int* lda, const double* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_chegst( lapack_int* itype, char* uplo, lapack_int* n,
                    lapack_complex_float* a, lapack_int* lda,
                    const lapack_complex_float* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_zhegst( lapack_int* itype, char* uplo, lapack_int* n,
                    lapack_complex_double* a, lapack_int* lda,
                    const lapack_complex_double* b, lapack_int* ldb,
                    lapack_int *info );
void LAPACK_sspgst( lapack_int* itype, char* uplo, lapack_int* n, float* ap,
                    const float* bp, lapack_int *info );
void LAPACK_dspgst( lapack_int* itype, char* uplo, lapack_int* n, double* ap,
                    const double* bp, lapack_int *info );
void LAPACK_chpgst( lapack_int* itype, char* uplo, lapack_int* n,
                    lapack_complex_float* ap, const lapack_complex_float* bp,
                    lapack_int *info );
void LAPACK_zhpgst( lapack_int* itype, char* uplo, lapack_int* n,
                    lapack_complex_double* ap, const lapack_complex_double* bp,
                    lapack_int *info );
void LAPACK_ssbgst( char* vect, char* uplo, lapack_int* n, lapack_int* ka,
                    lapack_int* kb, float* ab, lapack_int* ldab,
                    const float* bb, lapack_int* ldbb, float* x,
                    lapack_int* ldx, float* work, lapack_int *info );
void LAPACK_dsbgst( char* vect, char* uplo, lapack_int* n, lapack_int* ka,
                    lapack_int* kb, double* ab, lapack_int* ldab,
                    const double* bb, lapack_int* ldbb, double* x,
                    lapack_int* ldx, double* work, lapack_int *info );
void LAPACK_chbgst( char* vect, char* uplo, lapack_int* n, lapack_int* ka,
                    lapack_int* kb, lapack_complex_float* ab, lapack_int* ldab,
                    const lapack_complex_float* bb, lapack_int* ldbb,
                    lapack_complex_float* x, lapack_int* ldx,
                    lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_zhbgst( char* vect, char* uplo, lapack_int* n, lapack_int* ka,
                    lapack_int* kb, lapack_complex_double* ab, lapack_int* ldab,
                    const lapack_complex_double* bb, lapack_int* ldbb,
                    lapack_complex_double* x, lapack_int* ldx,
                    lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_spbstf( char* uplo, lapack_int* n, lapack_int* kb, float* bb,
                    lapack_int* ldbb, lapack_int *info );
void LAPACK_dpbstf( char* uplo, lapack_int* n, lapack_int* kb, double* bb,
                    lapack_int* ldbb, lapack_int *info );
void LAPACK_cpbstf( char* uplo, lapack_int* n, lapack_int* kb,
                    lapack_complex_float* bb, lapack_int* ldbb,
                    lapack_int *info );
void LAPACK_zpbstf( char* uplo, lapack_int* n, lapack_int* kb,
                    lapack_complex_double* bb, lapack_int* ldbb,
                    lapack_int *info );
void LAPACK_sgehrd( lapack_int* n, lapack_int* ilo, lapack_int* ihi, float* a,
                    lapack_int* lda, float* tau, float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_dgehrd( lapack_int* n, lapack_int* ilo, lapack_int* ihi, double* a,
                    lapack_int* lda, double* tau, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_cgehrd( lapack_int* n, lapack_int* ilo, lapack_int* ihi,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* tau, lapack_complex_float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_zgehrd( lapack_int* n, lapack_int* ilo, lapack_int* ihi,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* tau, lapack_complex_double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_sorghr( lapack_int* n, lapack_int* ilo, lapack_int* ihi, float* a,
                    lapack_int* lda, const float* tau, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_dorghr( lapack_int* n, lapack_int* ilo, lapack_int* ihi, double* a,
                    lapack_int* lda, const double* tau, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_sormhr( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* ilo, lapack_int* ihi, const float* a,
                    lapack_int* lda, const float* tau, float* c,
                    lapack_int* ldc, float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_dormhr( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* ilo, lapack_int* ihi, const double* a,
                    lapack_int* lda, const double* tau, double* c,
                    lapack_int* ldc, double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_cunghr( lapack_int* n, lapack_int* ilo, lapack_int* ihi,
                    lapack_complex_float* a, lapack_int* lda,
                    const lapack_complex_float* tau, lapack_complex_float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_zunghr( lapack_int* n, lapack_int* ilo, lapack_int* ihi,
                    lapack_complex_double* a, lapack_int* lda,
                    const lapack_complex_double* tau,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_cunmhr( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* ilo, lapack_int* ihi,
                    const lapack_complex_float* a, lapack_int* lda,
                    const lapack_complex_float* tau, lapack_complex_float* c,
                    lapack_int* ldc, lapack_complex_float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_zunmhr( char* side, char* trans, lapack_int* m, lapack_int* n,
                    lapack_int* ilo, lapack_int* ihi,
                    const lapack_complex_double* a, lapack_int* lda,
                    const lapack_complex_double* tau, lapack_complex_double* c,
                    lapack_int* ldc, lapack_complex_double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_sgebal( char* job, lapack_int* n, float* a, lapack_int* lda,
                    lapack_int* ilo, lapack_int* ihi, float* scale,
                    lapack_int *info );
void LAPACK_dgebal( char* job, lapack_int* n, double* a, lapack_int* lda,
                    lapack_int* ilo, lapack_int* ihi, double* scale,
                    lapack_int *info );
void LAPACK_cgebal( char* job, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_int* ilo, lapack_int* ihi,
                    float* scale, lapack_int *info );
void LAPACK_zgebal( char* job, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_int* ilo, lapack_int* ihi,
                    double* scale, lapack_int *info );
void LAPACK_sgebak( char* job, char* side, lapack_int* n, lapack_int* ilo,
                    lapack_int* ihi, const float* scale, lapack_int* m,
                    float* v, lapack_int* ldv, lapack_int *info );
void LAPACK_dgebak( char* job, char* side, lapack_int* n, lapack_int* ilo,
                    lapack_int* ihi, const double* scale, lapack_int* m,
                    double* v, lapack_int* ldv, lapack_int *info );
void LAPACK_cgebak( char* job, char* side, lapack_int* n, lapack_int* ilo,
                    lapack_int* ihi, const float* scale, lapack_int* m,
                    lapack_complex_float* v, lapack_int* ldv,
                    lapack_int *info );
void LAPACK_zgebak( char* job, char* side, lapack_int* n, lapack_int* ilo,
                    lapack_int* ihi, const double* scale, lapack_int* m,
                    lapack_complex_double* v, lapack_int* ldv,
                    lapack_int *info );
void LAPACK_shseqr( char* job, char* compz, lapack_int* n, lapack_int* ilo,
                    lapack_int* ihi, float* h, lapack_int* ldh, float* wr,
                    float* wi, float* z, lapack_int* ldz, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_dhseqr( char* job, char* compz, lapack_int* n, lapack_int* ilo,
                    lapack_int* ihi, double* h, lapack_int* ldh, double* wr,
                    double* wi, double* z, lapack_int* ldz, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_chseqr( char* job, char* compz, lapack_int* n, lapack_int* ilo,
                    lapack_int* ihi, lapack_complex_float* h, lapack_int* ldh,
                    lapack_complex_float* w, lapack_complex_float* z,
                    lapack_int* ldz, lapack_complex_float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_zhseqr( char* job, char* compz, lapack_int* n, lapack_int* ilo,
                    lapack_int* ihi, lapack_complex_double* h, lapack_int* ldh,
                    lapack_complex_double* w, lapack_complex_double* z,
                    lapack_int* ldz, lapack_complex_double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_shsein( char* job, char* eigsrc, char* initv,
                    lapack_logical* select, lapack_int* n, const float* h,
                    lapack_int* ldh, float* wr, const float* wi, float* vl,
                    lapack_int* ldvl, float* vr, lapack_int* ldvr,
                    lapack_int* mm, lapack_int* m, float* work,
                    lapack_int* ifaill, lapack_int* ifailr, lapack_int *info );
void LAPACK_dhsein( char* job, char* eigsrc, char* initv,
                    lapack_logical* select, lapack_int* n, const double* h,
                    lapack_int* ldh, double* wr, const double* wi, double* vl,
                    lapack_int* ldvl, double* vr, lapack_int* ldvr,
                    lapack_int* mm, lapack_int* m, double* work,
                    lapack_int* ifaill, lapack_int* ifailr, lapack_int *info );
void LAPACK_chsein( char* job, char* eigsrc, char* initv,
                    const lapack_logical* select, lapack_int* n,
                    const lapack_complex_float* h, lapack_int* ldh,
                    lapack_complex_float* w, lapack_complex_float* vl,
                    lapack_int* ldvl, lapack_complex_float* vr,
                    lapack_int* ldvr, lapack_int* mm, lapack_int* m,
                    lapack_complex_float* work, float* rwork,
                    lapack_int* ifaill, lapack_int* ifailr, lapack_int *info );
void LAPACK_zhsein( char* job, char* eigsrc, char* initv,
                    const lapack_logical* select, lapack_int* n,
                    const lapack_complex_double* h, lapack_int* ldh,
                    lapack_complex_double* w, lapack_complex_double* vl,
                    lapack_int* ldvl, lapack_complex_double* vr,
                    lapack_int* ldvr, lapack_int* mm, lapack_int* m,
                    lapack_complex_double* work, double* rwork,
                    lapack_int* ifaill, lapack_int* ifailr, lapack_int *info );
void LAPACK_strevc( char* side, char* howmny, lapack_logical* select,
                    lapack_int* n, const float* t, lapack_int* ldt, float* vl,
                    lapack_int* ldvl, float* vr, lapack_int* ldvr,
                    lapack_int* mm, lapack_int* m, float* work,
                    lapack_int *info );
void LAPACK_dtrevc( char* side, char* howmny, lapack_logical* select,
                    lapack_int* n, const double* t, lapack_int* ldt, double* vl,
                    lapack_int* ldvl, double* vr, lapack_int* ldvr,
                    lapack_int* mm, lapack_int* m, double* work,
                    lapack_int *info );
void LAPACK_ctrevc( char* side, char* howmny, const lapack_logical* select,
                    lapack_int* n, lapack_complex_float* t, lapack_int* ldt,
                    lapack_complex_float* vl, lapack_int* ldvl,
                    lapack_complex_float* vr, lapack_int* ldvr, lapack_int* mm,
                    lapack_int* m, lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_ztrevc( char* side, char* howmny, const lapack_logical* select,
                    lapack_int* n, lapack_complex_double* t, lapack_int* ldt,
                    lapack_complex_double* vl, lapack_int* ldvl,
                    lapack_complex_double* vr, lapack_int* ldvr, lapack_int* mm,
                    lapack_int* m, lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_strsna( char* job, char* howmny, const lapack_logical* select,
                    lapack_int* n, const float* t, lapack_int* ldt,
                    const float* vl, lapack_int* ldvl, const float* vr,
                    lapack_int* ldvr, float* s, float* sep, lapack_int* mm,
                    lapack_int* m, float* work, lapack_int* ldwork,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_dtrsna( char* job, char* howmny, const lapack_logical* select,
                    lapack_int* n, const double* t, lapack_int* ldt,
                    const double* vl, lapack_int* ldvl, const double* vr,
                    lapack_int* ldvr, double* s, double* sep, lapack_int* mm,
                    lapack_int* m, double* work, lapack_int* ldwork,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_ctrsna( char* job, char* howmny, const lapack_logical* select,
                    lapack_int* n, const lapack_complex_float* t,
                    lapack_int* ldt, const lapack_complex_float* vl,
                    lapack_int* ldvl, const lapack_complex_float* vr,
                    lapack_int* ldvr, float* s, float* sep, lapack_int* mm,
                    lapack_int* m, lapack_complex_float* work,
                    lapack_int* ldwork, float* rwork, lapack_int *info );
void LAPACK_ztrsna( char* job, char* howmny, const lapack_logical* select,
                    lapack_int* n, const lapack_complex_double* t,
                    lapack_int* ldt, const lapack_complex_double* vl,
                    lapack_int* ldvl, const lapack_complex_double* vr,
                    lapack_int* ldvr, double* s, double* sep, lapack_int* mm,
                    lapack_int* m, lapack_complex_double* work,
                    lapack_int* ldwork, double* rwork, lapack_int *info );
void LAPACK_strexc( char* compq, lapack_int* n, float* t, lapack_int* ldt,
                    float* q, lapack_int* ldq, lapack_int* ifst,
                    lapack_int* ilst, float* work, lapack_int *info );
void LAPACK_dtrexc( char* compq, lapack_int* n, double* t, lapack_int* ldt,
                    double* q, lapack_int* ldq, lapack_int* ifst,
                    lapack_int* ilst, double* work, lapack_int *info );
void LAPACK_ctrexc( char* compq, lapack_int* n, lapack_complex_float* t,
                    lapack_int* ldt, lapack_complex_float* q, lapack_int* ldq,
                    lapack_int* ifst, lapack_int* ilst, lapack_int *info );
void LAPACK_ztrexc( char* compq, lapack_int* n, lapack_complex_double* t,
                    lapack_int* ldt, lapack_complex_double* q, lapack_int* ldq,
                    lapack_int* ifst, lapack_int* ilst, lapack_int *info );
void LAPACK_strsen( char* job, char* compq, const lapack_logical* select,
                    lapack_int* n, float* t, lapack_int* ldt, float* q,
                    lapack_int* ldq, float* wr, float* wi, lapack_int* m,
                    float* s, float* sep, float* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_dtrsen( char* job, char* compq, const lapack_logical* select,
                    lapack_int* n, double* t, lapack_int* ldt, double* q,
                    lapack_int* ldq, double* wr, double* wi, lapack_int* m,
                    double* s, double* sep, double* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_ctrsen( char* job, char* compq, const lapack_logical* select,
                    lapack_int* n, lapack_complex_float* t, lapack_int* ldt,
                    lapack_complex_float* q, lapack_int* ldq,
                    lapack_complex_float* w, lapack_int* m, float* s,
                    float* sep, lapack_complex_float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_ztrsen( char* job, char* compq, const lapack_logical* select,
                    lapack_int* n, lapack_complex_double* t, lapack_int* ldt,
                    lapack_complex_double* q, lapack_int* ldq,
                    lapack_complex_double* w, lapack_int* m, double* s,
                    double* sep, lapack_complex_double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_strsyl( char* trana, char* tranb, lapack_int* isgn, lapack_int* m,
                    lapack_int* n, const float* a, lapack_int* lda,
                    const float* b, lapack_int* ldb, float* c, lapack_int* ldc,
                    float* scale, lapack_int *info );
void LAPACK_dtrsyl( char* trana, char* tranb, lapack_int* isgn, lapack_int* m,
                    lapack_int* n, const double* a, lapack_int* lda,
                    const double* b, lapack_int* ldb, double* c,
                    lapack_int* ldc, double* scale, lapack_int *info );
void LAPACK_ctrsyl( char* trana, char* tranb, lapack_int* isgn, lapack_int* m,
                    lapack_int* n, const lapack_complex_float* a,
                    lapack_int* lda, const lapack_complex_float* b,
                    lapack_int* ldb, lapack_complex_float* c, lapack_int* ldc,
                    float* scale, lapack_int *info );
void LAPACK_ztrsyl( char* trana, char* tranb, lapack_int* isgn, lapack_int* m,
                    lapack_int* n, const lapack_complex_double* a,
                    lapack_int* lda, const lapack_complex_double* b,
                    lapack_int* ldb, lapack_complex_double* c, lapack_int* ldc,
                    double* scale, lapack_int *info );
void LAPACK_sgghrd( char* compq, char* compz, lapack_int* n, lapack_int* ilo,
                    lapack_int* ihi, float* a, lapack_int* lda, float* b,
                    lapack_int* ldb, float* q, lapack_int* ldq, float* z,
                    lapack_int* ldz, lapack_int *info );
void LAPACK_dgghrd( char* compq, char* compz, lapack_int* n, lapack_int* ilo,
                    lapack_int* ihi, double* a, lapack_int* lda, double* b,
                    lapack_int* ldb, double* q, lapack_int* ldq, double* z,
                    lapack_int* ldz, lapack_int *info );
void LAPACK_cgghrd( char* compq, char* compz, lapack_int* n, lapack_int* ilo,
                    lapack_int* ihi, lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* q, lapack_int* ldq,
                    lapack_complex_float* z, lapack_int* ldz,
                    lapack_int *info );
void LAPACK_zgghrd( char* compq, char* compz, lapack_int* n, lapack_int* ilo,
                    lapack_int* ihi, lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* q, lapack_int* ldq,
                    lapack_complex_double* z, lapack_int* ldz,
                    lapack_int *info );
void LAPACK_sggbal( char* job, lapack_int* n, float* a, lapack_int* lda,
                    float* b, lapack_int* ldb, lapack_int* ilo, lapack_int* ihi,
                    float* lscale, float* rscale, float* work,
                    lapack_int *info );
void LAPACK_dggbal( char* job, lapack_int* n, double* a, lapack_int* lda,
                    double* b, lapack_int* ldb, lapack_int* ilo,
                    lapack_int* ihi, double* lscale, double* rscale,
                    double* work, lapack_int *info );
void LAPACK_cggbal( char* job, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_complex_float* b, lapack_int* ldb,
                    lapack_int* ilo, lapack_int* ihi, float* lscale,
                    float* rscale, float* work, lapack_int *info );
void LAPACK_zggbal( char* job, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_complex_double* b, lapack_int* ldb,
                    lapack_int* ilo, lapack_int* ihi, double* lscale,
                    double* rscale, double* work, lapack_int *info );
void LAPACK_sggbak( char* job, char* side, lapack_int* n, lapack_int* ilo,
                    lapack_int* ihi, const float* lscale, const float* rscale,
                    lapack_int* m, float* v, lapack_int* ldv,
                    lapack_int *info );
void LAPACK_dggbak( char* job, char* side, lapack_int* n, lapack_int* ilo,
                    lapack_int* ihi, const double* lscale, const double* rscale,
                    lapack_int* m, double* v, lapack_int* ldv,
                    lapack_int *info );
void LAPACK_cggbak( char* job, char* side, lapack_int* n, lapack_int* ilo,
                    lapack_int* ihi, const float* lscale, const float* rscale,
                    lapack_int* m, lapack_complex_float* v, lapack_int* ldv,
                    lapack_int *info );
void LAPACK_zggbak( char* job, char* side, lapack_int* n, lapack_int* ilo,
                    lapack_int* ihi, const double* lscale, const double* rscale,
                    lapack_int* m, lapack_complex_double* v, lapack_int* ldv,
                    lapack_int *info );
void LAPACK_shgeqz( char* job, char* compq, char* compz, lapack_int* n,
                    lapack_int* ilo, lapack_int* ihi, float* h, lapack_int* ldh,
                    float* t, lapack_int* ldt, float* alphar, float* alphai,
                    float* beta, float* q, lapack_int* ldq, float* z,
                    lapack_int* ldz, float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_dhgeqz( char* job, char* compq, char* compz, lapack_int* n,
                    lapack_int* ilo, lapack_int* ihi, double* h,
                    lapack_int* ldh, double* t, lapack_int* ldt, double* alphar,
                    double* alphai, double* beta, double* q, lapack_int* ldq,
                    double* z, lapack_int* ldz, double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_chgeqz( char* job, char* compq, char* compz, lapack_int* n,
                    lapack_int* ilo, lapack_int* ihi, lapack_complex_float* h,
                    lapack_int* ldh, lapack_complex_float* t, lapack_int* ldt,
                    lapack_complex_float* alpha, lapack_complex_float* beta,
                    lapack_complex_float* q, lapack_int* ldq,
                    lapack_complex_float* z, lapack_int* ldz,
                    lapack_complex_float* work, lapack_int* lwork, float* rwork,
                    lapack_int *info );
void LAPACK_zhgeqz( char* job, char* compq, char* compz, lapack_int* n,
                    lapack_int* ilo, lapack_int* ihi, lapack_complex_double* h,
                    lapack_int* ldh, lapack_complex_double* t, lapack_int* ldt,
                    lapack_complex_double* alpha, lapack_complex_double* beta,
                    lapack_complex_double* q, lapack_int* ldq,
                    lapack_complex_double* z, lapack_int* ldz,
                    lapack_complex_double* work, lapack_int* lwork,
                    double* rwork, lapack_int *info );
void LAPACK_stgevc( char* side, char* howmny, const lapack_logical* select,
                    lapack_int* n, const float* s, lapack_int* lds,
                    const float* p, lapack_int* ldp, float* vl,
                    lapack_int* ldvl, float* vr, lapack_int* ldvr,
                    lapack_int* mm, lapack_int* m, float* work,
                    lapack_int *info );
void LAPACK_dtgevc( char* side, char* howmny, const lapack_logical* select,
                    lapack_int* n, const double* s, lapack_int* lds,
                    const double* p, lapack_int* ldp, double* vl,
                    lapack_int* ldvl, double* vr, lapack_int* ldvr,
                    lapack_int* mm, lapack_int* m, double* work,
                    lapack_int *info );
void LAPACK_ctgevc( char* side, char* howmny, const lapack_logical* select,
                    lapack_int* n, const lapack_complex_float* s,
                    lapack_int* lds, const lapack_complex_float* p,
                    lapack_int* ldp, lapack_complex_float* vl, lapack_int* ldvl,
                    lapack_complex_float* vr, lapack_int* ldvr, lapack_int* mm,
                    lapack_int* m, lapack_complex_float* work, float* rwork,
                    lapack_int *info );
void LAPACK_ztgevc( char* side, char* howmny, const lapack_logical* select,
                    lapack_int* n, const lapack_complex_double* s,
                    lapack_int* lds, const lapack_complex_double* p,
                    lapack_int* ldp, lapack_complex_double* vl,
                    lapack_int* ldvl, lapack_complex_double* vr,
                    lapack_int* ldvr, lapack_int* mm, lapack_int* m,
                    lapack_complex_double* work, double* rwork,
                    lapack_int *info );
void LAPACK_stgexc( lapack_logical* wantq, lapack_logical* wantz, lapack_int* n,
                    float* a, lapack_int* lda, float* b, lapack_int* ldb,
                    float* q, lapack_int* ldq, float* z, lapack_int* ldz,
                    lapack_int* ifst, lapack_int* ilst, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_dtgexc( lapack_logical* wantq, lapack_logical* wantz, lapack_int* n,
                    double* a, lapack_int* lda, double* b, lapack_int* ldb,
                    double* q, lapack_int* ldq, double* z, lapack_int* ldz,
                    lapack_int* ifst, lapack_int* ilst, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_ctgexc( lapack_logical* wantq, lapack_logical* wantz, lapack_int* n,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* q, lapack_int* ldq,
                    lapack_complex_float* z, lapack_int* ldz, lapack_int* ifst,
                    lapack_int* ilst, lapack_int *info );
void LAPACK_ztgexc( lapack_logical* wantq, lapack_logical* wantz, lapack_int* n,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* q, lapack_int* ldq,
                    lapack_complex_double* z, lapack_int* ldz, lapack_int* ifst,
                    lapack_int* ilst, lapack_int *info );
void LAPACK_stgsen( lapack_int* ijob, lapack_logical* wantq,
                    lapack_logical* wantz, const lapack_logical* select,
                    lapack_int* n, float* a, lapack_int* lda, float* b,
                    lapack_int* ldb, float* alphar, float* alphai, float* beta,
                    float* q, lapack_int* ldq, float* z, lapack_int* ldz,
                    lapack_int* m, float* pl, float* pr, float* dif,
                    float* work, lapack_int* lwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_int *info );
void LAPACK_dtgsen( lapack_int* ijob, lapack_logical* wantq,
                    lapack_logical* wantz, const lapack_logical* select,
                    lapack_int* n, double* a, lapack_int* lda, double* b,
                    lapack_int* ldb, double* alphar, double* alphai,
                    double* beta, double* q, lapack_int* ldq, double* z,
                    lapack_int* ldz, lapack_int* m, double* pl, double* pr,
                    double* dif, double* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_ctgsen( lapack_int* ijob, lapack_logical* wantq,
                    lapack_logical* wantz, const lapack_logical* select,
                    lapack_int* n, lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* alpha, lapack_complex_float* beta,
                    lapack_complex_float* q, lapack_int* ldq,
                    lapack_complex_float* z, lapack_int* ldz, lapack_int* m,
                    float* pl, float* pr, float* dif,
                    lapack_complex_float* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_ztgsen( lapack_int* ijob, lapack_logical* wantq,
                    lapack_logical* wantz, const lapack_logical* select,
                    lapack_int* n, lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* alpha, lapack_complex_double* beta,
                    lapack_complex_double* q, lapack_int* ldq,
                    lapack_complex_double* z, lapack_int* ldz, lapack_int* m,
                    double* pl, double* pr, double* dif,
                    lapack_complex_double* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_stgsyl( char* trans, lapack_int* ijob, lapack_int* m, lapack_int* n,
                    const float* a, lapack_int* lda, const float* b,
                    lapack_int* ldb, float* c, lapack_int* ldc, const float* d,
                    lapack_int* ldd, const float* e, lapack_int* lde, float* f,
                    lapack_int* ldf, float* scale, float* dif, float* work,
                    lapack_int* lwork, lapack_int* iwork, lapack_int *info );
void LAPACK_dtgsyl( char* trans, lapack_int* ijob, lapack_int* m, lapack_int* n,
                    const double* a, lapack_int* lda, const double* b,
                    lapack_int* ldb, double* c, lapack_int* ldc,
                    const double* d, lapack_int* ldd, const double* e,
                    lapack_int* lde, double* f, lapack_int* ldf, double* scale,
                    double* dif, double* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_ctgsyl( char* trans, lapack_int* ijob, lapack_int* m, lapack_int* n,
                    const lapack_complex_float* a, lapack_int* lda,
                    const lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* c, lapack_int* ldc,
                    const lapack_complex_float* d, lapack_int* ldd,
                    const lapack_complex_float* e, lapack_int* lde,
                    lapack_complex_float* f, lapack_int* ldf, float* scale,
                    float* dif, lapack_complex_float* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_ztgsyl( char* trans, lapack_int* ijob, lapack_int* m, lapack_int* n,
                    const lapack_complex_double* a, lapack_int* lda,
                    const lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* c, lapack_int* ldc,
                    const lapack_complex_double* d, lapack_int* ldd,
                    const lapack_complex_double* e, lapack_int* lde,
                    lapack_complex_double* f, lapack_int* ldf, double* scale,
                    double* dif, lapack_complex_double* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_stgsna( char* job, char* howmny, const lapack_logical* select,
                    lapack_int* n, const float* a, lapack_int* lda,
                    const float* b, lapack_int* ldb, const float* vl,
                    lapack_int* ldvl, const float* vr, lapack_int* ldvr,
                    float* s, float* dif, lapack_int* mm, lapack_int* m,
                    float* work, lapack_int* lwork, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dtgsna( char* job, char* howmny, const lapack_logical* select,
                    lapack_int* n, const double* a, lapack_int* lda,
                    const double* b, lapack_int* ldb, const double* vl,
                    lapack_int* ldvl, const double* vr, lapack_int* ldvr,
                    double* s, double* dif, lapack_int* mm, lapack_int* m,
                    double* work, lapack_int* lwork, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_ctgsna( char* job, char* howmny, const lapack_logical* select,
                    lapack_int* n, const lapack_complex_float* a,
                    lapack_int* lda, const lapack_complex_float* b,
                    lapack_int* ldb, const lapack_complex_float* vl,
                    lapack_int* ldvl, const lapack_complex_float* vr,
                    lapack_int* ldvr, float* s, float* dif, lapack_int* mm,
                    lapack_int* m, lapack_complex_float* work,
                    lapack_int* lwork, lapack_int* iwork, lapack_int *info );
void LAPACK_ztgsna( char* job, char* howmny, const lapack_logical* select,
                    lapack_int* n, const lapack_complex_double* a,
                    lapack_int* lda, const lapack_complex_double* b,
                    lapack_int* ldb, const lapack_complex_double* vl,
                    lapack_int* ldvl, const lapack_complex_double* vr,
                    lapack_int* ldvr, double* s, double* dif, lapack_int* mm,
                    lapack_int* m, lapack_complex_double* work,
                    lapack_int* lwork, lapack_int* iwork, lapack_int *info );
void LAPACK_sggsvp( char* jobu, char* jobv, char* jobq, lapack_int* m,
                    lapack_int* p, lapack_int* n, float* a, lapack_int* lda,
                    float* b, lapack_int* ldb, float* tola, float* tolb,
                    lapack_int* k, lapack_int* l, float* u, lapack_int* ldu,
                    float* v, lapack_int* ldv, float* q, lapack_int* ldq,
                    lapack_int* iwork, float* tau, float* work,
                    lapack_int *info );
void LAPACK_dggsvp( char* jobu, char* jobv, char* jobq, lapack_int* m,
                    lapack_int* p, lapack_int* n, double* a, lapack_int* lda,
                    double* b, lapack_int* ldb, double* tola, double* tolb,
                    lapack_int* k, lapack_int* l, double* u, lapack_int* ldu,
                    double* v, lapack_int* ldv, double* q, lapack_int* ldq,
                    lapack_int* iwork, double* tau, double* work,
                    lapack_int *info );
void LAPACK_cggsvp( char* jobu, char* jobv, char* jobq, lapack_int* m,
                    lapack_int* p, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_complex_float* b, lapack_int* ldb,
                    float* tola, float* tolb, lapack_int* k, lapack_int* l,
                    lapack_complex_float* u, lapack_int* ldu,
                    lapack_complex_float* v, lapack_int* ldv,
                    lapack_complex_float* q, lapack_int* ldq, lapack_int* iwork,
                    float* rwork, lapack_complex_float* tau,
                    lapack_complex_float* work, lapack_int *info );
void LAPACK_zggsvp( char* jobu, char* jobv, char* jobq, lapack_int* m,
                    lapack_int* p, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_complex_double* b, lapack_int* ldb,
                    double* tola, double* tolb, lapack_int* k, lapack_int* l,
                    lapack_complex_double* u, lapack_int* ldu,
                    lapack_complex_double* v, lapack_int* ldv,
                    lapack_complex_double* q, lapack_int* ldq,
                    lapack_int* iwork, double* rwork,
                    lapack_complex_double* tau, lapack_complex_double* work,
                    lapack_int *info );
void LAPACK_stgsja( char* jobu, char* jobv, char* jobq, lapack_int* m,
                    lapack_int* p, lapack_int* n, lapack_int* k, lapack_int* l,
                    float* a, lapack_int* lda, float* b, lapack_int* ldb,
                    float* tola, float* tolb, float* alpha, float* beta,
                    float* u, lapack_int* ldu, float* v, lapack_int* ldv,
                    float* q, lapack_int* ldq, float* work, lapack_int* ncycle,
                    lapack_int *info );
void LAPACK_dtgsja( char* jobu, char* jobv, char* jobq, lapack_int* m,
                    lapack_int* p, lapack_int* n, lapack_int* k, lapack_int* l,
                    double* a, lapack_int* lda, double* b, lapack_int* ldb,
                    double* tola, double* tolb, double* alpha, double* beta,
                    double* u, lapack_int* ldu, double* v, lapack_int* ldv,
                    double* q, lapack_int* ldq, double* work,
                    lapack_int* ncycle, lapack_int *info );
void LAPACK_ctgsja( char* jobu, char* jobv, char* jobq, lapack_int* m,
                    lapack_int* p, lapack_int* n, lapack_int* k, lapack_int* l,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* b, lapack_int* ldb, float* tola,
                    float* tolb, float* alpha, float* beta,
                    lapack_complex_float* u, lapack_int* ldu,
                    lapack_complex_float* v, lapack_int* ldv,
                    lapack_complex_float* q, lapack_int* ldq,
                    lapack_complex_float* work, lapack_int* ncycle,
                    lapack_int *info );
void LAPACK_ztgsja( char* jobu, char* jobv, char* jobq, lapack_int* m,
                    lapack_int* p, lapack_int* n, lapack_int* k, lapack_int* l,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb, double* tola,
                    double* tolb, double* alpha, double* beta,
                    lapack_complex_double* u, lapack_int* ldu,
                    lapack_complex_double* v, lapack_int* ldv,
                    lapack_complex_double* q, lapack_int* ldq,
                    lapack_complex_double* work, lapack_int* ncycle,
                    lapack_int *info );
void LAPACK_sgels( char* trans, lapack_int* m, lapack_int* n, lapack_int* nrhs,
                   float* a, lapack_int* lda, float* b, lapack_int* ldb,
                   float* work, lapack_int* lwork, lapack_int *info );
void LAPACK_dgels( char* trans, lapack_int* m, lapack_int* n, lapack_int* nrhs,
                   double* a, lapack_int* lda, double* b, lapack_int* ldb,
                   double* work, lapack_int* lwork, lapack_int *info );
void LAPACK_cgels( char* trans, lapack_int* m, lapack_int* n, lapack_int* nrhs,
                   lapack_complex_float* a, lapack_int* lda,
                   lapack_complex_float* b, lapack_int* ldb,
                   lapack_complex_float* work, lapack_int* lwork,
                   lapack_int *info );
void LAPACK_zgels( char* trans, lapack_int* m, lapack_int* n, lapack_int* nrhs,
                   lapack_complex_double* a, lapack_int* lda,
                   lapack_complex_double* b, lapack_int* ldb,
                   lapack_complex_double* work, lapack_int* lwork,
                   lapack_int *info );
void LAPACK_sgelsy( lapack_int* m, lapack_int* n, lapack_int* nrhs, float* a,
                    lapack_int* lda, float* b, lapack_int* ldb,
                    lapack_int* jpvt, float* rcond, lapack_int* rank,
                    float* work, lapack_int* lwork, lapack_int *info );
void LAPACK_dgelsy( lapack_int* m, lapack_int* n, lapack_int* nrhs, double* a,
                    lapack_int* lda, double* b, lapack_int* ldb,
                    lapack_int* jpvt, double* rcond, lapack_int* rank,
                    double* work, lapack_int* lwork, lapack_int *info );
void LAPACK_cgelsy( lapack_int* m, lapack_int* n, lapack_int* nrhs,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* b, lapack_int* ldb, lapack_int* jpvt,
                    float* rcond, lapack_int* rank, lapack_complex_float* work,
                    lapack_int* lwork, float* rwork, lapack_int *info );
void LAPACK_zgelsy( lapack_int* m, lapack_int* n, lapack_int* nrhs,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb, lapack_int* jpvt,
                    double* rcond, lapack_int* rank,
                    lapack_complex_double* work, lapack_int* lwork,
                    double* rwork, lapack_int *info );
void LAPACK_sgelss( lapack_int* m, lapack_int* n, lapack_int* nrhs, float* a,
                    lapack_int* lda, float* b, lapack_int* ldb, float* s,
                    float* rcond, lapack_int* rank, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_dgelss( lapack_int* m, lapack_int* n, lapack_int* nrhs, double* a,
                    lapack_int* lda, double* b, lapack_int* ldb, double* s,
                    double* rcond, lapack_int* rank, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_cgelss( lapack_int* m, lapack_int* n, lapack_int* nrhs,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* b, lapack_int* ldb, float* s,
                    float* rcond, lapack_int* rank, lapack_complex_float* work,
                    lapack_int* lwork, float* rwork, lapack_int *info );
void LAPACK_zgelss( lapack_int* m, lapack_int* n, lapack_int* nrhs,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb, double* s,
                    double* rcond, lapack_int* rank,
                    lapack_complex_double* work, lapack_int* lwork,
                    double* rwork, lapack_int *info );
void LAPACK_sgelsd( lapack_int* m, lapack_int* n, lapack_int* nrhs, float* a,
                    lapack_int* lda, float* b, lapack_int* ldb, float* s,
                    float* rcond, lapack_int* rank, float* work,
                    lapack_int* lwork, lapack_int* iwork, lapack_int *info );
void LAPACK_dgelsd( lapack_int* m, lapack_int* n, lapack_int* nrhs, double* a,
                    lapack_int* lda, double* b, lapack_int* ldb, double* s,
                    double* rcond, lapack_int* rank, double* work,
                    lapack_int* lwork, lapack_int* iwork, lapack_int *info );
void LAPACK_cgelsd( lapack_int* m, lapack_int* n, lapack_int* nrhs,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* b, lapack_int* ldb, float* s,
                    float* rcond, lapack_int* rank, lapack_complex_float* work,
                    lapack_int* lwork, float* rwork, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_zgelsd( lapack_int* m, lapack_int* n, lapack_int* nrhs,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb, double* s,
                    double* rcond, lapack_int* rank,
                    lapack_complex_double* work, lapack_int* lwork,
                    double* rwork, lapack_int* iwork, lapack_int *info );
void LAPACK_sgglse( lapack_int* m, lapack_int* n, lapack_int* p, float* a,
                    lapack_int* lda, float* b, lapack_int* ldb, float* c,
                    float* d, float* x, float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_dgglse( lapack_int* m, lapack_int* n, lapack_int* p, double* a,
                    lapack_int* lda, double* b, lapack_int* ldb, double* c,
                    double* d, double* x, double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_cgglse( lapack_int* m, lapack_int* n, lapack_int* p,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* c, lapack_complex_float* d,
                    lapack_complex_float* x, lapack_complex_float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_zgglse( lapack_int* m, lapack_int* n, lapack_int* p,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* c, lapack_complex_double* d,
                    lapack_complex_double* x, lapack_complex_double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_sggglm( lapack_int* n, lapack_int* m, lapack_int* p, float* a,
                    lapack_int* lda, float* b, lapack_int* ldb, float* d,
                    float* x, float* y, float* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_dggglm( lapack_int* n, lapack_int* m, lapack_int* p, double* a,
                    lapack_int* lda, double* b, lapack_int* ldb, double* d,
                    double* x, double* y, double* work, lapack_int* lwork,
                    lapack_int *info );
void LAPACK_cggglm( lapack_int* n, lapack_int* m, lapack_int* p,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* d, lapack_complex_float* x,
                    lapack_complex_float* y, lapack_complex_float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_zggglm( lapack_int* n, lapack_int* m, lapack_int* p,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* d, lapack_complex_double* x,
                    lapack_complex_double* y, lapack_complex_double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_ssyev( char* jobz, char* uplo, lapack_int* n, float* a,
                   lapack_int* lda, float* w, float* work, lapack_int* lwork,
                   lapack_int *info );
void LAPACK_dsyev( char* jobz, char* uplo, lapack_int* n, double* a,
                   lapack_int* lda, double* w, double* work, lapack_int* lwork,
                   lapack_int *info );
void LAPACK_cheev( char* jobz, char* uplo, lapack_int* n,
                   lapack_complex_float* a, lapack_int* lda, float* w,
                   lapack_complex_float* work, lapack_int* lwork, float* rwork,
                   lapack_int *info );
void LAPACK_zheev( char* jobz, char* uplo, lapack_int* n,
                   lapack_complex_double* a, lapack_int* lda, double* w,
                   lapack_complex_double* work, lapack_int* lwork,
                   double* rwork, lapack_int *info );
void LAPACK_ssyevd( char* jobz, char* uplo, lapack_int* n, float* a,
                    lapack_int* lda, float* w, float* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_dsyevd( char* jobz, char* uplo, lapack_int* n, double* a,
                    lapack_int* lda, double* w, double* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_cheevd( char* jobz, char* uplo, lapack_int* n,
                    lapack_complex_float* a, lapack_int* lda, float* w,
                    lapack_complex_float* work, lapack_int* lwork, float* rwork,
                    lapack_int* lrwork, lapack_int* iwork, lapack_int* liwork,
                    lapack_int *info );
void LAPACK_zheevd( char* jobz, char* uplo, lapack_int* n,
                    lapack_complex_double* a, lapack_int* lda, double* w,
                    lapack_complex_double* work, lapack_int* lwork,
                    double* rwork, lapack_int* lrwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_int *info );
void LAPACK_ssyevx( char* jobz, char* range, char* uplo, lapack_int* n,
                    float* a, lapack_int* lda, float* vl, float* vu,
                    lapack_int* il, lapack_int* iu, float* abstol,
                    lapack_int* m, float* w, float* z, lapack_int* ldz,
                    float* work, lapack_int* lwork, lapack_int* iwork,
                    lapack_int* ifail, lapack_int *info );
void LAPACK_dsyevx( char* jobz, char* range, char* uplo, lapack_int* n,
                    double* a, lapack_int* lda, double* vl, double* vu,
                    lapack_int* il, lapack_int* iu, double* abstol,
                    lapack_int* m, double* w, double* z, lapack_int* ldz,
                    double* work, lapack_int* lwork, lapack_int* iwork,
                    lapack_int* ifail, lapack_int *info );
void LAPACK_cheevx( char* jobz, char* range, char* uplo, lapack_int* n,
                    lapack_complex_float* a, lapack_int* lda, float* vl,
                    float* vu, lapack_int* il, lapack_int* iu, float* abstol,
                    lapack_int* m, float* w, lapack_complex_float* z,
                    lapack_int* ldz, lapack_complex_float* work,
                    lapack_int* lwork, float* rwork, lapack_int* iwork,
                    lapack_int* ifail, lapack_int *info );
void LAPACK_zheevx( char* jobz, char* range, char* uplo, lapack_int* n,
                    lapack_complex_double* a, lapack_int* lda, double* vl,
                    double* vu, lapack_int* il, lapack_int* iu, double* abstol,
                    lapack_int* m, double* w, lapack_complex_double* z,
                    lapack_int* ldz, lapack_complex_double* work,
                    lapack_int* lwork, double* rwork, lapack_int* iwork,
                    lapack_int* ifail, lapack_int *info );
void LAPACK_ssyevr( char* jobz, char* range, char* uplo, lapack_int* n,
                    float* a, lapack_int* lda, float* vl, float* vu,
                    lapack_int* il, lapack_int* iu, float* abstol,
                    lapack_int* m, float* w, float* z, lapack_int* ldz,
                    lapack_int* isuppz, float* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_dsyevr( char* jobz, char* range, char* uplo, lapack_int* n,
                    double* a, lapack_int* lda, double* vl, double* vu,
                    lapack_int* il, lapack_int* iu, double* abstol,
                    lapack_int* m, double* w, double* z, lapack_int* ldz,
                    lapack_int* isuppz, double* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_cheevr( char* jobz, char* range, char* uplo, lapack_int* n,
                    lapack_complex_float* a, lapack_int* lda, float* vl,
                    float* vu, lapack_int* il, lapack_int* iu, float* abstol,
                    lapack_int* m, float* w, lapack_complex_float* z,
                    lapack_int* ldz, lapack_int* isuppz,
                    lapack_complex_float* work, lapack_int* lwork, float* rwork,
                    lapack_int* lrwork, lapack_int* iwork, lapack_int* liwork,
                    lapack_int *info );
void LAPACK_zheevr( char* jobz, char* range, char* uplo, lapack_int* n,
                    lapack_complex_double* a, lapack_int* lda, double* vl,
                    double* vu, lapack_int* il, lapack_int* iu, double* abstol,
                    lapack_int* m, double* w, lapack_complex_double* z,
                    lapack_int* ldz, lapack_int* isuppz,
                    lapack_complex_double* work, lapack_int* lwork,
                    double* rwork, lapack_int* lrwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_int *info );
void LAPACK_sspev( char* jobz, char* uplo, lapack_int* n, float* ap, float* w,
                   float* z, lapack_int* ldz, float* work, lapack_int *info );
void LAPACK_dspev( char* jobz, char* uplo, lapack_int* n, double* ap, double* w,
                   double* z, lapack_int* ldz, double* work, lapack_int *info );
void LAPACK_chpev( char* jobz, char* uplo, lapack_int* n,
                   lapack_complex_float* ap, float* w, lapack_complex_float* z,
                   lapack_int* ldz, lapack_complex_float* work, float* rwork,
                   lapack_int *info );
void LAPACK_zhpev( char* jobz, char* uplo, lapack_int* n,
                   lapack_complex_double* ap, double* w,
                   lapack_complex_double* z, lapack_int* ldz,
                   lapack_complex_double* work, double* rwork,
                   lapack_int *info );
void LAPACK_sspevd( char* jobz, char* uplo, lapack_int* n, float* ap, float* w,
                    float* z, lapack_int* ldz, float* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_dspevd( char* jobz, char* uplo, lapack_int* n, double* ap,
                    double* w, double* z, lapack_int* ldz, double* work,
                    lapack_int* lwork, lapack_int* iwork, lapack_int* liwork,
                    lapack_int *info );
void LAPACK_chpevd( char* jobz, char* uplo, lapack_int* n,
                    lapack_complex_float* ap, float* w, lapack_complex_float* z,
                    lapack_int* ldz, lapack_complex_float* work,
                    lapack_int* lwork, float* rwork, lapack_int* lrwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_zhpevd( char* jobz, char* uplo, lapack_int* n,
                    lapack_complex_double* ap, double* w,
                    lapack_complex_double* z, lapack_int* ldz,
                    lapack_complex_double* work, lapack_int* lwork,
                    double* rwork, lapack_int* lrwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_int *info );
void LAPACK_sspevx( char* jobz, char* range, char* uplo, lapack_int* n,
                    float* ap, float* vl, float* vu, lapack_int* il,
                    lapack_int* iu, float* abstol, lapack_int* m, float* w,
                    float* z, lapack_int* ldz, float* work, lapack_int* iwork,
                    lapack_int* ifail, lapack_int *info );
void LAPACK_dspevx( char* jobz, char* range, char* uplo, lapack_int* n,
                    double* ap, double* vl, double* vu, lapack_int* il,
                    lapack_int* iu, double* abstol, lapack_int* m, double* w,
                    double* z, lapack_int* ldz, double* work, lapack_int* iwork,
                    lapack_int* ifail, lapack_int *info );
void LAPACK_chpevx( char* jobz, char* range, char* uplo, lapack_int* n,
                    lapack_complex_float* ap, float* vl, float* vu,
                    lapack_int* il, lapack_int* iu, float* abstol,
                    lapack_int* m, float* w, lapack_complex_float* z,
                    lapack_int* ldz, lapack_complex_float* work, float* rwork,
                    lapack_int* iwork, lapack_int* ifail, lapack_int *info );
void LAPACK_zhpevx( char* jobz, char* range, char* uplo, lapack_int* n,
                    lapack_complex_double* ap, double* vl, double* vu,
                    lapack_int* il, lapack_int* iu, double* abstol,
                    lapack_int* m, double* w, lapack_complex_double* z,
                    lapack_int* ldz, lapack_complex_double* work, double* rwork,
                    lapack_int* iwork, lapack_int* ifail, lapack_int *info );
void LAPACK_ssbev( char* jobz, char* uplo, lapack_int* n, lapack_int* kd,
                   float* ab, lapack_int* ldab, float* w, float* z,
                   lapack_int* ldz, float* work, lapack_int *info );
void LAPACK_dsbev( char* jobz, char* uplo, lapack_int* n, lapack_int* kd,
                   double* ab, lapack_int* ldab, double* w, double* z,
                   lapack_int* ldz, double* work, lapack_int *info );
void LAPACK_chbev( char* jobz, char* uplo, lapack_int* n, lapack_int* kd,
                   lapack_complex_float* ab, lapack_int* ldab, float* w,
                   lapack_complex_float* z, lapack_int* ldz,
                   lapack_complex_float* work, float* rwork, lapack_int *info );
void LAPACK_zhbev( char* jobz, char* uplo, lapack_int* n, lapack_int* kd,
                   lapack_complex_double* ab, lapack_int* ldab, double* w,
                   lapack_complex_double* z, lapack_int* ldz,
                   lapack_complex_double* work, double* rwork,
                   lapack_int *info );
void LAPACK_ssbevd( char* jobz, char* uplo, lapack_int* n, lapack_int* kd,
                    float* ab, lapack_int* ldab, float* w, float* z,
                    lapack_int* ldz, float* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_dsbevd( char* jobz, char* uplo, lapack_int* n, lapack_int* kd,
                    double* ab, lapack_int* ldab, double* w, double* z,
                    lapack_int* ldz, double* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_chbevd( char* jobz, char* uplo, lapack_int* n, lapack_int* kd,
                    lapack_complex_float* ab, lapack_int* ldab, float* w,
                    lapack_complex_float* z, lapack_int* ldz,
                    lapack_complex_float* work, lapack_int* lwork, float* rwork,
                    lapack_int* lrwork, lapack_int* iwork, lapack_int* liwork,
                    lapack_int *info );
void LAPACK_zhbevd( char* jobz, char* uplo, lapack_int* n, lapack_int* kd,
                    lapack_complex_double* ab, lapack_int* ldab, double* w,
                    lapack_complex_double* z, lapack_int* ldz,
                    lapack_complex_double* work, lapack_int* lwork,
                    double* rwork, lapack_int* lrwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_int *info );
void LAPACK_ssbevx( char* jobz, char* range, char* uplo, lapack_int* n,
                    lapack_int* kd, float* ab, lapack_int* ldab, float* q,
                    lapack_int* ldq, float* vl, float* vu, lapack_int* il,
                    lapack_int* iu, float* abstol, lapack_int* m, float* w,
                    float* z, lapack_int* ldz, float* work, lapack_int* iwork,
                    lapack_int* ifail, lapack_int *info );
void LAPACK_dsbevx( char* jobz, char* range, char* uplo, lapack_int* n,
                    lapack_int* kd, double* ab, lapack_int* ldab, double* q,
                    lapack_int* ldq, double* vl, double* vu, lapack_int* il,
                    lapack_int* iu, double* abstol, lapack_int* m, double* w,
                    double* z, lapack_int* ldz, double* work, lapack_int* iwork,
                    lapack_int* ifail, lapack_int *info );
void LAPACK_chbevx( char* jobz, char* range, char* uplo, lapack_int* n,
                    lapack_int* kd, lapack_complex_float* ab, lapack_int* ldab,
                    lapack_complex_float* q, lapack_int* ldq, float* vl,
                    float* vu, lapack_int* il, lapack_int* iu, float* abstol,
                    lapack_int* m, float* w, lapack_complex_float* z,
                    lapack_int* ldz, lapack_complex_float* work, float* rwork,
                    lapack_int* iwork, lapack_int* ifail, lapack_int *info );
void LAPACK_zhbevx( char* jobz, char* range, char* uplo, lapack_int* n,
                    lapack_int* kd, lapack_complex_double* ab, lapack_int* ldab,
                    lapack_complex_double* q, lapack_int* ldq, double* vl,
                    double* vu, lapack_int* il, lapack_int* iu, double* abstol,
                    lapack_int* m, double* w, lapack_complex_double* z,
                    lapack_int* ldz, lapack_complex_double* work, double* rwork,
                    lapack_int* iwork, lapack_int* ifail, lapack_int *info );
void LAPACK_sstev( char* jobz, lapack_int* n, float* d, float* e, float* z,
                   lapack_int* ldz, float* work, lapack_int *info );
void LAPACK_dstev( char* jobz, lapack_int* n, double* d, double* e, double* z,
                   lapack_int* ldz, double* work, lapack_int *info );
void LAPACK_sstevd( char* jobz, lapack_int* n, float* d, float* e, float* z,
                    lapack_int* ldz, float* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_dstevd( char* jobz, lapack_int* n, double* d, double* e, double* z,
                    lapack_int* ldz, double* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_sstevx( char* jobz, char* range, lapack_int* n, float* d, float* e,
                    float* vl, float* vu, lapack_int* il, lapack_int* iu,
                    float* abstol, lapack_int* m, float* w, float* z,
                    lapack_int* ldz, float* work, lapack_int* iwork,
                    lapack_int* ifail, lapack_int *info );
void LAPACK_dstevx( char* jobz, char* range, lapack_int* n, double* d,
                    double* e, double* vl, double* vu, lapack_int* il,
                    lapack_int* iu, double* abstol, lapack_int* m, double* w,
                    double* z, lapack_int* ldz, double* work, lapack_int* iwork,
                    lapack_int* ifail, lapack_int *info );
void LAPACK_sstevr( char* jobz, char* range, lapack_int* n, float* d, float* e,
                    float* vl, float* vu, lapack_int* il, lapack_int* iu,
                    float* abstol, lapack_int* m, float* w, float* z,
                    lapack_int* ldz, lapack_int* isuppz, float* work,
                    lapack_int* lwork, lapack_int* iwork, lapack_int* liwork,
                    lapack_int *info );
void LAPACK_dstevr( char* jobz, char* range, lapack_int* n, double* d,
                    double* e, double* vl, double* vu, lapack_int* il,
                    lapack_int* iu, double* abstol, lapack_int* m, double* w,
                    double* z, lapack_int* ldz, lapack_int* isuppz,
                    double* work, lapack_int* lwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_int *info );
void LAPACK_sgees( char* jobvs, char* sort, LAPACK_S_SELECT2 select,
                   lapack_int* n, float* a, lapack_int* lda, lapack_int* sdim,
                   float* wr, float* wi, float* vs, lapack_int* ldvs,
                   float* work, lapack_int* lwork, lapack_logical* bwork,
                   lapack_int *info );
void LAPACK_dgees( char* jobvs, char* sort, LAPACK_D_SELECT2 select,
                   lapack_int* n, double* a, lapack_int* lda, lapack_int* sdim,
                   double* wr, double* wi, double* vs, lapack_int* ldvs,
                   double* work, lapack_int* lwork, lapack_logical* bwork,
                   lapack_int *info );
void LAPACK_cgees( char* jobvs, char* sort, LAPACK_C_SELECT1 select,
                   lapack_int* n, lapack_complex_float* a, lapack_int* lda,
                   lapack_int* sdim, lapack_complex_float* w,
                   lapack_complex_float* vs, lapack_int* ldvs,
                   lapack_complex_float* work, lapack_int* lwork, float* rwork,
                   lapack_logical* bwork, lapack_int *info );
void LAPACK_zgees( char* jobvs, char* sort, LAPACK_Z_SELECT1 select,
                   lapack_int* n, lapack_complex_double* a, lapack_int* lda,
                   lapack_int* sdim, lapack_complex_double* w,
                   lapack_complex_double* vs, lapack_int* ldvs,
                   lapack_complex_double* work, lapack_int* lwork,
                   double* rwork, lapack_logical* bwork, lapack_int *info );
void LAPACK_sgeesx( char* jobvs, char* sort, LAPACK_S_SELECT2 select,
                    char* sense, lapack_int* n, float* a, lapack_int* lda,
                    lapack_int* sdim, float* wr, float* wi, float* vs,
                    lapack_int* ldvs, float* rconde, float* rcondv, float* work,
                    lapack_int* lwork, lapack_int* iwork, lapack_int* liwork,
                    lapack_logical* bwork, lapack_int *info );
void LAPACK_dgeesx( char* jobvs, char* sort, LAPACK_D_SELECT2 select,
                    char* sense, lapack_int* n, double* a, lapack_int* lda,
                    lapack_int* sdim, double* wr, double* wi, double* vs,
                    lapack_int* ldvs, double* rconde, double* rcondv,
                    double* work, lapack_int* lwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_logical* bwork,
                    lapack_int *info );
void LAPACK_cgeesx( char* jobvs, char* sort, LAPACK_C_SELECT1 select,
                    char* sense, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_int* sdim, lapack_complex_float* w,
                    lapack_complex_float* vs, lapack_int* ldvs, float* rconde,
                    float* rcondv, lapack_complex_float* work,
                    lapack_int* lwork, float* rwork, lapack_logical* bwork,
                    lapack_int *info );
void LAPACK_zgeesx( char* jobvs, char* sort, LAPACK_Z_SELECT1 select,
                    char* sense, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_int* sdim, lapack_complex_double* w,
                    lapack_complex_double* vs, lapack_int* ldvs, double* rconde,
                    double* rcondv, lapack_complex_double* work,
                    lapack_int* lwork, double* rwork, lapack_logical* bwork,
                    lapack_int *info );
void LAPACK_sgeev( char* jobvl, char* jobvr, lapack_int* n, float* a,
                   lapack_int* lda, float* wr, float* wi, float* vl,
                   lapack_int* ldvl, float* vr, lapack_int* ldvr, float* work,
                   lapack_int* lwork, lapack_int *info );
void LAPACK_dgeev( char* jobvl, char* jobvr, lapack_int* n, double* a,
                   lapack_int* lda, double* wr, double* wi, double* vl,
                   lapack_int* ldvl, double* vr, lapack_int* ldvr, double* work,
                   lapack_int* lwork, lapack_int *info );
void LAPACK_cgeev( char* jobvl, char* jobvr, lapack_int* n,
                   lapack_complex_float* a, lapack_int* lda,
                   lapack_complex_float* w, lapack_complex_float* vl,
                   lapack_int* ldvl, lapack_complex_float* vr, lapack_int* ldvr,
                   lapack_complex_float* work, lapack_int* lwork, float* rwork,
                   lapack_int *info );
void LAPACK_zgeev( char* jobvl, char* jobvr, lapack_int* n,
                   lapack_complex_double* a, lapack_int* lda,
                   lapack_complex_double* w, lapack_complex_double* vl,
                   lapack_int* ldvl, lapack_complex_double* vr,
                   lapack_int* ldvr, lapack_complex_double* work,
                   lapack_int* lwork, double* rwork, lapack_int *info );
void LAPACK_sgeevx( char* balanc, char* jobvl, char* jobvr, char* sense,
                    lapack_int* n, float* a, lapack_int* lda, float* wr,
                    float* wi, float* vl, lapack_int* ldvl, float* vr,
                    lapack_int* ldvr, lapack_int* ilo, lapack_int* ihi,
                    float* scale, float* abnrm, float* rconde, float* rcondv,
                    float* work, lapack_int* lwork, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_dgeevx( char* balanc, char* jobvl, char* jobvr, char* sense,
                    lapack_int* n, double* a, lapack_int* lda, double* wr,
                    double* wi, double* vl, lapack_int* ldvl, double* vr,
                    lapack_int* ldvr, lapack_int* ilo, lapack_int* ihi,
                    double* scale, double* abnrm, double* rconde,
                    double* rcondv, double* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_cgeevx( char* balanc, char* jobvl, char* jobvr, char* sense,
                    lapack_int* n, lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* w, lapack_complex_float* vl,
                    lapack_int* ldvl, lapack_complex_float* vr,
                    lapack_int* ldvr, lapack_int* ilo, lapack_int* ihi,
                    float* scale, float* abnrm, float* rconde, float* rcondv,
                    lapack_complex_float* work, lapack_int* lwork, float* rwork,
                    lapack_int *info );
void LAPACK_zgeevx( char* balanc, char* jobvl, char* jobvr, char* sense,
                    lapack_int* n, lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* w, lapack_complex_double* vl,
                    lapack_int* ldvl, lapack_complex_double* vr,
                    lapack_int* ldvr, lapack_int* ilo, lapack_int* ihi,
                    double* scale, double* abnrm, double* rconde,
                    double* rcondv, lapack_complex_double* work,
                    lapack_int* lwork, double* rwork, lapack_int *info );
void LAPACK_sgesvd( char* jobu, char* jobvt, lapack_int* m, lapack_int* n,
                    float* a, lapack_int* lda, float* s, float* u,
                    lapack_int* ldu, float* vt, lapack_int* ldvt, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_dgesvd( char* jobu, char* jobvt, lapack_int* m, lapack_int* n,
                    double* a, lapack_int* lda, double* s, double* u,
                    lapack_int* ldu, double* vt, lapack_int* ldvt, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_cgesvd( char* jobu, char* jobvt, lapack_int* m, lapack_int* n,
                    lapack_complex_float* a, lapack_int* lda, float* s,
                    lapack_complex_float* u, lapack_int* ldu,
                    lapack_complex_float* vt, lapack_int* ldvt,
                    lapack_complex_float* work, lapack_int* lwork, float* rwork,
                    lapack_int *info );
void LAPACK_zgesvd( char* jobu, char* jobvt, lapack_int* m, lapack_int* n,
                    lapack_complex_double* a, lapack_int* lda, double* s,
                    lapack_complex_double* u, lapack_int* ldu,
                    lapack_complex_double* vt, lapack_int* ldvt,
                    lapack_complex_double* work, lapack_int* lwork,
                    double* rwork, lapack_int *info );
void LAPACK_sgesdd( char* jobz, lapack_int* m, lapack_int* n, float* a,
                    lapack_int* lda, float* s, float* u, lapack_int* ldu,
                    float* vt, lapack_int* ldvt, float* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_dgesdd( char* jobz, lapack_int* m, lapack_int* n, double* a,
                    lapack_int* lda, double* s, double* u, lapack_int* ldu,
                    double* vt, lapack_int* ldvt, double* work,
                    lapack_int* lwork, lapack_int* iwork, lapack_int *info );
void LAPACK_cgesdd( char* jobz, lapack_int* m, lapack_int* n,
                    lapack_complex_float* a, lapack_int* lda, float* s,
                    lapack_complex_float* u, lapack_int* ldu,
                    lapack_complex_float* vt, lapack_int* ldvt,
                    lapack_complex_float* work, lapack_int* lwork, float* rwork,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_zgesdd( char* jobz, lapack_int* m, lapack_int* n,
                    lapack_complex_double* a, lapack_int* lda, double* s,
                    lapack_complex_double* u, lapack_int* ldu,
                    lapack_complex_double* vt, lapack_int* ldvt,
                    lapack_complex_double* work, lapack_int* lwork,
                    double* rwork, lapack_int* iwork, lapack_int *info );
void LAPACK_dgejsv( char* joba, char* jobu, char* jobv, char* jobr, char* jobt,
                    char* jobp, lapack_int* m, lapack_int* n, double* a,
                    lapack_int* lda, double* sva, double* u, lapack_int* ldu,
                    double* v, lapack_int* ldv, double* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_sgejsv( char* joba, char* jobu, char* jobv, char* jobr, char* jobt,
                    char* jobp, lapack_int* m, lapack_int* n, float* a,
                    lapack_int* lda, float* sva, float* u, lapack_int* ldu,
                    float* v, lapack_int* ldv, float* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_dgesvj( char* joba, char* jobu, char* jobv, lapack_int* m,
                    lapack_int* n, double* a, lapack_int* lda, double* sva,
                    lapack_int* mv, double* v, lapack_int* ldv, double* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_sgesvj( char* joba, char* jobu, char* jobv, lapack_int* m,
                    lapack_int* n, float* a, lapack_int* lda, float* sva,
                    lapack_int* mv, float* v, lapack_int* ldv, float* work,
                    lapack_int* lwork, lapack_int *info );
void LAPACK_sggsvd( char* jobu, char* jobv, char* jobq, lapack_int* m,
                    lapack_int* n, lapack_int* p, lapack_int* k, lapack_int* l,
                    float* a, lapack_int* lda, float* b, lapack_int* ldb,
                    float* alpha, float* beta, float* u, lapack_int* ldu,
                    float* v, lapack_int* ldv, float* q, lapack_int* ldq,
                    float* work, lapack_int* iwork, lapack_int *info );
void LAPACK_dggsvd( char* jobu, char* jobv, char* jobq, lapack_int* m,
                    lapack_int* n, lapack_int* p, lapack_int* k, lapack_int* l,
                    double* a, lapack_int* lda, double* b, lapack_int* ldb,
                    double* alpha, double* beta, double* u, lapack_int* ldu,
                    double* v, lapack_int* ldv, double* q, lapack_int* ldq,
                    double* work, lapack_int* iwork, lapack_int *info );
void LAPACK_cggsvd( char* jobu, char* jobv, char* jobq, lapack_int* m,
                    lapack_int* n, lapack_int* p, lapack_int* k, lapack_int* l,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* b, lapack_int* ldb, float* alpha,
                    float* beta, lapack_complex_float* u, lapack_int* ldu,
                    lapack_complex_float* v, lapack_int* ldv,
                    lapack_complex_float* q, lapack_int* ldq,
                    lapack_complex_float* work, float* rwork, lapack_int* iwork,
                    lapack_int *info );
void LAPACK_zggsvd( char* jobu, char* jobv, char* jobq, lapack_int* m,
                    lapack_int* n, lapack_int* p, lapack_int* k, lapack_int* l,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb, double* alpha,
                    double* beta, lapack_complex_double* u, lapack_int* ldu,
                    lapack_complex_double* v, lapack_int* ldv,
                    lapack_complex_double* q, lapack_int* ldq,
                    lapack_complex_double* work, double* rwork,
                    lapack_int* iwork, lapack_int *info );
void LAPACK_ssygv( lapack_int* itype, char* jobz, char* uplo, lapack_int* n,
                   float* a, lapack_int* lda, float* b, lapack_int* ldb,
                   float* w, float* work, lapack_int* lwork, lapack_int *info );
void LAPACK_dsygv( lapack_int* itype, char* jobz, char* uplo, lapack_int* n,
                   double* a, lapack_int* lda, double* b, lapack_int* ldb,
                   double* w, double* work, lapack_int* lwork,
                   lapack_int *info );
void LAPACK_chegv( lapack_int* itype, char* jobz, char* uplo, lapack_int* n,
                   lapack_complex_float* a, lapack_int* lda,
                   lapack_complex_float* b, lapack_int* ldb, float* w,
                   lapack_complex_float* work, lapack_int* lwork, float* rwork,
                   lapack_int *info );
void LAPACK_zhegv( lapack_int* itype, char* jobz, char* uplo, lapack_int* n,
                   lapack_complex_double* a, lapack_int* lda,
                   lapack_complex_double* b, lapack_int* ldb, double* w,
                   lapack_complex_double* work, lapack_int* lwork,
                   double* rwork, lapack_int *info );
void LAPACK_ssygvd( lapack_int* itype, char* jobz, char* uplo, lapack_int* n,
                    float* a, lapack_int* lda, float* b, lapack_int* ldb,
                    float* w, float* work, lapack_int* lwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_int *info );
void LAPACK_dsygvd( lapack_int* itype, char* jobz, char* uplo, lapack_int* n,
                    double* a, lapack_int* lda, double* b, lapack_int* ldb,
                    double* w, double* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_chegvd( lapack_int* itype, char* jobz, char* uplo, lapack_int* n,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* b, lapack_int* ldb, float* w,
                    lapack_complex_float* work, lapack_int* lwork, float* rwork,
                    lapack_int* lrwork, lapack_int* iwork, lapack_int* liwork,
                    lapack_int *info );
void LAPACK_zhegvd( lapack_int* itype, char* jobz, char* uplo, lapack_int* n,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb, double* w,
                    lapack_complex_double* work, lapack_int* lwork,
                    double* rwork, lapack_int* lrwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_int *info );
void LAPACK_ssygvx( lapack_int* itype, char* jobz, char* range, char* uplo,
                    lapack_int* n, float* a, lapack_int* lda, float* b,
                    lapack_int* ldb, float* vl, float* vu, lapack_int* il,
                    lapack_int* iu, float* abstol, lapack_int* m, float* w,
                    float* z, lapack_int* ldz, float* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* ifail, lapack_int *info );
void LAPACK_dsygvx( lapack_int* itype, char* jobz, char* range, char* uplo,
                    lapack_int* n, double* a, lapack_int* lda, double* b,
                    lapack_int* ldb, double* vl, double* vu, lapack_int* il,
                    lapack_int* iu, double* abstol, lapack_int* m, double* w,
                    double* z, lapack_int* ldz, double* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* ifail, lapack_int *info );
void LAPACK_chegvx( lapack_int* itype, char* jobz, char* range, char* uplo,
                    lapack_int* n, lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* b, lapack_int* ldb, float* vl,
                    float* vu, lapack_int* il, lapack_int* iu, float* abstol,
                    lapack_int* m, float* w, lapack_complex_float* z,
                    lapack_int* ldz, lapack_complex_float* work,
                    lapack_int* lwork, float* rwork, lapack_int* iwork,
                    lapack_int* ifail, lapack_int *info );
void LAPACK_zhegvx( lapack_int* itype, char* jobz, char* range, char* uplo,
                    lapack_int* n, lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb, double* vl,
                    double* vu, lapack_int* il, lapack_int* iu, double* abstol,
                    lapack_int* m, double* w, lapack_complex_double* z,
                    lapack_int* ldz, lapack_complex_double* work,
                    lapack_int* lwork, double* rwork, lapack_int* iwork,
                    lapack_int* ifail, lapack_int *info );
void LAPACK_sspgv( lapack_int* itype, char* jobz, char* uplo, lapack_int* n,
                   float* ap, float* bp, float* w, float* z, lapack_int* ldz,
                   float* work, lapack_int *info );
void LAPACK_dspgv( lapack_int* itype, char* jobz, char* uplo, lapack_int* n,
                   double* ap, double* bp, double* w, double* z,
                   lapack_int* ldz, double* work, lapack_int *info );
void LAPACK_chpgv( lapack_int* itype, char* jobz, char* uplo, lapack_int* n,
                   lapack_complex_float* ap, lapack_complex_float* bp, float* w,
                   lapack_complex_float* z, lapack_int* ldz,
                   lapack_complex_float* work, float* rwork, lapack_int *info );
void LAPACK_zhpgv( lapack_int* itype, char* jobz, char* uplo, lapack_int* n,
                   lapack_complex_double* ap, lapack_complex_double* bp,
                   double* w, lapack_complex_double* z, lapack_int* ldz,
                   lapack_complex_double* work, double* rwork,
                   lapack_int *info );
void LAPACK_sspgvd( lapack_int* itype, char* jobz, char* uplo, lapack_int* n,
                    float* ap, float* bp, float* w, float* z, lapack_int* ldz,
                    float* work, lapack_int* lwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_int *info );
void LAPACK_dspgvd( lapack_int* itype, char* jobz, char* uplo, lapack_int* n,
                    double* ap, double* bp, double* w, double* z,
                    lapack_int* ldz, double* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_int* liwork, lapack_int *info );
void LAPACK_chpgvd( lapack_int* itype, char* jobz, char* uplo, lapack_int* n,
                    lapack_complex_float* ap, lapack_complex_float* bp,
                    float* w, lapack_complex_float* z, lapack_int* ldz,
                    lapack_complex_float* work, lapack_int* lwork, float* rwork,
                    lapack_int* lrwork, lapack_int* iwork, lapack_int* liwork,
                    lapack_int *info );
void LAPACK_zhpgvd( lapack_int* itype, char* jobz, char* uplo, lapack_int* n,
                    lapack_complex_double* ap, lapack_complex_double* bp,
                    double* w, lapack_complex_double* z, lapack_int* ldz,
                    lapack_complex_double* work, lapack_int* lwork,
                    double* rwork, lapack_int* lrwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_int *info );
void LAPACK_sspgvx( lapack_int* itype, char* jobz, char* range, char* uplo,
                    lapack_int* n, float* ap, float* bp, float* vl, float* vu,
                    lapack_int* il, lapack_int* iu, float* abstol,
                    lapack_int* m, float* w, float* z, lapack_int* ldz,
                    float* work, lapack_int* iwork, lapack_int* ifail,
                    lapack_int *info );
void LAPACK_dspgvx( lapack_int* itype, char* jobz, char* range, char* uplo,
                    lapack_int* n, double* ap, double* bp, double* vl,
                    double* vu, lapack_int* il, lapack_int* iu, double* abstol,
                    lapack_int* m, double* w, double* z, lapack_int* ldz,
                    double* work, lapack_int* iwork, lapack_int* ifail,
                    lapack_int *info );
void LAPACK_chpgvx( lapack_int* itype, char* jobz, char* range, char* uplo,
                    lapack_int* n, lapack_complex_float* ap,
                    lapack_complex_float* bp, float* vl, float* vu,
                    lapack_int* il, lapack_int* iu, float* abstol,
                    lapack_int* m, float* w, lapack_complex_float* z,
                    lapack_int* ldz, lapack_complex_float* work, float* rwork,
                    lapack_int* iwork, lapack_int* ifail, lapack_int *info );
void LAPACK_zhpgvx( lapack_int* itype, char* jobz, char* range, char* uplo,
                    lapack_int* n, lapack_complex_double* ap,
                    lapack_complex_double* bp, double* vl, double* vu,
                    lapack_int* il, lapack_int* iu, double* abstol,
                    lapack_int* m, double* w, lapack_complex_double* z,
                    lapack_int* ldz, lapack_complex_double* work, double* rwork,
                    lapack_int* iwork, lapack_int* ifail, lapack_int *info );
void LAPACK_ssbgv( char* jobz, char* uplo, lapack_int* n, lapack_int* ka,
                   lapack_int* kb, float* ab, lapack_int* ldab, float* bb,
                   lapack_int* ldbb, float* w, float* z, lapack_int* ldz,
                   float* work, lapack_int *info );
void LAPACK_dsbgv( char* jobz, char* uplo, lapack_int* n, lapack_int* ka,
                   lapack_int* kb, double* ab, lapack_int* ldab, double* bb,
                   lapack_int* ldbb, double* w, double* z, lapack_int* ldz,
                   double* work, lapack_int *info );
void LAPACK_chbgv( char* jobz, char* uplo, lapack_int* n, lapack_int* ka,
                   lapack_int* kb, lapack_complex_float* ab, lapack_int* ldab,
                   lapack_complex_float* bb, lapack_int* ldbb, float* w,
                   lapack_complex_float* z, lapack_int* ldz,
                   lapack_complex_float* work, float* rwork, lapack_int *info );
void LAPACK_zhbgv( char* jobz, char* uplo, lapack_int* n, lapack_int* ka,
                   lapack_int* kb, lapack_complex_double* ab, lapack_int* ldab,
                   lapack_complex_double* bb, lapack_int* ldbb, double* w,
                   lapack_complex_double* z, lapack_int* ldz,
                   lapack_complex_double* work, double* rwork,
                   lapack_int *info );
void LAPACK_ssbgvd( char* jobz, char* uplo, lapack_int* n, lapack_int* ka,
                    lapack_int* kb, float* ab, lapack_int* ldab, float* bb,
                    lapack_int* ldbb, float* w, float* z, lapack_int* ldz,
                    float* work, lapack_int* lwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_int *info );
void LAPACK_dsbgvd( char* jobz, char* uplo, lapack_int* n, lapack_int* ka,
                    lapack_int* kb, double* ab, lapack_int* ldab, double* bb,
                    lapack_int* ldbb, double* w, double* z, lapack_int* ldz,
                    double* work, lapack_int* lwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_int *info );
void LAPACK_chbgvd( char* jobz, char* uplo, lapack_int* n, lapack_int* ka,
                    lapack_int* kb, lapack_complex_float* ab, lapack_int* ldab,
                    lapack_complex_float* bb, lapack_int* ldbb, float* w,
                    lapack_complex_float* z, lapack_int* ldz,
                    lapack_complex_float* work, lapack_int* lwork, float* rwork,
                    lapack_int* lrwork, lapack_int* iwork, lapack_int* liwork,
                    lapack_int *info );
void LAPACK_zhbgvd( char* jobz, char* uplo, lapack_int* n, lapack_int* ka,
                    lapack_int* kb, lapack_complex_double* ab, lapack_int* ldab,
                    lapack_complex_double* bb, lapack_int* ldbb, double* w,
                    lapack_complex_double* z, lapack_int* ldz,
                    lapack_complex_double* work, lapack_int* lwork,
                    double* rwork, lapack_int* lrwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_int *info );
void LAPACK_ssbgvx( char* jobz, char* range, char* uplo, lapack_int* n,
                    lapack_int* ka, lapack_int* kb, float* ab, lapack_int* ldab,
                    float* bb, lapack_int* ldbb, float* q, lapack_int* ldq,
                    float* vl, float* vu, lapack_int* il, lapack_int* iu,
                    float* abstol, lapack_int* m, float* w, float* z,
                    lapack_int* ldz, float* work, lapack_int* iwork,
                    lapack_int* ifail, lapack_int *info );
void LAPACK_dsbgvx( char* jobz, char* range, char* uplo, lapack_int* n,
                    lapack_int* ka, lapack_int* kb, double* ab,
                    lapack_int* ldab, double* bb, lapack_int* ldbb, double* q,
                    lapack_int* ldq, double* vl, double* vu, lapack_int* il,
                    lapack_int* iu, double* abstol, lapack_int* m, double* w,
                    double* z, lapack_int* ldz, double* work, lapack_int* iwork,
                    lapack_int* ifail, lapack_int *info );
void LAPACK_chbgvx( char* jobz, char* range, char* uplo, lapack_int* n,
                    lapack_int* ka, lapack_int* kb, lapack_complex_float* ab,
                    lapack_int* ldab, lapack_complex_float* bb,
                    lapack_int* ldbb, lapack_complex_float* q, lapack_int* ldq,
                    float* vl, float* vu, lapack_int* il, lapack_int* iu,
                    float* abstol, lapack_int* m, float* w,
                    lapack_complex_float* z, lapack_int* ldz,
                    lapack_complex_float* work, float* rwork, lapack_int* iwork,
                    lapack_int* ifail, lapack_int *info );
void LAPACK_zhbgvx( char* jobz, char* range, char* uplo, lapack_int* n,
                    lapack_int* ka, lapack_int* kb, lapack_complex_double* ab,
                    lapack_int* ldab, lapack_complex_double* bb,
                    lapack_int* ldbb, lapack_complex_double* q, lapack_int* ldq,
                    double* vl, double* vu, lapack_int* il, lapack_int* iu,
                    double* abstol, lapack_int* m, double* w,
                    lapack_complex_double* z, lapack_int* ldz,
                    lapack_complex_double* work, double* rwork,
                    lapack_int* iwork, lapack_int* ifail, lapack_int *info );
void LAPACK_sgges( char* jobvsl, char* jobvsr, char* sort,
                   LAPACK_S_SELECT3 selctg, lapack_int* n, float* a,
                   lapack_int* lda, float* b, lapack_int* ldb, lapack_int* sdim,
                   float* alphar, float* alphai, float* beta, float* vsl,
                   lapack_int* ldvsl, float* vsr, lapack_int* ldvsr,
                   float* work, lapack_int* lwork, lapack_logical* bwork,
                   lapack_int *info );
void LAPACK_dgges( char* jobvsl, char* jobvsr, char* sort,
                   LAPACK_D_SELECT3 selctg, lapack_int* n, double* a,
                   lapack_int* lda, double* b, lapack_int* ldb,
                   lapack_int* sdim, double* alphar, double* alphai,
                   double* beta, double* vsl, lapack_int* ldvsl, double* vsr,
                   lapack_int* ldvsr, double* work, lapack_int* lwork,
                   lapack_logical* bwork, lapack_int *info );
void LAPACK_cgges( char* jobvsl, char* jobvsr, char* sort,
                   LAPACK_C_SELECT2 selctg, lapack_int* n,
                   lapack_complex_float* a, lapack_int* lda,
                   lapack_complex_float* b, lapack_int* ldb, lapack_int* sdim,
                   lapack_complex_float* alpha, lapack_complex_float* beta,
                   lapack_complex_float* vsl, lapack_int* ldvsl,
                   lapack_complex_float* vsr, lapack_int* ldvsr,
                   lapack_complex_float* work, lapack_int* lwork, float* rwork,
                   lapack_logical* bwork, lapack_int *info );
void LAPACK_zgges( char* jobvsl, char* jobvsr, char* sort,
                   LAPACK_Z_SELECT2 selctg, lapack_int* n,
                   lapack_complex_double* a, lapack_int* lda,
                   lapack_complex_double* b, lapack_int* ldb, lapack_int* sdim,
                   lapack_complex_double* alpha, lapack_complex_double* beta,
                   lapack_complex_double* vsl, lapack_int* ldvsl,
                   lapack_complex_double* vsr, lapack_int* ldvsr,
                   lapack_complex_double* work, lapack_int* lwork,
                   double* rwork, lapack_logical* bwork, lapack_int *info );
void LAPACK_sggesx( char* jobvsl, char* jobvsr, char* sort,
                    LAPACK_S_SELECT3 selctg, char* sense, lapack_int* n,
                    float* a, lapack_int* lda, float* b, lapack_int* ldb,
                    lapack_int* sdim, float* alphar, float* alphai, float* beta,
                    float* vsl, lapack_int* ldvsl, float* vsr,
                    lapack_int* ldvsr, float* rconde, float* rcondv,
                    float* work, lapack_int* lwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_logical* bwork,
                    lapack_int *info );
void LAPACK_dggesx( char* jobvsl, char* jobvsr, char* sort,
                    LAPACK_D_SELECT3 selctg, char* sense, lapack_int* n,
                    double* a, lapack_int* lda, double* b, lapack_int* ldb,
                    lapack_int* sdim, double* alphar, double* alphai,
                    double* beta, double* vsl, lapack_int* ldvsl, double* vsr,
                    lapack_int* ldvsr, double* rconde, double* rcondv,
                    double* work, lapack_int* lwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_logical* bwork,
                    lapack_int *info );
void LAPACK_cggesx( char* jobvsl, char* jobvsr, char* sort,
                    LAPACK_C_SELECT2 selctg, char* sense, lapack_int* n,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* b, lapack_int* ldb, lapack_int* sdim,
                    lapack_complex_float* alpha, lapack_complex_float* beta,
                    lapack_complex_float* vsl, lapack_int* ldvsl,
                    lapack_complex_float* vsr, lapack_int* ldvsr, float* rconde,
                    float* rcondv, lapack_complex_float* work,
                    lapack_int* lwork, float* rwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_logical* bwork,
                    lapack_int *info );
void LAPACK_zggesx( char* jobvsl, char* jobvsr, char* sort,
                    LAPACK_Z_SELECT2 selctg, char* sense, lapack_int* n,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb, lapack_int* sdim,
                    lapack_complex_double* alpha, lapack_complex_double* beta,
                    lapack_complex_double* vsl, lapack_int* ldvsl,
                    lapack_complex_double* vsr, lapack_int* ldvsr,
                    double* rconde, double* rcondv, lapack_complex_double* work,
                    lapack_int* lwork, double* rwork, lapack_int* iwork,
                    lapack_int* liwork, lapack_logical* bwork,
                    lapack_int *info );
void LAPACK_sggev( char* jobvl, char* jobvr, lapack_int* n, float* a,
                   lapack_int* lda, float* b, lapack_int* ldb, float* alphar,
                   float* alphai, float* beta, float* vl, lapack_int* ldvl,
                   float* vr, lapack_int* ldvr, float* work, lapack_int* lwork,
                   lapack_int *info );
void LAPACK_dggev( char* jobvl, char* jobvr, lapack_int* n, double* a,
                   lapack_int* lda, double* b, lapack_int* ldb, double* alphar,
                   double* alphai, double* beta, double* vl, lapack_int* ldvl,
                   double* vr, lapack_int* ldvr, double* work,
                   lapack_int* lwork, lapack_int *info );
void LAPACK_cggev( char* jobvl, char* jobvr, lapack_int* n,
                   lapack_complex_float* a, lapack_int* lda,
                   lapack_complex_float* b, lapack_int* ldb,
                   lapack_complex_float* alpha, lapack_complex_float* beta,
                   lapack_complex_float* vl, lapack_int* ldvl,
                   lapack_complex_float* vr, lapack_int* ldvr,
                   lapack_complex_float* work, lapack_int* lwork, float* rwork,
                   lapack_int *info );
void LAPACK_zggev( char* jobvl, char* jobvr, lapack_int* n,
                   lapack_complex_double* a, lapack_int* lda,
                   lapack_complex_double* b, lapack_int* ldb,
                   lapack_complex_double* alpha, lapack_complex_double* beta,
                   lapack_complex_double* vl, lapack_int* ldvl,
                   lapack_complex_double* vr, lapack_int* ldvr,
                   lapack_complex_double* work, lapack_int* lwork,
                   double* rwork, lapack_int *info );
void LAPACK_sggevx( char* balanc, char* jobvl, char* jobvr, char* sense,
                    lapack_int* n, float* a, lapack_int* lda, float* b,
                    lapack_int* ldb, float* alphar, float* alphai, float* beta,
                    float* vl, lapack_int* ldvl, float* vr, lapack_int* ldvr,
                    lapack_int* ilo, lapack_int* ihi, float* lscale,
                    float* rscale, float* abnrm, float* bbnrm, float* rconde,
                    float* rcondv, float* work, lapack_int* lwork,
                    lapack_int* iwork, lapack_logical* bwork,
                    lapack_int *info );
void LAPACK_dggevx( char* balanc, char* jobvl, char* jobvr, char* sense,
                    lapack_int* n, double* a, lapack_int* lda, double* b,
                    lapack_int* ldb, double* alphar, double* alphai,
                    double* beta, double* vl, lapack_int* ldvl, double* vr,
                    lapack_int* ldvr, lapack_int* ilo, lapack_int* ihi,
                    double* lscale, double* rscale, double* abnrm,
                    double* bbnrm, double* rconde, double* rcondv, double* work,
                    lapack_int* lwork, lapack_int* iwork, lapack_logical* bwork,
                    lapack_int *info );
void LAPACK_cggevx( char* balanc, char* jobvl, char* jobvr, char* sense,
                    lapack_int* n, lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* alpha, lapack_complex_float* beta,
                    lapack_complex_float* vl, lapack_int* ldvl,
                    lapack_complex_float* vr, lapack_int* ldvr, lapack_int* ilo,
                    lapack_int* ihi, float* lscale, float* rscale, float* abnrm,
                    float* bbnrm, float* rconde, float* rcondv,
                    lapack_complex_float* work, lapack_int* lwork, float* rwork,
                    lapack_int* iwork, lapack_logical* bwork,
                    lapack_int *info );
void LAPACK_zggevx( char* balanc, char* jobvl, char* jobvr, char* sense,
                    lapack_int* n, lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* alpha, lapack_complex_double* beta,
                    lapack_complex_double* vl, lapack_int* ldvl,
                    lapack_complex_double* vr, lapack_int* ldvr,
                    lapack_int* ilo, lapack_int* ihi, double* lscale,
                    double* rscale, double* abnrm, double* bbnrm,
                    double* rconde, double* rcondv, lapack_complex_double* work,
                    lapack_int* lwork, double* rwork, lapack_int* iwork,
                    lapack_logical* bwork, lapack_int *info );
void LAPACK_dsfrk( char* transr, char* uplo, char* trans, lapack_int* n,
                   lapack_int* k, double* alpha, const double* a,
                   lapack_int* lda, double* beta, double* c );
void LAPACK_ssfrk( char* transr, char* uplo, char* trans, lapack_int* n,
                   lapack_int* k, float* alpha, const float* a, lapack_int* lda,
                   float* beta, float* c );
void LAPACK_zhfrk( char* transr, char* uplo, char* trans, lapack_int* n,
                   lapack_int* k, double* alpha, const lapack_complex_double* a,
                   lapack_int* lda, double* beta, lapack_complex_double* c );
void LAPACK_chfrk( char* transr, char* uplo, char* trans, lapack_int* n,
                   lapack_int* k, float* alpha, const lapack_complex_float* a,
                   lapack_int* lda, float* beta, lapack_complex_float* c );
void LAPACK_dtfsm( char* transr, char* side, char* uplo, char* trans,
                   char* diag, lapack_int* m, lapack_int* n, double* alpha,
                   const double* a, double* b, lapack_int* ldb );
void LAPACK_stfsm( char* transr, char* side, char* uplo, char* trans,
                   char* diag, lapack_int* m, lapack_int* n, float* alpha,
                   const float* a, float* b, lapack_int* ldb );
void LAPACK_ztfsm( char* transr, char* side, char* uplo, char* trans,
                   char* diag, lapack_int* m, lapack_int* n,
                   lapack_complex_double* alpha, const lapack_complex_double* a,
                   lapack_complex_double* b, lapack_int* ldb );
void LAPACK_ctfsm( char* transr, char* side, char* uplo, char* trans,
                   char* diag, lapack_int* m, lapack_int* n,
                   lapack_complex_float* alpha, const lapack_complex_float* a,
                   lapack_complex_float* b, lapack_int* ldb );
void LAPACK_dtfttp( char* transr, char* uplo, lapack_int* n, const double* arf,
                    double* ap, lapack_int *info );
void LAPACK_stfttp( char* transr, char* uplo, lapack_int* n, const float* arf,
                    float* ap, lapack_int *info );
void LAPACK_ztfttp( char* transr, char* uplo, lapack_int* n,
                    const lapack_complex_double* arf, lapack_complex_double* ap,
                    lapack_int *info );
void LAPACK_ctfttp( char* transr, char* uplo, lapack_int* n,
                    const lapack_complex_float* arf, lapack_complex_float* ap,
                    lapack_int *info );
void LAPACK_dtfttr( char* transr, char* uplo, lapack_int* n, const double* arf,
                    double* a, lapack_int* lda, lapack_int *info );
void LAPACK_stfttr( char* transr, char* uplo, lapack_int* n, const float* arf,
                    float* a, lapack_int* lda, lapack_int *info );
void LAPACK_ztfttr( char* transr, char* uplo, lapack_int* n,
                    const lapack_complex_double* arf, lapack_complex_double* a,
                    lapack_int* lda, lapack_int *info );
void LAPACK_ctfttr( char* transr, char* uplo, lapack_int* n,
                    const lapack_complex_float* arf, lapack_complex_float* a,
                    lapack_int* lda, lapack_int *info );
void LAPACK_dtpttf( char* transr, char* uplo, lapack_int* n, const double* ap,
                    double* arf, lapack_int *info );
void LAPACK_stpttf( char* transr, char* uplo, lapack_int* n, const float* ap,
                    float* arf, lapack_int *info );
void LAPACK_ztpttf( char* transr, char* uplo, lapack_int* n,
                    const lapack_complex_double* ap, lapack_complex_double* arf,
                    lapack_int *info );
void LAPACK_ctpttf( char* transr, char* uplo, lapack_int* n,
                    const lapack_complex_float* ap, lapack_complex_float* arf,
                    lapack_int *info );
void LAPACK_dtpttr( char* uplo, lapack_int* n, const double* ap, double* a,
                    lapack_int* lda, lapack_int *info );
void LAPACK_stpttr( char* uplo, lapack_int* n, const float* ap, float* a,
                    lapack_int* lda, lapack_int *info );
void LAPACK_ztpttr( char* uplo, lapack_int* n, const lapack_complex_double* ap,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_int *info );
void LAPACK_ctpttr( char* uplo, lapack_int* n, const lapack_complex_float* ap,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_int *info );
void LAPACK_dtrttf( char* transr, char* uplo, lapack_int* n, const double* a,
                    lapack_int* lda, double* arf, lapack_int *info );
void LAPACK_strttf( char* transr, char* uplo, lapack_int* n, const float* a,
                    lapack_int* lda, float* arf, lapack_int *info );
void LAPACK_ztrttf( char* transr, char* uplo, lapack_int* n,
                    const lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* arf, lapack_int *info );
void LAPACK_ctrttf( char* transr, char* uplo, lapack_int* n,
                    const lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* arf, lapack_int *info );
void LAPACK_dtrttp( char* uplo, lapack_int* n, const double* a, lapack_int* lda,
                    double* ap, lapack_int *info );
void LAPACK_strttp( char* uplo, lapack_int* n, const float* a, lapack_int* lda,
                    float* ap, lapack_int *info );
void LAPACK_ztrttp( char* uplo, lapack_int* n, const lapack_complex_double* a,
                    lapack_int* lda, lapack_complex_double* ap,
                    lapack_int *info );
void LAPACK_ctrttp( char* uplo, lapack_int* n, const lapack_complex_float* a,
                    lapack_int* lda, lapack_complex_float* ap,
                    lapack_int *info );
void LAPACK_sgeqrfp( lapack_int* m, lapack_int* n, float* a, lapack_int* lda,
                     float* tau, float* work, lapack_int* lwork,
                     lapack_int *info );
void LAPACK_dgeqrfp( lapack_int* m, lapack_int* n, double* a, lapack_int* lda,
                     double* tau, double* work, lapack_int* lwork,
                     lapack_int *info );
void LAPACK_cgeqrfp( lapack_int* m, lapack_int* n, lapack_complex_float* a,
                     lapack_int* lda, lapack_complex_float* tau,
                     lapack_complex_float* work, lapack_int* lwork,
                     lapack_int *info );
void LAPACK_zgeqrfp( lapack_int* m, lapack_int* n, lapack_complex_double* a,
                     lapack_int* lda, lapack_complex_double* tau,
                     lapack_complex_double* work, lapack_int* lwork,
                     lapack_int *info );
void LAPACK_clacgv( lapack_int* n, lapack_complex_float* x, lapack_int* incx );
void LAPACK_zlacgv( lapack_int* n, lapack_complex_double* x, lapack_int* incx );
void LAPACK_slarnv( lapack_int* idist, lapack_int* iseed, lapack_int* n,
                    float* x );
void LAPACK_dlarnv( lapack_int* idist, lapack_int* iseed, lapack_int* n,
                    double* x );
void LAPACK_clarnv( lapack_int* idist, lapack_int* iseed, lapack_int* n,
                    lapack_complex_float* x );
void LAPACK_zlarnv( lapack_int* idist, lapack_int* iseed, lapack_int* n,
                    lapack_complex_double* x );
void LAPACK_sgeqr2( lapack_int* m, lapack_int* n, float* a, lapack_int* lda,
                    float* tau, float* work, lapack_int *info );
void LAPACK_dgeqr2( lapack_int* m, lapack_int* n, double* a, lapack_int* lda,
                    double* tau, double* work, lapack_int *info );
void LAPACK_cgeqr2( lapack_int* m, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_complex_float* tau,
                    lapack_complex_float* work, lapack_int *info );
void LAPACK_zgeqr2( lapack_int* m, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_complex_double* tau,
                    lapack_complex_double* work, lapack_int *info );
void LAPACK_slacn2( lapack_int* n, float* v, float* x, lapack_int* isgn,
                    float* est, lapack_int* kase, lapack_int* isave );
void LAPACK_dlacn2( lapack_int* n, double* v, double* x, lapack_int* isgn,
                    double* est, lapack_int* kase, lapack_int* isave );
void LAPACK_clacn2( lapack_int* n, lapack_complex_float* v,
                    lapack_complex_float* x, float* est,
                    lapack_int* kase, lapack_int* isave );
void LAPACK_zlacn2( lapack_int* n, lapack_complex_double* v,
                    lapack_complex_double* x, double* est,
                    lapack_int* kase, lapack_int* isave );
void LAPACK_slacpy( char* uplo, lapack_int* m, lapack_int* n, const float* a,
                    lapack_int* lda, float* b, lapack_int* ldb );
void LAPACK_dlacpy( char* uplo, lapack_int* m, lapack_int* n, const double* a,
                    lapack_int* lda, double* b, lapack_int* ldb );
void LAPACK_clacpy( char* uplo, lapack_int* m, lapack_int* n,
                    const lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* b, lapack_int* ldb );
void LAPACK_zlacpy( char* uplo, lapack_int* m, lapack_int* n,
                    const lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb );

void LAPACK_clacp2( char* uplo, lapack_int* m, lapack_int* n, const float* a,
                    lapack_int* lda, lapack_complex_float* b, lapack_int* ldb );
void LAPACK_zlacp2( char* uplo, lapack_int* m, lapack_int* n, const double* a,
                    lapack_int* lda, lapack_complex_double* b,
                    lapack_int* ldb );

void LAPACK_sgetf2( lapack_int* m, lapack_int* n, float* a, lapack_int* lda,
                    lapack_int* ipiv, lapack_int *info );
void LAPACK_dgetf2( lapack_int* m, lapack_int* n, double* a, lapack_int* lda,
                    lapack_int* ipiv, lapack_int *info );
void LAPACK_cgetf2( lapack_int* m, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_int* ipiv, lapack_int *info );
void LAPACK_zgetf2( lapack_int* m, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_int* ipiv, lapack_int *info );
void LAPACK_slaswp( lapack_int* n, float* a, lapack_int* lda, lapack_int* k1,
                    lapack_int* k2, const lapack_int* ipiv, lapack_int* incx );
void LAPACK_dlaswp( lapack_int* n, double* a, lapack_int* lda, lapack_int* k1,
                    lapack_int* k2, const lapack_int* ipiv, lapack_int* incx );
void LAPACK_claswp( lapack_int* n, lapack_complex_float* a, lapack_int* lda,
                    lapack_int* k1, lapack_int* k2, const lapack_int* ipiv,
                    lapack_int* incx );
void LAPACK_zlaswp( lapack_int* n, lapack_complex_double* a, lapack_int* lda,
                    lapack_int* k1, lapack_int* k2, const lapack_int* ipiv,
                    lapack_int* incx );
float LAPACK_slange( char* norm, lapack_int* m, lapack_int* n, const float* a,
                    lapack_int* lda, float* work );
double LAPACK_dlange( char* norm, lapack_int* m, lapack_int* n, const double* a,
                    lapack_int* lda, double* work );
float LAPACK_clange( char* norm, lapack_int* m, lapack_int* n,
                    const lapack_complex_float* a, lapack_int* lda, float* work );
double LAPACK_zlange( char* norm, lapack_int* m, lapack_int* n,
                    const lapack_complex_double* a, lapack_int* lda, double* work );
float LAPACK_clanhe( char* norm, char* uplo, lapack_int* n,
                    const lapack_complex_float* a, lapack_int* lda, float* work );
double LAPACK_zlanhe( char* norm, char* uplo, lapack_int* n,
                    const lapack_complex_double* a, lapack_int* lda, double* work );
float LAPACK_slansy( char* norm, char* uplo, lapack_int* n, const float* a,
                    lapack_int* lda, float* work );
double LAPACK_dlansy( char* norm, char* uplo, lapack_int* n, const double* a,
                    lapack_int* lda, double* work );
float LAPACK_clansy( char* norm, char* uplo, lapack_int* n,
                    const lapack_complex_float* a, lapack_int* lda, float* work );
double LAPACK_zlansy( char* norm, char* uplo, lapack_int* n,
                    const lapack_complex_double* a, lapack_int* lda, double* work );
float LAPACK_slantr( char* norm, char* uplo, char* diag, lapack_int* m,
                    lapack_int* n, const float* a, lapack_int* lda, float* work );
double LAPACK_dlantr( char* norm, char* uplo, char* diag, lapack_int* m,
                    lapack_int* n, const double* a, lapack_int* lda, double* work );
float LAPACK_clantr( char* norm, char* uplo, char* diag, lapack_int* m,
                    lapack_int* n, const lapack_complex_float* a, lapack_int* lda,
                    float* work );
double LAPACK_zlantr( char* norm, char* uplo, char* diag, lapack_int* m,
                    lapack_int* n, const lapack_complex_double* a, lapack_int* lda,
                    double* work );
float LAPACK_slamch( char* cmach );
double LAPACK_dlamch( char* cmach );
void LAPACK_sgelq2( lapack_int* m, lapack_int* n, float* a, lapack_int* lda,
                    float* tau, float* work, lapack_int *info );
void LAPACK_dgelq2( lapack_int* m, lapack_int* n, double* a, lapack_int* lda,
                    double* tau, double* work, lapack_int *info );
void LAPACK_cgelq2( lapack_int* m, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_complex_float* tau,
                    lapack_complex_float* work, lapack_int *info );
void LAPACK_zgelq2( lapack_int* m, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_complex_double* tau,
                    lapack_complex_double* work, lapack_int *info );
void LAPACK_slarfb( char* side, char* trans, char* direct, char* storev,
                    lapack_int* m, lapack_int* n, lapack_int* k, const float* v,
                    lapack_int* ldv, const float* t, lapack_int* ldt, float* c,
                    lapack_int* ldc, float* work, lapack_int* ldwork );
void LAPACK_dlarfb( char* side, char* trans, char* direct, char* storev,
                    lapack_int* m, lapack_int* n, lapack_int* k,
                    const double* v, lapack_int* ldv, const double* t,
                    lapack_int* ldt, double* c, lapack_int* ldc, double* work,
                    lapack_int* ldwork );
void LAPACK_clarfb( char* side, char* trans, char* direct, char* storev,
                    lapack_int* m, lapack_int* n, lapack_int* k,
                    const lapack_complex_float* v, lapack_int* ldv,
                    const lapack_complex_float* t, lapack_int* ldt,
                    lapack_complex_float* c, lapack_int* ldc,
                    lapack_complex_float* work, lapack_int* ldwork );
void LAPACK_zlarfb( char* side, char* trans, char* direct, char* storev,
                    lapack_int* m, lapack_int* n, lapack_int* k,
                    const lapack_complex_double* v, lapack_int* ldv,
                    const lapack_complex_double* t, lapack_int* ldt,
                    lapack_complex_double* c, lapack_int* ldc,
                    lapack_complex_double* work, lapack_int* ldwork );
void LAPACK_slarfg( lapack_int* n, float* alpha, float* x, lapack_int* incx,
                    float* tau );
void LAPACK_dlarfg( lapack_int* n, double* alpha, double* x, lapack_int* incx,
                    double* tau );
void LAPACK_clarfg( lapack_int* n, lapack_complex_float* alpha,
                    lapack_complex_float* x, lapack_int* incx,
                    lapack_complex_float* tau );
void LAPACK_zlarfg( lapack_int* n, lapack_complex_double* alpha,
                    lapack_complex_double* x, lapack_int* incx,
                    lapack_complex_double* tau );
void LAPACK_slarft( char* direct, char* storev, lapack_int* n, lapack_int* k,
                    const float* v, lapack_int* ldv, const float* tau, float* t,
                    lapack_int* ldt );
void LAPACK_dlarft( char* direct, char* storev, lapack_int* n, lapack_int* k,
                    const double* v, lapack_int* ldv, const double* tau,
                    double* t, lapack_int* ldt );
void LAPACK_clarft( char* direct, char* storev, lapack_int* n, lapack_int* k,
                    const lapack_complex_float* v, lapack_int* ldv,
                    const lapack_complex_float* tau, lapack_complex_float* t,
                    lapack_int* ldt );
void LAPACK_zlarft( char* direct, char* storev, lapack_int* n, lapack_int* k,
                    const lapack_complex_double* v, lapack_int* ldv,
                    const lapack_complex_double* tau, lapack_complex_double* t,
                    lapack_int* ldt );
void LAPACK_slarfx( char* side, lapack_int* m, lapack_int* n, const float* v,
                    float* tau, float* c, lapack_int* ldc, float* work );
void LAPACK_dlarfx( char* side, lapack_int* m, lapack_int* n, const double* v,
                    double* tau, double* c, lapack_int* ldc, double* work );
void LAPACK_clarfx( char* side, lapack_int* m, lapack_int* n,
                    const lapack_complex_float* v, lapack_complex_float* tau,
                    lapack_complex_float* c, lapack_int* ldc,
                    lapack_complex_float* work );
void LAPACK_zlarfx( char* side, lapack_int* m, lapack_int* n,
                    const lapack_complex_double* v, lapack_complex_double* tau,
                    lapack_complex_double* c, lapack_int* ldc,
                    lapack_complex_double* work );
void LAPACK_slatms( lapack_int* m, lapack_int* n, char* dist, lapack_int* iseed,
                    char* sym, float* d, lapack_int* mode, float* cond,
                    float* dmax, lapack_int* kl, lapack_int* ku, char* pack,
                    float* a, lapack_int* lda, float* work, lapack_int *info );
void LAPACK_dlatms( lapack_int* m, lapack_int* n, char* dist, lapack_int* iseed,
                    char* sym, double* d, lapack_int* mode, double* cond,
                    double* dmax, lapack_int* kl, lapack_int* ku, char* pack,
                    double* a, lapack_int* lda, double* work,
                    lapack_int *info );
void LAPACK_clatms( lapack_int* m, lapack_int* n, char* dist, lapack_int* iseed,
                    char* sym, float* d, lapack_int* mode, float* cond,
                    float* dmax, lapack_int* kl, lapack_int* ku, char* pack,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* work, lapack_int *info );
void LAPACK_zlatms( lapack_int* m, lapack_int* n, char* dist, lapack_int* iseed,
                    char* sym, double* d, lapack_int* mode, double* cond,
                    double* dmax, lapack_int* kl, lapack_int* ku, char* pack,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* work, lapack_int *info );
void LAPACK_slag2d( lapack_int* m, lapack_int* n, const float* sa,
                    lapack_int* ldsa, double* a, lapack_int* lda,
                    lapack_int *info );
void LAPACK_dlag2s( lapack_int* m, lapack_int* n, const double* a,
                    lapack_int* lda, float* sa, lapack_int* ldsa,
                    lapack_int *info );
void LAPACK_clag2z( lapack_int* m, lapack_int* n,
                    const lapack_complex_float* sa, lapack_int* ldsa,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_int *info );
void LAPACK_zlag2c( lapack_int* m, lapack_int* n,
                    const lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_float* sa, lapack_int* ldsa,
                    lapack_int *info );
void LAPACK_slauum( char* uplo, lapack_int* n, float* a, lapack_int* lda,
                    lapack_int *info );
void LAPACK_dlauum( char* uplo, lapack_int* n, double* a, lapack_int* lda,
                    lapack_int *info );
void LAPACK_clauum( char* uplo, lapack_int* n, lapack_complex_float* a,
                    lapack_int* lda, lapack_int *info );
void LAPACK_zlauum( char* uplo, lapack_int* n, lapack_complex_double* a,
                    lapack_int* lda, lapack_int *info );
void LAPACK_slagge( lapack_int* m, lapack_int* n, lapack_int* kl,
                    lapack_int* ku, const float* d, float* a, lapack_int* lda,
                    lapack_int* iseed, float* work, lapack_int *info );
void LAPACK_dlagge( lapack_int* m, lapack_int* n, lapack_int* kl,
                    lapack_int* ku, const double* d, double* a, lapack_int* lda,
                    lapack_int* iseed, double* work, lapack_int *info );
void LAPACK_clagge( lapack_int* m, lapack_int* n, lapack_int* kl,
                    lapack_int* ku, const float* d, lapack_complex_float* a,
                    lapack_int* lda, lapack_int* iseed,
                    lapack_complex_float* work, lapack_int *info );
void LAPACK_zlagge( lapack_int* m, lapack_int* n, lapack_int* kl,
                    lapack_int* ku, const double* d, lapack_complex_double* a,
                    lapack_int* lda, lapack_int* iseed,
                    lapack_complex_double* work, lapack_int *info );
void LAPACK_slaset( char* uplo, lapack_int* m, lapack_int* n, float* alpha,
                    float* beta, float* a, lapack_int* lda );
void LAPACK_dlaset( char* uplo, lapack_int* m, lapack_int* n, double* alpha,
                    double* beta, double* a, lapack_int* lda );
void LAPACK_claset( char* uplo, lapack_int* m, lapack_int* n,
                    lapack_complex_float* alpha, lapack_complex_float* beta,
                    lapack_complex_float* a, lapack_int* lda );
void LAPACK_zlaset( char* uplo, lapack_int* m, lapack_int* n,
                    lapack_complex_double* alpha, lapack_complex_double* beta,
                    lapack_complex_double* a, lapack_int* lda );
void LAPACK_slasrt( char* id, lapack_int* n, float* d, lapack_int *info );
void LAPACK_dlasrt( char* id, lapack_int* n, double* d, lapack_int *info );
void LAPACK_claghe( lapack_int* n, lapack_int* k, const float* d,
                    lapack_complex_float* a, lapack_int* lda, lapack_int* iseed,
                    lapack_complex_float* work, lapack_int *info );
void LAPACK_zlaghe( lapack_int* n, lapack_int* k, const double* d,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_int* iseed, lapack_complex_double* work,
                    lapack_int *info );
void LAPACK_slagsy( lapack_int* n, lapack_int* k, const float* d, float* a,
                    lapack_int* lda, lapack_int* iseed, float* work,
                    lapack_int *info );
void LAPACK_dlagsy( lapack_int* n, lapack_int* k, const double* d, double* a,
                    lapack_int* lda, lapack_int* iseed, double* work,
                    lapack_int *info );
void LAPACK_clagsy( lapack_int* n, lapack_int* k, const float* d,
                    lapack_complex_float* a, lapack_int* lda, lapack_int* iseed,
                    lapack_complex_float* work, lapack_int *info );
void LAPACK_zlagsy( lapack_int* n, lapack_int* k, const double* d,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_int* iseed, lapack_complex_double* work,
                    lapack_int *info );
void LAPACK_slapmr( lapack_logical* forwrd, lapack_int* m, lapack_int* n,
                    float* x, lapack_int* ldx, lapack_int* k );
void LAPACK_dlapmr( lapack_logical* forwrd, lapack_int* m, lapack_int* n,
                    double* x, lapack_int* ldx, lapack_int* k );
void LAPACK_clapmr( lapack_logical* forwrd, lapack_int* m, lapack_int* n,
                    lapack_complex_float* x, lapack_int* ldx, lapack_int* k );
void LAPACK_zlapmr( lapack_logical* forwrd, lapack_int* m, lapack_int* n,
                    lapack_complex_double* x, lapack_int* ldx, lapack_int* k );
float LAPACK_slapy2( float* x, float* y );
double LAPACK_dlapy2( double* x, double* y );
float LAPACK_slapy3( float* x, float* y, float* z );
double LAPACK_dlapy3( double* x, double* y, double* z );
void LAPACK_slartgp( float* f, float* g, float* cs, float* sn, float* r );
void LAPACK_dlartgp( double* f, double* g, double* cs, double* sn, double* r );
void LAPACK_slartgs( float* x, float* y, float* sigma, float* cs, float* sn );
void LAPACK_dlartgs( double* x, double* y, double* sigma, double* cs,
                     double* sn );
// LAPACK 3.3.0
void LAPACK_cbbcsd( char* jobu1, char* jobu2,
                    char* jobv1t, char* jobv2t, char* trans,
                    lapack_int* m, lapack_int* p, lapack_int* q,
                    float* theta, float* phi,
                    lapack_complex_float* u1, lapack_int* ldu1,
                    lapack_complex_float* u2, lapack_int* ldu2,
                    lapack_complex_float* v1t, lapack_int* ldv1t,
                    lapack_complex_float* v2t, lapack_int* ldv2t,
                    float* b11d, float* b11e, float* b12d,
                    float* b12e, float* b21d, float* b21e,
                    float* b22d, float* b22e, float* rwork,
                    lapack_int* lrwork , lapack_int *info );
void LAPACK_cheswapr( char* uplo, lapack_int* n,
                      lapack_complex_float* a, lapack_int* i1,
                      lapack_int* i2 );
void LAPACK_chetri2( char* uplo, lapack_int* n,
                     lapack_complex_float* a, lapack_int* lda,
                     const lapack_int* ipiv,
                     lapack_complex_float* work, lapack_int* lwork , lapack_int *info );
void LAPACK_chetri2x( char* uplo, lapack_int* n,
                      lapack_complex_float* a, lapack_int* lda,
                      const lapack_int* ipiv,
                      lapack_complex_float* work, lapack_int* nb , lapack_int *info );
void LAPACK_chetrs2( char* uplo, lapack_int* n,
                     lapack_int* nrhs, const lapack_complex_float* a,
                     lapack_int* lda, const lapack_int* ipiv,
                     lapack_complex_float* b, lapack_int* ldb,
                     lapack_complex_float* work , lapack_int *info );
void LAPACK_csyconv( char* uplo, char* way,
                     lapack_int* n, lapack_complex_float* a,
                     lapack_int* lda, const lapack_int* ipiv,
                     lapack_complex_float* work , lapack_int *info );
void LAPACK_csyswapr( char* uplo, lapack_int* n,
                      lapack_complex_float* a, lapack_int* i1,
                      lapack_int* i2 );
void LAPACK_csytri2( char* uplo, lapack_int* n,
                     lapack_complex_float* a, lapack_int* lda,
                     const lapack_int* ipiv,
                     lapack_complex_float* work, lapack_int* lwork , lapack_int *info );
void LAPACK_csytri2x( char* uplo, lapack_int* n,
                      lapack_complex_float* a, lapack_int* lda,
                      const lapack_int* ipiv,
                      lapack_complex_float* work, lapack_int* nb , lapack_int *info );
void LAPACK_csytrs2( char* uplo, lapack_int* n,
                     lapack_int* nrhs, const lapack_complex_float* a,
                     lapack_int* lda, const lapack_int* ipiv,
                     lapack_complex_float* b, lapack_int* ldb,
                     lapack_complex_float* work , lapack_int *info );
void LAPACK_cunbdb( char* trans, char* signs,
                    lapack_int* m, lapack_int* p, lapack_int* q,
                    lapack_complex_float* x11, lapack_int* ldx11,
                    lapack_complex_float* x12, lapack_int* ldx12,
                    lapack_complex_float* x21, lapack_int* ldx21,
                    lapack_complex_float* x22, lapack_int* ldx22,
                    float* theta, float* phi,
                    lapack_complex_float* taup1,
                    lapack_complex_float* taup2,
                    lapack_complex_float* tauq1,
                    lapack_complex_float* tauq2,
                    lapack_complex_float* work, lapack_int* lwork , lapack_int *info );
void LAPACK_cuncsd( char* jobu1, char* jobu2,
                    char* jobv1t, char* jobv2t, char* trans,
                    char* signs, lapack_int* m, lapack_int* p,
                    lapack_int* q, lapack_complex_float* x11,
                    lapack_int* ldx11, lapack_complex_float* x12,
                    lapack_int* ldx12, lapack_complex_float* x21,
                    lapack_int* ldx21, lapack_complex_float* x22,
                    lapack_int* ldx22, float* theta,
                    lapack_complex_float* u1, lapack_int* ldu1,
                    lapack_complex_float* u2, lapack_int* ldu2,
                    lapack_complex_float* v1t, lapack_int* ldv1t,
                    lapack_complex_float* v2t, lapack_int* ldv2t,
                    lapack_complex_float* work, lapack_int* lwork,
                    float* rwork, lapack_int* lrwork,
                    lapack_int* iwork , lapack_int *info );
void LAPACK_dbbcsd( char* jobu1, char* jobu2,
                    char* jobv1t, char* jobv2t, char* trans,
                    lapack_int* m, lapack_int* p, lapack_int* q,
                    double* theta, double* phi, double* u1,
                    lapack_int* ldu1, double* u2, lapack_int* ldu2,
                    double* v1t, lapack_int* ldv1t, double* v2t,
                    lapack_int* ldv2t, double* b11d, double* b11e,
                    double* b12d, double* b12e, double* b21d,
                    double* b21e, double* b22d, double* b22e,
                    double* work, lapack_int* lwork , lapack_int *info );
void LAPACK_dorbdb( char* trans, char* signs,
                    lapack_int* m, lapack_int* p, lapack_int* q,
                    double* x11, lapack_int* ldx11, double* x12,
                    lapack_int* ldx12, double* x21, lapack_int* ldx21,
                    double* x22, lapack_int* ldx22, double* theta,
                    double* phi, double* taup1, double* taup2,
                    double* tauq1, double* tauq2, double* work,
                    lapack_int* lwork , lapack_int *info );
void LAPACK_dorcsd( char* jobu1, char* jobu2,
                    char* jobv1t, char* jobv2t, char* trans,
                    char* signs, lapack_int* m, lapack_int* p,
                    lapack_int* q, double* x11, lapack_int* ldx11,
                    double* x12, lapack_int* ldx12, double* x21,
                    lapack_int* ldx21, double* x22, lapack_int* ldx22,
                    double* theta, double* u1, lapack_int* ldu1,
                    double* u2, lapack_int* ldu2, double* v1t,
                    lapack_int* ldv1t, double* v2t, lapack_int* ldv2t,
                    double* work, lapack_int* lwork,
                    lapack_int* iwork , lapack_int *info );
void LAPACK_dsyconv( char* uplo, char* way,
                     lapack_int* n, double* a, lapack_int* lda,
                     const lapack_int* ipiv, double* work , lapack_int *info );
void LAPACK_dsyswapr( char* uplo, lapack_int* n,
                      double* a, lapack_int* i1, lapack_int* i2 );
void LAPACK_dsytri2( char* uplo, lapack_int* n,
                     double* a, lapack_int* lda,
                     const lapack_int* ipiv,
                     lapack_complex_double* work, lapack_int* lwork , lapack_int *info );
void LAPACK_dsytri2x( char* uplo, lapack_int* n,
                      double* a, lapack_int* lda,
                      const lapack_int* ipiv, double* work,
                      lapack_int* nb , lapack_int *info );
void LAPACK_dsytrs2( char* uplo, lapack_int* n,
                     lapack_int* nrhs, const double* a,
                     lapack_int* lda, const lapack_int* ipiv,
                     double* b, lapack_int* ldb, double* work , lapack_int *info );
void LAPACK_sbbcsd( char* jobu1, char* jobu2,
                    char* jobv1t, char* jobv2t, char* trans,
                    lapack_int* m, lapack_int* p, lapack_int* q,
                    float* theta, float* phi, float* u1,
                    lapack_int* ldu1, float* u2, lapack_int* ldu2,
                    float* v1t, lapack_int* ldv1t, float* v2t,
                    lapack_int* ldv2t, float* b11d, float* b11e,
                    float* b12d, float* b12e, float* b21d,
                    float* b21e, float* b22d, float* b22e,
                    float* work, lapack_int* lwork , lapack_int *info );
void LAPACK_sorbdb( char* trans, char* signs,
                    lapack_int* m, lapack_int* p, lapack_int* q,
                    float* x11, lapack_int* ldx11, float* x12,
                    lapack_int* ldx12, float* x21, lapack_int* ldx21,
                    float* x22, lapack_int* ldx22, float* theta,
                    float* phi, float* taup1, float* taup2,
                    float* tauq1, float* tauq2, float* work,
                    lapack_int* lwork , lapack_int *info );
void LAPACK_sorcsd( char* jobu1, char* jobu2,
                    char* jobv1t, char* jobv2t, char* trans,
                    char* signs, lapack_int* m, lapack_int* p,
                    lapack_int* q, float* x11, lapack_int* ldx11,
                    float* x12, lapack_int* ldx12, float* x21,
                    lapack_int* ldx21, float* x22, lapack_int* ldx22,
                    float* theta, float* u1, lapack_int* ldu1,
                    float* u2, lapack_int* ldu2, float* v1t,
                    lapack_int* ldv1t, float* v2t, lapack_int* ldv2t,
                    float* work, lapack_int* lwork,
                    lapack_int* iwork , lapack_int *info );
void LAPACK_ssyconv( char* uplo, char* way,
                     lapack_int* n, float* a, lapack_int* lda,
                     const lapack_int* ipiv, float* work , lapack_int *info );
void LAPACK_ssyswapr( char* uplo, lapack_int* n,
                      float* a, lapack_int* i1, lapack_int* i2 );
void LAPACK_ssytri2( char* uplo, lapack_int* n,
                     float* a, lapack_int* lda,
                     const lapack_int* ipiv,
                     lapack_complex_float* work, lapack_int* lwork , lapack_int *info );
void LAPACK_ssytri2x( char* uplo, lapack_int* n,
                      float* a, lapack_int* lda,
                      const lapack_int* ipiv, float* work,
                      lapack_int* nb , lapack_int *info );
void LAPACK_ssytrs2( char* uplo, lapack_int* n,
                     lapack_int* nrhs, const float* a,
                     lapack_int* lda, const lapack_int* ipiv,
                     float* b, lapack_int* ldb, float* work , lapack_int *info );
void LAPACK_zbbcsd( char* jobu1, char* jobu2,
                    char* jobv1t, char* jobv2t, char* trans,
                    lapack_int* m, lapack_int* p, lapack_int* q,
                    double* theta, double* phi,
                    lapack_complex_double* u1, lapack_int* ldu1,
                    lapack_complex_double* u2, lapack_int* ldu2,
                    lapack_complex_double* v1t, lapack_int* ldv1t,
                    lapack_complex_double* v2t, lapack_int* ldv2t,
                    double* b11d, double* b11e, double* b12d,
                    double* b12e, double* b21d, double* b21e,
                    double* b22d, double* b22e, double* rwork,
                    lapack_int* lrwork , lapack_int *info );
void LAPACK_zheswapr( char* uplo, lapack_int* n,
                      lapack_complex_double* a, lapack_int* i1,
                      lapack_int* i2 );
void LAPACK_zhetri2( char* uplo, lapack_int* n,
                     lapack_complex_double* a, lapack_int* lda,
                     const lapack_int* ipiv,
                     lapack_complex_double* work, lapack_int* lwork , lapack_int *info );
void LAPACK_zhetri2x( char* uplo, lapack_int* n,
                      lapack_complex_double* a, lapack_int* lda,
                      const lapack_int* ipiv,
                      lapack_complex_double* work, lapack_int* nb , lapack_int *info );
void LAPACK_zhetrs2( char* uplo, lapack_int* n,
                     lapack_int* nrhs,
                     const lapack_complex_double* a, lapack_int* lda,
                     const lapack_int* ipiv,
                     lapack_complex_double* b, lapack_int* ldb,
                     lapack_complex_double* work , lapack_int *info );
void LAPACK_zsyconv( char* uplo, char* way,
                     lapack_int* n, lapack_complex_double* a,
                     lapack_int* lda, const lapack_int* ipiv,
                     lapack_complex_double* work , lapack_int *info );
void LAPACK_zsyswapr( char* uplo, lapack_int* n,
                      lapack_complex_double* a, lapack_int* i1,
                      lapack_int* i2 );
void LAPACK_zsytri2( char* uplo, lapack_int* n,
                     lapack_complex_double* a, lapack_int* lda,
                     const lapack_int* ipiv,
                     lapack_complex_double* work, lapack_int* lwork , lapack_int *info );
void LAPACK_zsytri2x( char* uplo, lapack_int* n,
                      lapack_complex_double* a, lapack_int* lda,
                      const lapack_int* ipiv,
                      lapack_complex_double* work, lapack_int* nb , lapack_int *info );
void LAPACK_zsytrs2( char* uplo, lapack_int* n,
                     lapack_int* nrhs,
                     const lapack_complex_double* a, lapack_int* lda,
                     const lapack_int* ipiv,
                     lapack_complex_double* b, lapack_int* ldb,
                     lapack_complex_double* work , lapack_int *info );
void LAPACK_zunbdb( char* trans, char* signs,
                    lapack_int* m, lapack_int* p, lapack_int* q,
                    lapack_complex_double* x11, lapack_int* ldx11,
                    lapack_complex_double* x12, lapack_int* ldx12,
                    lapack_complex_double* x21, lapack_int* ldx21,
                    lapack_complex_double* x22, lapack_int* ldx22,
                    double* theta, double* phi,
                    lapack_complex_double* taup1,
                    lapack_complex_double* taup2,
                    lapack_complex_double* tauq1,
                    lapack_complex_double* tauq2,
                    lapack_complex_double* work, lapack_int* lwork , lapack_int *info );
void LAPACK_zuncsd( char* jobu1, char* jobu2,
                    char* jobv1t, char* jobv2t, char* trans,
                    char* signs, lapack_int* m, lapack_int* p,
                    lapack_int* q, lapack_complex_double* x11,
                    lapack_int* ldx11, lapack_complex_double* x12,
                    lapack_int* ldx12, lapack_complex_double* x21,
                    lapack_int* ldx21, lapack_complex_double* x22,
                    lapack_int* ldx22, double* theta,
                    lapack_complex_double* u1, lapack_int* ldu1,
                    lapack_complex_double* u2, lapack_int* ldu2,
                    lapack_complex_double* v1t, lapack_int* ldv1t,
                    lapack_complex_double* v2t, lapack_int* ldv2t,
                    lapack_complex_double* work, lapack_int* lwork,
                    double* rwork, lapack_int* lrwork,
                    lapack_int* iwork , lapack_int *info );
// LAPACK 3.4.0
void LAPACK_sgemqrt( char* side, char* trans, lapack_int* m, lapack_int* n,
                     lapack_int* k, lapack_int* nb, const float* v,
                     lapack_int* ldv, const float* t, lapack_int* ldt, float* c,
                     lapack_int* ldc, float* work, lapack_int *info );
void LAPACK_dgemqrt( char* side, char* trans, lapack_int* m, lapack_int* n,
                     lapack_int* k, lapack_int* nb, const double* v,
                     lapack_int* ldv, const double* t, lapack_int* ldt,
                     double* c, lapack_int* ldc, double* work,
                     lapack_int *info );
void LAPACK_cgemqrt( char* side, char* trans, lapack_int* m, lapack_int* n,
                     lapack_int* k, lapack_int* nb,
                     const lapack_complex_float* v, lapack_int* ldv,
                     const lapack_complex_float* t, lapack_int* ldt,
                     lapack_complex_float* c, lapack_int* ldc,
                     lapack_complex_float* work, lapack_int *info );
void LAPACK_zgemqrt( char* side, char* trans, lapack_int* m, lapack_int* n,
                     lapack_int* k, lapack_int* nb,
                     const lapack_complex_double* v, lapack_int* ldv,
                     const lapack_complex_double* t, lapack_int* ldt,
                     lapack_complex_double* c, lapack_int* ldc,
                     lapack_complex_double* work, lapack_int *info );
void LAPACK_sgeqrt( lapack_int* m, lapack_int* n, lapack_int* nb, float* a,
                    lapack_int* lda, float* t, lapack_int* ldt, float* work,
                    lapack_int *info );
void LAPACK_dgeqrt( lapack_int* m, lapack_int* n, lapack_int* nb, double* a,
                    lapack_int* lda, double* t, lapack_int* ldt, double* work,
                    lapack_int *info );
void LAPACK_cgeqrt( lapack_int* m, lapack_int* n, lapack_int* nb,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* t, lapack_int* ldt,
                    lapack_complex_float* work, lapack_int *info );
void LAPACK_zgeqrt( lapack_int* m, lapack_int* n, lapack_int* nb,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* t, lapack_int* ldt,
                    lapack_complex_double* work, lapack_int *info );
void LAPACK_sgeqrt2( lapack_int* m, lapack_int* n, float* a, lapack_int* lda,
                     float* t, lapack_int* ldt, lapack_int *info );
void LAPACK_dgeqrt2( lapack_int* m, lapack_int* n, double* a, lapack_int* lda,
                     double* t, lapack_int* ldt, lapack_int *info );
void LAPACK_cgeqrt2( lapack_int* m, lapack_int* n, lapack_complex_float* a,
                     lapack_int* lda, lapack_complex_float* t, lapack_int* ldt,
                     lapack_int *info );
void LAPACK_zgeqrt2( lapack_int* m, lapack_int* n, lapack_complex_double* a,
                     lapack_int* lda, lapack_complex_double* t, lapack_int* ldt,
                     lapack_int *info );
void LAPACK_sgeqrt3( lapack_int* m, lapack_int* n, float* a, lapack_int* lda,
                     float* t, lapack_int* ldt, lapack_int *info );
void LAPACK_dgeqrt3( lapack_int* m, lapack_int* n, double* a, lapack_int* lda,
                     double* t, lapack_int* ldt, lapack_int *info );
void LAPACK_cgeqrt3( lapack_int* m, lapack_int* n, lapack_complex_float* a,
                     lapack_int* lda, lapack_complex_float* t, lapack_int* ldt,
                     lapack_int *info );
void LAPACK_zgeqrt3( lapack_int* m, lapack_int* n, lapack_complex_double* a,
                     lapack_int* lda, lapack_complex_double* t, lapack_int* ldt,
                     lapack_int *info );
void LAPACK_stpmqrt( char* side, char* trans, lapack_int* m, lapack_int* n,
                     lapack_int* k, lapack_int* l, lapack_int* nb,
                     const float* v, lapack_int* ldv, const float* t,
                     lapack_int* ldt, float* a, lapack_int* lda, float* b,
                     lapack_int* ldb, float* work, lapack_int *info );
void LAPACK_dtpmqrt( char* side, char* trans, lapack_int* m, lapack_int* n,
                     lapack_int* k, lapack_int* l, lapack_int* nb,
                     const double* v, lapack_int* ldv, const double* t,
                     lapack_int* ldt, double* a, lapack_int* lda, double* b,
                     lapack_int* ldb, double* work, lapack_int *info );
void LAPACK_ctpmqrt( char* side, char* trans, lapack_int* m, lapack_int* n,
                     lapack_int* k, lapack_int* l, lapack_int* nb,
                     const lapack_complex_float* v, lapack_int* ldv,
                     const lapack_complex_float* t, lapack_int* ldt,
                     lapack_complex_float* a, lapack_int* lda,
                     lapack_complex_float* b, lapack_int* ldb,
                     lapack_complex_float* work, lapack_int *info );
void LAPACK_ztpmqrt( char* side, char* trans, lapack_int* m, lapack_int* n,
                     lapack_int* k, lapack_int* l, lapack_int* nb,
                     const lapack_complex_double* v, lapack_int* ldv,
                     const lapack_complex_double* t, lapack_int* ldt,
                     lapack_complex_double* a, lapack_int* lda,
                     lapack_complex_double* b, lapack_int* ldb,
                     lapack_complex_double* work, lapack_int *info );
void LAPACK_dtpqrt( lapack_int* m, lapack_int* n, lapack_int* l, lapack_int* nb,
                    double* a, lapack_int* lda, double* b, lapack_int* ldb,
                    double* t, lapack_int* ldt, double* work,
                    lapack_int *info );
void LAPACK_ctpqrt( lapack_int* m, lapack_int* n, lapack_int* l, lapack_int* nb,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* b, lapack_int* ldb,
                    lapack_complex_float* t, lapack_int* ldt,
                    lapack_complex_float* work, lapack_int *info );
void LAPACK_ztpqrt( lapack_int* m, lapack_int* n, lapack_int* l, lapack_int* nb,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb,
                    lapack_complex_double* t, lapack_int* ldt,
                    lapack_complex_double* work, lapack_int *info );
void LAPACK_stpqrt2( lapack_int* m, lapack_int* n, lapack_int* l,
                     float* a, lapack_int* lda,
                     float* b, lapack_int* ldb,
                     float* t, lapack_int* ldt,
                     lapack_int *info );
void LAPACK_dtpqrt2( lapack_int* m, lapack_int* n, lapack_int* l,
                     double* a, lapack_int* lda,
                     double* b, lapack_int* ldb,
                     double* t, lapack_int* ldt,
                     lapack_int *info );
void LAPACK_ctpqrt2( lapack_int* m, lapack_int* n, lapack_int* l,
                     lapack_complex_float* a, lapack_int* lda,
                     lapack_complex_float* b, lapack_int* ldb,
                     lapack_complex_float* t, lapack_int* ldt,
                     lapack_int *info );
void LAPACK_ztpqrt2( lapack_int* m, lapack_int* n, lapack_int* l,
                     lapack_complex_double* a, lapack_int* lda,
                     lapack_complex_double* b, lapack_int* ldb,
                     lapack_complex_double* t, lapack_int* ldt,
                     lapack_int *info );
void LAPACK_stprfb( char* side, char* trans, char* direct, char* storev,
                    lapack_int* m, lapack_int* n, lapack_int* k, lapack_int* l,
                    const float* v, lapack_int* ldv, const float* t,
                    lapack_int* ldt, float* a, lapack_int* lda, float* b,
                    lapack_int* ldb, const float* work,
                    lapack_int* ldwork );
void LAPACK_dtprfb( char* side, char* trans, char* direct, char* storev,
                    lapack_int* m, lapack_int* n, lapack_int* k, lapack_int* l,
                    const double* v, lapack_int* ldv, const double* t,
                    lapack_int* ldt, double* a, lapack_int* lda, double* b,
                    lapack_int* ldb, const double* work,
                    lapack_int* ldwork );
void LAPACK_ctprfb( char* side, char* trans, char* direct, char* storev,
                    lapack_int* m, lapack_int* n, lapack_int* k, lapack_int* l,
                    const lapack_complex_float* v, lapack_int* ldv,
                    const lapack_complex_float* t, lapack_int* ldt,
                    lapack_complex_float* a, lapack_int* lda,
                    lapack_complex_float* b, lapack_int* ldb,
                    const float* work, lapack_int* ldwork );
void LAPACK_ztprfb( char* side, char* trans, char* direct, char* storev,
                    lapack_int* m, lapack_int* n, lapack_int* k, lapack_int* l,
                    const lapack_complex_double* v, lapack_int* ldv,
                    const lapack_complex_double* t, lapack_int* ldt,
                    lapack_complex_double* a, lapack_int* lda,
                    lapack_complex_double* b, lapack_int* ldb,
                    const double* work, lapack_int* ldwork );
// LAPACK 3.5.0
void LAPACK_ssysv_rook( char* uplo, lapack_int* n, lapack_int* nrhs, float* a,
                        lapack_int* lda, lapack_int* ipiv, float* b,
                        lapack_int* ldb, float* work, lapack_int* lwork,
                        lapack_int *info );
void LAPACK_dsysv_rook( char* uplo, lapack_int* n, lapack_int* nrhs, double* a,
                        lapack_int* lda, lapack_int* ipiv, double* b,
                        lapack_int* ldb, double* work, lapack_int* lwork,
                        lapack_int *info );
void LAPACK_csysv_rook( char* uplo, lapack_int* n, lapack_int* nrhs,
                        lapack_complex_float* a, lapack_int* lda,
                        lapack_int* ipiv, lapack_complex_float* b,
                        lapack_int* ldb, lapack_complex_float* work,
                        lapack_int* lwork, lapack_int *info );
void LAPACK_zsysv_rook( char* uplo, lapack_int* n, lapack_int* nrhs,
                        lapack_complex_double* a, lapack_int* lda,
                        lapack_int* ipiv, lapack_complex_double* b,
                        lapack_int* ldb, lapack_complex_double* work,
                        lapack_int* lwork, lapack_int *info );
void LAPACK_csyr( char* uplo, lapack_int* n, lapack_complex_float* alpha,
                      const lapack_complex_float* x, lapack_int* incx,
                      lapack_complex_float* a, lapack_int* lda );
void LAPACK_zsyr( char* uplo, lapack_int* n, lapack_complex_double* alpha,
                      const lapack_complex_double* x, lapack_int* incx,
                      lapack_complex_double* a, lapack_int* lda );
void LAPACK_ilaver( lapack_int* vers_major, lapack_int* vers_minor,
                     lapack_int* vers_patch );