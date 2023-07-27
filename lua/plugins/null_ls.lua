return {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "jose-elias-alvarez/null-ls.nvim",
    },
    opts = {
        automatic_setup = true,
    },
    config = function(_, opts)
        require("mason-null-ls").setup(opts)
        local null_ls = require("null-ls")
        local builtins = require("core.lsp.langlookup").merge_field("null_ls")
        local sources = {}
        for method, names in pairs(builtins) do
            for _, name in ipairs(names) do
                table.insert(sources, null_ls.builtins[method][name])
            end
        end
        null_ls.setup({
            sources = sources
        })
    end

}
