local M = {}

function M.setup()
  vim.g.OmniSharp_diagnostic_showid = 1
  vim.g.OmniSharp_lookup_metadata = 0
  vim.g.OmniSharp_selector_ui = 'fzf'
  vim.g.OmniSharp_translate_cygwin_wsl = 1

  vim.g.OmniSharp_server_path =
    '/mnt/c/Users/berriom/code/Personal/OmniSharpWorkaround/bin/Debug/net5.0/win-x64/OmniSharpWorkaround.exe'
end

return M
