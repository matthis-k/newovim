return {
    "catppuccin/nvim",
    priority = 1000,
    opts = {
        dim_inactive = {
            enabled = true,
            shade = "dark",
            percenttage = 0.15,
        },
        integrations = {
            cmp = true,
            gitsigns = true,
            illuminate = true,
            lsp_trouble = true,
            markdown = true,
            mason = true,
            mini = true,
            neotest = false,
            neotree = true,
            noice = true,
            notify = true,
            telescope = true,
            treesitter = true,
            treesitter_context = false,
            which_key = true,
            dap = {
                enabled = true,
                enable_ui = true,
            },
            indent_blankline = {
                enabled = true,
                colored_indent_levels = false,
            },
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                underlines = {
                    errors = { "undercurl" },
                    hints = { "undercurl" },
                    warnings = { "undercurl" },
                    information = { "undercurl" },
                },
            },
        },
    },
    config = function(_, opts)
        local p = require("catppuccin.palettes.mocha")
        opts.custom_highlights = {
            TelescopePromptNormal = {
                bg = p.base,
            },
            TelescopePromptBorder = {
                bg = p.base,
            },
            TelescopePromptTitle = {
                fg = p.base,
                bg = p.base,
            },
            TelescopeResultsTitle = {
                fg = p.crust,
                bg = p.crust,
            },
            TeleScopeResultsNormal = {
                bg = p.crust,
            },
            TelescopeResultsBorder = {
                fg = p.crust,
                bg = p.crust,
            },
            TelescopePreviewTitle = {
                fg = p.crust,
                bg = p.crust,
            },
            TeleScopePreviewNormal = {
                bg = p.crust,
            },
            TelescopePreviewBorder = {
                fg = p.crust,
                bg = p.crust,
            },
            NoiceMini = {
                bg = p.base,
            }
        }
        require("catppuccin").setup(opts)

        vim.cmd([[colorscheme catppuccin]])
    end,
}
