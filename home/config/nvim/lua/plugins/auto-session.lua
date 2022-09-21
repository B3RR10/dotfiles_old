local M = {}

function M.setup()
  require('auto-session').setup({
    log_level = 'error',
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_create_enabled = false,
  })
end

return M
