-- stylua: ignore start
local map = vim.keymap.set

local move = require("nvim-treesitter-textobjects.move")
local select = require("nvim-treesitter-textobjects.select").select_textobject
local swap = require("nvim-treesitter-textobjects.swap")

-- Functions
map({ "n", "x", "o" }, "]f", function() move.goto_next_start("@function.outer", "textobjects") end,
  { desc = "Next Function Start" })
map({ "n", "x", "o" }, "]F", function() move.goto_next_end("@function.outer", "textobjects") end,
  { desc = "Next Function End" })
map({ "n", "x", "o" }, "[f", function() move.goto_previous_start("@function.outer", "textobjects") end,
  { desc = "Previous Function Start" })
map({ "n", "x", "o" }, "[F", function() move.goto_previous_end("@function.outer", "textobjects") end,
  { desc = "Previous Function End" })
map({ "x", "o" }, "af", function() select("@function.outer", "textobjects") end, { desc = "Select Function Outer" })
map({ "x", "o" }, "if", function() select("@function.inner", "textobjects") end, { desc = "Select Function Inner" })
-- Classes
map({ "n", "x", "o" }, "]c", function() move.goto_next_start("@class.outer", "textobjects") end,
  { desc = "Next Class Start" })
map({ "n", "x", "o" }, "]C", function() move.goto_next_end("@class.outer", "textobjects") end,
  { desc = "Next Class End" })
map({ "n", "x", "o" }, "[c", function() move.goto_previous_start("@class.outer", "textobjects") end,
  { desc = "Previous Class Start" })
map({ "n", "x", "o" }, "[C", function() move.goto_previous_end("@class.outer", "textobjects") end,
  { desc = "Previous Class End" })
map({ "x", "o" }, "ac", function() select("@class.outer", "textobjects") end, { desc = "Select Class Outer" })
map({ "x", "o" }, "ic", function() select("@class.inner", "textobjects") end, { desc = "Select Class Inner" })
-- Parameters
map({ "n", "x", "o" }, "]a", function() move.goto_next_start("@parameter.inner", "textobjects") end,
  { desc = "Next Parameter" })
map({ "n", "x", "o" }, "[a", function() move.goto_previous_start("@parameter.inner", "textobjects") end,
  { desc = "Previous Parameter" })
map("n", "<leader>a", function() swap.swap_next("@parameter.inner") end, { desc = "Swap Next Parameter" })
map("n", "<leader>A", function() swap.swap_previous("@parameter.inner") end, { desc = "Swap Previous Parameter" })

-- Inspect
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>uI", function()
  vim.treesitter.inspect_tree()
  vim.api.nvim_input("I")
end, { desc = "Inspect Tree" })

-- stylua: ignore end
