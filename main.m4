dnl Copyright © 2020 Mikle Kolyada
dnl 
dnl Permission is hereby granted, free of charge, to any person obtaining
dnl a copy of this software and associated documentation files (the
dnl "Software"), to deal in the Software without restriction, including
dnl without limitation the rights to use, copy, modify, merge, publish,
dnl distribute, sublicense, and/or sell copies of the Software, and to
dnl permit persons to whom the Software is furnished to do so, subject to
dnl the following conditions:
dnl 
dnl The above copyright notice and this permission notice shall be
dnl included in all copies or substantial portions of the Software.
dnl 
dnl THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
dnl EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
dnl MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
dnl IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
dnl CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
dnl TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
dnl SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
dnl
dnl Divert all the output to avoid filling the generated files with blank
dnl lines.
divert(1)

dnl Setup autoconf-style quoting since that's much easier to expect
dnl and parse in a file; also use C-style comments that won't
dnl interfere with the PAM comments that use the same #-prefix as m4
changequote([,])
changecom([/*], [*/])

define([PAM_MODULE_ADD], [$1      		$2			$3])

define([warning], [
  errprint($@
)
])

define([PAM_MODULE_IF], [dnl
define([chain], [ifdef([$1], [$2], [#$2])])dnl
PAM_MODULE_ADD(chain, [$3], [$4])[]dnl
])

define([need_macro], [
  ifdef([$1],, [
    warning([You need to define $1])
    m4exit([1])
  ])
])

need_macro([PAM_SERVICE])

dnl we do not have openpam anymore
include([linux-pam.m4])

ifdef([DEBUG], [define([DEBUG], [debug])], [define([DEBUG])])

divert[]dnl
[# PAM configuration for ]"PAM_SERVICE"[ part of Gentoo pambase package]

include(PAM_SERVICE[.m4])
undivert([2])[]dnl
divert([-1])[]dnl
undivert[]dnl
