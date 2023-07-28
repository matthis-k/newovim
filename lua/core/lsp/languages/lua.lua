return {
    filetype = "lua",
    lspconfig = {
        name = "lua_ls",
        opts = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    hint = {
                        enable = true,
                    }
                },
            },
        },
    },
    mason = { lsp = "lua-language-server", formatter = "stylua" },
    treesitter = "lua",
    custom_keys = {
        { mode = "n", lhs = "<leader>vs", rhs = "<cmd>so %<cr>", opts = { desc = "source file" } },
        {
            mode = "n",
            lhs = "<leader>Lr",
            rhs = function()
                local current_buffer = vim.api.nvim_get_current_buf()
                local buffer_name = vim.api.nvim_buf_get_name(current_buffer)
                require("utils").spawn_terminal("lua " .. buffer_name)
            end,
            opts = { desc = "run file" }
        },
    },
}
