" init.vim : .nvimrc
" location of init.vim : ~/.config/nvim/

" for deoplete plugin
    function! DoRemote(arg)
        UpdateRemotePlugins
    endfunction

" Vim-Plug 설정 ------------------------------------------------------------------
" 아래와 같이 설정한 다음 :PlugInstall<CR> 해주면 된다.
call plug#begin('~/.vim/plugged')

    " VIM POWER
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}
    Plug '907th/vim-auto-save'

    " tags
    Plug 'taglist.vim'
    Plug 'ludovicchabant/vim-gutentags' " 자동으로 tags 파일을 갱신해 준다.
    Plug 'majutsushi/tagbar'

    " version control
    Plug 'tpope/vim-fugitive'           " git 명령어 wrapper
    Plug 'mbbill/undotree'

    " file browser
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'scrooloose/nerdtree'
        Plug 'jistr/vim-nerdtree-tabs'
        " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
    Plug 'mru.vim'

    " editing
    Plug 'tpope/vim-surround'
    Plug 'bling/vim-airline'           " BUFFER navigator, status line 을 제공한다.
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-commentary'
    Plug 'kana/vim-textobj-user'
        Plug 'kana/vim-textobj-entire'
        Plug 'kana/vim-textobj-indent'
        Plug 'thinca/vim-textobj-between'
    Plug 'wellle/targets.vim'           " text object utils
    Plug 'jiangmiao/auto-pairs'
    Plug 'godlygeek/tabular'           " 텍스트 세로 정렬 도구
    Plug 'junegunn/vim-easy-align'

    " searching
    Plug 'matchit.zip'
    Plug 'othree/eregex.vim'
    Plug 'haya14busa/incsearch.vim'

    " screen view
    Plug 'luochen1990/rainbow'          " 괄호를 level 별로 다르게 색칠한다. html 태그에도 적용.
    Plug 'kshenoy/vim-signature'        " m mark 위치를 표시해준다.
    Plug 'airblade/vim-gitgutter'       " git diff 를 라인 넘버 옆에 표시.
    Plug 'johngrib/FlatColor-johngrib'  " color theme
    Plug 'ap/vim-css-color'             " #rrggbb 형식의 문자열에 색깔을 입혀준다.
    Plug 'itchyny/vim-cursorword'       " 커서가 위치한 word 아래에 underline 을 그어준다.
    Plug 'mhinz/vim-startify'           " 시작 화면을 꾸며준다. MRU가 있어 편리하다.

    " language support
    Plug 'scrooloose/syntastic'        " 파일을 저장할 때 자동으로 문법 검사(ale과 중복되는 기능)
    " Plug 'w0rp/ale'                      " 실시간으로 문법 검사 (syntastic 과 중복되는 기능)
    Plug 'pangloss/vim-javascript'
    Plug 'junegunn/vim-xmark', { 'do': 'make' }
    Plug 'valloric/youcompleteme', { 'do': './install.py --all'}
    " Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

    " Plug 'yggdroot/indentline'        " 문자열 ** 을 hidden 상태로 바꾼다. 몹시 짜증남. 다시는 설치하지 말 것.
    " Plug 'raimondi/delimitmate'       " 따옴표, 괄호 등을 입력하면 닫는 따옴표,괄호를 추가해준다.
    Plug 'kana/vim-operator-user'
        Plug 'tyru/operator-camelize.vim'

    Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'
    " Plug 'tpope/vim-liquid'
    " Plug 'tpope/vim-speeddating'

call plug#end()

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
    set termguicolors
endif

" Theme
syntax enable
" colorscheme OceanicNext

"syntax on
filetype plugin indent on " Put your non-Plugin stuff after this line

