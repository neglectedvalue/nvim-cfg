local function init()
  require('telescope').setup{
    defaults = {
      file_ignore_patterns = {
        "node_modules/.*",
        "secret.d/.*",
        "%.pem"
      }
    }
  }

  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  vim.keymap.set('n', '<C-p>', builtin.git_files, {})
  vim.keymap.set('n', '<leader>ps', function()
	  builtin.grep_string({ seatch = vim.fn.input("Grep > ")})	
  end)

end

return {
  init = init
}
