local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (' 󰁂 %d '):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, 'MoreMsg' })
  return newVirtText
end
return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
      {
        'luukvbaal/statuscol.nvim',
        config = function()
          local builtin = require 'statuscol.builtin'
          require('statuscol').setup {
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
              { text = { '%s' }, click = 'v:lua.ScSa' },
              { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
            },
          }
        end,
      },
    },
    opts = {
      -- open_fold_hl_timeout = {
      --   description = [[Time in millisecond between the range to be highlgihted and to be cleared
      --               while opening the folded line, `0` value will disable the highlight]],
      --   default = 400,
      -- },
      -- provider_selector = {
      --   description = [[A function as a selector for fold providers. For now, there are
      --               'lsp' and 'treesitter' as main provider, 'indent' as fallback provider]],
      --   default = nil,
      -- },
      -- close_fold_kinds = {
      --   description = [[After the buffer is displayed (opened for the first time), close the
      --               folds whose range with `kind` field is included in this option. For now,
      --               'lsp' provider's standardized kinds are 'comment', 'imports' and 'region',
      --               run `UfoInspect` for details if your provider has extended the kinds.]],
      --   default = {},
      -- },
      -- fold_virt_text_handler = {
      --   description = [[A function customize fold virt text, see ### Customize fold text]],
      --   default = nil,
      -- },
      -- enable_get_fold_virt_text = {
      --   description = [[Enable a function with `lnum` as a parameter to capture the virtual text
      --               for the folded lines and export the function to `get_fold_virt_text` field of
      --               ctx table as 6th parameter in `fold_virt_text_handler`]],
      --   default = false,
      -- },
      -- preview = {
      --   description = [[Configure the options for preview window and remap the keys for current
      --               buffer and preview buffer if the preview window is displayed.
      --               Never worry about the users's keymaps are overridden by ufo, ufo will save
      --               them and restore them if preview window is closed.]],
      --   win_config = {
      --     border = {
      --       description = [[The border for preview window,
      --               `:h nvim_open_win() | call search('border:')`]],
      --       default = 'rounded',
      --     },
      --     winblend = {
      --       description = [[The winblend for preview window, `:h winblend`]],
      --       default = 12,
      --     },
      --     winhighlight = {
      --       description = [[The winhighlight for preview window, `:h winhighlight`]],
      --       default = 'Normal:Normal',
      --     },
      --     maxheight = {
      --       description = [[The max height of preview window]],
      --       default = 20,
      --     },
      --   },
      --   mappings = {
      --     description = [[The table for {function = key}]],
      --     default = [[see ###Preview function table for detail]],
      --   },
      -- },
      event = 'VeryLazy',
      -- Use treesitter as a main provider
      provider_selector = function()
        return { 'treesitter', 'indent' }
      end,
      fold_virt_text_handler = handler,
      open_fold_hl_timeout = 150,
      close_fold_kinds = { 'imports', 'comment' },
      preview = {
        win_config = {
          -- border = { '', '─', '', '', '', '─', '', '' },
          winhighlight = 'Normal:Folded',
          winblend = 0,
        },
        mappings = {
          scrollB = '<C-b>',
          scrollF = '<C-f>',
          scrollU = '<C-u>',
          scrollD = '<C-d>',
          jumpTop = 'gg',
          jumpBot = 'G',
        },
      },
    },

    init = function()
      -- ufo keymaps
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'open all folds' })
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'close all folds' })
      vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds, { desc = 'open folds except kinds' })
      vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith, { desc = 'close all folds on all lvls' }) -- closeAllFolds == closeFoldsWith(0)
      vim.keymap.set('n', 'zk', function()
        require('ufo').peekFoldedLinesUnderCursor()
      end)
    end,
  },
  -- Folding preview, by default h and l keys are used.
  -- On first press of h key, when cursor is on a closed fold, the preview will be shown.
  -- On second press the preview will be closed and fold will be opened.
  -- When preview is opened, the l key will close it and open fold. In all other cases these keys will work as usual.
  -- {
  --   'anuvyklack/fold-preview.nvim',
  --   event = 'BufReadPost',
  --   dependencies = 'anuvyklack/keymap-amend.nvim',
  --   config = true,
  -- },
}
