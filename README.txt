= selenium-prep

== DESCRIPTION:

selenium-prep helps set up your machine for local Selenium execution for multiple browsers. It downloads (in parallel) the latest browser drivers and standalone server to a specified location. It will then check your system PATH to see if the download directory is in it. If not, it will add it for you.

== INSTALLATION:

gem install selenium-prep

== USAGE:

=== Environment Variables

SE_OS_TYPE (e.g., 'linux32', 'linux64', 'mac32', 'win32', 'win64' -- automatically detected)
SE_OS_TYPE_BIT (e.g., '32', '64' -- defaults to '32')
SE_DOWNLOAD_LOCATION (e.g., full path)

NOTE: SE_DOWNLOAD_LOCATION is the only variable you need to set. If is not set properly, a RuntimeError will be returned along with a helpful message.

=== Prep

SeleniumPrep.prep

NOTE: This will download the files for your OS, attempt to set the path on your system, and check that the path is set correctly. If not, it will provide some debugging output.

=== Downloading

SeleniumPrep.download

NOTE: The downloader will check to see if the download directory is empty. If not, it will prompt you to proceed, overwriting files of the same name.

=== Check System Path

Find out if your path is set correctly and if not provide some debugging output.

SeleniumPrep.path_set?

NOTE: Will return a boolean result in addition to debugging output.

== LICENSE:

The MIT License (MIT)

Copyright (c) 2014 Dave Haeffner

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
