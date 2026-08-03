-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Save on focus change
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  group = vim.api.nvim_create_augroup("AutoSaveOnFocusChange", { clear = true }),
  callback = function()
    if vim.bo.buftype == "" and vim.bo.modified and vim.bo.modifiable and not vim.bo.readonly then
      vim.cmd("silent! write")
    end
  end,
})

vim.api.nvim_create_user_command("CleanStaleData", function()
  local state_dir = vim.fn.stdpath("state")

  local undo_dir = state_dir .. "/undo"
  local undo_cleaned = 0
  if vim.fn.isdirectory(undo_dir) == 1 then
    for name, _ in vim.fs.dir(undo_dir) do
      local real_path = name:gsub("%%", "/")
      if vim.fn.filereadable(real_path) == 0 then
        os.remove(undo_dir .. "/" .. name)
        undo_cleaned = undo_cleaned + 1
      end
    end
  end

  local session_dir = state_dir .. "/sessions"
  local session_cleaned = 0
  if vim.fn.isdirectory(session_dir) == 1 then
    for name, _ in vim.fs.dir(session_dir) do
      local real_path = name:gsub("%%", "/"):gsub("%.vim$", "")
      if vim.fn.isdirectory(real_path) == 0 and vim.fn.filereadable(real_path) == 0 then
        os.remove(session_dir .. "/" .. name)
        session_cleaned = session_cleaned + 1
      end
    end
  end

  local old_count = #vim.v.oldfiles
  vim.v.oldfiles = vim.tbl_filter(function(f)
    return vim.fn.filereadable(f) == 1
  end, vim.v.oldfiles)
  vim.cmd("wshada!")
  local shada_cleaned = old_count - #vim.v.oldfiles

  vim.notify(
    string.format(
      "Clean complete!\n- Cleaned %d undo files\n- Cleaned %d sessions\n- Cleaned %d ShaDa entries",
      undo_cleaned,
      session_cleaned,
      shada_cleaned
    ),
    vim.log.levels.INFO
  )
end, { desc = "Clean stale undo, session and ShaDa data" })
