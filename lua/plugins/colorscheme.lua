return {
    {
        'sainnhe/gruvbox-material',
        -- lazy = false,
        -- priority = 1000,
        config = function()
            -- Optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            vim.opt.termguicolors = true
            vim.opt.background = 'dark'
            vim.g.gruvbox_material_background = 'medium'
            vim.g.gruvbox_material_enable_italic = true
            vim.cmd.colorscheme 'gruvbox-material'
        end,
    },

    {
        'nyoom-engineering/oxocarbon.nvim',
        config = function()
            vim.opt.background = 'dark'
        end,
    },

    {
        'shaunsingh/nord.nvim',
    },

    {
        'sainnhe/everforest',
    },

    {
        'rebelot/kanagawa.nvim',
    },

    {
        'neanias/everforest-nvim',
    },

    {
        'olivercederborg/poimandres.nvim',
    },

    {
        '0xstepit/flow.nvim',
        opts = {},
    },

    {
        'folke/tokyonight.nvim',
    },
}
