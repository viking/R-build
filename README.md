# R-build

<<<<<<< HEAD
R-build provides a simple way to compile and install different
versions of R on UNIX-like systems.

### Installing R-build
=======
ruby-build is an [rbenv](https://github.com/sstephenson/rbenv) plugin
that provides an `rbenv install` command to compile and install
different versions of Ruby on UNIX-like systems.

You can also use ruby-build without rbenv in environments where you
need precise control over Ruby version installation.


## Installation

### Installing as an rbenv plugin (recommended)

Installing ruby-build as an rbenv plugin will give you access to the
`rbenv install` command.

    $ mkdir -p ~/.rbenv/plugins
    $ cd ~/.rbenv/plugins
    $ git clone git://github.com/sstephenson/ruby-build.git

This will install the latest development version of ruby-build into
the `~/.rbenv/plugins/ruby-build` directory. From that directory, you
can check out a specific release tag. To update ruby-build, run `git
pull` to download the latest changes.

### Installing as a standalone program (advanced)

Installing ruby-build as a standalone program will give you access to
the `ruby-build` command for precise control over Ruby version
installation. If you have rbenv installed, you will also be able to
use the `rbenv install` command.
>>>>>>> upstream/master

    $ git clone git://github.com/viking/R-build.git
    $ cd R-build
    $ ./install.sh

This will install R-build into `/usr/local`. If you do not have
write permission to `/usr/local`, you will need to run `sudo
./install.sh` instead. You can install to a different prefix by
setting the `PREFIX` environment variable.

<<<<<<< HEAD
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
=======
To update ruby-build after it has been installed, run `git pull` in
your cloned copy of the repository, then re-run the install script.

### Installing with Homebrew (for OS X users)

Mac OS X users can install ruby-build with the
[Homebrew](http://mxcl.github.com/homebrew/) package manager. This
will give you access to the `ruby-build` command. If you have rbenv
installed, you will also be able to use the `rbenv install` command.

*This is the recommended method of installation if you installed rbenv
 with Homebrew.*

    $ brew install ruby-build

Or, if you would like to install the latest development release:

    $ brew install --HEAD ruby-build


## Usage

### Using `rbenv install` with rbenv

To install a Ruby version for use with rbenv, run `rbenv install` with
the exact name of the version you want to install. For example,

    $ rbenv install 1.9.3-p194

Ruby versions will be installed into a directory of the same name
under `~/.rbenv/versions`.

To see a list of all available Ruby versions, run `rbenv install`
without any arguments. You may also tab-complete available Ruby
versions if your rbenv installation is properly configured.

### Using `ruby-build` standalone

If you have installed ruby-build as a standalone program, you can use
the `ruby-build` command to compile and install Ruby versions into
specific locations.

Run the `ruby-build` command with the exact name of the version you
want to install and the full path where you want to install it. For
example,

    $ ruby-build 1.9.3-p194 ~/local/ruby-1.9.3-p194

To see a list of all available Ruby versions, run `ruby-build
--definitions`.

Pass the `-v` or `--verbose` flag to `ruby-build` as the first
argument to see what's happening under the hood.

### Custom definitions

Both `rbenv install` and `ruby-build` accept a path to a custom
definition file in place of a version name. Custom definitions let you
develop and install versions of Ruby that are not yet supported by
ruby-build.

See the [ruby-build built-in
definitions](https://github.com/sstephenson/ruby-build/tree/master/share/ruby-build)
as a starting point for custom definition files.

### Special environment variables

You can set certain environment variables to control the build
process.

* `TMPDIR` sets the location where ruby-build stores temporary files.
* `RUBY_BUILD_BUILD_PATH` sets the location in which sources are
  downloaded and built. By default, this is a subdirectory of
  `TMPDIR`.
* `CC` sets the path to the C compiler.
* `CONFIGURE_OPTS` lets you pass additional options to `./configure`.
* `MAKE_OPTS` (or `MAKEOPTS`) lets you pass additional options to
  `make`.

### Keeping the build directory after installation

Both `ruby-build` and `rbenv install` accept the `-k` or `--keep`
flag, which tells ruby-build to keep the downloaded source after
installation. This can be useful if you need to use `gdb` and
`memprof` with Ruby.

Source code will be kept in a parallel directory tree
`~/.rbenv/sources` when using `--keep` with the `rbenv install`
command. You should specify the location of the source code with the
`RUBY_BUILD_BUILD_PATH` environment variable when using `--keep` with
`ruby-build`.


## Getting Help

Please see the [ruby-build
wiki](https://github.com/sstephenson/ruby-build/wiki) for solutions to
common problems.

If you can't find an answer on the wiki, open an issue on the [issue
tracker](https://github.com/sstephenson/ruby-build/issues). Be sure to
include the full build log for build failures.


## Version History

#### 20120815

* Added a definition for MagLev 1.1.0-dev from git.
* Added a definition for Ruby 1.8.7-p370. (For those having trouble
  installing 1.8.7 with newer versions of glibc, please see
  https://github.com/sstephenson/ruby-build/pull/195#issuecomment-7743664.)
* Updated the package URL in the definition for JRuby 1.7.0-preview1.
* Added a definition for JRuby 1.7.0-preview2.
* Updated the Rubinius 2.0.0-dev definition to use the bundled
  RubyGems version instead of installing its own.
* Added an `rbenv uninstall` command for removing installed versions.
* Improved the option parsing for `ruby-build` and `rbenv-install` so
  options may be placed in any order, and short options may be
  combined (e.g. `-kv`).
* Added a `-l`/`--list` option to `rbenv install` to list all
  available definitions.
* Added a `-v`/`--verbose` option to `rbenv install` to invoke
  `ruby-build` in verbose mode.
* Documented the `-k`/`--keep` flag in the command-line help for
  `ruby-build` and `rbenv install`.

#### 20120524

* Added definitions for JRuby 1.6.7.2 and 1.7.0-preview1.
* Removed the definition for JRuby 1.7.0-dev. (In general we do not
  like to remove definitions, but the JRuby team has deleted the
  1.7.0-dev package from their servers -- caveat emptor.)
* Added support for specifying the build location with the
  `RUBY_BUILD_BUILD_PATH` environment variable.
* Added a `-k`/`--keep` flag to `ruby-build` and `rbenv install` for
  keeping the source code around after installation.
* Updated the readme to emphasize installation as an rbenv plugin.

#### 20120423

* Improved error messages when dependencies are missing.
* XCode 4.3+ may be used to build 1.9.3-p125 and later.
* Updated all Ruby 1.9.2 and 1.9.3 definitions to RubyGems 1.8.23.
* Added definitions for REE 1.8.7-2012.02 and 1.8.7-2009.10.
* Added definitions for JRuby 1.6.7.
* Added definitions for Ruby 1.9.2-p318, 1.9.2-p320, and 1.9.3-p194.

#### 20120216
>>>>>>> upstream/master

* Added definitions for REE 1.8.7-2011.12 and 1.8.7-2012.01.
* Added definitions for JRuby 1.6.5.1 and 1.6.6.
* Added definitions for Ruby 1.8.7-p358 and 1.9.3-p125.
* Updated the readme with instructions for installing ruby-build as an
  rbenv plugin.

#### 20120106

* Began fork from [ruby-build](https://github.com/sstephenson/ruby-build)
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
