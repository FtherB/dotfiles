local M = {}

-- highlights
vim.api.nvim_set_hl(0, "TabLine", {
    fg = '#ffffff',
    bg = '#000000',
    italic = true,
})

vim.api.nvim_set_hl(0, "TablineMode", {
    fg = '#000000',
    bg = '#cccccc',
    italic = true,
    bold = true,
})

vim.api.nvim_set_hl(0, "TablineVersion", {
    fg = '#cccccc',
    bg = '#333333',
    italic = true,
})

vim.api.nvim_set_hl(0, "TablineSep1", {
    fg = '#cccccc',
    bg = '#333333',
})

vim.api.nvim_set_hl(0, "TablineSep2", {
    fg = '#333333',
    bg = '#000000',
})
local separator = ""

local function mode()
    local mode_map = {
        n = "NOR",
        i = "INS",
        v = "VIS",
        V = "V-L",
        ["\22"] = "V-B",
        c = "CMD",
        R = "REP",
        t = "TER",
    }

    local m = vim.fn.mode():sub(1,1)
    return mode_map[m] or "OTH"
end

local function nvimv()
    local title = 'Neovim'
    local vfull = vim.api.nvim_exec2("version", {output = true}).output
    local version = vfull:match("NVIM%s+([^\n]+)")
    return title .. ' ' .. version
end

function M.tabline()
    local s = ''

    s = s .. "%#TablineMode#"
    s = s .. " " .. mode() .. " "

    s = s .. "%#TablineSep1#"
    s = s .. separator

    s = s .. "%#TablineVersion#"
    s = s .. " " .. nvimv() .. " "

    s = s .. "%#TablineSep2#"
    s = s .. separator

    s = s .. "%#TabLine#"
    s = s .. " "

    return s
end

setmetatable(M, {
    __call = function()
        return M.tabline()
    end
})

return M
