= selenium-prep

== DESCRIPTION:

selenium-prep helps set up your machine for local Selenium execution for multiple browsers. It downloads (in parallel) the latest browser drivers and standalone server to a specified location. It will then check your system PATH to see if the directory is in it. If not, it will provide you with information on how to configure it for your operating system.

== INSTALLATION:

Coming soon.

== USAGE:

=== Environment Variables

SP_OS_TYPE (e.g., 'linux32', 'linux64', 'mac32', 'win32', 'win64')
SP_DOWNLOAD_LOCATION (e.g., full path)

If these values are not set properly, a RuntimeError will be returned along with a helpful message.

For example:

ENV['SP_DOWNLOAD_LOCATION'] = '/Users/tourdedave/Desktop/bin/test'
ENV['SP_OS_TYPE'] = 'mac32'

=== Downloading

SeleniumPrep.download

NOTE: Will check to see if the download directory is empty. If not, it will prompt you to proceed. It will overwrite files of the same name.

=== Check System Path

Find out if your path is set correctly and if not provide instructions on how to proceed.

SeleniumPrep.path_set?

NOTE: Will return a boolean result in addition to helpful messaging. This will automatically run after downloading completes.

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
