return {
  -- find and replace in multiple files
  {
    'nvim-pack/nvim-spectre',
    build = false,
    cmd = 'Spectre',
    opts = { open_cmd = 'noswapfile vnew' },
      -- stylua: ignore
      keys = {
        { "<leader>rs", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
      },
  },
}
