local M = {}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

function M.setup()
  local cmp = require('cmp')
  local lspkind = require('lspkind')
  local snippy = require('snippy')

  cmp.setup({
    snippet = {
      expand = function(args)
        require('snippy').expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    formatting = {
      format = lspkind.cmp_format({
        with_text = false,
        menu = {
          buffer = '[Buffer]',
          nvim_lsp = '[LSP]',
          omni = '[Omni]',
          snippy = '[Snippet]',
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
        if snippy.can_expand_or_advance() then
          snippy.expand_or_advance()
        elseif cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if snippy.can_jump(-1) then
          snippy.previous()
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
      { name = 'snippy' },
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
