"
nnoremap <C-w><C-s> :vert sbN<cr>
nnoremap gn :tabnew<CR>
nnoremap q: :q
" Telescope:
nnoremap <Space>fd  :Telescopefindfiledart<cr>
nnoremap <Space>fs  :Telescope current_buffer_fuzzy_find<cr>
nnoremap <Space>fg  <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <Space>fb  <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <Space>fh  <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <Space>ff  <cmd>lua require('telescope.builtin').find_files({ find_command = { 'fd','-tf','-tl'}})<cr>

nnoremap <Space>fh  <cmd>:lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <Space>fa  <cmd>:lua require("harpoon.mark").add_file()<cr>
nnoremap <Space>fn  <cmd>:lua require("harpoon.ui").nav_next()<cr>
nnoremap <Space>fp  <cmd>:lua require("harpoon.ui").nav_prev()<cr>

nnoremap <Space>f. :lua require('tsp.cwd-tsp').search_dotfiles()<cr> 
nnoremap <Space>f- :lua require('tsp.cwd-tsp').search_nvim()<cr> 
nnoremap <Space>fw :lua require('tsp.cwd-tsp').search_wiki()<cr> 
nnoremap <Space>f1 :lua require('tsp.cwd-tsp').search_proj("sl")<cr> 
nnoremap <Space>f2 :lua require('tsp.cwd-tsp').search_proj("slstatus")<cr> 

let $my_vimrc = '~/.config/nvim/init.lua'
nnoremap <leader>s :source $my_vimrc<cr>

" Hop
" nnoremap <Space><Space> :HopChar2<cr>

" Train
nnoremap ,tt :TrainUpDown<cr>
nnoremap ,tw :TrainWord<cr>
nnoremap ,t  :TrainTextObj<cr>

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
" nnoremap <silent> <Space>fp :FlutterPubGet<cr>
" nnoremap <silent> <Space>fr :FlutterRun<cr>
" nnoremap <silent> <Space>ft :FlutterRestart<cr>
" nnoremap <silent> <Space>fq :FlutterQuit<cr>

inoremap <c-a-k> <c-k>

nnoremap <up> k<c-y>
nnoremap <down> j<c-e>

" nnoremap <a-h> <c-w><c-h>
" nnoremap <a-j> <c-w><c-j>
" nnoremap <a-k> <c-w><c-k>
" nnoremap <a-l> <c-w><c-l>

" tnoremap <a-h> <c-\><c-n>c-w><c-h>
" tnoremap <a-j> <c-\><c-n>c-w><c-j>
" tnoremap <a-k> <c-\><c-n>c-w><c-k>
" tnoremap <a-l> <c-\><c-n>c-w><c-l>

tnoremap <esc><esc> <c-\><c-n><esc>
tnoremap <tab> <c-\><c-n>:bn<cr>


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
nnoremap S <NOP>
nnoremap <C-Q>      :noautocmd bd<cr>
nnoremap <C-Q><C-Q> :noautocmd q<cr>
nnoremap <Space>w   :w<cr>


" ddd fg

" Alias replace all to
vnoremap <A-s> "hy:%s#<C-R><C-W>#<C-R><C-W>
nnoremap <A-s> :s#<C-R><C-W>#<C-R><C-W>#g<Left><Left>
 
" Prevent x from overriding what's in the clipboard.
" use this tow symbole "_ after motion, 



nnoremap > v>
nnoremap < v<
vnoremap > >gv
vnoremap < <gv

inoremap <A-a> <Right>
inoremap <A-i> <Left>

" Make sure all types of requirements.txt files get syntax highlighting.
" autocmd BufNewFile,BufRead requirements*.txt set syntax=python



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
" nnoremap <F8> :silent FloatermSend           tail_latexmk<cr>:FloatermShow<cr>
" tnoremap <F8> <c-\><c-n>:silent FloatermSend tail_latexmk<cr>:FloatermShow<cr>
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
nnoremap q :bd<cr>

function! s:ll()

endfunction


function! Pac()
   echo "hello, world"
   write %
   source after/plugin/packer.lua 
   PackerCompile 
   PackerClean
   PackerInstall
endfunction
command! Pi call Pac()

function! ResReg()
    unmap y
    unmap Y
endfunction

nnoremap gt viW"dy:tabnew <c-r>d<cr>
