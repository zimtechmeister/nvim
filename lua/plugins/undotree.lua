return {
    'mbbill/undotree',
    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = '[U]ndotreeToggle'})
        vim.g.undotree_WindowLayout = 4
        vim.g.undotree_ShortIndicators = 1
    end,
}
