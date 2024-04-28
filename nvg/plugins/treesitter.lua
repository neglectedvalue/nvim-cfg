local function init()
  require'nvim-treesitter.configs'.setup {
    ignore_install = { "norg" },
    ensure_installed = {
      'bash',
      'dockerfile',
      'go',
      'gomod',
      'graphql',
      'html',
	  'css',
      'javascript',
      'jsdoc',
      'json',
      'lua',
      'python',
      'tsx',
      'typescript',
      'yaml',
	  'elixir',
	  'erlang',
	  'eex',
    },
    highlight = {
      enable = true
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    indent = {
      enable = true
    }
  }

end

return {
  init = init
}
