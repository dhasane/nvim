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

      local builtin = require("telescope.builtin")
      local utils = require("telescope.utils")

      local function telescope_live_grep_open_files()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end

      local function telescope_fuzzy_find()
          -- You can pass additional configuration to telescope to change theme, layout, etc.
          builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
              winblend = 10,
              previewer = false,
          })
      end

      local function telescope_files_in_dir()
          builtin.find_files({ cwd = utils.buffer_dir() })
      end

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
      Maps("<leader>", 'n', {
        {'E', builtin.find_files, {desc = 'files in project'}},
        {'e', telescope_files_in_dir, { desc = "Find files in cwd" }},
        {'x', builtin.commands},
        {
          's', {
            {'/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' }},
            {'s', builtin.builtin, { desc = '[S]earch [S]elect Telescope' }},
            {'f', builtin.git_files, { desc = 'Search [G]it [F]iles' }},
            {'h', builtin.help_tags, { desc = '[S]earch [H]elp' }},
            {'w', builtin.grep_string, { desc = '[S]earch current [W]ord' }},
            {'g', builtin.live_grep, { desc = '[S]earch by [G]rep' }},
            {'G', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' }},
            {'d', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' }},
            {'r', builtin.resume, { desc = '[S]earch [R]esume' }},
          },
          { desc = 'search' }
        },
        {'b', builtin.buffers, { desc = 'buffers'}},
        {'?', builtin.oldfiles, { desc = '[?] Find recently opened files' }},
        {'/', telescope_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' }},
      })
    end,
  }
}
