# Package

version       = "0.2.1"
author        = "Andrea Ferretti"
description   = "Nim binding for LAPACK"
license       = "Apache2"
skipFiles     = @["lapacke.h", "lapack.h", "lapack.c2nim", "nimlapack.html"]
skipDirs      = @["tests"]

requires "nim >= 0.16.0"

import strutils

task header, "generate bindings from header":
  let
    libPath = "lapack.h"
    patchPath = "lapack.c2nim"
    headerPath = "lapack-tmp.h"
    libContent = readFile(libPath)
    patchContent = readFile(patchPath)
  writeFile(headerPath, patchContent & libContent)
  exec("c2nim " & headerPath & " -o:nimlapack.nim")
  exec("rm " & headerPath)

task check, "check that generated bindings do compile":
  exec("nim c -c nimlapack.nim")

task docs, "generate documentation":
  exec("nim doc2 nimlapack.nim")

proc configForTests() =
  --hints: off
  --linedir: on
  --stacktrace: on
  --linetrace: on
  --debuginfo
  --path: "."
  --run

task test, "run NimLAPACK tests":
  configForTests()
  setCommand "c", "tests/test.nim"

task testopenblas, "run NimLAPACK tests on OpenBLAS":
  configForTests()
  --define:"lapack=openblas"
  setCommand "c", "tests/test.nim"
