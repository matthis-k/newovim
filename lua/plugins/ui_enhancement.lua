return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
                progress = { enabled = true },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = true,
            },
            popupmenu = {
                backend = "cmp",
            },
            messages = { view = "mini" },
        },
        keys = {
            {
                "<S-Enter>",
                function()
                    require("noice").redirect(vim.fn.getcmdline())
                end,
                mode = "c",
                desc = "Redirect Cmdline",
            },
            {
                "<c-f>",
                function()
                    if not require("noice.lsp").scroll(4) then
                        return "<c-f>"
                    end
                end,
                silent = true,
                expr = true,
                desc = "Scroll forward",
                mode = {
                    "i",
                    "n",
                    "s",
                },
            },
            {
                "<c-b>",
                function()
                    if not require("noice.lsp").scroll(-4) then
                        return "<c-b>"
                    end
                end,
                silent = true,
                expr = true,
                desc = "Scroll backward",
                mode = {
                    "i",
                    "n",
                    "s",
                },
            },
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
            { "smjonas/inc-rename.nvim", config = true },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            char = "▏",
            filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
            show_trailing_blankline_indent = false,
            show_current_context = false,
        },
    },

    {
        "echasnovski/mini.indentscope",
        version = false,
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            symbol = "▏",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
        config = function(_, opts)
            require("mini.indentscope").setup(opts)
        end,
    },
    {
        "rcarriga/nvim-notify",
        keys = {
            {
                "<leader><bs>",
                function()
                    require("notify").dismiss({ silent = true, pending = true })
                end,
                desc = "Delete all Notifications",
            },
        },
        opts = {
            timeout = 3000,
            level = vim.log.levels.WARN,
            top_down = false,
            max_height = function()
                return math.floor(vim.o.lines * 0.5)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.5)
            end,
        },
    },
    {
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup({
                input = {
                    enabled = true,
                },
                select = {
                    enabled = true,
                    backend = { "telescope" },
                    trim_prompt = true,
                    telescope = {
                        border = true,
                        theme = "center",
                        layout_config = {
                            horizontal = { prompt_position = "top", preview_width = 0.5 },
                            width = 0.5,
                            height = 0.3
                        },
                        layout_strategy = "horizontal",
                        prompt_prefix = " ",
                        selection_caret = " ",
                        sorting_strategy = "ascending",
                        borderchars = {
                            prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
                            results = { " ", " ", " ", " ", " ", " ", " ", " " },
                            preview = { " ", " ", " ", " ", " ", " ", " ", " " },
                        },
                    },
                    get_config = function(opts)
                        if opts.kind == 'codeaction' then
                            return {
                                telescope = {
                                    theme = "cursor",
                                    border = false,
                                    layout_strategy = "cursor",
                                    sorting_strategy = "ascending",
                                    layout_config = {
                                        width = 70,
                                        height = 8,
                                    },
                                },
                            }
                        end
                    end
                },
            })
        end,
    },
    {
        "RRethy/vim-illuminate",
        opts = {
            providers = {
                "lsp",
                "treesitter",
                "regex",
            },
            delay = 100,
            filetype_overrides = {},
            filetypes_denylist = {
                "dirvish",
                "fugitive",
                "neo-tree",
                "alpha",
                "lazy",
                "toggleterm",
            },
            filetypes_allowlist = {},
            modes_allowlist = {},
            providers_regex_syntax_denylist = {},
            providers_regex_syntax_allowlist = {},
            under_cursor = true,
            large_file_cutoff = nil,
            large_file_overrides = nil,
            min_count_to_highlight = 1,
        },
        config = function(_, opts)
            require("illuminate").configure(opts)
        end,
    },
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "MunifTanjim/nui.nvim",        lazy = true },
    {
        "xiyaowong/link-visitor.nvim",
        lazy = true,
        keys = {
            {
                "gL",
                function()
                    require("link-visitor").link_under_cursor()
                end,
                desc = "Open Link",
            },
        },
        config = true,
    },
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = true,
    },
    {
        "jiaoshijie/undotree",
        lazy = true,
        keys = {
            {
                "<leader>u",
                function()
                    require("undotree").toggle()
                end,
                desc = "undotree",
            },
        },
        opts = {
            window = {
                winblend = 0,
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
}
