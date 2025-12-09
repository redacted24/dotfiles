-- lua/plugins/rose-pine.lua
return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
        -- require("rose-pine").setup({
        --     variant = "auto",
        --     dark_variant = "auto"
        -- })
		vim.cmd("colorscheme rose-pine")
	end
}
