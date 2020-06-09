let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Projects/ftdt
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 term://.//8005:/bin/bash
badd +1 term://.//7997:/bin/bash
badd +12 CMakeLists.txt
badd +24 ~/Projects/fdtdt_simulation/src/fdtd.h
badd +1 ~/Projects/fdtdt_simulation/src/fdtdwrapper.cu
badd +22 build/test.py
badd +1 build/Cfdtd.py
badd +1 src/cfdtd_wrapper.h
badd +1 src/cfdtd_wrapper.cpp
badd +1 term://.//8076:/bin/bash
badd +1 ~/Projects/fdtdt_simulation/src
badd +1 ~/Projects/fdtdt_simulation/CMakeLists.txt
badd +54 term://.//8452:/bin/bash
badd +42 src/cfdtd.cpp
badd +23 src/cfdtd.h
badd +111 term://.//8657:/bin/bash
badd +77 src/cuda_fdtd.h
badd +0 make.sh
badd +0 src/cfdtd_wrapper.cu
badd +0 term://.//9995:/bin/bash
badd +116 term://.//12536:/bin/bash
badd +0 .git/index
badd +0 .save.vim
badd +0 fugitive:///home/jonathon/Projects/ftdt/.git//0/.save.vim
argglobal
%argdel
$argadd ./
set stal=2
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
if bufexists("term://.//7997:/bin/bash") | buffer term://.//7997:/bin/bash | else | edit term://.//7997:/bin/bash | endif
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
lcd ~/Projects/ftdt
wincmd w
argglobal
if bufexists("term://.//8005:/bin/bash") | buffer term://.//8005:/bin/bash | else | edit term://.//8005:/bin/bash | endif
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
lcd ~/Projects/ftdt
wincmd w
exe 'vert 1resize ' . ((&columns * 106 + 106) / 212)
exe 'vert 2resize ' . ((&columns * 105 + 106) / 212)
tabedit ~/Projects/ftdt/build/test.py
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
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
exe '1resize ' . ((&lines * 11 + 24) / 49)
exe '2resize ' . ((&lines * 15 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 106 + 106) / 212)
exe '3resize ' . ((&lines * 18 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 106 + 106) / 212)
exe '4resize ' . ((&lines * 34 + 24) / 49)
exe 'vert 4resize ' . ((&columns * 105 + 106) / 212)
argglobal
if bufexists("term://.//8076:/bin/bash") | buffer term://.//8076:/bin/bash | else | edit term://.//8076:/bin/bash | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 197 - ((10 * winheight(0) + 5) / 11)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
197
normal! 045|
lcd ~/Projects/ftdt
wincmd w
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=
setlocal fdl=2
setlocal fml=1
setlocal fdn=20
setlocal fen
7
normal! zo
20
normal! zo
20
normal! zo
20
normal! zo
let s:l = 10 - ((4 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
10
normal! 02|
lcd ~/Projects/ftdt
wincmd w
argglobal
if bufexists("~/Projects/ftdt/build/Cfdtd.py") | buffer ~/Projects/ftdt/build/Cfdtd.py | else | edit ~/Projects/ftdt/build/Cfdtd.py | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=
setlocal fdl=4
setlocal fml=1
setlocal fdn=20
setlocal fen
11
normal! zo
13
normal! zo
let s:l = 17 - ((11 * winheight(0) + 9) / 18)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 09|
lcd ~/Projects/ftdt
wincmd w
argglobal
if bufexists("~/Projects/ftdt/CMakeLists.txt") | buffer ~/Projects/ftdt/CMakeLists.txt | else | edit ~/Projects/ftdt/CMakeLists.txt | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 032|
lcd ~/Projects/ftdt
wincmd w
exe '1resize ' . ((&lines * 11 + 24) / 49)
exe '2resize ' . ((&lines * 15 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 106 + 106) / 212)
exe '3resize ' . ((&lines * 18 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 106 + 106) / 212)
exe '4resize ' . ((&lines * 34 + 24) / 49)
exe 'vert 4resize ' . ((&columns * 105 + 106) / 212)
tabedit ~/Projects/ftdt/src/cuda_fdtd.h
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd w
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 35 + 24) / 49)
exe 'vert 1resize ' . ((&columns * 70 + 106) / 212)
exe '2resize ' . ((&lines * 10 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 70 + 106) / 212)
exe 'vert 3resize ' . ((&columns * 60 + 106) / 212)
exe '4resize ' . ((&lines * 15 + 24) / 49)
exe 'vert 4resize ' . ((&columns * 80 + 106) / 212)
exe '5resize ' . ((&lines * 19 + 24) / 49)
exe 'vert 5resize ' . ((&columns * 80 + 106) / 212)
exe '6resize ' . ((&lines * 10 + 24) / 49)
exe 'vert 6resize ' . ((&columns * 80 + 106) / 212)
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
7
normal! zo
66
normal! zo
70
normal! zo
84
normal! zo
87
normal! zo
let s:l = 105 - ((21 * winheight(0) + 17) / 35)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
105
normal! 05|
lcd ~/Projects/ftdt
wincmd w
argglobal
if bufexists("~/Projects/ftdt/src/cfdtd.h") | buffer ~/Projects/ftdt/src/cfdtd.h | else | edit ~/Projects/ftdt/src/cfdtd.h | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=3
setlocal fml=1
setlocal fdn=20
setlocal fen
22
normal! zo
let s:l = 23 - ((5 * winheight(0) + 5) / 10)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
23
normal! 03|
lcd ~/Projects/ftdt
wincmd w
argglobal
if bufexists("~/Projects/ftdt/src/cfdtd_wrapper.cu") | buffer ~/Projects/ftdt/src/cfdtd_wrapper.cu | else | edit ~/Projects/ftdt/src/cfdtd_wrapper.cu | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=4
setlocal fml=1
setlocal fdn=20
setlocal fen
8
normal! zo
16
normal! zo
20
normal! zo
let s:l = 17 - ((16 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 035|
lcd ~/Projects/ftdt
wincmd w
argglobal
if bufexists("~/Projects/ftdt/build/Cfdtd.py") | buffer ~/Projects/ftdt/build/Cfdtd.py | else | edit ~/Projects/ftdt/build/Cfdtd.py | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=
setlocal fdl=4
setlocal fml=1
setlocal fdn=20
setlocal fen
11
normal! zo
13
normal! zo
19
normal! zo
let s:l = 20 - ((8 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
20
normal! 017|
lcd ~/Projects/ftdt
wincmd w
argglobal
if bufexists("~/Projects/ftdt/build/test.py") | buffer ~/Projects/ftdt/build/test.py | else | edit ~/Projects/ftdt/build/test.py | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=
setlocal fdl=2
setlocal fml=1
setlocal fdn=20
setlocal fen
7
normal! zo
18
normal! zo
19
normal! zo
20
normal! zo
let s:l = 20 - ((15 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
20
normal! 017|
lcd ~/Projects/ftdt
wincmd w
argglobal
if bufexists("term://.//8657:/bin/bash") | buffer term://.//8657:/bin/bash | else | edit term://.//8657:/bin/bash | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 97 - ((9 * winheight(0) + 5) / 10)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
97
normal! 0
lcd ~/Projects/ftdt
wincmd w
5wincmd w
exe '1resize ' . ((&lines * 35 + 24) / 49)
exe 'vert 1resize ' . ((&columns * 70 + 106) / 212)
exe '2resize ' . ((&lines * 10 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 70 + 106) / 212)
exe 'vert 3resize ' . ((&columns * 60 + 106) / 212)
exe '4resize ' . ((&lines * 15 + 24) / 49)
exe 'vert 4resize ' . ((&columns * 80 + 106) / 212)
exe '5resize ' . ((&lines * 19 + 24) / 49)
exe 'vert 5resize ' . ((&columns * 80 + 106) / 212)
exe '6resize ' . ((&lines * 10 + 24) / 49)
exe 'vert 6resize ' . ((&columns * 80 + 106) / 212)
tabedit ~/Projects/ftdt/.git/index
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
lcd ~/Projects/ftdt
wincmd w
argglobal
if bufexists("fugitive:///home/jonathon/Projects/ftdt/.git//0/.save.vim") | buffer fugitive:///home/jonathon/Projects/ftdt/.git//0/.save.vim | else | edit fugitive:///home/jonathon/Projects/ftdt/.git//0/.save.vim | endif
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
lcd ~/Projects/ftdt
wincmd w
argglobal
if bufexists("~/Projects/ftdt/.save.vim") | buffer ~/Projects/ftdt/.save.vim | else | edit ~/Projects/ftdt/.save.vim | endif
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
lcd ~/Projects/ftdt
wincmd w
exe '1resize ' . ((&lines * 23 + 24) / 49)
exe '2resize ' . ((&lines * 22 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 106 + 106) / 212)
exe '3resize ' . ((&lines * 22 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 105 + 106) / 212)
tabedit ~/Projects/fdtdt_simulation/src/fdtdwrapper.cu
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
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
exe '1resize ' . ((&lines * 39 + 24) / 49)
exe 'vert 1resize ' . ((&columns * 105 + 106) / 212)
exe '2resize ' . ((&lines * 19 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 106 + 106) / 212)
exe '3resize ' . ((&lines * 19 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 106 + 106) / 212)
exe '4resize ' . ((&lines * 6 + 24) / 49)
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=20
setlocal fen
6
normal! zo
let s:l = 11 - ((10 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
11
normal! 0
lcd ~/Projects/ftdt
wincmd w
argglobal
if bufexists("~/Projects/fdtdt_simulation/CMakeLists.txt") | buffer ~/Projects/fdtdt_simulation/CMakeLists.txt | else | edit ~/Projects/fdtdt_simulation/CMakeLists.txt | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 16 - ((12 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
16
normal! 0
lcd ~/Projects/ftdt
wincmd w
argglobal
if bufexists("~/Projects/fdtdt_simulation/src/fdtd.h") | buffer ~/Projects/fdtdt_simulation/src/fdtd.h | else | edit ~/Projects/fdtdt_simulation/src/fdtd.h | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
15
normal! zo
27
normal! zo
104
normal! zo
107
normal! zo
let s:l = 24 - ((6 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
24
normal! 0
lcd ~/Projects/ftdt
wincmd w
argglobal
if bufexists("term://.//9995:/bin/bash") | buffer term://.//9995:/bin/bash | else | edit term://.//9995:/bin/bash | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 6 - ((5 * winheight(0) + 3) / 6)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
6
normal! 057|
lcd ~/Projects/ftdt
wincmd w
exe '1resize ' . ((&lines * 39 + 24) / 49)
exe 'vert 1resize ' . ((&columns * 105 + 106) / 212)
exe '2resize ' . ((&lines * 19 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 106 + 106) / 212)
exe '3resize ' . ((&lines * 19 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 106 + 106) / 212)
exe '4resize ' . ((&lines * 6 + 24) / 49)
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
