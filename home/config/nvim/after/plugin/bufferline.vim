lua <<EOF
require("bufferline").setup{
  options = {
    -- mappings = true | false,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    --tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return " ("..count..")"
    end,
    offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left"}},
    show_buffer_close_icons = false,
    show_close_icon = false,
     show_tab_indicators = true,
    always_show_bufferline = true,
    sort_by = 'extension',
  }
}
EOF
