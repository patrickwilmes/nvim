require("core.keymap")
require("core.plugins")
require("core.plugin_config")
require("core.editor")
require("koogle")
local obsidian_link = require("obsidian_link")

vim.api.nvim_set_keymap('n', '<leader>o', ':lua require("obsidian_link").open_linked_file()<CR>', { noremap = true, silent = true })
