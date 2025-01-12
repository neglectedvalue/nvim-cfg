# outdated

local function init()
	
	local lspconfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	lspconfig.elixirls.setup({
		-- you need to specify the executable command mannualy for elixir-ls
	    cmd = { "/home/funkycatz/elixir_ls/language_server.sh" },
		capabilities = capabilities,
	})

end

return {
	init = init 
}
