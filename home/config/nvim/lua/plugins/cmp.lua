local M = {}

function M.setup()
  local cmp = require('cmp')
  local lspkind = require('lspkind')

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn['UltiSnips#Anon'](args.body)
      end,
    },
    formatting = {
      format = lspkind.cmp_format({
        with_text = false,
        menu = {
          buffer = '[Buffer]',
          nvim_lsp = '[LSP]',
          ultisnips = '[Snippet]',
          nvim_lua = '[Lua]',
          tabnine = '[TabNine]',
          path = '[Path]',
          spell = '[Spell]',
          calc = '[Calc]',
          emoji = '[Emoji]',
          treesitter = '[Treesitter]',
        },
      }),
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping.close(),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
    },
    sources = cmp.config.sources({
      { name = 'buffer' },
      { name = 'nvim_lsp' },
      { name = 'ultisnips' },
      { name = 'nvim_lua' },
      { name = 'path' },
      { name = 'calc' },
      { name = 'spell' },
      { name = 'emoji' },
      { name = 'treesitter' },
    }, {
      { name = 'buffer' },
    }),
    completion = { completeopt = 'menu,menuone,noinsert' },
  })
end

return M
