
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

function Maps(base, mode, keymaps)
  local map = vim.keymap.set

  for _, keymap in ipairs(keymaps) do
    local keybind = keymap[1]
    local action = keymap[2]
    local opts = keymap[3]


    if keybind == nil then
      print("keybind is nil")
    elseif action == nil then
      print("command is nil")
    else
      local key = base .. keybind

      if type(action) == "table" then
        -- require('which-key').register {
        --   [key] = { name = opts.desc, _ = 'which_key_ignore' },
        -- }
        Maps(key, mode, action)
      else
        local command
        if type(action) == 'function' then
          command = action
        else
          command = action .. '<CR>'
        end
        map(mode, key, command, opts)
      end
    end
  end
end

local map = vim.keymap.set
map('n', '<C-x><C-c>', ':qa<CR>')

map({'n', 'i', 'v'}, '<C-s>', '<esc>:write<CR>')

map('t', '<C-h>', '<C-\\><C-n><C-w>h<CR>')
map('t', '<C-j>', '<C-\\><C-n><C-w>j<CR>')
map('t', '<C-k>', '<C-\\><C-n><C-w>k<CR>')
map('t', '<C-l>', '<C-\\><C-n><C-w>l<CR>')

map("n", '<Esc>', '<Esc>:nohlsearch<CR>')

map({'v', 'n'}, '<C-q>', '<esc>:close<CR>')

Maps("<leader>", 'n', {
  {'<TAB>', {
    {'c', ':tabnew %'},
    {'q', ':tabclose'},
    {'h', ':tabprevious'},
    {'l', ':tabnext'}
  }},
  {'w', '<c-w>'},
  {
    'o', { -- " verificacion de escritura
      {'e', ':setlocal spell! spelllang=es'},
      {'i', ':setlocal spell! spelllang=en_us'},
      {'t', ':setlocal spell! spelllang=es,en_us'}
    }
  },
  -- " abrir terminal
  {'.', '<esc>:vsp <cr> :term <cr>'},
  {'{', '<esc>va}zf'},
  {'t', ':Lexplore'},
  {'c', ':callCompilar()'},
  {'<Leader>m', ':botright lwindow 5'},
})

Maps('<leader>\'', 'n', {
    {'e', ':execute "edit " . $MYVIMRC'},
    -- {'s', ' :execute "source " . $MYVIMRC<CR>'},
    {'s', ':lua ReloadConfig'},
})

-- " correr la macro en q, que aveces sin querer la sobreescribo
Maps('', 'n', {
    {'Q', '@q'},
    {'gb', 'gT'},
    {'Y', 'y$'} -- " copiar hasta el final de linea
})

-- " mostrar las marcas
-- map('n', '?', ':marks <cr>')

-- " para solo mostrar las marcas dentro del archivo
-- map('n', '<Leader>', ':marks abcdefghijklmnopqrstuvwxyz<cr>:')

-- " noremap <Leader>. :call TermToggle(25) <cr>

-- " ver arbol de archivos

-- " compilar con make y mostrar salida
-- map('n', '<Leader><C-m>', ':copen<cr>')
-- " nnoremap <Leader>m :lopen 5 <cr>

-- " muestra errores

-- "mover entre buffers
-- map('n', '<Leader>j', '<esc>:bp<cr>')
-- map('n', '<Leader>k', '<esc>:bn<cr>')
-- " jetpack
-- " noremap <Leader>l :ls<CR>:b<space>
-- map('n', '<Leader>l', ':FZFBuffer<cr>')

-- " cortes
map('n', '<tab>', '<C-w>')
-- " noremap <Leader>wv <esc>:vsp<cr> " esto se puede con tab tab
-- " noremap <Leader>ws <esc>:sp<cr> " esto se puede con tab v
-- " noremap <Leader>wt <esc>:tabnew %<cr>

-- " final funciones con <Leader> -----------------------------------

-- " salir

map('v', '<tab>', '>gv')
map('v', '<S-tab>', '<gv')

-- " mover entre splits
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map('n', 'j', 'gj')
map('n', 'k', 'gk')
map('n', '<DOWN>', 'gj')
map('n', '<UP>', 'gk')

map('n', 'gf', ':edit <cfile><cr>')
