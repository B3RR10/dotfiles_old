local M = {}

function M.setup()
  vim.g.user_emmet_leader_key = ','
  vim.g.user_emmet_install_global = 0

  vim.cmd([[autocmd FileType html,eruby,css,scss EmmetInstall]])
end

return M
