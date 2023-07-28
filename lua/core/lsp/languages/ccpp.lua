return {
    filetype = { "c", "cpp", "h", "hpp" },
    lspconfig = { name = "clangd" },
    mason = { lsp = "clangd", debug = "codelldb", formatter = "clang-format" },
    treesitter = { "c", "cpp" },
}
