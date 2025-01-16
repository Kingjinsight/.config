vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }
    vim.keymap.set("i", ",f", "<Esc>/<++><CR>:nohlsearch<CR>c4l", opts)
    vim.keymap.set("i", ",n", "---<Enter><Enter>", opts)
    vim.keymap.set("i", ",b", "**** <++><Esc>F*hi", opts)
    vim.keymap.set("i", ",s", "~~~~ <++><Esc>F~hi", opts)
    vim.keymap.set("i", ",i", "** <++><Esc>F*i", opts)
    vim.keymap.set("i", ",d", "`` <++><Esc>F`i", opts)
    vim.keymap.set("i", ",c", "```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA", opts)
    vim.keymap.set("i", ",p", "![](<++>)<++><Esc>F[a", opts)
    vim.keymap.set("i", ",a", "[](<++>)<++><Esc>F[a", opts)
    vim.keymap.set("i", ",1", "#<Space><Enter><++><Esc>kA", opts)
    vim.keymap.set("i", ",2", "##<Space><Enter><++><Esc>kA", opts)
    vim.keymap.set("i", ",3", "###<Space><Enter><++><Esc>kA", opts)
    vim.keymap.set("i", ",4", "####<Space><Enter><++><Esc>kA", opts)
    vim.keymap.set("i", ",l", "--------<Enter>", opts)
  end
})

