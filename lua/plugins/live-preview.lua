return {
    "brianhuster/live-preview.nvim",
    opts = {
        vim.keymap.set('n', '<leader>ps', function() vim.cmd('LivePreview start') end,
            { desc = 'start live preview' }),
        vim.keymap.set('n', '<leader>pc', function() vim.cmd('LivePreview close') end,
            { desc = 'close live preview' })
    }
}
