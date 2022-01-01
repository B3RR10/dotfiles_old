local M = {}

function M.setup()
  print('Test!')
  require('rest-nvim').setup({
    -- Open request results in a horizontal split
    result_split_horizontal = true,
    -- Skip SSL verification, useful for unknown certificates
    skip_ssl_verification = false,
    -- Highlight request on run
    highlight = {
      enabled = false,
      timeout = 150,
    },
    -- Jump to request line on run
    jump_to_request = false,
  })

  local map = require('settings.utils').map

  map('n', '<CR>', ':lua require("rest-nvim").run()<CR>', { noremap = false })
end

return M
