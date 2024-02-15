return {
  -- Default to dracula theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },

  -- Retain the tokyonight theme but with transparency
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  -- Setup the dracula theme with transparency
  {
    "Mofiqul/dracula.nvim",
    opts = {
      transparent_bg = true,
    },
  },

  -- Foce background_colour for transparency support
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
}
