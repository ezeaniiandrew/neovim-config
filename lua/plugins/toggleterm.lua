vim.pack.add({
  'https://github.com/akinsho/toggleterm.nvim',
})

local toggleterm = require('toggleterm')
local terminal = require('toggleterm.terminal')
local Terminal = require('toggleterm.terminal').Terminal

toggleterm.setup()

local function get_terminal_state()
  local terminals = terminal.get_all()

  if #terminals < 2 then
    return
  end

  local current_id = terminal.get_focused_id()

  for i, t in ipairs(terminals) do
    if t.id == current_id then
      return terminals, i
    end
  end

  return terminals, 1
end

local function next_terminal()
  local terminals, current_index = get_terminal_state()

  if not terminals then
    return
  end

  terminals[current_index]:toggle()

  local next_index = current_index % #terminals + 1

  terminals[next_index]:toggle()
end


local function previous_terminal()
  local terminals, current_index = get_terminal_state()

  if not terminals then
    return
  end

  terminals[current_index]:toggle()

  local previous_index = (current_index - 2) % #terminals + 1

  terminals[previous_index]:toggle()
end

local function close_current_terminal()
  local id = terminal.get_focused_id()
  local currentTerminal = id and terminal.get(id)

  if currentTerminal then
    currentTerminal:close()
  end
end

local function create_new_terminal()
  local id = terminal.get_focused_id()
  local current = id and terminal.get(id)
  local new = Terminal:new()

  if current then
    current:toggle()
  end

  new:toggle()
end

vim.keymap.set('n', '<leader>t', toggleterm.toggle, {
  desc = 'Toggle terminal',
})

vim.keymap.set('n', '<leader>tn', create_new_terminal, {
  desc = 'New terminal',
})

vim.keymap.set('n', '<leader>tj', next_terminal, {
  desc = 'Next terminal',
})

vim.keymap.set('n', '<leader>tk', previous_terminal, {
  desc = 'Previous terminal',
})

vim.keymap.set('n', '<leader>tc', close_current_terminal, {
  desc = 'Close terminal',
})

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {
  desc = 'Leave terminal mode',
})
