# Package

version       = "0.1.0"
author        = "Andrea Ferretti"
description   = "Nim binding for LAPACK"
license       = "Apache2"
skipFiles     = @["lapack.h", "lapack.c2nim", "nimlapack.html"]

requires "nim >= 0.16.0", "nimblas >= 0.1.4"

import ospaths, strutils

task header, "generate bindings from header":
  let
    libPath = "/usr/include/atlas/clapack.h"
    patchPath = "lapack.c2nim"
    headerPath = "lapack.h"
    libContent = readFile(libPath)
    patchContent = readFile(patchPath)
  writeFile(headerPath, patchContent & libContent)
  exec("c2nim " & headerPath & " -o:nimlapack.nim")

task check, "check that generated bindings do compile":
  exec("nimble c -c nimlapack.nim")

task docs, "generate documentation":
  exec("nim doc2 nimlapack.nim")