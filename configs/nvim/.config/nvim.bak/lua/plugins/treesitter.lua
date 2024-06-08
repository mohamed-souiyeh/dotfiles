return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'VeryLazy',
    init = function(plugin)
      -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
      -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
      -- no longer trigger the **nvim-treesitter** module to be loaded in time.
      -- Luckily, the only things that those plugins need are the custom queries, which we make available
      -- during startup.
      require('lazy.core.loader').add_to_rtp(plugin)
      require 'nvim-treesitter.query_predicates'
    end,
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        config = function()
          -- When in diff mode, we want to use the default
          -- vim text objects c & C instead of the treesitter ones.
          local move = require 'nvim-treesitter.textobjects.move' ---@type table<string,fun(...)>
          local configs = require 'nvim-treesitter.configs'
          for name, fn in pairs(move) do
            if name:find 'goto' == 1 then
              move[name] = function(q, ...)
                if vim.wo.diff then
                  local config = configs.get_module('textobjects.move')[name] ---@type table<string,string>
                  for key, query in pairs(config or {}) do
                    if q == query and key:find '[%]%[][cC]' then
                      vim.cmd('normal! ' .. key)
                      return
                    end
                  end
                end
                return fn(q, ...)
              end
            end
          end
        end,
      },
    },
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    keys = {
      { '<c-space>', desc = 'Increment selection' },
      { '<bs>', desc = 'Decrement selection', mode = 'x' },
    },
    opts = {

      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'jsonc',
        'lua',
        'luadoc',
        'luap',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'regex',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { [']f'] = '@function.outer', [']c'] = '@class.outer' },
          goto_next_end = { [']F'] = '@function.outer', [']C'] = '@class.outer' },
          goto_previous_start = { ['[f'] = '@function.outer', ['[c'] = '@class.outer' },
          goto_previous_end = { ['[F'] = '@function.outer', ['[C'] = '@class.outer' },
        },
      },
      config = function()
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

        -- There are additional nvim-treesitter modules that you can use to interact
        -- with nvim-treesitter. You should go explore a few and see what interests you:
        --
        --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
        --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
        --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      end,
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    config = function()
      -- When in diff mode, we want to use the default
      -- vim text objects c & C instead of the treesitter ones.
      local move = require 'nvim-treesitter.textobjects.move' ---@type table<string,fun(...)>
      local configs = require 'nvim-treesitter.configs'
      for name, fn in pairs(move) do
        if name:find 'goto' == 1 then
          move[name] = function(q, ...)
            if vim.wo.diff then
              local config = configs.get_module('textobjects.move')[name] ---@type table<string,string>
              for key, query in pairs(config or {}) do
                if q == query and key:find '[%]%[][cC]' then
                  vim.cmd('normal! ' .. key)
                  return
                end
              end
            end
            return fn(q, ...)
          end
        end
      end
    end,
  },
  -- {
  --   'nvim-treesitter/nvim-treesitter-context',
  --   event = 'VeryLazy',
  --   enabled = true,
  --   opts = { mode = 'cursor', max_lines = 3 },
  --   keys = {
  --     {
  --       '<leader>ut',
  --       function()
  --         local Util = require 'lazyvim.util'
  --         local tsc = require 'treesitter-context'
  --         tsc.toggle()
  --         if Util.inject.get_upvalue(tsc.toggle, 'enabled') then
  --           Util.info('Enabled Treesitter Context', { title = 'Option' })
  --         else
  --           Util.warn('Disabled Treesitter Context', { title = 'Option' })
  --         end
  --       end,
  --       desc = 'Toggle Treesitter Context',
  --     },
  --   },
  -- },
  {
    'windwp/nvim-ts-autotag',
    event = 'VeryLazy',
    opts = {},
  },
}
