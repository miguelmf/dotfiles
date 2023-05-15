require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = true;
  min_length = 1;
  -- preselect = 'enable';
  preselect = 'always';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  allow_prefix_unmatch = false;

  -- source = {
  --   path = true;
  --   buffer = true;
  --   calc = true;
  --   vsnip = true;
  --   nvim_lsp = true;
  --   nvim_lua = true;
  --   spell = true;
  --   tags = true;
  --   snippets_nvim = true;
  -- };
  source = {
    -- sort = { priority = 500; };
    -- tags = { priority = 500; };
    -- spell = { priority = 500; };
    path = { priority = 500; };
    buffer = { priority = 500; };
    -- calc = { priority = 500; };
    nvim_lsp = { priority = 500; };
    -- nvim_lua = { priority = 500; };
    vsnip = { priority = 1000; };
  };
}
