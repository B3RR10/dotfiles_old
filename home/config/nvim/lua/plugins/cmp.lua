local M = {}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

function M.setup()
  local cmp = require('cmp')
  local lspkind = require('lspkind')
  local luasnip = require('luasnip')

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    formatting = {
      format = lspkind.cmp_format({
        with_text = false,
        menu = {
          buffer = '[Buffer]',
          nvim_lsp = '[LSP]',
          omni = '[Omni]',
          luasnip = '[Snippet]',
          nvim_lua = '[Lua]',
          tabnine = '[TabNine]',
          path = '[Path]',
          calc = '[Calc]',
          emoji = '[Emoji]',
          treesitter = '[Treesitter]',
        },
      }),
    },
    mapping = {
      ['<Tab>'] = cmp.mapping(function(fallback)
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        elseif cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<Down>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<Up>'] = cmp.mapping.select_prev_item(),
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
      { name = 'buffer', option = { keyword_pattern = [[\k\+]] } },
      { name = 'nvim_lsp' },
      { name = 'omni' },
      { name = 'luasnip' },
      { name = 'nvim_lua' },
      { name = 'path' },
      { name = 'calc' },
      { name = 'emoji' },
      { name = 'treesitter' },
    }, {
      { name = 'buffer', option = { keyword_pattern = [[\k\+]] } },
    }),
    completion = { completeopt = 'menu,menuone,noselect' },
  })
end

return M
