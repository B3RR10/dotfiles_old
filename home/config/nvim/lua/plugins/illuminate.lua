local M = {}

function M.setup()
  require('illuminate').configure({
    delay = 100,
  })
end

return M
