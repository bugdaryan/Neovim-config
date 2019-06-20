silent! if plug#begin('~/.vim/plugged')
    Plug 'OmniSharp/omnisharp-vim'
    Plug 'w0rp/ale'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'ervandew/supertab'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'hoelzro/vim-split-navigate'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'randomize/switch.vim'
    Plug 'mbbill/undotree'
    Plug 'hecal3/vim-leader-guide'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'morhetz/gruvbox'
call plug#end()
endif

filetype plugin on
filetype indent plugin on
syntax enable
set termguicolors

set fileencodings=utf-8,latin1
set encoding=utf-8
set listchars=tab:>·,trail:•
set list
set ff=unix

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set number
set relativenumber

set shiftwidth=4
set smartcase
set smarttab
set autoindent
set tabstop=4
set softtabstop=4
set expandtab
set showcmd
set cursorline
set wildmenu
set showmatch
set lazyredraw
set ignorecase

set foldenable
set foldlevelstart=0
set foldnestmax=10
set foldmethod=syntax

" color scheme config
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" Ale config
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : "☒",
    \ "Unknown"   : "?"
    \ }

" Split navigate config
let g:splitnavigate_start_key = "<leader><leader><leader>"
"default white on blue
highlight default TopHighlight term=bold ctermfg=252 ctermbg=18 guifg=fg guibg=#000080
" default yellow on red
highlight default BottomHighlight term=standout ctermfg=186 ctermbg=88 guifg=#d0d090 guibg=#800000

" airline config
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1

let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_c = 'WN: %{winnr()}'
let g:airline_section_y = 'BN: %{bufnr("%")} %{&encoding}'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"Swith config
let g:switch_mapping = ""
let g:switch_find_fallback_match_cursor_right = 1
let g:switch_find_fallback_match_line_start = 1

autocmd FileType cs let b:switch_custom_definitions =
    \ [
    \   [  '+=' , '-='  ],
    \   [  'private' , 'public', 'protected'  ],
    \   [  'struct' , 'class'  ],
    \   [  'OnDisable()' , 'OnEnable()' ],
    \   [  'Update()' , 'FixedUpdate()' ],
    \   [  'Debug.Log(' , 'Debug.LogFormat('],
    \   [  'Debug.LogError(', 'Debug.LogErrorFormat(' ],
    \   [  'Debug.LogWarning(', 'Debug.LogWarningFormat(' ]
    \ ]


" Undotree config
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" SuperTab config
 let g:SuperTabDefaultCompletionType = 'context'
 let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
 let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
 let g:SuperTabClosePreviewOnPopupClose = 1

" leader guide config
let g:lmap =  {}
call leaderGuide#register_prefix_descriptions(' ', "g:lmap")

" ********************************
" All mappings start here
let mapleader = ' '

"leader guide startup
nnoremap <silent> <leader> :LeaderGuide ' '<CR>
vnoremap <silent> <leader> :LeaderGuideVisual ' '<CR>
"nnoremap <silent> <leader> :LeaderGuideD g:lmap<CR>

" Easy copy/paste to/from system clipboard
let g:lmap.p = ['\"+p', 'Paste from system clipboard']
nnoremap <silent> <leader>p "+p
vnoremap <silent> <leader>y "+y
let g:lmap.y = ['\"+y', 'Copy to system clipboard']

" Folding shortcuts
" Toggle fold
nmap <silent> <leader>eft za
" Open All folds
nmap <silent> <leader>efO zR
" Close all folds
nmap <silent> <leader>efC zM

let g:lmap.e = {'name' : 'Extras'}
let g:lmap.e.f = {'name' : 'Folds'}
let g:lmap.e.f.t = ['za', 'Toggle fold']
let g:lmap.e.f.O = ['zR', 'Open all folds']
let g:lmap.e.f.C = ['zM', 'Close all folds']

" file shortcuts (like spacemacs)
nmap <silent> <leader>fs :w<CR>:echo "saved file!!!"<CR>

let g:lmap.f = {'name': 'Files'}
let g:lmap.f.s = ['w', 'Save current file']

" buffer shortcuts
nmap <silent> <leader>bd :bd<CR>:echo "Buffer Killed!!!"<CR>
nmap <silent> <leader>bdd :bd!<CR>:echo "Buffer Murdered!!!"<CR>
" startify buffer shortcut
nmap <silent> <leader>bs :Startify<CR>

let g:lmap.b = {'name': 'Buffer'}
let g:lmap.b.d = ['bd', 'Delete buffer']
let g:lmap.b.D = ['bd!', 'Delete buffer forced']
let g:lmap.b.s = ['Startify', 'Go to Startify']

