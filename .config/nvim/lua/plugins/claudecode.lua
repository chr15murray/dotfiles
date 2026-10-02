-- Claude Code IDE integration (enabled via the `ai.claudecode` extra in lazyvim.json).
-- `claude` runs in an external terminal: the WebSocket server starts with Neovim and
-- the CLI connects with `/ide`. No terminal is ever spawned inside Neovim.
return {
  "coder/claudecode.nvim",
  lazy = false, -- start the server at startup, not on first keypress
  opts = {
    auto_start = true,
    terminal = {
      provider = "none",
    },
  },
  keys = {
    -- These open an in-editor terminal, which provider = "none" turns into a no-op
    { "<leader>ac", false },
    { "<leader>af", false },
    { "<leader>ar", false },
    { "<leader>aC", false },
    -- The extra only maps tree-add for neo-tree/NvimTree/oil; add the snacks explorer
    { "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>", desc = "Add file", ft = { "snacks_picker_list" } },
  },
}
