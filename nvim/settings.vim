" mappings for jumping
nnoremap <C-j> <C-o>
nnoremap <C-k> <C-i>
"enable yank/paste to/from system clipboard
set clipboard+=unnamedplus
" to visually select and copy from vim without line numbers
if has('mouse')
  set mouse=a
endif
" Don't redraw while executing macros (good performance config)
set lazyredraw
set ttyfast
" add chars to '%'
set matchpairs+=<:>
" highlight for current line
set cursorline
" highlight for current column
set cursorcolumn
" deepest fold is 10 levels
set foldnestmax=10
" don't fold by default
set nofoldenable
" fold text using syntax
set foldmethod=syntax
" when line is longer than the screen, it continues on the next line
set nowrap
" but do not break words, only 'by words'
set linebreak
" show absolute line number
set number
" keep searched chunks hightlighted
set hlsearch
" search case-insensitive
set ignorecase
" if on with ignorecase, when a pattern contains an uppercase letter, it is
" case sensitive, otherwise it is not
set smartcase
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nowb
set noswapfile
" show what commands you typing, what you select in visual mode, etc.
set showcmd
" Automatically :write before running commands
set autowrite
" put Set 'tabstop' and 'shiftwidth' to whatever you prefer and use
" 'expandtab'.  This way you will always insert spaces.  The
" formatting will never be messed up when 'tabstop' is changed.
set expandtab " spaces when pressing TAB in insert mode
set tabstop=2
set shiftwidth=2
" when scrolling screen via f.e. J and K how many lines should be to the
" bottom of the page (for scroll to trigger you need be at 5 line from bottom
" and press 'j')
set scrolloff=5
" resize signcolumn size dynamically depending on context
set signcolumn=auto
" make inner terminal zsh
set shell=/usr/local/bin/zsh
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif
