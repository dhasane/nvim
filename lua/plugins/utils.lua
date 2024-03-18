return {
  {
    "windwp/nvim-autopairs",
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require("nvim-autopairs").setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
      )
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function ()
      require('neo-tree').setup {}
    end,
  },
  {
      'folke/which-key.nvim', 
      opts = {},
      config = function ()
          wk = require('which-key')
          -- document existing key chains
          wk.register {
              ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
              ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
              ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
              ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
              ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
              ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
              ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
              ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
          }
          -- register which-key VISUAL mode
          -- required for visual <leader>hs (hunk stage) to work
          wk.register({
              ['<leader>'] = { name = 'VISUAL <leader>' },
              ['<leader>h'] = { 'Git [H]unk' },
          }, { mode = 'v' })

      end
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
}

