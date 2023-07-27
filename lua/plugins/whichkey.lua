return {
    {
        "folke/which-key.nvim",
        opts = {
            {
                icons = {
                    breadcrumb = "»",
                    separator = "➜",
                    group = "+",
                },
                popup_mappings = {
                    scroll_down = "<c-d>",
                    scroll_up = "<c-u>",
                },
                window = {
                    border = "none",
                    position = "bottom",
                    margin = { 1, 0, 1, 0 },
                    padding = { 1, 2, 1, 2 },
                    winblend = 0,
                },
                layout = {
                    height = { min = 4, max = 25 },
                    width = { min = 20, max = 50 },
                    spacing = 3,
                    align = "center",
                },
                ignore_missing = false,
                hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " },
                show_help = false,
                show_keys = true,
                triggers = "auto",
                triggers_nowait = {
                    -- marks
                    "`",
                    "'",
                    "g`",
                    "g'",
                    -- registers
                    '"',
                    "<c-r>",
                    -- spelling
                    "z=",
                },
                triggers_blacklist = {
                    i = { "j", "k" },
                    v = { "j", "k" },
                },
                disable = {
                    buftypes = {},
                    filetypes = {},
                },
            },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            local keymaps = {
                mode = { "n", "v" },
                ["g"] = { name = "goto" },
                ["gz"] = { name = "surround" },
                ["]"] = { name = "next" },
                ["["] = { name = "prev" },
                ["<leader>l"] = { name = "lsp" },
                ["<leader>s"] = { name = "search" },
                ["<leader>d"] = { name = "debug" },
                ["<leader>b"] = { name = "buffers" },
                ["<leader>g"] = { name = "git" },
                ["<leader>w"] = { name = "window" },
                ["<leader>v"] = { name = "vim" },
                ["<leader><tab>"] = { name = "tabs" },
            }
            wk.register(keymaps)
        end,
    },
}
