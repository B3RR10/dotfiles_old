local M = {}

function M.setup()
  require('cinnamon').setup({
    -- Default keymaps:
    --   Half-window movements: <C-U> and <C-D>
    --   Page movements:        <C-B>, <C-F>, <PageUp> and <PageDown>
    default_keymaps = true,
    -- Extra keymaps:
    --   Start/end of file:          gg and G
    --   Line number:                [count]G
    --   Start/end of line:          0, ^ and $
    --   Paragraph movements:        { and }
    --   Prev/next search result:    n, N, *, #, g* and g#
    --   Prev/next cursor location:  <C-O> and <C-I>
    --   Screen scrolling:           zz, zt, zb, z., z<CR>, z-, z^, z+, <C-Y> and <C-E>
    --   Horizontal scrolling:       zH, zL, zs, ze, zh and zl
    extra_keymaps = true,
  })
end

return M
