return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = require("plugins.format.settings"),
      format_on_save = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = "fallback",
      },
    },
  },
}
