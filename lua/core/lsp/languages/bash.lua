return {
    filetype = { "bash", "sh" },
    lspconfig = { name = "bashls" },
    mason = {
        lsp = { "bash-language-server", "shellcheck", "shellharden" },
        debug = "bash-debug-adapter",
        formatter = "shfmt"
    },
    treesitter = { "bash" },
    null_ls = { code_actions = "shellcheck", diagnostics = "shellcheck", formatting = { "shellfmt", "shellharden" } },
    custom_keys = {
        {
            mode = "n",
            lhs = "<leader>Lr",
            rhs = function()
                local current_buffer = vim.api.nvim_get_current_buf()
                local buffer_name = vim.api.nvim_buf_get_name(current_buffer)
                require("utils").spawn_terminal("bash " .. buffer_name)
            end,
            opts = { desc = "run file" }
        },
        {
            mode = "n",
            lhs = "<leader>Lx",
            rhs = function()
                local current_buffer = vim.api.nvim_get_current_buf()
                local buffer_name = vim.api.nvim_buf_get_name(current_buffer)
                os.execute("chmod +x " .. buffer_name)
            end,
            opts = { desc = "make executable" }
        },
    },
}
