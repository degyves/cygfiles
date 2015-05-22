  :imap jj <Esc>
  syntax on
  " Usar l<backspace>* para obtener el caracter λ y otros 
  set digraph

  " El cursor siempre en la línea media, cuando sea posible
  " para apagar, :set so=0
  " set so=999
  " set so=0
  "
  " Cambiar el leader, de "\" a ","
  let mapleader=","

  " Copiar nombre del archivo al portapapeles
  nmap <leader>f :let @"=expand("%")<CR>

  " Busqueda inteligente
  set incsearch
  set ignorecase
  set smartcase
  " hlsearch marca todas las ocurrencias. <leader>h para desmarcar.
  set hlsearch
  "nmap <leader>h :noh<CR>
  " Desmarcar despues de updatetime
  function! SearchHlClear()
        let @/ = ''
  endfunction
  autocmd CursorHold,CursorHoldI * call SearchHlClear()

  " :set tags=tags;

  " Numeros de linea ( nn for toggle )
  " set number
  nmap <leader>n :setlocal number!<CR>

  " lisp, no mandar los parentesis de cierre hacia abajo
  let g:paredit_electric_return=0
  " lisp usar common lisp hyperspec local
  let g:slimv_browser_cmd = "firefox"
  " let g:slimv_clhs_root = "file:///c:/cygwin64/home/VictorPolo/lisp/clhs/HyperSpec/Body/"
  " let g:slimv_browser_cmd = "lynx"
  let g:slimv_clhs_root = "file:///home/VictorPolo/lisp/clhs/HyperSpec/Body/"
  let g:slimv_repl_syntax = 0
  " Apagar slimv para lisp: 
  let g:slimv_disable_lisp = 1
  let g:slimv_leader = "-"
  nmap <leader>r :redraw!<CR>
autocmd FileType lisp let g:lisp_rainbow=1
autocmd FileType rkt let g:lisp_rainbow=1
if empty($BUFFERFILE)
	let g:vimconsolebuff = $HOME . "/.consolebuff"
else
	let g:vimconsolebuff = ($BUFFERFILE)
endif

let g:frepl= ":POP"

let g:consolemuxfound = 1
if empty($STY) && empty($TMUX)
	let g:consolemuxfound = 0
endif

