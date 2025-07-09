local pane = os.getenv("TMUX_PANE")
if pane then
    vim.api.nvim_create_autocmd("ModeChanged", {
    callback = function()
      local mode = vim.fn.mode()
      local cmd = string.format("tmux set-environment NVIM_MODE_%s %s 2>/dev/null", pane, mode)
      os.execute(cmd)
    end,
    })

    vim.api.nvim_create_autocmd("VimLeave", {
        callback = function()
          local cmd = string.format("tmux set-environment NVIM_MODE_%s n 2>/dev/null", pane)
          os.execute(cmd)
        end,
      })
end
