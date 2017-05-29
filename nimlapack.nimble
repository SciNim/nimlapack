# Package

version       = "0.1.0"
author        = "Andrea Ferretti"
description   = "Nim binding for LAPACK"
license       = "Apache2"
skipFiles     = @["lapacke.h", "lapack.h", "lapack.c2nim", "nimlapack.html"]

requires "nim >= 0.16.0"

import ospaths, strutils

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