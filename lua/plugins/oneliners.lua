return {--copying to clipboard helper and SSH tunneling
    {
	'ojroques/vim-oscyank',
    },
    {--Git plugin
	'tpope/vim-fugitive',
    },
    { --Show CSS colors
	'brenoprata10/nvim-highlight-colors',
	config = function()
	    require('nvim-highlight-colors').setup({})
	end
    },
}
