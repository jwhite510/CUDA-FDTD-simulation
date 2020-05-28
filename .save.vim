let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Projects/FTDT_compare/FTDT
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 src/main.cpp
badd +9 CMakeLists.txt
badd +1 build/ftdt.py
badd +1 src/pythonarrays.h
badd +38 term://.//30410:/bin/bash
badd +1 make.sh
badd +80 src/c_arrays.h
badd +150 term://.//3007:/bin/bash
badd +3 src/debug.gdb
badd +45 term:///home/zom/Projects/FTDT_compare/FTDT/src//5804:gdb\ -q\ -x\ debug.gdb\ -ex\ \'break\ main.cpp:130\'\ -ex\ \'r\'\ -ex\ refresh
badd +56 term://.//1079:/bin/bash
badd +2 build/hx_display.dat
badd +1 t.py
badd +31 ~/bin/plotd.py
badd +1 term://.//11063:/bin/bash
badd +1 term://.//11124:/bin/bash
badd +1 term://.//11253:/bin/bash
badd +9 ~/Projects/diffraction_net/zernike3/CMakeLists.txt
badd +80 ~/Projects/diffraction_net/zernike3/src/main.cpp
badd +1 ~/Projects/diffraction_net/zernike3/src/testprop.cpp
badd +1 term://.//11188:/bin/bash
badd +53 src/cfdtd.cpp
badd +1 ~/Projects/diffraction_net/zernike3/src/MeasuredImageFormatter.h
badd +3 ~/Projects/diffraction_net/zernike3/src/MeasuredImageFormatter.cpp
badd +15 src/cfdtd.h
badd +0 .git/index
badd +0 fugitive:///home/zom/Projects/FTDT_compare/FTDT/.git//0/make.sh
argglobal
%argdel
$argadd ./
set stal=2
edit src/main.cpp
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 7 + 24) / 49)
exe '2resize ' . ((&lines * 38 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 106 + 106) / 212)
exe '3resize ' . ((&lines * 38 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 105 + 106) / 212)
argglobal
if bufexists("term://.//11063:/bin/bash") | buffer term://.//11063:/bin/bash | else | edit term://.//11063:/bin/bash | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 7 - ((6 * winheight(0) + 3) / 7)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
7
normal! 0
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("~/Projects/FTDT_compare/FTDT/src/c_arrays.h") | buffer ~/Projects/FTDT_compare/FTDT/src/c_arrays.h | else | edit ~/Projects/FTDT_compare/FTDT/src/c_arrays.h | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
28
normal! zo
29
normal! zo
57
normal! zo
60
normal! zo
69
normal! zo
70
normal! zo
let s:l = 85 - ((18 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
85
normal! 07|
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
exe '1resize ' . ((&lines * 7 + 24) / 49)
exe '2resize ' . ((&lines * 38 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 106 + 106) / 212)
exe '3resize ' . ((&lines * 38 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 105 + 106) / 212)
tabedit ~/Projects/FTDT_compare/FTDT/src/main.cpp
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 106 + 106) / 212)
exe 'vert 2resize ' . ((&columns * 105 + 106) / 212)
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("~/Projects/FTDT_compare/FTDT/src/main.cpp") | buffer ~/Projects/FTDT_compare/FTDT/src/main.cpp | else | edit ~/Projects/FTDT_compare/FTDT/src/main.cpp | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
exe 'vert 1resize ' . ((&columns * 106 + 106) / 212)
exe 'vert 2resize ' . ((&columns * 105 + 106) / 212)
tabedit ~/Projects/FTDT_compare/FTDT/src/c_arrays.h
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 106 + 106) / 212)
exe 'vert 2resize ' . ((&columns * 105 + 106) / 212)
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
28
normal! zo
29
normal! zo
57
normal! zo
60
normal! zo
69
normal! zo
70
normal! zo
let s:l = 54 - ((27 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
54
normal! 07|
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("term://.//11124:/bin/bash") | buffer term://.//11124:/bin/bash | else | edit term://.//11124:/bin/bash | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 13 - ((12 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
13
normal! 0
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
exe 'vert 1resize ' . ((&columns * 106 + 106) / 212)
exe 'vert 2resize ' . ((&columns * 105 + 106) / 212)
tabedit ~/Projects/FTDT_compare/FTDT/src/main.cpp
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 23 + 24) / 49)
exe 'vert 1resize ' . ((&columns * 86 + 106) / 212)
exe '2resize ' . ((&lines * 22 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 86 + 106) / 212)
exe '3resize ' . ((&lines * 23 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 125 + 106) / 212)
exe '4resize ' . ((&lines * 22 + 24) / 49)
exe 'vert 4resize ' . ((&columns * 62 + 106) / 212)
exe '5resize ' . ((&lines * 22 + 24) / 49)
exe 'vert 5resize ' . ((&columns * 62 + 106) / 212)
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
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
26
normal! zo
33
normal! zo
34
normal! zo
37
normal! zo
39
normal! zo
let s:l = 23 - ((22 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
23
normal! 03|
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("~/Projects/FTDT_compare/FTDT/CMakeLists.txt") | buffer ~/Projects/FTDT_compare/FTDT/CMakeLists.txt | else | edit ~/Projects/FTDT_compare/FTDT/CMakeLists.txt | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 16 - ((15 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
16
normal! 028|
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("term://.//11188:/bin/bash") | buffer term://.//11188:/bin/bash | else | edit term://.//11188:/bin/bash | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 357 - ((22 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
357
normal! 041|
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("~/Projects/FTDT_compare/FTDT/src/cfdtd.cpp") | buffer ~/Projects/FTDT_compare/FTDT/src/cfdtd.cpp | else | edit ~/Projects/FTDT_compare/FTDT/src/cfdtd.cpp | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
6
normal! zo
13
normal! zo
18
normal! zo
18
normal! zo
34
normal! zo
35
normal! zo
36
normal! zo
38
normal! zo
50
normal! zo
51
normal! zo
53
normal! zo
let s:l = 53 - ((12 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
53
normal! 09|
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("~/Projects/FTDT_compare/FTDT/src/cfdtd.h") | buffer ~/Projects/FTDT_compare/FTDT/src/cfdtd.h | else | edit ~/Projects/FTDT_compare/FTDT/src/cfdtd.h | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
9
normal! zo
20
normal! zo
let s:l = 28 - ((8 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
28
normal! 0
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
4wincmd w
exe '1resize ' . ((&lines * 23 + 24) / 49)
exe 'vert 1resize ' . ((&columns * 86 + 106) / 212)
exe '2resize ' . ((&lines * 22 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 86 + 106) / 212)
exe '3resize ' . ((&lines * 23 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 125 + 106) / 212)
exe '4resize ' . ((&lines * 22 + 24) / 49)
exe 'vert 4resize ' . ((&columns * 62 + 106) / 212)
exe '5resize ' . ((&lines * 22 + 24) / 49)
exe 'vert 5resize ' . ((&columns * 62 + 106) / 212)
tabedit ~/Projects/FTDT_compare/FTDT/.git/index
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 23 + 24) / 49)
exe '2resize ' . ((&lines * 22 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 106 + 106) / 212)
exe '3resize ' . ((&lines * 22 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 105 + 106) / 212)
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 5 - ((4 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5
normal! 0
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("fugitive:///home/zom/Projects/FTDT_compare/FTDT/.git//0/make.sh") | buffer fugitive:///home/zom/Projects/FTDT_compare/FTDT/.git//0/make.sh | else | edit fugitive:///home/zom/Projects/FTDT_compare/FTDT/.git//0/make.sh | endif
setlocal fdm=diff
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("~/Projects/FTDT_compare/FTDT/make.sh") | buffer ~/Projects/FTDT_compare/FTDT/make.sh | else | edit ~/Projects/FTDT_compare/FTDT/make.sh | endif
setlocal fdm=diff
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
exe '1resize ' . ((&lines * 23 + 24) / 49)
exe '2resize ' . ((&lines * 22 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 106 + 106) / 212)
exe '3resize ' . ((&lines * 22 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 105 + 106) / 212)
tabedit ~/Projects/diffraction_net/zernike3/src
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
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 8 - ((7 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
8
normal! 0
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("~/Projects/diffraction_net/zernike3/CMakeLists.txt") | buffer ~/Projects/diffraction_net/zernike3/CMakeLists.txt | else | edit ~/Projects/diffraction_net/zernike3/CMakeLists.txt | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 32 - ((18 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
32
normal! 0
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("term://.//11253:/bin/bash") | buffer term://.//11253:/bin/bash | else | edit term://.//11253:/bin/bash | endif
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
tabedit ~/Projects/diffraction_net/zernike3/src/MeasuredImageFormatter.h
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 106 + 106) / 212)
exe 'vert 2resize ' . ((&columns * 105 + 106) / 212)
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=3
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 17 - ((16 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 03|
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
argglobal
if bufexists("~/Projects/diffraction_net/zernike3/src/MeasuredImageFormatter.h") | buffer ~/Projects/diffraction_net/zernike3/src/MeasuredImageFormatter.h | else | edit ~/Projects/diffraction_net/zernike3/src/MeasuredImageFormatter.h | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=3
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 24 - ((23 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
24
normal! 0
lcd ~/Projects/FTDT_compare/FTDT
wincmd w
exe 'vert 1resize ' . ((&columns * 106 + 106) / 212)
exe 'vert 2resize ' . ((&columns * 105 + 106) / 212)
tabnext 4
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
