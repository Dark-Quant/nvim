local augroup = vim.api.nvim_create_augroup("custom", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	desc = "Return to last edit position",
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		if mark[1] > 1 and mark[1] <= vim.fn.line("$") then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	desc = "Close某些 filetype with q",
	pattern = { "qf", "help", "man", "lspinfo", "TelescopePrompt" },
	callback = function(event)
		vim.keymap.set("n", "q", "<CMD>close<CR>", { buffer = event.buf, silent = true })
	end,
})
