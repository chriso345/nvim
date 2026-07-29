return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    name = "tokyonight",
    priority = 10000,
    config = function()
      require("tokyonight").setup({})
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    name = "kanagawa",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        transparent = true,
      })

      -- vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "/sainnhe/sonokai",
    lazy = false,
    name = "sonokai",
    priority = 1000,
    config = function()
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_transparent_background = true
      vim.g.sonokai_style = "default"

      -- vim.cmd.colorscheme("sonokai")
    end,
  },
  {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("bamboo").setup({})
      -- vim.cmd.colorscheme("bamboo")
    end,
  },
  {
    "chriso345/mintchoco.nvim",
    lazy = false,
    name = "mintchoco",
    priority = 1000,
    config = function()
      require("mintchoco").setup({})
      -- vim.cmd.colorscheme("mintchoco")
    end,
  },
  {
    dir = "~/dev/plugins/suede.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("suede").setup({
        theme = "ash",
        contrast = 0,
        -- transparent = true,
      })
      -- vim.cmd.colorscheme("suede")
    end,
  },
  {
    "jpwol/thorn.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("thorn").setup({
        transparent = true,
      })
      -- vim.cmd.colorscheme("thorn")
    end,
  },
}
