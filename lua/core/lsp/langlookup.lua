---@class LanguageInfo
---@field filetype string|string[]
---@field lspconfig { name: string, opts: table }|nil
---@field null_ls { formatting: string|nil, hover: string|nil, code_actions: string|nil, completion: string|nil, diagnostics: string|nil }|nil
---@field treesitter string|string[]|nil
---@field mason { lsp: string|string[]|nil, debug: string|string[]|nil, lint: string|string[]|nil, formatter: string|string[]|nil }|nil
---@field setup fun()|nil
---@field autoinstall boolean|nil
---@field enabled boolean|nil
---@field custom_keys table[]|nil



---@type LanguageInfo[]
local M = {}
M.languages = {
    ---@type LanguageInfo
    lua = {
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
    },
    ---@type LanguageInfo
    rust = {
        filetype = "rust",
        lspconfig = { name = "rust_analyzer" },
        mason = { lsp = "rust-analyzer", debug = "codelldb" },
        treesitter = "rust",
    },
    ---@type LanguageInfo
    ccpp = {
        filetype = { "c", "cpp", "h", "hpp" },
        lspconfig = { name = "clangd" },
        mason = { lsp = "clangd", debug = "codelldb", formatter = "clang-format" },
        treesitter = { "c", "cpp" },
    },
    fish = {
        filetype = "fish",
        null_ls = { diagnostics = "fish" },
        treesitter = "fish",
    },
    nix = {
        filetype = "nix",
        lspconfig = { name = "rnix" },
        mason = { lsp = "rnix-lsp" },
        treesitter = "nix",
    },
    git = {
        null_ls = { code_actions = "gitsigns" }
    },
    noice = {
        treesitter = { "bash", "vim", "regex", "lua", "markdown", "markdown_inline" }
    }
}

function M.merge_field(field_name)
    local r = {}
    for _, conf in pairs(M.languages) do
        local field = conf[field_name]
        if field then
            if type(field) == "string" then
                table.insert(r, field)
            elseif vim.tbl_isarray(field) then
                for _, val in pairs(field) do
                    if type(val) == "string" then
                        table.insert(r, val)
                    end
                end
            elseif type(field) == "table" then
                for key, val in pairs(field) do
                    if not r[key] then r[key] = {} end
                    table.insert(r[key], val)
                end
            end
        end
    end
    return r
end

return M
