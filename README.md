# R-build

R-build is an [Renv](https://github.com/viking/Renv) plugin
that provides an `Renv install` command to compile and install
different versions of R on UNIX-like systems.

You can also use R-build without Renv in environments where you
need precise control over R version installation.


## Installation

### Installing as an Renv plugin (recommended)

Installing R-build as an Renv plugin will give you access to the
`Renv install` command.

    $ mkdir -p ~/.Renv/plugins
    $ cd ~/.Renv/plugins
    $ git clone git://github.com/viking/R-build.git

This will install the latest development version of R-build into
the `~/.Renv/plugins/R-build` directory. From that directory, you
can check out a specific release tag. To update R-build, run `git
pull` to download the latest changes.

### Installing as a standalone program (advanced)

Installing R-build as a standalone program will give you access to
the `R-build` command for precise control over R version
installation. If you have Renv installed, you will also be able to
use the `Renv install` command.

    $ git clone git://github.com/viking/R-build.git
    $ cd R-build
    $ ./install.sh

This will install R-build into `/usr/local`. If you do not have
write permission to `/usr/local`, you will need to run `sudo
./install.sh` instead. You can install to a different prefix by
setting the `PREFIX` environment variable.

To update R-build after it has been installed, run `git pull` in
your cloned copy of the repository, then re-run the install script.

## Usage

### Using `Renv install` with Renv

To install a R version for use with Renv, run `Renv install` with
the exact name of the version you want to install. For example,

    $ Renv install 2.15.2

installs R version 2.15.2 to `~/.Renv/versions/2.15.2`. Provide an
additional argument to install to a directory with a name that differs
from the version number. For example,

    $ Renv install 2.15.2 my-proj

installs R version 2.15.2 to `~/.Renv/versions/my-proj`.

To see a list of all available R versions, run `Renv install`
without any arguments. You may also tab-complete available R
versions if your Renv installation is properly configured.

### Using `R-build` standalone

If you have installed R-build as a standalone program, you can use
the `R-build` command to compile and install R versions into
specific locations.

Run the `R-build` command with the exact name of the version you
want to install and the full path where you want to install it. For
example,

    $ R-build 2.15.2 ~/local/R-2.15.2

To see a list of all available R versions, run `R-build
--definitions`.

Pass the `-v` or `--verbose` flag to `R-build` as the first
argument to see what's happening under the hood.

### Custom definitions

Both `Renv install` and `R-build` accept a path to a custom
definition file in place of a version name. Custom definitions let you
develop and install versions of R that are not yet supported by
R-build.

See the [R-build built-in
definitions](https://github.com/viking/R-build/tree/master/share/R-build)
as a starting point for custom definition files.

### Special environment variables

You can set certain environment variables to control the build
process.

* `TMPDIR` sets the location where R-build stores temporary files.
* `R_BUILD_BUILD_PATH` sets the location in which sources are
  downloaded and built. By default, this is a subdirectory of
  `TMPDIR`.
* `CC` sets the path to the C compiler.
* `CONFIGURE_OPTS` lets you pass additional options to `./configure`.
* `MAKE_OPTS` (or `MAKEOPTS`) lets you pass additional options to
  `make`.

### Keeping the build directory after installation

Both `R-build` and `Renv install` accept the `-k` or `--keep`
flag, which tells R-build to keep the downloaded source after
installation. This can be useful if you need to use `gdb` and
`memprof` with R.

Source code will be kept in a parallel directory tree
`~/.Renv/sources` when using `--keep` with the `Renv install`
command. You should specify the location of the source code with the
`R_BUILD_BUILD_PATH` environment variable when using `--keep` with
`R-build`.


## Getting Help

Open an issue on the [issue
tracker](https://github.com/viking/R-build/issues). Be sure to
include the full build log for build failures.


## Version History

R-build is a forked version of [ruby-build](https://github.com/sstephenson/ruby-build).

#### 20121102

* Add definition for R-2.15.2
* Fix merging errors

#### 20121003

* Add definition for R-2.15.1

#### 20120405

* Add definition for R-2.15.0

#### 20120302

* Add definition for R-2.14.2

#### 20120106

* Began fork from [R-build](https://github.com/viking/R-build)
* Added definitions for the R-2 series

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
