vim.cmd "hi clear"
if vim.fn.exists "syntax_on" then
  vim.cmd "syntax reset"
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "default_theme"

local user_plugin_opts = require("core.utils").user_plugin_opts

local modules = {
  "base",
  "treesitter",
  "lsp",
  "others",
}

local highlights = {}

C = require "default_theme.colors"

for _, module in ipairs(modules) do
  highlights = vim.tbl_deep_extend("force", highlights, require("default_theme." .. module))
end

for group, spec in pairs(user_plugin_opts("default_theme.highlights", highlights)) do
  vim.api.nvim_set_hl(0, group, spec)
end
