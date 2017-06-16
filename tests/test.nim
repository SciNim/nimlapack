# Copyright 2017 UniCredit S.p.A.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import unittest, nimlapack

template first[A](x: openArray[A]): ptr A = addr(x[0])

suite "NimLAPACK test":
  test "solver":
    var
      v = [12.0, 15.0, 17.0, 19.0]
      a = [
        1.0, 2.0, 3.0, 4.0,
        5.0, 6.0, 7.0, 8.0,
        1.0, 2.0, 1.0, 1.0,
        3.0, 1.0, 2.0, 1.0
      ]
      ipiv: array[4, cint]
      info: cint
      m = 4.cint
      n = 1.cint
      lda = 4.cint

    dgesv(addr m, addr n, a.first, addr lda, ipiv.first, v.first, addr lda, addr info)
    check info == 0
    check v == [2.0, 1.0, 2.0, 1.0]