" lisp  - copiar de VIM a /tmp/screen-exchange
" Si singleline = 1, enviar la línea actual al REPL
" Si singleline no está seteado, enviar el párrafo actual al REPL
" Si singleline = 2, enviar line al REPL
function! PasteToConsoleMultiplexer( singleline, line )
	if g:consolemuxfound
		if a:singleline
			if a:singleline == 1
				normal yy
			elseif a:singleline == 2
        " :echom "LINE TO REPL2"
				:call setreg("", a:line)
			endif
		else
			normal vapy%
		endif
		:call writefile( split(@", "\n"), g:vimconsolebuff )
		:silent !consoleMultiplexerPasteFunction & > /dev/null
		:redraw!
		:echo "Paste to console multiplexer"
	else
		:echo "Err: No console multiplexer"
	endif
endfunction
" Copiar una sola linea
nmap <C-f> :call PasteToConsoleMultiplexer(0, "")<CR>
" Copiar un bloque de texto
" y a partir de alli, llamar a bin/gnuScreenPasteFunction
" de forma que se pegue en la ventana contigua de GNU Screen
nmap <C-c> :call PasteToConsoleMultiplexer(1, "")<CR>
"  Enviar mensaje de abortar al REPL
nmap <C-x> :call PasteToConsoleMultiplexer(2, g:frepl)<CR>
" Abrir el REPL de lisp en modo vertical
" nmap <leader>k <leader>c<CR>:only<CR><C-w>v<CR><C-w>w<CR>L<CR>

" Colorear la columna 80 (solo Vim 8.3) ( <leader>8 toggle)
function! g:ToggleColorColumn()
	if &colorcolumn != 0
		:setlocal colorcolumn=0
	else
		:setlocal colorcolumn=72
	endif
endfunction
nnoremap <silent> <leader>8 :call g:ToggleColorColumn()<CR>

nmap <leader>p :setlocal paste!<CR>

" Edit .screenrc
nmap <silent> <leader>es :e ~/.screencustomrc<CR>
" Edit .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
" Reload .vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" Edit commands.txt
nmap <silent> <leader>ec :e ~/commands.txt<CR>


set background=dark
hi SpecialKey ctermfg=gray
hi NonText ctermfg=gray
hi PreProc ctermfg=gray


" MiniBufExpl Colors
hi MBENormal               ctermfg=cyan  ctermbg=black
hi MBEChanged              ctermfg=red ctermbg=black
hi MBEVisibleNormal        ctermfg=blue ctermbg=black
hi MBEVisibleChanged       ctermfg=yellow ctermbg=black
hi MBEVisibleActiveNormal  ctermfg=white ctermbg=black
hi MBEVisibleActiveChanged ctermfg=green ctermbg=black

" Let status line display some useful info
hi StatusLine cterm=NONE ctermbg=black ctermfg=white
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''} "Encoding
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

set backupdir=$HOME/tmp
set directory=$HOME/tmp/swapfiles//
behave mswin
set nocompatible

" indentar automaticamente los archivos con extension reconocida
filetype indent on
filetype plugin on

" auto-leer si cambia el archivo por fuera
" set autoread
set ruler

set encoding=utf-8
set fileencoding=utf-8
function! CheckFileEncoding()
	if &modified && &fileencoding !=''
		exec 'e! ++enc=' . &fileencoding
	endif
endfunction

au BufNewFile,BufRead *.maxima,*.wxmx set filetype=maxima
au BufNewFile,BufRead *.fs set filetype=fsharp
au BufNewFile,BufRead *.fsx set filetype=fsharp
au BufNewFile,BufRead *.fsi set filetype=fsharp
au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.vcf set filetype=vcard
au BufNewFile,BufRead *.js set filetype=javascript
au BufNewFile,BufRead *.asd  set filetype=lisp
au BufNewFile,BufRead *.jar,*.war,*.rar set filetype=zip
au BufNewFile,BufRead *.proj,*.csproj set filetype=xml
let g:xml_syntax_folding=1
au FileType mxml setlocal foldmethod=manual
au FileType actionscript setlocal foldmethod=manual
au BufWinEnter *.F90 call CheckFileEncoding()
au BufWinEnter *.f90 call CheckFileEncoding()

" Cuando el archivo sea escrito
au BufWritePost *.tex :call Refresh_Tex()
" Cuando el archivo sea modificado
function! Refresh_Tex()
  :write 
  :silent !pdflatex -output-directory=%:p:h % >/dev/null
  :redraw!
endfunction

autocmd BufWriteCmd *.html,*.css,*.gtpl :call Refresh_firefox()
function! Refresh_firefox()
	"echom "Refresh firefox!"
	if &modified
		echom "Modified!"
		write
		silent !echo 'vimYo = content.window.pageYOffset;
					\ vimXo = content.window.pageXOffset;
					\ BrowserReload();
					\ content.window.scrollTo(vimXo, vimYo);
					\ repl.quit();' |
					\ nc -w 1 127.0.0.1 4242 2>&1 >/dev/null
	endif
endfunction

" Con \ml se carga el archivo html en firefox
command! -nargs=1 Repl silent !echo
			\ "repl.home();
			\ content.location.href='<args>';
			\ repl.enter(content);
			\ repl.quit();"|
			\ nc 127.0.0.1 4242

function! Goto_firefox( arg ) 
	let str = "cygpath -am " . expand("%:p")
	echom "str: " . str
	let str2 = substitute( system( str ), "\n","","")
	echom "str2: " . str2 
	let path = '"file:///'. str2 . '";'
	echom "path: " . path
	let exec = '''repl.home(); content.location.href = ' . path
	let exec = exec . 'repl.enter(content); repl.quit();'''
	let exec = "!echo " . exec . "| nc -w 1 localhost 4242 2>&1>/dev/null"
	echom exec
	silent execute exec
endfunction

" from local
nmap <silent> <leader>ml :Repl file:///%:p<CR>
" nmap <silent> <leader>mh :Repl http://localhost:8000/app/%:p<CR>

autocmd FileType make set noexpandtab
autocmd FileType cs set noexpandtab|set tabstop=4|set shiftwidth=4|set softtabstop=4|set autoindent
autocmd BufRead, BufNewFile *.fs *.fsx *.fsi *.c, *.h, *.java, *.sh set expandtab|set tabstop=2|set shiftwidth=2|set softtabstop=2|set autoindent
autocmd BufRead, BufNewFile *.f90, *.F90 set expandtab|set tabstop=2|set shiftwidth=2|set softtabstop=2|set autoindent
autocmd BufRead, BufNewFile *.py set expandtab
autocmd FileType fortran set expandtab
autocmd FileType fsharp set expandtab|set tabstop=2|set shiftwidth=2|set softtabstop=2|set autoindent
autocmd FileType java set expandtab|set tabstop=4|set shiftwidth=4|set softtabstop=4|set autoindent
autocmd FileType javascript set expandtab|set tabstop=4|set shiftwidth=4|set softtabstop=4|set autoindent
autocmd FileType vim set expandtab|set tabstop=2|set shiftwidth=2|set softtabstop=2|set autoindent

" :bufdo ejecuta algo para todos los buffers
" bd cierra un buffer
" <bar> es la "|" de vimrc para ejecutar varios comandos en uno
" q es para salir del vim

" Movement between tabs OR buffers
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap L :call MyNext()<CR>
nnoremap H :call MyPrev()<CR>

" cambiar entre buffers sin grabar cambios
" ni perderlos
" NOTA: solo funciona en vim
set hidden
" MyNext() and MyPrev(): Movement between tabs OR buffers
function! MyNext()
	if exists( '*tabpagenr' ) && tabpagenr('$') != 1
		" Tab support && tabs open
		normal gt
	else
		" No tab support, or no tabs open
		execute ":bnext"
	endif
endfunction

function! MyPrev()
	if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
		" Tab support && tabs open
		normal gT
	else
		" No tab support, or no tabs open
		execute ":bprev"
	endif
endfunction

au BufRead,BufNewFile *.java set filetype=java
set foldmethod=syntax
set foldmarker={,}
set foldenable
set foldnestmax=2
set foldlevel=0
set foldlevelstart=1

set laststatus=2 " barra de estado permanente
" numero de buffer
set statusline+=%-10.3n
" nombre del archivo (tail del archivo)
set statusline+=%t
" indicar si es modificado
set statusline+=%m 
"indicar columna de barra de estado
set statusline+=\ col:\ %c
" color de barra de estado en fondo negro letras amarillas
hi StatusLineNC ctermfg=black ctermbg=white
hi StatusLine ctermfg=white ctermbg=black

" TODO: Eliminar
" ConqueTerm permite usar C-w en modo insert
" let g:ConqueTerm_InsertOnEnter = 1
" let g:ConqueTerm_CWInsert = 1

" Usar F8 para tooglear el tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_width = 50
let g:tagbar_autofocus = 1

" Presentar menús con F4:
if !has("gui_running")
	:source $VIMRUNTIME/menu.vim 
	:set wildmenu                        
	:set cpoptions-=<
	:set wildcharm=<C-Z>
	:map <F5> :emenu <C-Z>
endif

" let g:VimPyServer_autostart=0
" let g:VimPyServer_port=9871
" let g:VimPyServer_host='127.0.0.1'


" Ejecutar pathogen
execute pathogen#infect()
Helptags

let g:zipPlugin_ext = '*.zip,*.jar,*.xpi,*.ja,*.war,*.ear,*.celzip,*.oxt,*.kmz,*.wsz,*.xap,*.docx,*.docm,*.dotx,*.dotm,*.potx,*.potm,*.ppsx,*.ppsm,*.pptx,*.pptm,*.ppam,*.sldx,*.thmx,*.crtx,*.vdw,*.glox,*.gcsx,*.gqsx'
