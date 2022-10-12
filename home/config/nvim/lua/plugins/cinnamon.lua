local M = {}

function M.setup()
  require('cinnamon').setup({
    -- Default keymaps:
    --   Half-window movements: <C-U> and <C-D>
    --   Page movements:        <C-B>, <C-F>, <PageUp> and <PageDown>
    default_keymaps = true,
  })
end

return M
