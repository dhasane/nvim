return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
      }

      local function telescope_live_grep_open_files()
        require('telescope.builtin').live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
      Maps("<leader>", 'n', {
        {'E', require('telescope.builtin').find_files, {desc = 'files in project'}},
        {
          's', {
            {'/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' }},
            {'s', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' }},
            {'f', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' }},
            {'h', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' }},
            {'w', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' }},
            {'g', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' }},
            {'G', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' }},
            {'d', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' }},
            {'r', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' }},
          },
          { desc = 'search' }
        },
        {'b', require('telescope.builtin').buffers, { desc = 'buffers'}}
      })
    end,
  }
}
