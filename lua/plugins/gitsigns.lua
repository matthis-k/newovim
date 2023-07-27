return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        keys = function ()
            return {
                { '<leader>gs', "<cmd>Gitsigns stage_hunk", desc = "stage hunk" },
                { '<leader>gr', "<cmd>Gitsigns reset_hunk", desc = "reset hunk" },
                {
                    '<leader>gs',
                    "<cmd>Gitsigns stage_hunk",
                    desc = "stage hunk",
                    mode = 'v'
                },
                {
                    '<leader>gr',
        "<cmd>Gitsigns reset_hunk",
                    desc = "reset hunk",
                    mode = 'v'
                },
                { '<leader>gS', "<cmd>Gitsigns stage_buffer",                              desc = "stage buffer" },
                { '<leader>gu', "<cmd>Gitsigns undo_stage_hunk",                           desc = "undo stage hunk" },
                { '<leader>gR', "<cmd>Gitsigns reset_buffer",                              desc = "reset buffer" },
                { '<leader>gp', "<cmd>Gitsigns preview_hunk",                              desc = "preview hunk" },
                { '<leader>gB', "<cmd>Gitsigns toggle_current_line_blame",                 desc = "toggle blame line" },
                { '<leader>gD', "<cmd>Gitsigns diffthis",                                  desc = "diff" },
                { '<leader>gd', "<cmd>Gitsigns toggle_deleted",                            desc = "toggle deleted" },
            }
        end,
        opts = {
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
            },
            signcolumn = true,
            numhl = false,
            linehl = false,
            word_diff = true,
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            attach_to_untracked = true,
            current_line_blame = false,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol",
                delay = 1000,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil,
            max_file_length = 40000,
            preview_config = {
                border = "rounded",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
            yadm = {
                enable = false,
            },
        },
    },
}
