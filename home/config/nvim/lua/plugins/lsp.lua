local M = {}

local lspconfig = require('lspconfig')
local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = require('settings.lsp_utils').on_attach,
}

function M.setup()
  ---
  -- Global config
  ---

  lspconfig.util.default_config = vim.tbl_deep_extend('force', lspconfig.util.default_config, lsp_defaults)

  ---
  -- LSP Servers
  ---

  lspconfig.angularls.setup({})
  lspconfig.bashls.setup({})
  lspconfig.csharp_ls.setup({})
  lspconfig.cssls.setup({})
  lspconfig.dockerls.setup({})
  lspconfig.html.setup({})
  lspconfig.pyright.setup({})
  lspconfig.solargraph.setup({})
  lspconfig.rust_analyzer.setup({})
  lspconfig.tailwindcss.setup({})
  lspconfig.tsserver.setup({})
  lspconfig.vimls.setup({})
  lspconfig.volar.setup({
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
  })

  vim.g['fsharp#lsp_auto_setup'] = 0
  require('ionide').setup({
    on_attach = lsp_defaults.on_attach,
    capabilities = lsp_defaults.capabilities,
    flags = lsp_defaults.flags,
  })

  lspconfig.jsonls.setup({
    user_commands = {
      {
        name = 'Format',
        command = function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line('$'), 0 })
        end,
      },
    },
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      },
    },
  })

  lspconfig.sumneko_lua.setup({
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = { enable = true, globals = { 'vim', 'use', 'lua' } },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
      },
    },
  })

  lspconfig.texlab.setup({
    settings = {
      texlab = {
        build = {
          args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '-shell-escape', '%f' },
          executable = 'latexmk',
          onSave = true,
        },
        chktex = {
          onOpenAndSave = true,
        },
      },
    },
  })

  -- Set schemas for yaml
  local json_schemas = require('schemastore').json.schemas({})
  local yaml_schemas = {}
  vim.tbl_map(function(schema)
    yaml_schemas[schema.url] = schema.fileMatch
  end, json_schemas)

  require('lspconfig').yamlls.setup({
    settings = {
      yaml = {
        schemas = yaml_schemas,
        schemaStore = {
          enable = true,
        },
      },
    },
  })
end

return M
