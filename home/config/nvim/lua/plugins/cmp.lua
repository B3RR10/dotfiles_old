local M = {}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

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
          omni = '[Omni]',
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
      ['<Tab>'] = cmp.mapping(function(fallback)
        if vim.fn['UltiSnips#CanJumpForwards']() == 1 then
          vim.api.nvim_feedkeys(t('<Plug>(ultisnips_jump_forward)'), 'm', true)
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if vim.fn['UltiSnips#CanJumpBackwards']() == 1 then
          vim.api.nvim_feedkeys(t('<Plug>(ultisnips_jump_backward)'), 'm', true)
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-u>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }),
    },
    sources = cmp.config.sources({
      { name = 'buffer' },
      { name = 'nvim_lsp' },
      { name = 'omni' },
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
    completion = { completeopt = 'menu,menuone,noinsert,noselect' },
  })

  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' },
    },
  })

  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'cmdline' },
    }),
  })
end

return M
