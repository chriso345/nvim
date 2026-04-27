return {
  {
    "chriso345/scout.nvim",
    opts = {
      search_paths = { "~/dev", "~/dev/plugins", "~/personal", "~/sandbox", "~/uni" },
      include_folders = { "~/.config/nvim", "~/.config/tmux" },
      exclude_folders = { "~/dev/plugins" },
      preview = {
        cmd = "cat {path}/README.md || ls -la",
        highlight = { ft = "markdown" },
      },
    },
  },
}
