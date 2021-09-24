local cmd = vim.cmd

cmd 'autocmd TextYankPost * lua vim.highlight.on_yank { on_visual = false }'

-- Autoremove trailing white spaces spaces and convert tabs in spaces
cmd [[
  function! StripWhiteSpaces()
      if &ft =~ 'gitcommit\|diff'
      return
      endif
      mark s
      %s/\s\+$//e
      's
      delmarks s
  endfunction
]]
-- autocmd BufWritePre * silent! %s/\s\+$//ge
cmd [[
  augroup before_save
    autocmd!
    autocmd BufWritePre * silent! call StripWhiteSpaces()
    autocmd BufWritePre * %retab!
  augroup END
]]

-- Show relative numbers in normal mode
cmd [[
  augroup line_nums
    autocmd!
    autocmd InsertEnter * set nornu
    autocmd InsertLeave * set rnu
  augroup END
]]

-- Allow comments in json
cmd [[autocmd FileType json syntax match Comment +\/\/.\+$+]]

-- Disable fold in commit buffers
cmd 'autocmd FileType gitcommit set nofoldenable'
