# NimLAPACK

Nim bindings for the [LAPACK](http://www.netlib.org/lapack/) libraries.

These are low-level bindings generated via c2nim. See `nimlapack.html` for
the API documentation.

For a higher-level linear algebra library based on this, check out
[neo](http://andreaferretti.github.io/neo/).

## Linking LAPACK implementations

The library requires to link some LAPACK implementation to perform the actual
linear algebra operations. By default, it tries to link whatever is the default
system-wide LAPACK implementation.

You can link against a different LAPACK implementation by a combination of:

* changing the path for linked libraries (use
  [`--clibdir`](https://nim-lang.org/docs/nimc.html#compiler-usage-command-line-switches)
  for this)
* using the `--define:lapack` flag. By default, the system tries to load a LAPACK
  library called `lapack`, which translates into something called `lapack.dll`
  or `liblapack.so` according to the underling operating system. To link,
  say, the library `libopenblas.so.3` on Linux, you should pass to Nim the
  option `--define:lapack=openblas`.

See the tasks inside [nimblas.nimble](https://github.com/andreaferretti/nimlapack/blob/master/nimlapack.nimble)
for a few examples.

Packages for various LAPACK implementations are available from the package
managers of many Linux distributions. On OSX one can add the brew formulas
from [Homebrew Science](https://github.com/Homebrew/homebrew-science), such
as `brew install homebrew/science/openblas`.

You may also need to add suitable paths for the includes and library dirs.
On OSX, this should do the trick

```nim
switch("clibdir", "/usr/local/opt/openblas/lib")
switch("cincludes", "/usr/local/opt/openblas/include")
```
