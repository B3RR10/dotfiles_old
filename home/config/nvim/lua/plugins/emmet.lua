vim.g.user_emmet_leader_key     = ','
vim.g.user_emmet_install_global = 0
vim.cmd([[
    augroup emmet_install
        autocmd!
        autocmd FileType html,css,xml,eruby EmmetInstall
    augroup END
]])
