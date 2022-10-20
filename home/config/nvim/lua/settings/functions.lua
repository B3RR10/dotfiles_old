local M = {}

M.toggle_checkbox = function()
  local line_content = vim.api.nvim_get_current_line()
  local re_full = vim.regex([[^- \[X] ]])
  local re_empty = vim.regex([[^- \[ ] ]])

  if not re_full:match_str(line_content) and not re_empty:match_str(line_content) then
    return
  elseif re_full:match_str(line_content) then
    local new_content = string.gsub(line_content, '- %[X%] ', '- [ ] ')
    print(new_content)
    vim.api.nvim_set_current_line(new_content)
  else
    local new_content = string.gsub(line_content, '- %[ %] ', '- [X] ', 1)
    print(new_content)
    vim.api.nvim_set_current_line(new_content)
  end
end

return M
