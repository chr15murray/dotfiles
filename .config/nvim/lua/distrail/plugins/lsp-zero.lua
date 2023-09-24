return {
    {
        'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
        config = function()
        
            local lsp_zero = require("lsp-zero")

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                },
            })


            --lsp_zero.setup_servers({({'lua_ls'})'lua_ls'})

            --[[
            require('lspconfig').yamlls.setup {
                settings = {
                    yaml = {
                        schemas = {
                            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                            ["../path/relative/to/file.yml"] = "/.github/workflows/*",
                            ["/path/from/root/of/project"] = "/.github/workflows/*",
                        },
                    },
                }
            }
            --]]


            --lsp.preset("recomended")
            --lsp.setup()
        end
    },

    --- Manage LSP servers from neovim
    {
        'williamboman/mason.nvim'
    },

    {
        'williamboman/mason-lspconfig.nvim'
    },

    -- LSP Support
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
        },
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            {'L3MON4D3/LuaSnip'},
        }
    }
}
