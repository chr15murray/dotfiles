return {
--[[ 
Tree-sitter is a parser generator tool and an incremental parsing library. It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited. Tree-sitter aims to be:

General enough to parse any programming language
Fast enough to parse on every keystroke in a text editor
Robust enough to provide useful results even in the presence of syntax errors
Dependency-free so that the runtime library (which is written in pure C) can be embedded in any application
--]]

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "go" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
  },

  {
    "nvim-treesitter/playground"
  }
}

