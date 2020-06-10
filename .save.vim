let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Projects/ftdt
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +46 term://.//7997:/bin/bash
badd +1 CMakeLists.txt
badd +24 ~/Projects/fdtdt_simulation/src/fdtd.h
badd +11 ~/Projects/fdtdt_simulation/src/fdtdwrapper.cu
badd +19 build/test.py
badd +17 build/Cfdtd.py
badd +1 src/cfdtd_wrapper.h
badd +1 src/cfdtd_wrapper.cpp
badd +319 term://.//3069:/bin/bash
badd +1 ~/Projects/fdtdt_simulation/src
badd +1 ~/Projects/fdtdt_simulation/CMakeLists.txt
badd +54 term://.//8452:/bin/bash
badd +92 src/cfdtd.cpp
badd +40 src/cfdtd.h
badd +60 src/cuda_fdtd.h
badd +1 make.sh
badd +22 src/cfdtd_wrapper.cu
badd +116 term://.//12536:/bin/bash
badd +1 .save.vim
badd +574 term://.//12846:/bin/bash
badd +814 term://.//15836:/bin/bash
badd +300 term://.//19637:/bin/bash
badd +292 term://.//22828:/bin/bash
badd +1213 term://.//23280:/bin/bash
badd +1 term://.//3144:/bin/bash
badd +1 term://.//3136:/bin/bash
argglobal
%argdel
$argadd ./
set stal=2
edit build/test.py
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
exe '1resize ' . ((&lines * 7 + 24) / 49)
exe '2resize ' . ((&lines * 38 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 70 + 106) / 212)
exe '3resize ' . ((&lines * 38 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 70 + 106) / 212)
exe '4resize ' . ((&lines * 38 + 24) / 49)
exe 'vert 4resize ' . ((&columns * 70 + 106) / 212)
argglobal
if bufexists("term://.//3069:/bin/bash") | buffer term://.//3069:/bin/bash | else | edit term://.//3069:/bin/bash | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 3086 - ((6 * winheight(0) + 3) / 7)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3086
normal! 043|
lcd ~/Projects/ftdt
wincmd w
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=
setlocal fdl=2
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
28,38fold
7,38fold
7
normal! zo
let s:l = 32 - ((26 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
32
normal! 09|
lcd ~/Projects/ftdt
wincmd w
argglobal
if bufexists("~/Projects/ftdt/src/cuda_fdtd.h") | buffer ~/Projects/ftdt/src/cuda_fdtd.h | else | edit ~/Projects/ftdt/src/cuda_fdtd.h | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 146 - ((21 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
146
normal! 09|
lcd ~/Projects/ftdt
wincmd w
argglobal
if bufexists("~/Projects/ftdt/src/cuda_fdtd.h") | buffer ~/Projects/ftdt/src/cuda_fdtd.h | else | edit ~/Projects/ftdt/src/cuda_fdtd.h | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 188 - ((11 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
188
normal! 058|
lcd ~/Projects/ftdt
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 7 + 24) / 49)
exe '2resize ' . ((&lines * 38 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 70 + 106) / 212)
exe '3resize ' . ((&lines * 38 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 70 + 106) / 212)
exe '4resize ' . ((&lines * 38 + 24) / 49)
exe 'vert 4resize ' . ((&columns * 70 + 106) / 212)
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
if bufexists("term://.//3136:/bin/bash") | buffer term://.//3136:/bin/bash | else | edit term://.//3136:/bin/bash | endif
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
if bufexists("term://.//3144:/bin/bash") | buffer term://.//3144:/bin/bash | else | edit term://.//3144:/bin/bash | endif
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
tabedit ~/Projects/ftdt/src/cuda_fdtd.h
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
let s:l = 190 - ((8 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
190
normal! 0
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
18
normal! zo
let s:l = 18 - ((17 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
18
normal! 011|
lcd ~/Projects/ftdt
wincmd w
exe 'vert 1resize ' . ((&columns * 106 + 106) / 212)
exe 'vert 2resize ' . ((&columns * 105 + 106) / 212)
tabedit ~/Projects/ftdt/build/test.py
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
setlocal fdi=
setlocal fdl=2
setlocal fml=1
setlocal fdn=20
setlocal fen
7
normal! zo
let s:l = 28 - ((27 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
28
normal! 09|
lcd ~/Projects/ftdt
wincmd w
argglobal
if bufexists("~/Projects/ftdt/build/Cfdtd.py") | buffer ~/Projects/ftdt/build/Cfdtd.py | else | edit ~/Projects/ftdt/build/Cfdtd.py | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 22 - ((21 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
22
normal! 017|
lcd ~/Projects/ftdt
wincmd w
exe 'vert 1resize ' . ((&columns * 106 + 106) / 212)
exe 'vert 2resize ' . ((&columns * 105 + 106) / 212)
tabedit ~/Projects/ftdt/src/cuda_fdtd.h
set splitbelow splitright
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
exe 'vert 1resize ' . ((&columns * 70 + 106) / 212)
exe 'vert 2resize ' . ((&columns * 70 + 106) / 212)
exe 'vert 3resize ' . ((&columns * 70 + 106) / 212)
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 190 - ((5 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
190
normal! 0
lcd ~/Projects/ftdt
wincmd w
argglobal
if bufexists("~/Projects/ftdt/src/cuda_fdtd.h") | buffer ~/Projects/ftdt/src/cuda_fdtd.h | else | edit ~/Projects/ftdt/src/cuda_fdtd.h | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 118 - ((25 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
118
normal! 05|
lcd ~/Projects/ftdt
wincmd w
argglobal
if bufexists("~/Projects/ftdt/src/cuda_fdtd.h") | buffer ~/Projects/ftdt/src/cuda_fdtd.h | else | edit ~/Projects/ftdt/src/cuda_fdtd.h | endif
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
28
normal! zo
29
normal! zo
40
normal! zo
57
normal! zo
109
normal! zo
113
normal! zo
128
normal! zo
132
normal! zo
137
normal! zo
179
normal! zo
183
normal! zo
188
normal! zo
let s:l = 36 - ((22 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
36
normal! 0
lcd ~/Projects/ftdt
wincmd w
exe 'vert 1resize ' . ((&columns * 70 + 106) / 212)
exe 'vert 2resize ' . ((&columns * 70 + 106) / 212)
exe 'vert 3resize ' . ((&columns * 70 + 106) / 212)
tabnext 1
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
