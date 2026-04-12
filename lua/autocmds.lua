-- Filetype detection, file-specific behavior, actions on events

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yankgroup = augroup("YankHighlight", {})
autocmd("TextYankPost", {
  group = yankgroup,
  pattern = "*",
  callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 }) end,
})

-- Store a global variable for the OS type
local os_types = {
  "wsl", -- WSL has to be checked before others as it will match both
  "linux",
  "windows",
}

vim.g.os = "unknown" -- Default value if no OS matches
for _, os in ipairs(os_types) do
  if vim.fn.has(os) == 1 then
    vim.g.os = os
    break
  end
end

vim.api.nvim_create_user_command("Restart", function()
  -- Get listed buffers
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })

  -- Check if there's at least one "real" buffer (has a name)
  local has_real_buffer = false
  for _, buf in ipairs(bufs) do
    if buf.name ~= "" then
      has_real_buffer = true
      break
    end
  end

  if has_real_buffer then
    local session = vim.fn.stdpath("state") .. "/session.vim"
    vim.cmd("mksession! " .. vim.fn.fnameescape(session))
    vim.cmd("restart source " .. vim.fn.fnameescape(session))
  else
    -- No meaningful buffers → just restart cleanly
    vim.cmd("restart")
  end
end, {})
