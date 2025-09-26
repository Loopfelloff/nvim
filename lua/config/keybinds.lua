vim.g.mapleader = " "
local function wrap_word(left, right)
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()
    local reversed_line = string.reverse(line)
    local s, e = line:find("%w+", col + 1)
    local s_, e_ = reversed_line:find("%w+", string.len(line) - col)
    s = string.len(line) - (e_ - 1)
    if s and e then
        local new_line = line:sub(1, s - 1) .. left .. line:sub(s, e) .. right .. line:sub(e + 1)
        vim.api.nvim_set_current_line(new_line)
    end
end

local function auto_complete_brackets(left_bracket)
    local right_bracket = ""
    if left_bracket == "{" then
        right_bracket = "}"
    elseif left_bracket == "[" then
        right_bracket = "]"
    elseif left_bracket == "(" then
        right_bracket = ")"
    end
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()
    local new_line = line:sub(1, col) .. left_bracket .. right_bracket .. line:sub(col + 1)
    vim.api.nvim_set_current_line(new_line)
    row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_win_set_cursor(0, { row, col + 1 })
end

vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "<leader>{", function()
    wrap_word("{", "}")
end, { silent = true })
vim.keymap.set("n", "<leader>(", function()
    wrap_word("(", ")")
end, { silent = true })
vim.keymap.set("n", "<leader>[", function()
    wrap_word("[", "]")
end, { silent = true })
vim.keymap.set("n", "<leader>'", function()
    wrap_word("'", "'")
end, { silent = true })
vim.keymap.set("n", '<leader>"', function()
    wrap_word('"', '"')
end, { silent = true })
vim.keymap.set("i", "{", function()
    auto_complete_brackets("{")
end, { silent = true })
vim.keymap.set("i", "(", function()
    auto_complete_brackets("(")
end, { silent = true })
vim.keymap.set("i", "[", function()
    auto_complete_brackets("[")
end, { silent = true })
