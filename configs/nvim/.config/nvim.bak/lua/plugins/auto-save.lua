return {
  -- 'https://git.sr.ht/~nedia/auto-save.nvim',
  -- event = { 'BufReadPre' },
  -- opts = {
  --   events = { 'InsertLeave', 'BufLeave', 'BufHidden' },
  --   silent = true,
  --   timeout = 300,
  --   save_fn = function()
  --     local config = require 'auto-save.config'
  --     if config.save_cmd ~= nil then
  --       vim.cmd(config.save_cmd)
  --     elseif config.silent then
  --       vim.cmd 'silent! wa'
  --     else
  --       vim.cmd 'wa'
  --     end
  --   end,
  --   exclude_ft = { 'neo-tree' },
  -- },
}
