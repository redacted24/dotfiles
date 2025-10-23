return {
	"L3MON4D3/LuaSnip",
    enabled = true,
    dependencies = {
      "rafamadriz/friendly-snippets", -- Collection of VS Code-like snippets
    },
	version = "v2.*",
    -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
    config = function ()
        -- require("luasnip.loaders.from_snipmate").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
}
