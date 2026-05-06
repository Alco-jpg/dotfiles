local plugins = {
	{ source = "neovim/nvim-lspconfig" },
	{ source = "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{ source = "nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"} },
}

for _, plugin in ipairs(plugins) do
	vim.pack.add(plugin)
end

