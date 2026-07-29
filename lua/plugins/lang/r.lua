return {
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("quarto").setup({
        debug = true,
        lspFeatures = {
          enabled = true,
          languages = { "r", "python", "julia" },
          -- chunks = "curly",
          diagnostics = {
            enabled = true,
            triggers = { "BufWrite" },
          },
          hover = {
            enabled = true,
          },
        },
      })
    end,
  },
}