" set ----------------------------------------------------------------------

    set path+=**
    set nofixeol

    if executable('ag')
        set grepprg=ag\ --nogroup\ --nocolor\ --column
        set grepformat=%f:%l:%c%m
    elseif executable('ack')
        set grepprg=ack\ --nogroup\ --column\ $*
        set grepformat=%f:%l:%c:%m
    endif

    if has("nvim")
        set termguicolors
        set clipboard^=unnamedplus
    endif

    if has("gui_macvim")
        set macmeta
        set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h11
    endif

    "set noimd  " normal 모드에서 한국어 입력시에도 영문으로 입력한 것처럼 동작 -> 제대로 작동하지 않는다.
    set nocompatible                  " vi 기능을 사용하지 않고, vim 만의 기능을 사용.
    " set linebreak                     " break at word boundary
    " set showbreak=++
    set list listchars=tab:»\ ,trail:·,extends:>,precedes:<
    set omnifunc=syntaxcomplete#Complete
    set mouse=a

    set hidden

    set smartcase ignorecase hlsearch incsearch
    "set tildeop    "~ 를 다른 오퍼레이터와 함께 사용한다.
    set wmnu        " tab 자동완성시 가능한 목록을 보여줌

    " 화면 표시
    set nu               " 라인 넘버 출력
    set ruler            " 현재 커서 위치 (row, col) 좌표 출력
    set noerrorbells     " 에러 알림음 끄기
    set background=dark  " 검정배경을 사용 (이 색상에 맞춰 문법 하이라이트 색상이 달라짐.)
    set laststatus=2     " 상태바를 언제나 표시할 것
    set showmatch        " 일치하는 괄호 하이라이팅
    set cursorline       " highlight current line
    set lazyredraw       " redraw only when we need to.
    set showcmd          " airline 플러그인과 충돌 가능성 있음.
    "set nowrap
    " set sidescroll=2 sidescrolloff=10
    set wildmenu wildignorecase
    set wildmode=full

    set noerrorbells visualbell t_vb= " 사운드 벨, 비주얼 벨 비활성화

    augroup setgroup
        autocmd!
        autocmd GUIEnter * set visualbell t_vb=
    augroup END

    "사용
    set bs=indent,eol,start  " backspace 키 사용 가능
    set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
    "set noimd               " no imdisable 한글 입력기 관련인데 mac 에서는 안 통하는듯
    set cindent autoindent smartindent
    set history=200 undolevels=2000
    set cursorcolumn
    set langmap=ㅁa,ㅠb,ㅊc,ㅇd,ㄷe,ㄹf,ㅎg,ㅗh,ㅑi,ㅓj,ㅏk,ㅣl,ㅡm,ㅜn,ㅐo,ㅔp,ㅂq,ㄱr,ㄴs,ㅅt,ㅕu,ㅍv,ㅈw,ㅌx,ㅛy,ㅋz

    colorscheme flatcolor-johngrib

    if has("syntax")
        "syntax on
    endif

" initialize 설정 ---------------------------------------------------------------

" 마지막으로 수정된 곳에 커서를 위치함
    au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "norm g`\"" |
    \ endif

" map ----------------------------------------------------------------------
    let mapleader = "\<Space>"
    let maplocalleader = "\\"
    nnoremap <Leader>e :browse oldfiles<CR>
    " nnoremap <f5> :!ctags -R<CR>

    nnoremap k gk
    nnoremap gk k
    nnoremap j gj
    nnoremap gj j

    nnoremap & :&&<CR>
    xnoremap & :&&<CR>

    "nnoremap <F10>r :source ~/.vimrc<CR>
    nnoremap <F10>r :source ~/.config/nvim/init.vim<CR>
    "nnoremap gv `[v`]    " highlight last inserted text
    nnoremap <NL> i<CR><ESC>

    " copy , paste , select 기능 보완
    nnoremap Y y$
    nnoremap <Leader>y "*y
    nnoremap <Leader>Y "*yg_
    vnoremap <Leader>y "*y
    nnoremap <Leader>p "*p
    nnoremap <Leader>P "*P
    " nnoremap <Leader>a gg<S-v>G
    "nnoremap gn       :call ToggleNumber()<cr>
    nnoremap <F3>     :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

    " 버퍼 관리
    nnoremap <M-t> :enew<CR>       " 새로운 버퍼를 연다
    nnoremap gt :bnext!<CR>        " 다음 버퍼로 이동
    nnoremap gr :bprevious!<CR>    " 이전 버퍼로 이동
    nnoremap <M-n> :bnext!<CR>        " 다음 버퍼로 이동
    nnoremap <M-p> :bprevious!<CR>    " 이전 버퍼로 이동
    nnoremap <M-q> :bp <BAR> bd #<CR> " 현재 버퍼를 닫고 이전 버퍼로 이동

    "Bubble lines
    nnoremap <M-k> ddkP
    nnoremap <M-j> ddp
    " nnoremap gV `[v`]

    " nnoremap <leader>ev :vsplit $MYVIMRC<cr>

    " 윈도우 관리
    nnoremap <M-=> <C-w>+
    nnoremap <M--> <C-w>-
    nnoremap <M-,> <C-w><
    nnoremap <M-.> <C-w>>

    " reselect visual block after indent/outdent
    " link: http://tilvim.com/2013/04/24/reindenting.html
    vnoremap < <gv
    vnoremap > >gv

    " completion
    " <c-x><c-l>  whole lines :h i^x^l
    " <c-x><c-l>  keywords from current file  :h i^x^n
    " <c-x><c-k>  keywords from 'dictionary' option   :h i^x^k
    " <c-x><c-t>  keywords from 'thesaurus' option    :h i^x^t
    " <c-x><c-i>  keywords from current and included files    :h i^x^i
    " <c-x><c-]>  tags    :h i^x^]
    " <c-x><c-f>  file names  :h i^x^f
    " <c-x><c-d>  definitions or macros   :h i^x^d
    " <c-x><c-v>  Vim commands    :h i^x^v
    " <c-x><c-u>  user defined (as specified in 'completefunc')   :h i^x^u
    " <c-x><c-o>  omni completion (as specified in 'omnifunc')    :h i^x^o
    " <c-x>s  spelling suggestions

