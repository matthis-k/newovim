return {
    {
        "goolord/alpha-nvim",
        lazy = false,
        keys = {
            { "<leader>;", "<cmd>Alpha<cr>", desc = "Welcome screen" },
        },
        event = "VimEnter",
        opts = function()
            local dashboard = require("alpha.themes.dashboard")
            local logo = {
                [[                                                                       ]],
                [[  ██████   █████                   █████   █████  ███                  ]],
                [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
                [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
                [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
                [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
                [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
                [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
                [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
            }
            dashboard.section.header.val = logo
            dashboard.section.buttons.val = {
                dashboard.button("f", " " .. " Find file", "<cmd>Telescope find_files <CR>"),
                dashboard.button("n", " " .. " New file", "<cmd>ene <BAR> startinsert <CR>"),
                dashboard.button("r", " " .. " Recent files", "<cmd>Telescope oldfiles <CR>"),
                dashboard.button("g", " " .. " Find text", "<cmd>Telescope live_grep <CR>"),
                dashboard.button("c", " " .. " Config", "<cmd>cd ~/.config/nvim | e $MYVIMRC <CR>"),
                dashboard.button("s", " " .. " Restore Session", [[<cmd>lua require("persistence").load() <cr>]]),
                dashboard.button("l", "󰒲 " .. " Lazy", "<cmd>Lazy<CR>"),
                dashboard.button("q", " " .. " Quit", "<cmd>qa<CR>"),
            }
            dashboard.opts.layout[1].val = 8
            return dashboard
        end,
        config = function(_, dashboard)
            -- close Lazy and re-open when the dashboard is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "AlphaReady",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            require("alpha").setup(dashboard.opts)

            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
}
