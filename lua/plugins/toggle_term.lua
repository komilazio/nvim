return {
   'akinsho/toggleterm.nvim',
  opts = {},
  config = function ()
     require("toggleterm").setup({
       vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { noremap = true, silent = true}),
       vim.keymap.set('t', "<C-SPACE>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true}),
       vim.keymap.set('n', "<C-SPACE>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true})
     })
  end
}
