return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    commit = vim.fn.has("nvim-0.12") == 0 and "7caec274fd19c12b55902a5b795100d21531391f" or nil,
    version = false,

    build = ":TSUpdate",

    event = { "BufReadPre", "BufNewFile" },
    cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },

    opts = {
      indent = { enable = true },
      highlight = { enable = true },
      folds = { enable = true },

      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
        "toml",
        "yaml",
      },
    },

    config = function(_, opts)
      require("nvim-treesitter.config").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          local buf = ev.buf

          local ok = pcall(vim.treesitter.start, buf)
          if not ok then return end

          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },

    config = function()
      require("nvim-treesitter-textobjects").setup({
        move = {
          set_jumps = true,
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },
}
