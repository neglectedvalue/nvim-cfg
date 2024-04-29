local function init()
	vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
end

return {
	init = init
}
