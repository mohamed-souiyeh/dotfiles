return {
  -- NOTE: Plugins can also be configured to run lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        [']'] = { name = '+next', _ = 'which_key_ignore' },
        ['['] = { name = '+prev', _ = 'which_key_ignore' },
        ['g'] = { name = '[G]oto', _ = 'which_key_ignore' },
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument/[D]ebugger', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename/[R]eplace', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
        ['<leader>f'] = { name = '[F]file', _ = 'which_key_ignore' },
        ['<leader>q'] = { name = '[Q]uit/Session', _ = 'which_key_ignore' },
        ['<leader>u'] = { name = '[U]i', _ = 'which_key_ignore' },
        ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        ['<leader>gh'] = { name = '[h]unks', _ = 'which_key_ignore' },
        ['<leader><tab>'] = { name = '[T]abs', _ = 'which_key_ignore' },
        ['<leader>x'] = { name = '+diagnostics/quickfix', _ = 'which_key_ignore' },
        ['<leader>un'] = { name = '[U]i [N]oice' },
      }
    end,
  },
}
