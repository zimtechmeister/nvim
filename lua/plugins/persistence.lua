return {
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {
            vim.keymap.set("n", "<leader>ps", function() require("persistence").load() end,
                { desc = 'load session for cwd' }),

            vim.keymap.set("n", "<leader>pS", function() require("persistence").select() end,
                { desc = 'select a session to load' }),

            vim.keymap.set("n", "<leader>pl", function() require("persistence").load({ last = true }) end,
                { desc = 'load the last session' }),

            -- stop Persistence => session won't be saved on exit
            vim.keymap.set("n", "<leader>pd", function() require("persistence").stop() end, { desc = 'stop Persistence' }),
        }
    }
}
