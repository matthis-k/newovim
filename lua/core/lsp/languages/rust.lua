return {
    filetype = "rust",
    lspconfig = { name = "rust_analyzer" },
    mason = { lsp = "rust-analyzer", debug = "codelldb" },
    treesitter = "rust",
}
