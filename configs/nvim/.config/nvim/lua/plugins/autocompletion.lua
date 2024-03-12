return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'f3fora/cmp-spell',
      'https://codeberg.org/FelipeLema/cmp-async-path',
      'Dynge/gitmoji.nvim',
      'hrsh7th/cmp-emoji',
      'chrisgrieser/cmp_yanky',
      'gbprod/yanky.nvim',
      -- If you want to add a bunch of pre-configured snippets,
      --    you can use this plugin to help you. It even has snippets
      --    for various frameworks/libraries/etc. but you will have to
      --    set up the ones that are useful for you.
      -- 'rafamadriz/friendly-snippets',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      --   פּ ﯟ   some other good icons
      local kind_icons = {
        -- Text = 'Text',
        -- Method = 'Method',
        -- Function = 'Function',
        -- Constructor = '',
        -- Field = '',
        Variable = '',
        -- Class = 'Class',
        -- Interface = '',
        -- Module = '',
        -- Property = 'Property',
        -- Unit = 'Unit',
        -- Enum = 'Enum',
        -- Keyword = 'Keyword',
        Snippet = '',
        -- Color = 'Color',
        File = '',
        Reference = '',
        Folder = '',
        -- EnumMember = '',
        Constant = '',
        Struct = '',
        Event = '',
        -- Operator = '',
        -- TypeParameter = 'TypeParameter',
        Copilot = '',
      }
      -- find more here: https://www.nerdfonts.com/cheat-sheet

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
              nvim_lsp = '[LSP]',
              luasnip = '[Snippet]',
              buffer = '[Buffer]',
              path = '[Path]',
              copilot = '[Copilot]',
            })[entry.source.name]
            return vim_item
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        },
        sources = {
          -- Copilot Source
          { name = 'copilot', group_index = 2 },
          -- Other Sources
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          -- { name = 'path' },
          { name = 'spell' },
          {
            name = 'async-path',
            option = {
              trailing_slash = true,
              show_hidden_files_by_default = true,
              -- Options go into this table
            },
          },
          { name = 'gitmoji' },
          { name = 'emoji' },
          -- default values
          {
            name = 'cmp_yanky',
            option = {
              -- only suggest items which match the current filetype
              onlyCurrentFiletype = false,
              -- only suggest items with a minimum length
              minLength = 3,
            },
          },
        },
      }
    end,
  },
  {
    'Dynge/gitmoji.nvim',
    dependencies = {
      'hrsh7th/nvim-cmp',
    },
    opts = { -- the values below are the defaults
      filetypes = { 'gitcommit' },
      completion = {
        append_space = false,
        complete_as = 'emoji',
      },
    },
    ft = 'gitcommit',
  },
}
