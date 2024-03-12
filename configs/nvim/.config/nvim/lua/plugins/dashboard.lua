return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = {
    'MaximilianLloyd/ascii.nvim',
    'MunifTanjim/nui.nvim',
  },
  opts = function()
    --local logo = [[
    --     ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
    --     ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
    --     ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
    --     ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
    --     ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
    --     ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
    --]]

    local logo = [[                                                                       
                                                                          
            ████ ██████           █████      ██                     
           ███████████             █████                             
           █████████ ███████████████████ ███   ███████████   
          █████████  ███    █████████████ █████ ██████████████   
         █████████ ██████████ █████████ █████ █████ ████ █████   
       ███████████ ███    ███ █████████ █████ █████ ████ █████  
      ██████  █████████████████████ ████ █████ █████ ████ ██████ 
                                                                       ]]

    -- local logo = require('ascii').art.text.neovim.sharp
    logo = string.rep('\n', 4) .. logo .. '\n\n'

    local builtin = require 'telescope.builtin'

    local find_files_opts = {
      follow = true, -- follow symlinks
      hidden = true, -- include hidden files
    }

    local function custom_find_files()
      builtin.find_files(find_files_opts)
    end

    local opts = {
      theme = 'doom',
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, '\n'),
        --header = logo,
        -- stylua: ignore
        center = {
          { action = custom_find_files,                                          desc = " Find file",       icon = " ", key = "f" },
          { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
          { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
          { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
      button.key_format = '  %s'
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'DashboardLoaded',
        callback = function()
          require('lazy').show()
        end,
      })
    end

    return opts
  end,
}