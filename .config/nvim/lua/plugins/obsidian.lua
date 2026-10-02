return {
  -- Install Obsidian (maintained community fork of the archived epwalsh/obsidian.nvim)
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  ft = "markdown",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- use `:Obsidian <subcommand>` instead of `:ObsidianXxx`
    workspaces = {
      {
        name = "chris",
        path = "~/Documents/Chris",
      },
    },
    daily_notes = {
      folder = "Daily Notes",
    },
  },
}
