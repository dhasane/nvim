--
-- ███╗   ██╗██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██║   ██║██║████╗ ████║
-- ██╔██╗ ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
--

require("opts")
require("keymaps")

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local function load_plugins()

  local PLUGINS_TO_LOAD = {}

  local function PLUGIN_LOADER(plugin_config)
    for _,v in pairs(plugin_config) do table.insert(PLUGINS_TO_LOAD, v) end
  end

  PLUGIN_LOADER(require("plugins.git"))
  PLUGIN_LOADER(require("plugins.lsp"))
  PLUGIN_LOADER(require("plugins.visual"))
  PLUGIN_LOADER(require("plugins.telescope"))
  PLUGIN_LOADER(require("plugins.completion"))
  PLUGIN_LOADER(require("plugins.utils"))
  PLUGIN_LOADER(require("plugins.org"))

  require('lazy').setup(PLUGINS_TO_LOAD, {})
end

load_plugins()


-- [[ Basic Keymaps ]]

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- See `:help cmp`
function ReloadConfig()
  -- for name,_ in pairs(package.loaded) do
  --   if name:match('^user') and not name:match('nvim-tree') then
  --     package.loaded[name] = nil
  --   end
  -- end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
