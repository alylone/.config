return {
  -- Configure blink.cmp for Tab-based completion
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",
        ["<Tab>"] = { "accept", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<CR>"] = {}, -- Disable Enter for completion acceptance
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      },
      completion = {
        accept = {
          -- Don't auto-insert on Enter
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          draw = {
            treesitter = { "lsp" },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
}
