#!/bin/bash

# David Reguera Garcia aka Dreg - dreg@fr33project.org
# -
# http://github.com/David-Reguera-Garcia-Dreg/ - http://www.fr33project.org/
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.

# set -x

# for Linux 64 bits use:
# elfnasm="-felf64" 
# ldelf="-m elf_x86_64"

# for Windows 64 bits use:
# elfnasm="-f win64" 
# ldelf="-mi386pep"

# for Windows 32 bits use:
# elfnasm="-f win32" 
# ldelf="-mi386pe"


name_prj="helloworldx86"

elfnasm="-felf32" 
ldelf="-m elf_i386"

declare -a cmds=("rm -rf ${name_prj}.o ${name_prj}" "nasm ${elfnasm} -o ${name_prj}.o ${name_prj}.asm" "ld ${ldelf} ${name_prj}.o -o ${name_prj}")

for i in "${cmds[@]}"
do
    eval $i
    if [ $? -eq 0 ]
    then
        echo "success: $i"
    else
        echo "$0:$LINENO: error: $i" >&2
        exit 1
    fi
done

exit 0