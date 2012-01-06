# R-build

R-build provides a simple way to compile and install different
versions of R on UNIX-like systems.

### Installing R-build

    $ git clone git://github.com/viking/R-build.git
    $ cd R-build
    $ ./install.sh

This will install R-build into `/usr/local`. If you do not have
write permission to `/usr/local`, you will need to run `sudo
./install.sh` instead. You can install to a different prefix by
setting the `PREFIX` environment variable.

### Installing R

To install an R version, run the `R-build` command with the path
to a definition file and the path where you want to install it. (A
number of [built-in
definitions](https://github.com/viking/R-build/tree/R-build/share/R-build)
may be specified instead.)

    $ R-build 2.14.0 ~/local/R-2.14.0
    ...
    $ ~/local/R-2.14.0/bin/R --version
    R version 2.14.0 (2011-10-31)
    Copyright (C) 2011 The R Foundation for Statistical Computing
    ISBN 3-900051-07-0
    Platform: x86_64-unknown-linux-gnu (64-bit)

    R is free software and comes with ABSOLUTELY NO WARRANTY.
    You are welcome to redistribute it under the terms of the
    GNU General Public License version 2.
    For more information about these matters see
    http://www.gnu.org/licenses/.


You can use it with [Renv](https://github.com/viking/Renv):

    $ R-build 2.14.0 ~/.rbenv/versions/2.14.0

R-build provides an `Renv-install` command that shortens this to:

    $ Renv install 2.14.0

### Version History

#### 20120106

* Began fork from [ruby-build](https://github.com/sstephenson/ruby-build)
* Added definitions for 2.14.0 and 2.14.1.

### License

(The MIT License)

Copyright (c) 2011 Sam Stephenson

Copyright (c) 2012 Vanderbilt University

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
