-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("n", "<leader>r", function()
  vim.cmd("w")
  local dir = vim.fn.expand("%:p:h")
  local out = dir .. "/" .. vim.fn.expand("%:t:r")
  local cmd = "g++ -fdiagnostics-color=always -g -ggdb -pedantic-errors -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -std=c++23 "
    .. dir .. "/**.cpp -o " .. out .. " -I./source/includes && " .. out
    .. "; echo; echo '[Press Enter to close]'; read"
  vim.cmd("botright 15split | terminal bash -c '" .. cmd .. "'")
  vim.cmd("startinsert")
end, { desc = "Compile & run C++" })
vim.keymap.set("n", "<leader>ac", function()
  Snacks.terminal("claude", {
    cwd = vim.fn.getcwd(),
    win = { position = "right", width = 0.4 },
  })
end, { desc = "Toggle Claude Code" })
