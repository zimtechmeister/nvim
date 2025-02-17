return {
    'folke/which-key.nvim',
    event = "VeryLazy",
    dependencies = {
        'echasnovski/mini.nvim',
        -- 'nvim-tree/nvim-web-devicons',
    },
    opts = {
         preset = "helix",
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
        desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
