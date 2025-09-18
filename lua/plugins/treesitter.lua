return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
    require("nvim-treesitter.install").compilers = {"zig"}
    local configs = require("nvim-treesitter.configs")
    configs.setup({
        highlight = {
        enable = true,
        },
        indent = {enable = true},
        autotag = {enable = true},
        auto_install = false,
    })
    end,
}
