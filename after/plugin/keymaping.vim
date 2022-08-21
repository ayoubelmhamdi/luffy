" terminal
nnoremap <C-W><C-S> :vert sbN<cr>
nnoremap gn :tabnew<CR>

" LSP
nnoremap <Space>ff   <cmd>lua vim.lsp.buf.formatting_sync()<CR>

" Telescope:
autocmd TermOpen * setlocal nonu nornu | startinsert

nnoremap <Space>fg      <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <C-f>          <cmd>lua require('telescope.builtin').find_files({ find_command = { 'fd','-tf','-tl'}})  <cr>
nnoremap <Space>fd     :Telescopefindfiledart<cr>
nnoremap <Space>fb      <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <Space>fh      <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <Space>fs      :Telescope current_buffer_fuzzy_find<cr>


nnoremap <Space>fd    :lua require('tsp.cwd-tsp').search_dotfiles()<cr> 
nnoremap <Space>fn    :lua require('tsp.cwd-tsp').search_nvim()<cr> 
nnoremap <Space>fw    :lua require('tsp.cwd-tsp').search_wiki()<cr> 
nnoremap <Space>f1     :lua require('tsp.cwd-tsp').search_proj("sl")<cr> 
nnoremap <Space>f2     :lua require('tsp.cwd-tsp').search_proj("slstatus")<cr> 

let $my_vimrc = '~/.config/nvim/init.lua'
nnoremap <leader>s :source $my_vimrc<cr>

" Hop
" nnoremap <Space><Space> :HopChar2<cr>

" Train
nnoremap <Space>tl :TrainUpDown<cr>
nnoremap <Space>tw :TrainWord<cr>
nnoremap <Space>t  :TrainTextObj<cr>

" nnoremap <Esc>      :set nohlsearch<cr>
nnoremap <Tab>      :bn<cr>
if !exists('g:lasttab')
  let g:lasttab = 1
endif

nnoremap <S-Tab> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()



cnoremap <C-a> <Home>

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z



" FLUTTER
nnoremap <silent> <Space>fp :FlutterPubGet<cr>
" nnoremap <silent> <Space>fr :FlutterRun<cr>
" nnoremap <silent> <Space>ft :FlutterRestart<cr>
" nnoremap <silent> <Space>fq :FlutterQuit<cr>

inoremap <C-A-K> <C-K>

nnoremap <C-D> j<C-E>
nnoremap <C-U> k<C-Y>

nnoremap <A-h> <C-w><C-h>
nnoremap <A-j> <C-w><C-j>
nnoremap <A-k> <C-w><C-k>
nnoremap <A-l> <C-w><C-l>

tnoremap <A-H> <C-\><C-N>C-W><C-H>
tnoremap <A-J> <C-\><C-N>C-W><C-J>
tnoremap <A-K> <C-\><C-N>C-W><C-K>
tnoremap <A-L> <C-\><C-N>C-W><C-L>

tnoremap <Esc><Esc> <C-\><C-N><Esc>
tnoremap <S-Tab> <C-\><C-N>:bNext<cr>


nnoremap <C-Up>    :resize +2<cr>
nnoremap <C-Down>  :resize -2<cr>
nnoremap <C-Left>  :vertical resize -2<cr>
nnoremap <C-Right> :vertical resize +2<cr>

tnoremap <C-Up>    <C-\><C-N>:resize +2<cr>
tnoremap <C-Down>  <C-\><C-N>:resize -2<cr>
tnoremap <C-Left>  <C-\><C-N>:vertical resize -2<cr>
tnoremap <C-Right> <C-\><C-N>:vertical resize +2<cr>

"Basic file system commands
nnoremap <C-M-o> :!touch<Space>
nnoremap <C-M-d> :!mkdir<Space>
nnoremap <C-M-c> :!cp<Space>%<Space>
nnoremap <C-M-m> :!mv<Space>%<Space>

" fix p y
nnoremap s <NOP>
nnoremap s <NOP>
nnoremap <C-Q>      :noautocmd bd<cr>
nnoremap <C-Q><C-Q> :noautocmd q<cr>
nnoremap <Space>w   :w<cr>


" Alias replace all to
vnoremap <M-S> "hy:%s#<C-R><C-W>#<C-R><C-W>
nnoremap <M-S> :s#<C-R><C-W>#<C-R><C-W>#g<Left><Left>
 
" Prevent x from overriding what's in the clipboard.
" use this tow symbole "_ after motion, 



nnoremap > v>
nnoremap < v<
vnoremap > >gv
vnoremap < <gv

inoremap <M-a> <Right>
inoremap <M-i> <Left>

" Make sure all types of requirements.txt files get syntax highlighting.
autocmd BufNewFile,BufRead requirements*.txt set syntax=python



" Move : 
nnoremap <silent> <A-j> :MoveLine(1)<CR>
nnoremap <silent> <A-k> :MoveLine(-1)<CR>

vnoremap <silent> <A-j> :MoveBlock(1)<CR>
vnoremap <silent> <A-k> :MoveBlock(-1)<CR>

" togle
" nnoremap <F6> :setlocal! spell! spelllang=en,fr<cr>

" nnoremap <F1> :setlocal nu!<cr>

" nnoremap <F3> :Lexplore<cr>

" nnoremap <RightMouse> :silent Evaluate<CR>
" nnoremap <LeftMouse> :silent Evaluate<cr>
" nnoremap <Space>n :cNext<Cr>
" nnoremap <Space>b :Break<Cr>

" Command 
command! Telescopefindfiledart lua require("telescope.builtin").find_files({find_command = {"fd","--type","f","-E","*.lock","-E","ios","-E","android","-E","build","-E","web","-E","linux","-E","macos","-E","windows","-E","*.png","-E","*.jpg","-E","*.md"}})
command! Telescopefy Telescope frecency default_text=:CWD: 
command! Reloader lua require('telescope').reloader()

command! Ps PackerSync
command! Pi PackerInstall
command! Pc PackerClean

command! So so
command! W w
command! Q q
command! Qa qa
command! QA qa
command! WQ wq
command! Wq wq
command! MyGdb let g:termdebug_wide = 10 | packadd termdebug | Termdebug
nnoremap <F7> :FloatermToggle<cr>
nnoremap <F8> :silent FloatermSend           tail_latexmk<cr>:FloatermShow<cr>
tnoremap <F8> <c-\><c-n>:silent FloatermSend tail_latexmk<cr>:FloatermShow<cr>
tnoremap <F7> <c-\><c-n>:FloatermToggle<cr>
let g:floaterm_height=0.8
let g:floaterm_width=0.8
" let g:floaterm_wintype="vsplit"

" audocmd
" autocmd BufEnter *.txt setlocal spell spelllang=en
autocmd BufEnter *.tex setlocal spell spelllang=fr
au BufEnter *.xsh set syntax=python

inoremap <A-w> <c-o>w
inoremap <A-b> <c-o>b
inoremap <A-e> <c-o>e


" Clears hlsearch after doing a search, otherwise just does normal <CR> stuff
nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()


" grep hightlite
nnoremap <leader>sh <cmd>TSHighlightCapturesUnderCursor<CR>
