return {
    'akinsho/bufferline.nvim',
    dependencies = { 'echasnovski/mini.nvim' },
    config = function()
        require("bufferline").setup {}
        vim.keymap.set("n", "<leader>bp", vim.cmd.BufferLineTogglePin, { desc = 'Toggle Pin' })
        vim.keymap.set("n", "<C-h>", vim.cmd.BufferLineCyclePrev, { desc = 'Prev Buffer' })
        vim.keymap.set("n", "<C-l>", vim.cmd.BufferLineCycleNext, { desc = 'Next Buffer' })
    end,
}
