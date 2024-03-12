return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'zbirenbaum/copilot-cmp',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
}
