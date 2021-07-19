local map = require('settings.utils').map

vim.g.gitgutter_map_keys = 0

map('', ']h', '<Plug>(GitGutterNextHunk)', { noremap = true })
map('', '[h', '<Plug>(GitGutterPrevHunk)', { noremap = true })

map('', '<C-h>p', '<Plug>(GitGutterPreviewHunk)', { noremap = true })
map('', '<C-h>s', '<Plug>(GitGutterStageHunk)', { noremap = true })
map('', '<C-h>u', '<Plug>(GitGutterUndoHunk)', { noremap = true })
map('', '<C-h>h', ':GitGutterLineHighlightsToggle<CR>', { noremap = true })

-- Use hunks as objects
map('o', 'ih', '<Plug>(GitGutterTextObjectInnerPending)', { noremap = false })
map('o', 'ah', '<Plug>(GitGutterTextObjectOuterPending)', { noremap = false })
map('x', 'ih', '<Plug>(GitGutterTextObjectInnerVisual)', { noremap = false })
map('x', 'ah', '<Plug>(GitGutterTextObjectOuterVisual)', { noremap = false })

vim.g.gitgutter_signs = 1

vim.g.gitgutter_sign_added = '▌'
vim.g.gitgutter_sign_modified = '▌'
vim.g.gitgutter_sign_removed = '▁'
vim.g.gitgutter_sign_removed_first_line = '▌'
vim.g.gitgutter_sign_modified_removed = '▌'

vim.g.gitgutter_grep_command = 'rg'
