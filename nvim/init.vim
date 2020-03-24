let g:python_host_prog='/usr/bin/python3.8'

" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
" 设置剪贴板
" set clipboard=unnamedplus
" let &t_ut='' 这句不知道是什么意思
set autochdir
set mouse=a
" 不会立即刷新内容，重新渲染
set lazyredraw 

" ===
" === Editor behavior
" ===
set encoding=utf-8  
set number
set relativenumber
set cursorline

" 调整缩进的
"使用tab键，如果设置为expandtab代表用几个空格来代替tab。需要设置autoindent
set noexpandtab

set t_Co=256  " 256 color support
"设置tab的空格数目:
set tabstop=2 
" 设置自动缩进时使用的空格数目
set shiftwidth=2 
" 设置 tab 使用的空格数目
set softtabstop=2
set autoindent


" 如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块。
set list
set listchars=tab:\|\ ,trail:▫ 
" 光标距离最下面的行数
set scrolloff=5

" 调整命令接受的持续时间，这里的意思是说输入一个d，1s之后就是别的命令了。这个必须设置 timeout 才行
set ttimeoutlen=0
set notimeout

" 改变 :mkview 的效果，所处的位置
set viewoptions=cursor,folds,slash,unix

set wrap
" 设置插入内容的最大宽度，为了粘贴设置的
set tw=0

" 设置折叠，按缩进zhedie
set foldmethod=indent
set foldlevel=99
set foldenable

" 自动格式化时使用的格式
set formatoptions-=tc

"默认打开分割时，新窗口的位置
set splitright

" 设置显示当前模式，插入啊，可视啊
set showmode
set wildmenu
set ignorecase
set smartcase

" 设置简短信息，简化命令输入返回的提示信息
set shortmess+=c
" 在预览窗口中显示超出屏幕的部分
set inccommand=split
" 补全的语法
set completeopt=longest,noinsert,menuone,noselect,preview

"设置以屏幕闪烁替换响铃，当输入错误时，就会闪烁屏幕然后回到正常模式
set visualbell

" 这个设置就是右边那个蓝条，代表的列数，然后下面的是设置颜色
set colorcolumn=81
highlight ColorColumn ctermbg=blue
" 一段时间不操作，然后交换文件自动写入文件，这里就是 1s 自动保存
set updatetime=1000
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" Save & quit
noremap Q :q<CR>
" 退出所有文件
noremap <C-q> :qa<CR>
noremap S :w<CR>

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1


" Folding
noremap <silent> <LEADER>o za

noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>



" ===
" === Cursor Movement
" ===

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> K 5k
noremap <silent> J 5j

" Faster in-line navigation
noremap W 5w
noremap B 5b

" Ctrl + U or E will move up/down the view port without moving the cursor
"noremap <C-1> 5<C-y>
"noremap <C-2> 5<C-e>

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sw <C-w>t<C-w>K
" Place the two screens side by side
noremap sd <C-w>t<C-w>H

" Rotate screens
noremap srw <C-w>b<C-w>K
noremap srd <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>


" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap ta :-tabnext<CR>
noremap td :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tma :-tabmove<CR>
noremap tmd :+tabmove<CR>


" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Other useful stuff
" ===

" Opening a terminal window
" noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
noremap ` ~

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
" 显示一个图像界面的那个开头一个猪，用线条画的
noremap tx :r !figlet

" find and replace
"noremap \s :%s//g<left><left>

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "google-chrome-stable".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		CocCommand flutter.run
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc

call plug#begin('~/.config/nvim/plugged')
" below are some vim plugin for demonstration purpose

"statu line
Plug 'theniceboy/eleline.vim'
" theame
Plug 'ajmwagar/vim-deus'

" file manage
Plug 'scrooloose/nerdtree',
Plug 'Xuyuanp/nerdtree-git-plugin'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for' :['markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown'] }

" prettier
Plug 'prettier/vim-prettier', {
	\ 'do' : 'yarn install',
	\ 'for' : ['javascript','typescript','css','less','scss','json','graphql','markdown', 'vue', 'yaml', 'html']}


" html support
Plug 'mattn/emmet-vim'

" javascript
Plug 'pangloss/vim-javascript',{'for': 'javascript'}

" autopairs
Plug 'jiangmiao/auto-pairs'

" chinese swich
Plug 'rlue/vim-barbaric'
call plug#end()


" ===
" === Dress up my vim
" ===
set termguicolors	" enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1

"color dracula
"color one
color deus
"color gruvbox
"let ayucolor="light"
"color ayu
"set background=light
"color xcodedark

hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70
" ===================== Start of Plugin Settings =====================

" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1
			\ }
let g:mkdp_markdown_css = '‪'
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" ===
" === NerdTree
" ===
map tt :NERDTreeToggle<CR>
"当只有nerdtree时自动关闭vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"不同文件的高亮
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
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
" ===
" === NerdTree-git
" ===
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Ignore"   : "☒",
    \ "Unknown"   : "?"
    \ }

" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

" ===
" === vim-markdown-toc
" ===
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

" ===
" === eleline.vim
" ===
let g:airline_powerline_fonts = 0

" ===
" === Prettier.vim
" ===
nmap <Leader>pr <Plug>(Prettier)

" when running at every change you may want to disable quickfix
"let g:prettier#quickfix_enabled = 0

"autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" ===
" === emmet.vim
" ===
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" ===
" === javascript.vim
" ===
let g:javascript_plugin_jsdoc = 1

" ===
" === autopair.vim
" ===
au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{'])
"===================== end of plugin settings =====================


" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"
