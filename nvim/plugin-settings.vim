"nvim-lspconfig
exec 'luafile' expand(g:custom_path . 'lua/nvim-lspconfig.lua')

"nvim-telescope
exec 'luafile' expand(g:custom_path . 'lua/nvim-telescope.lua')

"lsp_signature
exec 'luafile' expand(g:custom_path . 'lua/lsp_signature.lua')

"gitsigns
exec 'luafile' expand(g:custom_path . 'lua/gitsigns.lua')

" --------
"nvim-cmp
set completeopt=menu,menuone,noselect
exec 'luafile' expand(g:custom_path . 'lua/nvim-cmp.lua')

"luasnip
exec 'luafile' expand(g:custom_path . 'lua/snippets.lua')

"comment.nvim
exec 'luafile' expand(g:custom_path . 'lua/comment-nvim.lua')

"hop
exec 'luafile' expand(g:custom_path . 'lua/hop-nvim.lua')

"stabilize
exec 'luafile' expand(g:custom_path . 'lua/stabilize.lua')

"nvim-tree
exec 'luafile' expand(g:custom_path . 'lua/nvim-tree.lua')
" --------

"coq
"set completeopt=menu,menuone,noselect
"exec 'luafile' expand(g:custom_path . 'lua/coq.lua')

"snap
" exec 'luafile' expand(g:custom_path . 'lua/snap.lua')

"nvim-compe
"set completeopt=menu,menuone,noselect
" exec 'luafile' expand(g:custom_path . 'lua/nvim-compe.lua')
" " let g:compe = {}
" " let g:compe.source.snippets = { 'priority': 1000 }
" let g:loaded_compe_snippets_nvim=0
" let g:loaded_compe_treesitter=0
" let g:loaded_compe_spell=0
" let g:loaded_compe_path=0
" let g:loaded_compe_nvim_lua=0
" let g:loaded_compe_calc=0
" let g:loaded_compe_tags=0
" let g:loaded_compe_emoji=0

"barbar
let bufferline = get(g:, 'bufferline', {})
" let bufferline.icons = v:false
let bufferline.animation = v:false
let g:barbar_auto_setup = v:false " disable auto-setup
lua << EOF
  require'barbar'.setup {…}
EOF


"gitgutter
let g:gitgutter_preview_win_location = 'abo'

"vim-polyglot
"let g:polyglot_disabled = ['csv']

"vim-doge
let g:doge_doc_standard_python = 'numpy'

"nvim-lsputils
lua <<EOF
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
EOF

"todo-comments.nvim
lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
       signs = true, -- show icons in the signs column
      -- keywords recognized as todo comments
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "FIX", "ISSUE", "fixme" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info", alt= {"todo"} },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "perf" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO", "note" } },
      },
      -- highlighting of the line containing the todo comment
      -- * before: highlights before the keyword (typically comment characters)
      -- * keyword: highlights of the keyword
      -- * after: highlights after the keyword (todo text)
      highlight = {
        before = "", -- "fg" or "bg" or empty
        keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
        after = "fg", -- "fg" or "bg" or empty
      },
      -- list of named colors where we try to extract the guifg from the
      -- list of hilight groups or use the hex color if hl not found as a fallback
      colors = {
        error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
        warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
        info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
        hint = { "LspDiagnosticsDefaultHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
      }, -- refer to the configuration section below
  }
EOF

""treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      -- ["foo.bar"] = "Identifier",
    -- },
  },
  ensure_installed = {
    "tsx",
    "json",
    "html",
    "scss",
    "javascript",
    "css",
  },
}
EOF

"dd (https://gitlab.com/yorickpeterse/nvim-dd)

lua <<EOF
require('dd').setup()
EOF

"vim-sneak
" let g:sneak#use_ic_scs = 1
" let g:sneak#label = 1

"nvim-coq
"let g:coq_settings = { 'auto_start': v:true, "keymap.recommended": v:false }

"chadtree
" let g:chadtree_settings = { "view.width": 25 }
" autocmd VimEnter * CHADopen --nofocus
" autocmd BufEnter * if (winnr("$") == 1 && &filetype == "CHADTree") | q | endif

"nvim-tree
autocmd VimEnter * NvimTreeToggle wincmd *
" autocmd bufenter * if (winnr("$") == 1 && &filetype == "NvimTree") | q | endif
" autocmd VimEnter * NvimTreeToggle
autocmd VimEnter * wincmd l

"autopep8
" let g:autopep8_disable_show_diff=1

" lua << EOF
"   require("which-key").setup {
"     -- your configuration comes here
"     -- or leave it empty to use the default settings
"     -- refer to the configuration section below
"   }
" EOF
