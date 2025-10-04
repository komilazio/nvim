return {
   "blazkowolf/gruber-darker.nvim",
  lazy = false,
  priority = 1000,
  opts =  {
    bold = true,
    invert = {
      signs = false,
      tabline = false,
      visual = false,
    },
    italic = {
      strings = true,
      comments = true,
      operators = false,
      folds = true,
    },
    undercurl = true,
    underline = true,
  },
  config = function()
    vim.cmd.colorscheme("gruber-darker")

    --====== DEFAULTS =====--
    vim.api.nvim_set_hl(0, "Float", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "Pmenu", {bg = "none"})
    vim.api.nvim_set_hl(0, "PmenuSbar", {bg = "none"})
  end
}
