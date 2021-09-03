require("rest-nvim").setup {
  -- Open request results in a horizontal split
  result_split_horizontal = true,
  -- Skip SSL verification, useful for unknown certificates
  skip_ssl_verification = true,
  -- Highlight request on run
  highlight = { enabled = false, timeout = 150 },
  -- Jump to request line on run
  jump_to_request = false
}
