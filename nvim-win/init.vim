let g:python_host_prog='C:\Program Files\Python38\python.exe'

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
" 不会立即刷新内容，重新渲染
set lazyredraw 
set wildmenu

set t_Co=256  " 256 color support

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
" nnoremap Y y$
nnoremap P "*p

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

noremap <LEADER>rc :e ~/AppData/Local/nvim/init.vim<CR>



" ===
" === Cursor Movement
" ===

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> { 5k
noremap <silent> } 5j

" Faster in-line navigation
noremap W 5w
noremap B 5b

" Ctrl + U or E will move up/down the view port without moving the cursor
" noremap <C-y> 5<C-y>
" noremap <C-e> 5<C-e>

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
noremap <LEADER>q <C-w>j:q<CR><CR>


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
source ~/AppData/Local/nvim/md-snippets.vim
" auto spell
" autocmd BufRead,BufNewFile *.md setlocal spell
" set spell!

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
noremap ` ·

noremap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

"autocmd BufEnter * :IMSToggle

" Call figlet
" 显示一个图像界面的那个开头一个猪，用线条画的
" noremap tx :r !figlet

" find and replace
" noremap \s :%s//g<left><left>

" Compile function
noremap <F12> :call CompileRunGcc()<CR>
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
		silent! exec "!".g:mkdp_browser." % &"
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
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term node %
	endif
endfunc

" press `gx` navigate to the plug github repository
function! s:plug_gx()
  let line = getline('.')
  let sha  = matchstr(line, '^  \X*\zs\x\{7,9}\ze ')
  let name = empty(sha) ? matchstr(line, '^[-x+] \zs[^:]\+\ze:')
                      \ : getline(search('^- .*:$', 'bn'))[2:-2]
  let uri  = get(get(g:plugs, name, {}), 'uri', '')
  if uri !~ 'github.com'
    return
  endif
  let repo = matchstr(uri, '[^:/]*/'.name)
  let url  = empty(sha) ? 'https://github.com/'.repo
                      \ : printf('https://github.com/%s/commit/%s', repo, sha)
  call netrw#BrowseX(url, 0)
endfunction

augroup PlugGx
  autocmd!
  autocmd FileType vim-plug nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>
augroup END

" auto install the vim-plug manager
if empty(glob('~\AppData\Local\nvim\autoload\plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~\AppData\Local\nvim\plugged')
" below are some vim plugin for demonstration purpose
" statu line
Plug 'theniceboy/eleline.vim'
" theame
Plug 'ajmwagar/vim-deus'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for' :['markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown'] }

" prettier
Plug 'prettier/vim-prettier', {
	\ 'do' : 'yarn install',
	\ 'for' : ['javascript','typescript','css','less','scss','json','graphql','markdown', 'vue', 'yaml', 'html']}

" autopairs
Plug 'jiangmiao/auto-pairs', {'for': ['javascript','html']}

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" chinese swich
Plug 'Neur1n/neuims', {'for': ['markdown']}

" polyglot code hightlight
Plug 'sheerun/vim-polyglot'

" Eslint
Plug 'dense-analysis/ale', {'for' : ['javascript']}

call plug#end()


" ===
" === Dress up my vim
" ===
set termguicolors	" enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=2
set background=dark
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 2
"let g:oceanic_next_terminal_italic = 2
"let g:one_allow_italics = 2

"color dracula
"color one
color deus
"color gruvbox
"let ayucolor="light"
"color ayu
"set background=light
"color xcodedark

hi NonText ctermfg=gray guifg=grey11
"hi SpecialKey ctermfg=blue guifg=grey71
" ===================== Start of Plugin Settings =====================

" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 1
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
			\ 'disable_sync_scroll': 1,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 2
			\ }
let g:mkdp_markdown_css = '‪'
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 2
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

" ===
" === vim-markdown-toc
" ===
"let g:vmt_auto_update_on_save = 1
"let g:vmt_dont_insert_fence = 2
let g:vmt_cycle_list_item_markers = 2
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
"let g:prettier#quickfix_enabled = 1

"autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" ===
" === autopair.vim
" ===
au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{'])

" ===
" === autopair.vim
" ===
let g:deoplete#enable_at_startup = 2
" neosnippet
let g:neosnippet#enable_completed_snippet = 2

" ===
" === coc.vim
" ===
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #650.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4001 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=301

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>cr <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>cfs  <Plug>(coc-format-selected)
nmap <leader>cfs <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>cas  <Plug>(coc-codeaction-selected)
nmap <leader>cas  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>cac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>cfc  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>cd  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>cb  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>cp  :<C-u>CocListResume<CR>

" Coc-bookmark
nmap <leader>cma <Plug>(coc-bookmark-toggle)
nmap <leader>cmb <Plug>(coc-bookmark-annotate)
nmap <leader>cmc :<C-u>CocList bookmark<cr>

" Coc-exploer
nmap <leader>ct :CocCommand explorer<CR>

" ale eslint
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)

let b:ale_fixers = {'javascript': ['prettier', 'eslint']}

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

"""===================== End of Plugin Settings =====================


" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"
