" ~/.vimrc
" Lisa McCutcheon
" Wed Feb 07, 2007

" **************************************
" * VARIABLES
" **************************************
set nocompatible		" get rid of strict vi compatibility!
set nu				" line numbering on
set autoindent			" autoindent on
set noerrorbells		" bye bye bells :)
set vb t_vb=			" NO BELLS AT ALL
set modeline			" show what I'm doing
set showmode			" show the mode on the dedicated line (see above)
set nowrap			" no wrapping!
set ignorecase			" search without regards to case
set backspace=indent,eol,start	" backspace over everything
set fileformats=unix,dos,mac	" open files from mac/dos
set exrc			" open local config files
set nojoinspaces		" don't add white space when I don't tell you to
set ruler			" which line am I on?
set showmatch			" ensure Dyck language
set incsearch			" incremental searching
set nohlsearch			" meh
set bs=2			" fix backspacing in insert mode
set background=dark
"set bg=dark

" Expand tabs in C files to spaces
au BufRead,BufNewFile *.{c,h,java} set expandtab
au BufRead,BufNewFile *.{c,h,java} set shiftwidth=2
au BufRead,BufNewFile *.{c,h,java} set tabstop=2

" Do not expand tabs in assembly file.  Make them 8 chars wide.
au BufRead,BufNewFile *.s set noexpandtab
au BufRead,BufNewFile *.s set shiftwidth=8
au BufRead,BufNewFile *.s set tabstop=8

" Show syntax
syntax on

" This is my prefered colorscheme, open a file with gvim to view others
:colorscheme ron

" For switching between many opened file by using ctrl+l or ctrl+h
map <C-J> :next <CR>
map <C-K> :prev <CR>

" Spelling toggle via F10 and F11
map <F10> <Esc>setlocal spell spelllang=en_us<CR>
map <F11> <Esc>setlocal nospell<CR>

" setlocal textwidth=80		" used for text wrapping

function FileHeading()
	let s:line=line(".")
	call setline(s:line,   "/***")
	call append (s:line, " * Name:              ")
	call append (s:line+1, " * Date:            " .strftime("%b %d %Y"))
	call append (s:line+2, " * Filename:        " .expand("%"))
	call append (s:line+3, " * Description:     ")
	call append (s:line+4, " * Sources of help: ")
	call append (s:line+5, " ***/")
	unlet s:line
endfunction

imap <F4> <ESC>mz:execute FileHeading()<CR>`z4jA

" Function header macro"
function FuncHeading()
	let s:line=line(".")
	call setline(s:line,  "/*")
	call append (s:line, " * Function name:           ")
	call append (s:line+1, " * Function prototype:    ")
	call append (s:line+2, " * Description:   ")
	call append (s:line+3, " * Parameters:    ")
	call append (s:line+4, " * Side Effects:  ")
	call append (s:line+5, " * Error Conditions:  ")
	call append (s:line+6, " * Return Value:  ")
	call append (s:line+7, " */")
	unlet s:line
endfunction
imap <F3> <ESC>mz:execute FuncHeading()<CR>`z4jA