" Plugin 설정 -------------------------------------------------------------------

    " Autofair
    let g:AutoPairsFlyMode = 0
    let g:AutoPairsShortcutToggle = ''
    let g:AutoPairsShortcutFastWrap = ''
    let g:AutoPairsShortcutJump = ''
    let g:AutoPairsShortcutBackInsert = ''

    " " incsearch
    let g:incsearch#auto_nohlsearch = 1
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
    map n  <Plug>(incsearch-nohl-n)
    map N  <Plug>(incsearch-nohl-N)
    map *  <Plug>(incsearch-nohl-*)
    map #  <Plug>(incsearch-nohl-#)
    map g* <Plug>(incsearch-nohl-g*)
    map g# <Plug>(incsearch-nohl-g#)

    " ctrlp
    let g:ctrlp_working_path_mode = 'ra'

    " UndoTree
    nnoremap <LocalLeader>u :UndotreeToggle<cr>
    if has("persistent_undo")
        set undodir=~/.undodir/
        set undofile
    endif

    " NERDTree
    let NERDTreeShowHidden = 1 "Show hidden files in NerdTree
    nnoremap <LocalLeader>n :NERDTreeToggle<CR>
    nnoremap <LocalLeader>m :NERDTreeMirrorToggle<CR>
    nnoremap <LocalLeader>s :NERDTreeTabsFind<CR>
    let g:NERDTreeQuitOnOpen = 0
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1

    function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
        exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
        exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
    endfunction

    call NERDTreeHighlightFile('jade', 'Magenta', 'none', 'green', '#151515')
    call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
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

    " rainbow
    nnoremap <F12>r :RainbowToggle<CR>

    " MRU
    let MRU_Auto_Close = 1
    nnoremap <LocalLeader>e :<C-u>MRU<CR>

    " Easy motion
    "let g:EasyMotion_do_mapping  = 0 " Disable default mappings
    let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
    let g:EasyMotion_smartcase = 1
    map  <Leader>  <Plug>(easymotion-prefix)
    vmap s         <Plug>(easymotion-bd-f)
    nmap s         <Plug>(easymotion-overwin-f2)
    nmap <Leader>l <Plug>(easymotion-lineforward)
    nmap <Leader>j <Plug>(easymotion-j)
    nmap <Leader>k <Plug>(easymotion-k)
    nmap <Leader>h <Plug>(easymotion-linebackward)

    " indentline 설정
    nnoremap <F12>i :IndentLinesToggle<CR>

    " Syntastic 설정
    "   : ale 때문에 사용하지 않는 상태
    " https://thechefprogrammer.blogspot.kr/2014/05/syntax-check-for-php-and-javascript.html
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_php_checkers = ['php']
    let g:syntastic_check_on_wq = 0
    let g:syntastic_mode_map = { 'mode': 'passive' }
    let g:syntastic_auto_loc_list = 0
    nnoremap <silent> <F6> :SyntasticCheck<CR>

    " au CursorHold,InsertLeave * nested call AutoSave()

    " vim-airline 설정
    " @link http://bakyeono.net/post/2015-08-13-vim-tab-madness-translate.html
    let g:airline#extensions#tabline#enabled = 1     " vim-airline 버퍼 목록 켜기
    let g:airline#extensions#tabline#fnamemod = ':t' " vim-airline 버퍼 목록 파일명만 출력
    let g:airline#extensions#tabline#buffer_nr_show = 1 " buffer number 를 보여준다
    let g:airline#extensions#tabline#buffer_nr_format = '%s:' " buffer number format
    let g:airline_powerline_fonts = 1
    " let g:airline_left_sep = ''
    " let g:airline_left_alt_sep = ''
    " let g:airline_right_sep = ''
    " let g:airline_right_alt_sep = ''

    " rainbow
    let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

    " tabular
    vnoremap <C-t> :Tabularize /

    " peekaboo 관련
    " let g:peekaboo_window = 'vertical botright 30new'
    " let g:peekaboo_delay = 0
    " let g:peekaboo_compact = 0

    "ycm
    let g:ycm_key_list_select_completion = ['<C-n>']    " 본래 <Tab> 이지만 ultisnip 과 충돌을 막기 위해 변경
    let g:ycm_key_list_previous_completion=['<C-p>']
    " let g:ycm_server_python_interpreter = '/usr/bin/python'
    let g:ycm_server_python_interpreter = '/usr/local/Cellar/python/2.7.13/bin/python'
    " let g:ycm_server_python_interpreter = '/usr/local/Cellar/python3/3.6.0_1/bin/python3'
    let g:ycm_complete_in_comments = 1
    let g:ycm_min_num_of_chars_for_completion = 1

    "deoplete
    if has("nvim")
        "let g:deoplete#enable_at_startup = 1 " Use deoplete.
    endif

    "eclim
    " let g:EclimCompletionMethod = 'omnifunc'

    " fzf
    let g:fzf_launcher = "In_a_new_term_function %s"
    imap <c-x><c-l> <plug>(fzf-complete-line)

    " eregex
    nnoremap <leader>/ :call eregex#toggle()<CR>
    let g:eregex_default_enable = 0
    let g:eregex_forward_delim = '/'
    let g:eregex_backward_delim = '?'
    let g:eregex_force_case = 0

    " Trigger configuration. <Tab> 을 쓴다면 ycm 과 키가 중복되어 제대로 기능하지 않을 수 있다. 둘 중 하나의 설정을 바꿔준다.
    let g:UltiSnipsExpandTrigger="<Tab>"
    let g:UltiSnipsJumpForwardTrigger="<Tab>"
    let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
    let g:UltiSnipsEditSplit="vertical"     " If you want :UltiSnipsEdit to split your window.

    " nmap ga <Plug>(EasyAlign)
    " xmap ga <Plug>(EasyAlign)

    " camelize
    map <LocalLeader>c <Plug>(operator-camelize)
    map <LocalLeader>C <Plug>(operator-decamelize)

    " UltiSnips
    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

    " tagbar
    nnoremap <LocalLeader>t :TagbarToggle<CR>

    " vim-auto-save
    let g:auto_save = 1  " enable AutoSave on Vim startup
    let g:auto_save_silent = 1  " do not display the auto-save notification
    let g:auto_save_events = ["InsertLeave", "TextChanged"]
    let g:auto_save_postsave_hook = 'SyntasticCheck'

" functions -------------------------------------------------------------------
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

command! ToHtml :so $VIMRUNTIME/syntax/2html.vim

" http://vim.wikia.com/wiki/Copy_filename_to_clipboard
if has('win32')
    command! GetFileName :let @*=substitute(expand("%"), "/", "\\", "g")
    command! GetFileAddress :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
else
    command! GetFileName :let @*=expand('%')
    command! GetFileAddress :let @*=expand('%:p')
endif

" 현재 편집중인 파일 경로로 pwd 를 변경한다
command! Ncd :cd %:p:h

" tmux에서 배경색이 이상하게 나오는 문제를 해결한다.
" link : http://stackoverflow.com/a/15095377
set t_ut=

" Change cursor shape between insert and normal mode in iTerm2.app + tmux + vim
" https://gist.github.com/andyfowler/1195581
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

