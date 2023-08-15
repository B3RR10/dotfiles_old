return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-path',
      'ray-x/cmp-treesitter',
      'onsails/lspkind-nvim',
    },
    opts = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')
      local luasnip = require('luasnip')
      local compare = require('cmp.config.compare')
      local source_names = {
        buffer = '[Buffer]',
        luasnip = '[Snippet]',
        nvim_lsp = '[LSP]',
        path = '[Path]',
        treesitter = '[Treesitter]',
      }
      local duplicates = {
        buffer = 1,
        luasnip = 1,
        nvim_lsp = 0,
        path = 1,
        treesitter = 0,
      }

      return {
        completion = {
          completeopt = 'menu,menuone,noselect',
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            compare.score,
            compare.recently_used,
            compare.offset,
            compare.exact,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
          },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-u>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false, }),

          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<Down>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<Up>'] = cmp.mapping.select_prev_item(),

          ['<Tab>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
              -- elseif cmp.visible() then
              --   cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
              -- elseif cmp.visible() then
              --   cmp.select_prev_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp',   group_index = 1 },
          { name = 'luasnip',    group_index = 1 },
          { name = 'buffer',     group_index = 2, option = { keyword_pattern = [[\k\+]] } },
          { name = 'path',       group_index = 2 },
          { name = 'treesitter', group_index = 2 },
        }),
        formatting = {
          format = lspkind.cmp_format({
            with_text = false,
            menu = source_names,
          }),
        },
        experimental = {
          hl_group = 'LspCodeLens',
          ghost_text = {},
        },
        window = {
          documentation = {
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            winhighlight = 'NormalFloat:NormalFloat,FloatBorder:TelescopeBorder',
          },
        },
      }
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'honza/vim-snippets',
      'rafamadriz/friendly-snippets',
    },
    build = 'make install_jsregexp',
    opts = {
      history = true,
      delete_check_events = 'TextChanged',
    },
    keys = {
      {
        '<C-j>',
        function()
          return require('luasnip').jumpable(1) and '<Plug>luasnip-jump-next' or '<C-j>'
        end,
        expr = true,
        remap = true,
        silent = true,
        mode = 'i',
      },
      {
        '<C-j>',
        function()
          require('luasnip').jump(1)
        end,
        mode = 's',
      },
      {
        '<C-k>',
        function()
          require('luasnip').jump(-1)
        end,
        mode = { 'i', 's' },
      },
    },
    config = function(_, opts)
      require('luasnip').setup(opts)
      require('luasnip.loaders.from_snipmate').lazy_load()
      require('luasnip.loaders.from_snipmate').lazy_load({ paths = { './snippets' } })
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },
  {
    'jiangmiao/auto-pairs',
    event = 'VeryLazy',
    config = function()
      vim.g.AutoPairsShortcutJump = ''
    end,
  },
  {
    'echasnovski/mini.comment',
    event = 'BufReadPost',
    config = true,
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      defaults = {
        ['<leader>t'] = { name = '+Test' },
        ['<leader>tt'] = { name = '+Task' },
      },
    },
  },
  {
    'vim-test/vim-test',
    opts = {
      setup = {},
    },
    config = function(plugin, opts)
      vim.g['test#strategy'] = 'neovim'
      vim.g['test#neovim#term_position'] = 'belowright'
      vim.g['test#neovim#preserve_screen'] = 1

      -- Set up vim-test
      for k, _ in pairs(opts.setup) do
        opts.setup[k](plugin, opts)
      end
    end,
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-neotest/neotest-vim-test',
      'vim-test/vim-test',
      'stevearc/overseer.nvim',
    },
    -- stylua: ignore start
    keys = {
      {
        '<leader>td',
        "<cmd>w|lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
        desc =
        'Debug File',
      },
      {
        '<leader>tL',
        "<cmd>w|lua require('neotest').run.run_last({strategy = 'dap'})<cr>",
        desc =
        'Debug Last'
      },
      {
        '<leader>ta',
        "<cmd>w|lua require('neotest').run.attach()<cr>",
        desc =
        'Attach'
      },
      { '<leader>tf', "<cmd>w|lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = 'File' },
      {
        '<leader>tF',
        "<cmd>w|lua require('neotest').run.run(vim.loop.cwd())<cr>",
        desc =
        'All Files'
      },
      { '<leader>tl', "<cmd>w|lua require('neotest').run.run_last()<cr>",              desc = 'Last' },
      {
        '<leader>tn',
        "<cmd>w|lua require('neotest').run.run()<cr>",
        desc =
        'Nearest'
      },
      {
        '<leader>tN',
        "<cmd>w|lua require('neotest').run.run({strategy = 'dap'})<cr>",
        desc =
        'Debug Nearest'
      },
      {
        '<leader>to',
        "<cmd>w|lua require('neotest').output.open({ enter = true })<cr>",
        desc =
        'Output'
      },
      { '<leader>ts', "<cmd>w|lua require('neotest').run.stop()<cr>", desc = 'Stop' },
      {
        '<leader>tS',
        "<cmd>w|lua require('neotest').summary.toggle()<cr>",
        desc =
        'Summary'
      },
    },
    -- stylua: ignore end
    opts = {
      -- adapters = {
      --   require('neotest-vim-test')({
      --     ignore_file_types = { 'python', 'vim', 'lua' },
      --   }),
      -- },
      status = { virtual_text = true },
      output = { open_on_run = true },
      -- overseer.nvim
      -- consumers = {
      --   overseer = require('neotest.consumers.overseer'),
      -- },
      overseer = {
        enabled = true,
        force_default = true,
      },
    },
    config = function(_, opts)
      local neotest_ns = vim.api.nvim_create_namespace('neotest')
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
            return message
          end,
        },
      }, neotest_ns)
      require('neotest').setup(opts)
    end,
  },
  {
    'stevearc/overseer.nvim',
    keys = {
      { '<leader>ttR', '<cmd>OverseerRunCmd<cr>',       desc = 'Run Command' },
      { '<leader>tta', '<cmd>OverseerTaskAction<cr>',   desc = 'Task Action' },
      { '<leader>ttb', '<cmd>OverseerBuild<cr>',        desc = 'Build' },
      { '<leader>ttc', '<cmd>OverseerClose<cr>',        desc = 'Close' },
      { '<leader>ttd', '<cmd>OverseerDeleteBundle<cr>', desc = 'Delete Bundle' },
      { '<leader>ttl', '<cmd>OverseerLoadBundle<cr>',   desc = 'Load Bundle' },
      { '<leader>tto', '<cmd>OverseerOpen<cr>',         desc = 'Open' },
      { '<leader>ttq', '<cmd>OverseerQuickAction<cr>',  desc = 'Quick Action' },
      { '<leader>ttr', '<cmd>OverseerRun<cr>',          desc = 'Run' },
      { '<leader>tts', '<cmd>OverseerSaveBundle<cr>',   desc = 'Save Bundle' },
      { '<leader>ttt', '<cmd>OverseerToggle<cr>',       desc = 'Toggle' },
    },
    opts = {},
  },
  {
    'anuvyklack/hydra.nvim',
    opts = {
      specs = {
        test = function()
          local cmd = require('hydra.keymap-util').cmd
          local hint = [[
  ^
  _f_: File
  _F_: All Files
  _l_: Last
  _n_: Nearest
  ^
  _d_: Debug File
  _L_: Debug Last
  _N_: Debug Nearest
  ^
  _o_: Output
  _S_: Summary
  ^
  _a_: Attach
  _s_: Stop
  ^
  ^ ^  _q_: Quit
            ]]
          return {
            name = 'Test',
            hint = hint,
            config = {
              color = 'pink',
              invoke_on_body = true,
              hint = {
                border = 'rounded',
                position = 'top-left',
              },
            },
            mode = 'n',
            body = '<A-t>',
            heads = {
              { 'F', cmd("w|lua require('neotest').run.run(vim.loop.cwd())"),          desc = 'All Files' },
              { 'L', cmd("w|lua require('neotest').run.run_last({strategy = 'dap'})"), desc = 'Debug Last' },
              { 'N', cmd("w|lua require('neotest').run.run({strategy = 'dap'})"),      desc = 'Debug Nearest' },
              { 'S', cmd("w|lua require('neotest').summary.toggle()"),                 desc = 'Summary' },
              { 'a', cmd("w|lua require('neotest').run.attach()"),                     desc = 'Attach' },
              {
                'd',
                cmd("w|lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'}"),
                desc = 'Debug File',
              },
              { 'f', cmd("w|lua require('neotest').run.run(vim.fn.expand('%'))"),   desc = 'File' },
              { 'l', cmd("w|lua require('neotest').run.run_last()"),                desc = 'Last' },
              { 'n', cmd("w|lua require('neotest').run.run()"),                     desc = 'Nearest' },
              { 'o', cmd("w|lua require('neotest').output.open({ enter = true })"), desc = 'Output' },
              { 's', cmd("w|lua require('neotest').run.stop()"),                    desc = 'Stop' },
              { 'q', nil, {
                exit = true,
                nowait = true,
                desc = 'Exit'
              } },
            },
          }
        end,
      },
    },
  },
}
