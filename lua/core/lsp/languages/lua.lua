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
    },
}
