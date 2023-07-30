local M = {}

local function load_configurations()
    local configurations = require("core.lsp.langlookup").languages
    return configurations
end

local function install_if_missing(package)
    local mr = require("mason-registry")
    mr.refresh()
    if not mr.get_package(package):is_installed() then
        vim.cmd(":MasonInstall " .. package)
    end
end


function M.setup()
    local utils = require("utils")
    local lspconfig = require("lspconfig")

    local configurations = load_configurations()
    utils.recursiveCall(configurations, "setup")

    for _, config in pairs(configurations) do
        if config.autoinstall == false then
            goto skip_install
        end
        if not config.mason then goto skip_install end
        for _, package in pairs(config.mason) do
            if type(package) == "string" then
                install_if_missing(package)
            elseif vim.tbl_isarray(package) then
                for _, pkg in pairs(package) do
                    install_if_missing(pkg)
                end
            end
        end
        ::skip_install::
        if config.enabled ~= false and config.lspconfig then
            lspconfig[config.lspconfig.name].setup(config.lspconfig.opts or {})
        end
    end
end

return M
