-- lsp

-- language servers
vim.lsp.enable({"lua_ls", "tsgo"})

-- Show errors inline
vim.diagnostic.config({virtual_text = true})

-- autocomplete where supported
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client ~= nil and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
-- dont autoselect first
vim.cmd("set completeopt+=noselect")
