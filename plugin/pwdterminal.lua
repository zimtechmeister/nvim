vim.keymap.set('n', '<leader><leader>', function ()
    local cwd = vim.fn.getcwd()
    local command = string.format(
        "hyprctl dispatch exec '[workspace special:scratchpad] kitty -d %s'",
        cwd
    )
    vim.cmd('!' .. command)
end, {desc = 'Open Kitty in current directory',})
