return {
    {
        "nvim-telescope/telescope.nvim",
        version = false,
        event = "VeryLazy",
        cmd = "Telescope",
        keys = {
            {
                "<leader><leader>",
                "<cmd>Telescope find_files<cr>",
                desc = "File",
            },
            {
                "<leader>sf",
                "<cmd>Telescope find_files<cr>",
                desc = "File",
            },
            {
                "<leader>sF",
                "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>",
                desc = "File (hidden)",
            },
            {
                "<leader>sw",
                "<cmd>Telescope live_grep<cr>",
                desc = "Word",
            },
            {
                "<leader>/",
                "<cmd>Telescope live_grep<cr>",
                desc = "Search Word",
            },
            {
                "<leader>sn",
                "<cmd>Telescope noice<cr>",
                desc = "Notifications",
            },
            {
                "<leader>sW",
                "<cmd>Telescope current_buffer_fuzzy_find<cr>",
                desc = "Word in file",
            },
            {
                "<leader>sh",
                "<cmd>Telescope help_tags<cr>",
                desc = "Help",
            },
            {
                "<leader>sr",
                "<cmd>Telescope oldfiles<cr>",
                desc = "Recent files",
            },
            {
                "<leader>z",
                "<cmd>Telescope zoxide list<cr>",
                desc = "Change directory",
            },
        },
        opts = {
            defaults = {
                border = true,
                theme = "center",
                layout_config = { horizontal = { prompt_position = "top", preview_width = 0.5 } },
                layout_strategy = "horizontal",
                prompt_prefix = " ",
                selection_caret = " ",
                sorting_strategy = "ascending",
                winblend = 0,
                borderchars = {
                    prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
                    results = { " ", " ", " ", " ", " ", " ", " ", " " },
                    preview = { " ", " ", " ", " ", " ", " ", " ", " " },
                },
            },
            extensions = {
                zoxide = {
                    prompt_title = "[ Walking on the shoulders of TJ ]",
                    mappings = {
                        default = {
                            after_action = function(selection)
                                print("Update to (" .. selection.z_score .. ") " .. selection.path)
                            end,
                        },
                        ["<C-s>"] = {
                            before_action = function(selection)
                                print("before C-s")
                            end,
                            action = function(selection)
                                vim.cmd.edit(selection.path)
                            end,
                        },
                    },
                },
            },
        },
        config = function(_, opts)
            require("telescope").setup(opts)
            require("telescope").load_extension("zoxide")
            require("telescope").load_extension("notify")
            require("telescope").load_extension("noice")
            require("telescope").load_extension("dap")
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "jvgrootveld/telescope-zoxide",
            "rcarriga/nvim-notify",
            {
                "nvim-telescope/telescope-dap.nvim",
                config = true,
                dependencies = { "mfussenegger/nvim-dap" },
            },
        },
    },
}
