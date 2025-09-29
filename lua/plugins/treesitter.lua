return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.install").compilers = { "zig" }
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            highlight = {
                enable = true,
            },
            indent = { enable = true },
            autotag = { enable = true },
            auto_install = false,
        })
        if vim.filetype and vim.filetype.add then
            vim.filetype.add({
                extension = { ejs = "html" },
            })
        else
            -- Fallback for older Neovim
            vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
                pattern = "*.ejs",
                callback = function()
                    vim.bo.filetype = "html"
                end,
            })
        end
    end,
}
