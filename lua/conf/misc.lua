vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.number = true
vim.opt.relativenumber = true

vim.api.nvim_set_keymap('n', '<leader>pc', ':set clipboard=unnamedplus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>uc', ':set clipboard=unnamed<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':Cargo build<CR>', { noremap = true, silent = false })
function cycle_letter()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local current_line = vim.fn.getline(row)
  col = col + 1
  local current_char = current_line:sub(col, col)

  if current_char:match("[%a]") then
    local next_char
    if current_char:match("[%l]") then
      next_char = string.char(((string.byte(current_char) - string.byte('a') + 1) % 26) + string.byte('a'))
    elseif current_char:match("[%u]") then
      next_char = string.char(((string.byte(current_char) - string.byte('A') + 1) % 26) + string.byte('A'))
    end

    local new_line = current_line:sub(1, col - 1) .. next_char .. current_line:sub(col + 1)
    vim.fn.setline(row, new_line)
  end
end

-- Key mapping to cycle letters (e.g., using `Ctrl-L`)
vim.api.nvim_set_keymap('n', '<C-l>', ':lua cycle_letter()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-CR>', ':Lspsaga code_action<CR>', { noremap = true })
vim.cmd("colorscheme catppuccin")
vim.opt.guicursor = "i:block"
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undo/")
vim.opt.undofile = true
