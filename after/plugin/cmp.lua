local cmp = require'cmp'

cmp.setup({
    snippet = {
    -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({
          select = true,
          behavior = cmp.ConfirmBehavior.Replace
      }), 
    }),
    sources = cmp.config.sources({
        { name = 'luasnip' },
        { 
            name = "nvim_lsp",
            max_item_count = 12,
            entry_filter = function(entry, ctx)
                return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
            end 
        },
    })
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'cmdline' }
    })
})

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  underline = false,
  update_in_insert = false,
  severity_sort = false,
})
