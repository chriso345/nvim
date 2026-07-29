local function load_lang_files()
  local specs = {}

  local lang_path = vim.fn.stdpath("config") .. "/lua/plugins/lang/"

  for _, file in ipairs(vim.fn.glob(lang_path .. "*.lua", true, true)) do
    local module = "plugins.lang." .. vim.fn.fnamemodify(file, ":t:r")

    local ok, spec = pcall(require, module)

    if ok then
      table.insert(specs, spec)
    else
      vim.notify(("Failed loading %s:\n%s"):format(module, spec), vim.log.levels.ERROR)
    end
  end

  return specs
end

return load_lang_files()
