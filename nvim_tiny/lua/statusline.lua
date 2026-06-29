-- highlight
vim.api.nvim_set_hl(0, "StatusLine", {
  fg = "#dddddd",
  bg = "#000000",
  italic = true,
})

vim.api.nvim_set_hl(0, "StatusLineNC", {
  fg = "#333333",
  bg = "#000000",
  italic = true,
})

vim.api.nvim_set_hl(0, "Status1", {
  fg = "#000000",
  bg = "#cccccc",
  bold = true,
  italic = true,
})

vim.api.nvim_set_hl(0, "Status2", {
  fg = "#ffffff",
  bg = "#333333",
  italic = true,
})

vim.api.nvim_set_hl(0, "StatusSep1", {
  fg = "#cccccc",
  bg = "#333333",
})

vim.api.nvim_set_hl(0, "StatusSep2", {
  fg = "#333333",
  bg = "#000000",
})

local sepl = ""
local sepr = ""

function _G.Wc()
  local c = vim.fn.wordcount()

  if c.visual_words ~= nil then
    return string.format(
      "VIS: %d words, %d chars  %d words, %d chars",
      c.visual_words,
      c.visual_chars,
      c.words,
      c.chars
    )
  else
    return string.format("%d words, %d chars", c.words, c.chars)
  end
end

function _G.Filename()
  if vim.fn.expand("%") ~= "" then
    return vim.fn.expand("%:p")
  else
    return "[No Name]"
  end
end

function _G.LinePercent()
  local line = vim.fn.line(".")
  local last = vim.fn.line("$")

  if line == 1 then
    return "Top"
  elseif line == last then
    return "Bot"
  else
    local p = math.floor((line * 100.0) / last)
    return string.format("%2d%%", p)
  end
end

-- statusline left
local stl_l = ""

stl_l = stl_l .. "%#Status2#"
stl_l = stl_l .. " %{v:lua.Filename()}%m%r "

stl_l = stl_l .. "%#StatusSep2#" .. sepl
stl_l = stl_l .. "%*"

-- statusline right
local stl_r = ""

stl_r = stl_r .. "%{v:lua.Wc()} "

stl_r = stl_r .. "%#StatusSep2#" .. sepr
stl_r = stl_r .. "%#Status2# %{v:lua.LinePercent()} "

stl_r = stl_r .. "%#StatusSep1#" .. sepr
stl_r = stl_r .. "%#Status1# %3l:%-2c "

local stl = stl_l .. "%=" .. stl_r

vim.o.statusline = stl
