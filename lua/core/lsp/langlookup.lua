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

local M = {}
M.languages = require("utils").dirReq("core.lsp.languages")

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
