return {
    -- {
    --     'sainnhe/gruvbox-material',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         -- Optionally configure and load the colorscheme
    --         -- directly inside the plugin declaration.
    --         vim.opt.termguicolors = true
    --         vim.opt.background = 'dark'
    --         vim.g.gruvbox_material_background = 'medium'
    --         vim.g.gruvbox_material_enable_italic = true
    --         vim.cmd.colorscheme 'gruvbox-material'
    --     end,
    -- },

    {
        'ellisonleao/gruvbox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.opt.termguicolors = true
            vim.opt.background = 'dark'
            vim.cmd.colorscheme 'gruvbox'
        end,
    },

    -- {
    --     'nyoom-engineering/oxocarbon.nvim',
    --     config = function()
    --         vim.opt.termguicolors = true
    --         vim.opt.background = 'dark'
    --         vim.cmd.colorscheme 'oxocarbon'
    --     end,
    -- },

    -- {
    --     'shaunsingh/nord.nvim',
    -- },

    -- {
    --     'sainnhe/everforest',
    -- },

    -- {
    --     'rebelot/kanagawa.nvim',
    -- },

    -- {
    --     'neanias/everforest-nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.opt.termguicolors = true
    --         vim.opt.background = 'dark'
    --         vim.cmd.colorscheme 'everforest'
    --     end,
    -- },

    -- {
    --     'folke/tokyonight.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         vim.opt.termguicolors = true
    --         vim.opt.background = 'dark'
    --         vim.cmd.colorscheme 'tokyonight-night'
    --     end,
    -- },
}
