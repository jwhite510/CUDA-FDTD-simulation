let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Projects/FTDT_compare/FTDT
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +19 src/main.cpp
badd +17 CMakeLists.txt
badd +1 build/ftdt.py
badd +1 src/pythonarrays.h
badd +38 term://.//30410:/bin/bash
badd +1 make.sh
badd +85 src/c_arrays.h
badd +150 term://.//3007:/bin/bash
badd +3 src/debug.gdb
badd +45 term:///home/zom/Projects/FTDT_compare/FTDT/src//5804:gdb\ -q\ -x\ debug.gdb\ -ex\ \'break\ main.cpp:130\'\ -ex\ \'r\'\ -ex\ refresh
badd +56 term://.//1079:/bin/bash
badd +2 build/hx_display.dat
badd +1 t.py
badd +31 ~/bin/plotd.py
badd +7 term://.//11063:/bin/bash
badd +151 term://.//11124:/bin/bash
badd +1 term://.//3005:/bin/bash
badd +1 ~/Projects/diffraction_net/zernike3/CMakeLists.txt
badd +80 ~/Projects/diffraction_net/zernike3/src/main.cpp
badd +1 ~/Projects/diffraction_net/zernike3/src/testprop.cpp
badd +426 term://.//11188:/bin/bash
badd +65 src/cfdtd.cpp
badd +2 ~/Projects/diffraction_net/zernike3/src/MeasuredImageFormatter.h
badd +67 ~/Projects/diffraction_net/zernike3/src/MeasuredImageFormatter.cpp
badd +5 src/cfdtd.h
badd +1 ~/Projects/diffraction_net/zernike3/src
badd +1 ~/Projects/diffraction_net/zernike3/src/MeasuredImageFormatterWrapper.h
badd +1 ~/Projects/diffraction_net/zernike3/src/MeasuredImageFormatterWrapper.cpp
badd +15 src/cfdtd_wrapper.cpp
badd +3 src/cfdtd_wrapper.h
badd +29 ~/Projects/diffraction_net/zernike3/build/MeasuredImageFormatterTest.py
badd +32 build/test.py
badd +1 term://.//2913:/bin/bash
badd +1 term://.//2777:/bin/bash
badd +1 src/MeasuredImageFormatterWrapper.cpp
badd +134 term://.//5671:/bin/bash
badd +0 term://.//4079:/bin/bash
argglobal
%argdel
$argadd ./
set stal=2
edit CMakeLists.txt
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 12 - ((11 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
12
normal! 09|
lcd ~/Projects/FTDT_compare/FTDT
tabedit ~/Projects/FTDT_compare/FTDT/src/main.cpp
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd w
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 18 + 24) / 49)
exe 'vert 1resize ' . ((&columns * 106 + 106) / 212)
exe '2resize ' . ((&lines * 18 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 105 + 106) / 212)
exe '3resize ' . ((&lines * 27 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 40 + 106) / 212)
exe '4resize ' . ((&lines * 27 + 24) / 49)
exe 'vert 4resize ' . ((&columns * 50 + 106) / 212)
exe '5resize ' . ((&lines * 27 + 24) / 49)
exe 'vert 5resize ' . ((&columns * 120 + 106) / 212)
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
5
normal! zo
22
normal! zo
24
normal! zo
25
normal! zo
let s:l = 32 - ((8 * winheight(0) + 9) / 18)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
32
normal! 05|
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("term://.//2777:/bin/bash") | buffer term://.//2777:/bin/bash | else | edit term://.//2777:/bin/bash | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 441 - ((17 * winheight(0) + 9) / 18)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
441
normal! 047|
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("~/Projects/FTDT_compare/FTDT/src/cfdtd.h") | buffer ~/Projects/FTDT_compare/FTDT/src/cfdtd.h | else | edit ~/Projects/FTDT_compare/FTDT/src/cfdtd.h | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 8 - ((3 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
8
normal! 08|
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("~/Projects/FTDT_compare/FTDT/src/cfdtd_wrapper.cpp") | buffer ~/Projects/FTDT_compare/FTDT/src/cfdtd_wrapper.cpp | else | edit ~/Projects/FTDT_compare/FTDT/src/cfdtd_wrapper.cpp | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=20
setlocal fen
8
normal! zo
9
normal! zo
9
normal! zo
15
normal! zo
16
normal! zo
16
normal! zo
let s:l = 17 - ((13 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 09|
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("~/Projects/FTDT_compare/FTDT/build/test.py") | buffer ~/Projects/FTDT_compare/FTDT/build/test.py | else | edit ~/Projects/FTDT_compare/FTDT/build/test.py | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
6
normal! zo
7
normal! zo
12
normal! zo
26
normal! zo
26
normal! zo
41
normal! zo
42
normal! zo
43
normal! zo
44
normal! zo
let s:l = 48 - ((17 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
48
normal! 0
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
exe '1resize ' . ((&lines * 18 + 24) / 49)
exe 'vert 1resize ' . ((&columns * 106 + 106) / 212)
exe '2resize ' . ((&lines * 18 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 105 + 106) / 212)
exe '3resize ' . ((&lines * 27 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 40 + 106) / 212)
exe '4resize ' . ((&lines * 27 + 24) / 49)
exe 'vert 4resize ' . ((&columns * 50 + 106) / 212)
exe '5resize ' . ((&lines * 27 + 24) / 49)
exe 'vert 5resize ' . ((&columns * 120 + 106) / 212)
tabedit ~/Projects/FTDT_compare/FTDT/src/cfdtd.cpp
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 70 + 106) / 212)
exe '2resize ' . ((&lines * 15 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 70 + 106) / 212)
exe '3resize ' . ((&lines * 15 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 70 + 106) / 212)
exe '4resize ' . ((&lines * 15 + 24) / 49)
exe 'vert 4resize ' . ((&columns * 141 + 106) / 212)
exe '5resize ' . ((&lines * 14 + 24) / 49)
exe 'vert 5resize ' . ((&columns * 141 + 106) / 212)
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=4
setlocal fml=1
setlocal fdn=20
setlocal fen
30
normal! zo
46
normal! zo
46
normal! zo
62
normal! zo
64
normal! zo
66
normal! zo
let s:l = 47 - ((20 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
47
normal! 05|
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("~/Projects/FTDT_compare/FTDT/src/c_arrays.h") | buffer ~/Projects/FTDT_compare/FTDT/src/c_arrays.h | else | edit ~/Projects/FTDT_compare/FTDT/src/c_arrays.h | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
69
normal! zo
70
normal! zo
79
normal! zo
88
normal! zo
97
normal! zo
97
normal! zo
100
normal! zo
103
normal! zo
106
normal! zo
107
normal! zo
let s:l = 89 - ((8 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
89
normal! 07|
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("~/Projects/FTDT_compare/FTDT/src/c_arrays.h") | buffer ~/Projects/FTDT_compare/FTDT/src/c_arrays.h | else | edit ~/Projects/FTDT_compare/FTDT/src/c_arrays.h | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
69
normal! zo
70
normal! zo
78
normal! zo
87
normal! zo
96
normal! zo
97
normal! zo
100
normal! zo
103
normal! zo
106
normal! zo
107
normal! zo
let s:l = 88 - ((8 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
88
normal! 016|
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("~/Projects/FTDT_compare/FTDT/src/cfdtd.cpp") | buffer ~/Projects/FTDT_compare/FTDT/src/cfdtd.cpp | else | edit ~/Projects/FTDT_compare/FTDT/src/cfdtd.cpp | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=4
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 16 - ((0 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
16
normal! 02|
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("~/Projects/FTDT_compare/FTDT/src/cfdtd.h") | buffer ~/Projects/FTDT_compare/FTDT/src/cfdtd.h | else | edit ~/Projects/FTDT_compare/FTDT/src/cfdtd.h | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
22
normal! zo
38
normal! zo
38
normal! zo
let s:l = 39 - ((8 * winheight(0) + 7) / 14)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
39
normal! 0
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
exe 'vert 1resize ' . ((&columns * 70 + 106) / 212)
exe '2resize ' . ((&lines * 15 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 70 + 106) / 212)
exe '3resize ' . ((&lines * 15 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 70 + 106) / 212)
exe '4resize ' . ((&lines * 15 + 24) / 49)
exe 'vert 4resize ' . ((&columns * 141 + 106) / 212)
exe '5resize ' . ((&lines * 14 + 24) / 49)
exe 'vert 5resize ' . ((&columns * 141 + 106) / 212)
tabnew
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
if bufexists("term://.//4079:/bin/bash") | buffer term://.//4079:/bin/bash | else | edit term://.//4079:/bin/bash | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 207 - ((45 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
207
normal! 041|
lcd ~/Projects/FTDT_compare/FTDT
tabedit ~/Projects/diffraction_net/zernike3/CMakeLists.txt
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 19 + 24) / 49)
exe '2resize ' . ((&lines * 26 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 70 + 106) / 212)
exe '3resize ' . ((&lines * 26 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 70 + 106) / 212)
exe '4resize ' . ((&lines * 26 + 24) / 49)
exe 'vert 4resize ' . ((&columns * 70 + 106) / 212)
argglobal
if bufexists("term://.//2913:/bin/bash") | buffer term://.//2913:/bin/bash | else | edit term://.//2913:/bin/bash | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 19 - ((18 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
19
normal! 0
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 32 - ((14 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
32
normal! 013|
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("~/Projects/diffraction_net/zernike3/src/MeasuredImageFormatterWrapper.cpp") | buffer ~/Projects/diffraction_net/zernike3/src/MeasuredImageFormatterWrapper.cpp | else | edit ~/Projects/diffraction_net/zernike3/src/MeasuredImageFormatterWrapper.cpp | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=4
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
9,10fold
13,16fold
19,20fold
7,21fold
7
normal! zo
9
normal! zc
13
normal! zc
19
normal! zc
let s:l = 13 - ((12 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
13
normal! 05|
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("~/Projects/diffraction_net/zernike3/build/MeasuredImageFormatterTest.py") | buffer ~/Projects/diffraction_net/zernike3/build/MeasuredImageFormatterTest.py | else | edit ~/Projects/diffraction_net/zernike3/build/MeasuredImageFormatterTest.py | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=
setlocal fdl=2
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 22 - ((9 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
22
normal! 09|
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
exe '1resize ' . ((&lines * 19 + 24) / 49)
exe '2resize ' . ((&lines * 26 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 70 + 106) / 212)
exe '3resize ' . ((&lines * 26 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 70 + 106) / 212)
exe '4resize ' . ((&lines * 26 + 24) / 49)
exe 'vert 4resize ' . ((&columns * 70 + 106) / 212)
tabedit ~/Projects/diffraction_net/zernike3/CMakeLists.txt
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 23 + 24) / 49)
exe 'vert 1resize ' . ((&columns * 106 + 106) / 212)
exe '2resize ' . ((&lines * 22 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 106 + 106) / 212)
exe 'vert 3resize ' . ((&columns * 105 + 106) / 212)
argglobal
enew
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 33 - ((16 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
33
normal! 0
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("term://.//3005:/bin/bash") | buffer term://.//3005:/bin/bash | else | edit term://.//3005:/bin/bash | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 46 - ((45 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
46
normal! 0
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
exe '1resize ' . ((&lines * 23 + 24) / 49)
exe 'vert 1resize ' . ((&columns * 106 + 106) / 212)
exe '2resize ' . ((&lines * 22 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 106 + 106) / 212)
exe 'vert 3resize ' . ((&columns * 105 + 106) / 212)
tabnext 3
set stal=1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
