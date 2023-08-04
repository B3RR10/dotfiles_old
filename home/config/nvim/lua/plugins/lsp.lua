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

  lsp_defaults.capabilities.textDocument.completion.completionItem.snippetSupport = true

  lspconfig.util.default_config = vim.tbl_deep_extend('force', lspconfig.util.default_config, lsp_defaults)

  ---
  -- LSP Servers
  ---
  lspconfig.ansiblels.setup({})
  lspconfig.bashls.setup({})
  -- lspconfig.csharp_ls.setup({})
  lspconfig.cssls.setup({})
  lspconfig.docker_compose_language_service.setup({})
  lspconfig.dockerls.setup({})
  lspconfig.fsautocomplete.setup({})
  lspconfig.html.setup({})
  lspconfig.jsonls.setup({
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      },
    },
  })
  lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = { globals = { 'vim' } },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
          checkThirdParty = false,
        },
        telemetry = { enable = false },
        format = {
          defaultConfig = {
            indent_style = 'space',
            indent_size = 2,
            quote_style = 'single',
            trailing_table_separator = 'smart',
            insert_final_newline = true,
          },
        },
      },
    },
  })
  local omnisharp_bin = require('mason.settings').current.install_root_dir .. '/packages/omnisharp/omnisharp'
  local pid = vim.fn.getpid()
  lspconfig.omnisharp.setup({
    handlers = {
      ['textDocument/definition'] = require('omnisharp_extended').handler,
    },
    cmd = { omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) },
    enable_ms_build_load_projects_on_demand = false,
    enable_roslin_analyzers = true,
    enable_import_completion = false,
    organize_imports_on_format = true,
  })
  lspconfig.pkgbuild_language_server.setup({})
  lspconfig.pyright.setup({})
  lspconfig.rust_analyzer.setup({})
  lspconfig.tailwindcss.setup({})
  lspconfig.terraformls.setup({})
  lspconfig.texlab.setup({
    settings = {
      texlab = {
        build = {
          args = {
            '-pdf',
            '-interaction=nonstopmode',
            '-output-directory=build',
            '-synctex=1',
            '-shell-escape',
            '%f',
          },
          executable = 'latexmk',
          onSave = true,
        },
        chktex = {
          onOpenAndSave = true,
        },
      },
    },
  })
  lspconfig.tflint.setup({})
  lspconfig.tsserver.setup({})
  lspconfig.unocss.setup({})
  lspconfig.vimls.setup({})
  lspconfig.yamlls.setup({
    settings = {
      yaml = {
        schemaStore = {
          enable = false,
          url = '',
        },
        schemas = require('schemastore').yaml.schemas(),
      },
    },
  })
end

return M
