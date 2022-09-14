local M = {}

function M.setup()
  require('mini.bufremove').setup()
  require('mini.comment').setup()
  require('mini.indentscope').setup()
  require('mini.jump').setup()
  require('mini.jump2d').setup()
  require('mini.surround').setup()
  require('mini.trailspace').setup()
end

return M