" window shortcuts
nmap <silent> <leader>wj <C-w>j
nmap <silent> <leader>wk <C-w>k
nmap <silent> <leader>wh <C-w>h
nmap <silent> <leader>wl <C-w>l
nmap <silent> <leader>wJ <C-w>J
nmap <silent> <leader>wK <C-w>K
nmap <silent> <leader>wH <C-w>H
nmap <silent> <leader>wL <C-w>L
nmap <silent> <leader>wv <C-w>v
nmap <silent> <leader>ws <C-w>s
nmap <silent> <leader>wd :hide<CR>
nmap <silent> <leader>wtt :NERDTreeToggle<CR>
nmap <silent> <leader>wtc :TagbarToggle<CR>
nmap <silent> <leader>wu :UndotreeToggle<CR>
nmap <silent> <leader>wn <C-w>w
nmap <silent> <leader>qq :qa<CR>
nmap <silent> <leader>qQ :qa!<CR>

let g:lmap.w = {'name': 'Window'}
let g:lmap.w.j = ['<C-w>j', 'Go down']
let g:lmap.w.k = ['<C-w>k', 'Go up']
let g:lmap.w.h = ['<C-w>h', 'Go left']
let g:lmap.w.l = ['<C-w>l', 'Go right']
let g:lmap.w.J = ['<C-w>J', 'Go lowest']
let g:lmap.w.K = ['<C-w>K', 'Go highest']
let g:lmap.w.H = ['<C-w>H', 'Go left most']
let g:lmap.w.L = ['<C-w>L', 'Go right most']
let g:lmap.w.v = ['<C-w>v', 'Split vertical']
let g:lmap.w.s = ['<C-w>s', 'Split horizontal']
let g:lmap.w.d = ['hide', 'Destroy window']
let g:lmap.w.t = {'name': 'Toggles'}
let g:lmap.w.t.t = ['NERDTreeToggle', 'NERDTree']
let g:lmap.w.t.c = ['TagbarToggle', 'Tagbar']
let g:lmap.w.t.u = ['UndotreeToggle', 'Undotree']
let g:lmap.w.n = ['<C-w>w', 'Move to window number']
let g:lmap.q = {'name': 'Quit vim'}
let g:lmap.q.q = ['qa', 'Normal']
let g:lmap.q.Q = ['qa!', 'Forced']

" fzf mappings
nmap <leader>uff :GFiles<CR>
nmap <leader>ufb :Buffers<CR>
nmap <leader>ufw :Windows<CR>
nmap <leader>ufo :BTags<CR>
nmap <leader>uft :Tags<CR>
nmap <leader>ufl :BLines<CR>
nmap <leader>ufs :Snippets<CR>

let g:lmap.u = {'name': 'Unified search'}
let g:lmap.u.f = {'name': 'fzf'}
let g:lmap.u.f.f = ['GFiles', 'Search files']
let g:lmap.u.f.b = ['Buffers', 'Search buffers']
let g:lmap.u.f.w = ['Windows', 'Search windows']
let g:lmap.u.f.o = ['BTags', 'Search buffer tags']
let g:lmap.u.f.t = ['Tags', 'Search project tags']
let g:lmap.u.f.l = ['BLines', 'Search buffer lines']
let g:lmap.u.f.s = ['Snippets', 'Search Snippets']

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

inoremap jk <Esc>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTree<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('cpp', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('cshtml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush
nmap <leader>gP :Gpull<CR>
nmap <leader>gl :GV<CR>
nmap <leader>gb :MerginalToggle<CR>

let g:lmap.g = {'name': 'Git'}
let g:lmap.g.s = ['Gstatus', 'Status']
let g:lmap.g.c = ['Gcommit', 'Commit']
let g:lmap.g.p = ['Gpush', 'Push']
let g:lmap.g.P = ['Gpull', 'Pull']
let g:lmap.g.l = ['GV', 'Log Tree']
let g:lmap.g.b = ['MerginalToggle', 'Merginal toggle']


" Use the stdio OmniSharp-roslyn server
let g:OmniSharp_server_stdio = 1

" Set the type lookup function to use the preview window instead of echoing it
"let g:OmniSharp_typeLookupInPreview = 1

" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 5

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview
set splitbelow
" Fetch full documentation during omnicomplete requests.
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
"let g:omnicomplete_fetch_full_documentation = 1

" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

" Update symantic highlighting on BufEnter and InsertLeave
let g:OmniSharp_highlight_types = 2

let g:syntastic_cs_checkers = ['code_checker']

augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Enable snippet completion
let g:OmniSharp_want_snippet=1
