return {
  -- Install ToggleTerm
  {
    "akinsho/toggleterm.nvim",
    version = "v2.*",
    opts = {
      direction = "float",
      open_mapping = [[<c-\>]],
      float_opts = { border = "curved" },
    },
  },
}
