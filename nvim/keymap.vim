"Keymaps

" Map Leader
nnoremap <Space> <Nop>
let mapleader = " "

" Fold control
map <leader>F       [fold]
map [fold]o         :foldopen<CR>
map [fold]c         :foldclose<CR>

" Yank whole file
map <leader>Y       ggyG``

""" Buffer Mappings
" Show buffers
nmap <leader>b      :b<space>
" Go back
nmap <leader>bp     :bp<CR>
" Go next
nmap <leader>bn     :bn<CR>
" Delete buffer
nmap <leader>bd     :bd<CR>

"-------- Plugins -----------

"vsnip
" Expand
"imap <expr> <tab>   vsnip#expandable()  ? '<plug>(vsnip-expand)'         : '<c-j>'
"smap <expr> <tab>   vsnip#expandable()  ? '<plug>(vsnip-expand)'         : '<c-j>'

"imap <expr> <tab> vsnip#jumpable(1) ? '<plug>(vsnip-jump-next)' : compe#confirm("\<tab>")
"imap <expr> <s-tab> vsnip#jumpable(-1) ? '<plug>(vsnip-jump-prev)' : '<s-tab>'
"smap <expr> <tab> vsnip#jumpable(1) ? '<plug>(vsnip-jump-next)' : '<tab>'
"smap <expr> <s-tab> vsnip#jumpable(-1) ? '<plug>(vsnip-jump-prev)' : '<s-tab>'

"telescope
" nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-p> <cmd>Telescope file_browser<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>

"lspsaga
"" lsp provider to find the cursor word definition and reference
"nnoremap <C-e>         :Lspsaga lsp_finder<CR>

"" code action
"nnoremap <silent><leader>ca         :Lspsaga code_action<CR>
"vnoremap <silent><leader>ca         :<C-U>Lspsaga range_code_action<CR>

"" show hover doc
""nnoremap <silent> K                 :Lspsaga hover_doc<CR>
"nnoremap <C-h>                       :Lspsaga hover_doc<CR>
"" scroll down hover doc or scroll in definition preview
""nnoremap <silent> <C-f>             <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
"" scroll up hover doc
""nnoremap <silent> <C-b>             <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

"" show signature help
""nnoremap <silent> <C-e>             :Lspsaga signature_help<CR>

"" rename
"" close rename win use <C-c> in insert mode or `q` in noremal mode or `:q`
""nnoremap <silent><leader>rn         :Lspsaga rename<CR>

"" preview definition
"" nnoremap<C-h>          :Lspsaga preview_definition<CR>

"" show diagnostics
"nnoremap <C-m>         :Lspsaga show_line_diagnostics<CR>
"" jump diagnostic
""nnoremap <silent> [e                :Lspsaga diagnostic_jump_next<CR>
""nnoremap <silent> ]e                :Lspsaga diagnostic_jump_prev<CR>

"" float terminal also you can pass the cli command in open_float_terminal function
"" nnoremap <silent> <A-d>             :Lspsaga open_floaterm<CR>
"" tnoremap <silent> <A-d> <C-\><C-n>  :Lspsaga close_floaterm<CR>


"" display a float window with diagnostic info using saga
"" vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
"" autocmd CursorHold *                :Lspsaga show_line_diagnostics
"" vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]
"autocmd CursorHoldI * silent!       :Lspsaga signature_help

"autocmd CursorHoldI * silent!       lua vim.lsp.buf.signature_help()

" barbar
nnoremap <silent>    <C-Left> :BufferPrevious<CR>
nnoremap <silent>    <C-Right> :BufferNext<CR>
nnoremap <silent>    <C-q> :BufferClose!<CR>

" vim-doge
nmap <silent> <C-d> <Plug>DogeGenerate

" Gitgutter
"nmap <C-g> <Plug>(GitGutterPreviewHunk)

"chadtree
" nnoremap <C-k> <cmd>CHADopen<cr>

" nvim-tree
nnoremap <C-k> :NvimTreeToggle<CR>

"Unsets the last search pattern
nnoremap <silent> <CR> :noh<CR><CR>

"vim-doge
let g:doge_mapping = '<C-d>'

" trouble nvim
nnoremap <C-i> <cmd>TroubleToggle<CR>

" todo-comments nvim
nnoremap <silent><C-x> <cmd>TodoTelescope<CR>

"coq
" ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
" ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
" ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
" ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
" ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

"coq
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><s-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"hop.nvim
"vim.api.nvim_set_keymap('n', 's', "<cmd>lua require'hop'.hint_words()<cr>", {})

noremap <h> <Nop>
noremap <C-h> <Nop>

"Copilot
imap <silent><script><expr> <Right> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
