return {
    filetype = "rust",
    lspconfig = { name = "rust_analyzer" },
    mason = { lsp = "rust-analyzer", debug = "codelldb" },
    treesitter = "rust",
    custom_keys = {
        {
            mode = "n",
            lhs = "<leader>Lr",
            rhs = function()
                require("utils").spawn_terminal("cargo run")
            end,
            opts = { desc = "cargo run" }
        },
    },
}
